using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using DotNetNuke.Entities.Modules;
using Rawson.App;
using DotNetNuke.Common.Utilities;
using Rawson.Data;
using DotNetNuke.Entities.Users;
using DevExpress.Web.ASPxGridView;
using Rawson.App.Security;
using DotNetNuke.Entities.Tabs;
using System.Runtime.Serialization;
using System.Text;
using System.Xml;
using System.IO;
using DotNetNuke.Services.Exceptions;
using Rawson.Data.Controllers;
using Rawson.Data.Model;
using Rawson.Reports.Constants;

namespace Rawson.Jobs
{
    public partial class Details : PortalModuleBase
    {
        protected void Page_Init ( object sender, EventArgs e )
        {
            JobFormController controller = new JobFormController ();
            
            if ( Request.QueryString[ "JobID" ] == null )
            {
                controller.Options.TrackingMode = TrackingModes.Disconnected;
                controller.NewEntity ();
            }
            else
            {
                int jobId;
                if ( int.TryParse ( Request.QueryString[ "JobID" ], out jobId ) )
                {
                    controller.Options.TrackingMode = TrackingModes.Connected;
                    controller.Load ( jobId );
                }
                else
                {
                    Exceptions.ProcessModuleLoadException ( "Unable to match JobID", this, new Exception ( "Unable to match JobID" ) );
                }
            }

            Context.Items.Add("#boController", controller);
        }


        protected void Page_Load ( object sender, EventArgs e )
        {
            ServiceDetailsGrid.Templates.PagerBar = new CustomPagerBarTemplate();

            if ( !Page.IsPostBack )
            {
                LoadData();
            }
        }

        private void LoadData ()
        {
            try
            {
                JobFormController controller = Context.Items["#boController"] as JobFormController;
                Job job = controller.Entity;

                if ( job.Version == null ) // new Job
                {
                    lblJobID.Text = "NEW";                   

                    job.CreatedBy = controller.ResolveEmployeeID(UserId);
                    job.CreationDate = DateTime.Now;

                    lnkNew.NavigateUrl = "#";
                    lnkNew.Enabled = false;
                }
                else
                {
                    lblJobID.Text = job.JobID.ToString ();

                    lnkNew.NavigateUrl = GetNewFormUrl ( job.JobTypeID, job.JobID );
                    lnkNew.Enabled = true;
                }

                ClientSelect.Value = job.Version == null ? -1 : job.ClientLocation.ClientID;
                LocationSelect.Value = job.Version == null ? -1 : job.ClientLocationID;

                SalesOrderNumTextBox.Text = job.SalesOrderNum ?? "";
                txtSapWoNum.Text = job.SapWoNum ?? "";
                CallDateEdit.Value = job.CallDate;
                RequestedBySelect.Value = job.RequestedByID ?? -1;

                JobTypeSelect.Value = job.Version == null ? -1 : job.JobTypeID;
                JobStatusSelect.Value = job.Version == null ? -1 : job.JobStatusID;
                ServiceDateEdit.Value = job.ServiceDate;
                CompletionDateEdit.Value = job.CompletionDate;
                AssignedBySelect.Value = job.AssignedByID;
                AssignedToSelect.Value = job.AssignedToID ?? -1;
                ApprovedbySelect.Value = job.ApprovedByID ?? -1;
                DotNumberTextBox.Text = job.DotNumber ?? "";
                VRstampTextBox.Text = job.VRstamp ?? "";

                // ToDo: Implement DataViewer role
                //  requires moving current Employees table to Memebership.
                CreatedByLabel.Text = ( job.CreatedBy == null ) ? "" : controller.GetEmployeeName ( job.CreatedBy.Value );
                CreationDateLabel.Text = job.CreationDate.ToShortDateString();

                // Set up forms grid
                string labelText = "";

                switch (job.JobTypeID)
                {
                    case (int)JobTypeEnum.Testing:
                        labelText = "Testing Forms";
                        break;
                    case (int)JobTypeEnum.Greasing:
                        labelText = "Greasing Records";
                        //hide the service item, serial, and result columns. They are not applicable
                        ServiceDetailsGrid.Columns["ServiceItemID"].Visible = false;
                        ServiceDetailsGrid.Columns["Serial #"].Visible = false;
                        ServiceDetailsGrid.Columns["Result"].Visible = false;
                        ServiceDetailsGrid.Width = new Unit(150, UnitType.Pixel);
                        break;
                    case (int)JobTypeEnum.WellSafety:
                        labelText = "Well Safety Forms";
                        break;
                    default:
                        labelText = "Forms";
                        break;
                }

                this.FormListLabel.Text = labelText;
                this.ClientSelect.Focus();
            }
            catch ( Exception ex )
            {
                Exceptions.ProcessModuleLoadException ( ex.Message + ex.StackTrace, this, ex );
            }
        }

        protected void ServiceDetailDataSource_Selecting ( object sender, LinqDataSourceSelectEventArgs e )
        {
            JobFormController controller = Context.Items[ "#boController" ] as JobFormController;
            e.Result = controller.GetCurrentJobServiceForms();
        }

        protected void ClientDataSource_Selecting ( object sender, LinqDataSourceSelectEventArgs e )
        {
            JobFormController controller = Context.Items["#boController"] as JobFormController;
            e.Result = controller.GetAuthorizedClients(UserId);
        }

        protected void LocationDataSource_Selecting ( object sender, LinqDataSourceSelectEventArgs e )
        {
            int clientID;
            if (ClientSelect.Value == null && !int.TryParse((string)ClientSelect.ClientValue, out clientID))
                clientID = -1;
            else
                clientID = (int)ClientSelect.Value;
                
            JobFormController controller = Context.Items["#boController"] as JobFormController;
            e.Result = controller.GetAuthorizedLocations(UserId, clientID);
        }

        protected void EmployeeDataSource_Selecting ( object sender, LinqDataSourceSelectEventArgs e )
        {
            JobFormController controller = Context.Items["#boController"] as JobFormController;
            e.Result = controller.GetEmployeesList();
        }

        protected void CompletionDateEdit_Validation ( object sender, DevExpress.Web.ASPxEditors.ValidationEventArgs e )
        {
            if ( !( e.Value is DateTime ) )
                return;
            DateTime selectedDate = (DateTime)e.Value;
            DateTime currentDate = DateTime.Now;
            if ( selectedDate > currentDate )
                e.IsValid = false;
        }

        protected void ServiceDetailsGrid_CustomButtonCallback ( object sender, ASPxGridViewCustomButtonCallbackEventArgs e )
        {
            JobFormController manager = Context.Items[ "#boController" ] as JobFormController;

            int jobId = manager.Entity.JobID;
            int jobTypeId = manager.Entity.JobTypeID;

            ASPxGridView grid = sender as ASPxGridView;

            object[] values = grid.GetRowValues ( e.VisibleIndex, "ID", "ServiceItemID", "JobTypeID" ) as object[];
            
            grid.JSProperties["cpShowReport"] = false;

            if ( e.ButtonID == "btnEdit" )
            {
                switch ( jobTypeId )
                {
                    case (int)JobTypeEnum.Testing:
                        Response.RedirectLocation = DotNetNuke.Common.Globals.NavigateURL ( TabId, "Valve", "mid=" + ModuleId, "JobID=" + jobId.ToString (), "ValveTestID=" + values[ 0 ] );
                        break;
                    case (int)JobTypeEnum.Greasing:
                        Response.RedirectLocation = DotNetNuke.Common.Globals.NavigateURL ( TabId, "Grease", "mid=" + ModuleId, "JobID=" + jobId.ToString (), "GreasingRecordID=" + values[ 0 ] );
                        break;
                    case (int)JobTypeEnum.WellSafety:
                        Response.RedirectLocation = DotNetNuke.Common.Globals.NavigateURL ( TabId, "Well", "mid=" + ModuleId, "JobID=" + jobId.ToString (), "WellSafetyTestID=" + values[ 0 ] );
                        break;
                    default:
                        break;
                }
            }
            else
            {
                Session["ReportData"] = values[0];

                grid.JSProperties["cpShowReport"] = true;

                switch ( jobTypeId )
                {
                    case (int)JobTypeEnum.Testing:
                        grid.JSProperties["cpReportUrl"] = ResourcePaths.DownloadHelperPath + DocumentPaths.ValveTestFieldReport;
                        break;
                    case (int)JobTypeEnum.Greasing:
                        grid.JSProperties["cpReportUrl"] = ResourcePaths.DownloadHelperPath + DocumentPaths.GreasingRecordFieldReport;
                        break;
                    case (int)JobTypeEnum.WellSafety:
                        grid.JSProperties["cpReportUrl"] = ResourcePaths.DownloadHelperPath + DocumentPaths.WellSafetyFieldReport;
                        break;
                    default:
                        break;
                }
            }
        }

        private string GetNewFormUrl ( int jobTypeId, int jobId)
        {
            string url = "";

            switch ( jobTypeId )
            {
                case (int)JobTypeEnum.Testing:
                    url = DotNetNuke.Common.Globals.NavigateURL ( TabId, "Valve", "mid=" + ModuleId, "JobID=" + jobId.ToString () );
                    break;
                case (int)JobTypeEnum.Greasing:
                    url = DotNetNuke.Common.Globals.NavigateURL ( TabId, "Grease", "mid=" + ModuleId, "JobID=" + jobId.ToString () );
                    break;
                case (int)JobTypeEnum.WellSafety:
                    url = DotNetNuke.Common.Globals.NavigateURL ( TabId, "Well", "mid=" + ModuleId, "JobID=" + jobId.ToString () );
                    break;
                default:
                    break;
            }

            return url;

        }

        protected void OnClientSelectedIndexChanged(object sender, EventArgs e)
        {
            LocationSelect.DataBind();
        }

        protected void LocationSelect_Callback(object sender, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
            LocationSelect.DataBind();
        }

        protected void ServiceDetailsGrid_DataBound(object sender, EventArgs e)
        {
            ServiceDetailsGrid.JSProperties["cpPageCount"] = ServiceDetailsGrid.PageCount;
        }
        protected void ServiceDetailsGrid_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            int pageSize;
            if (Int32.TryParse(e.Parameters, out pageSize))
                ServiceDetailsGrid.SettingsPager.PageSize = pageSize;

            ServiceDetailsGrid.DataBind();
        }

        protected void SaveAction_Callback(object source, DevExpress.Web.ASPxCallback.CallbackEventArgs e)
        {
            JobFormController controller = Context.Items["#boController"] as JobFormController;
            Job job = controller.Entity;

            //set the properties
            job.SalesOrderNum = SalesOrderNumTextBox.Text;
            job.CallDate = (DateTime?)CallDateEdit.Value;
            job.JobTypeID = Convert.ToInt32(JobTypeSelect.Value);
            job.ClientLocationID = Convert.ToInt32(LocationSelect.Value);
            job.SapWoNum = txtSapWoNum.Text;
            job.JobStatusID = Convert.ToInt32(JobStatusSelect.Value);
            job.ServiceDate = (DateTime?)ServiceDateEdit.Value;
            job.CompletionDate = (DateTime?)CompletionDateEdit.Value;
            job.RequestedByID = (int)RequestedBySelect.Value == -1 ? (int?)null : Convert.ToInt32(RequestedBySelect.Value);
            job.AssignedByID = Convert.ToInt32(AssignedBySelect.Value);
            job.AssignedToID = (int)AssignedToSelect.Value == -1 ? (int?)null : Convert.ToInt32(AssignedToSelect.Value);
            job.ApprovedByID = (int)ApprovedbySelect.Value == -1 ? (int?)null : Convert.ToInt32(ApprovedbySelect.Value);
            job.DotNumber = DotNumberTextBox.Text;
            job.VRstamp = VRstampTextBox.Text;
            job.Active = true;

            if (job.Version == null)
            {
                job.CreatedBy = controller.ResolveEmployeeID(UserId);
                job.CreationDate = DateTime.Now;
            }

            if (controller.Validate())
            {
                SaveAction.JSProperties.Add("cpHasErrors", false);

                if (controller.Save())
                    Response.RedirectLocation = DotNetNuke.Common.Globals.NavigateURL(TabId, "Job", "mid=" + ModuleId, "JobID=" + job.JobID.ToString());
                else
                    Exceptions.ProcessModuleLoadException(controller.ErrorMessage, this, controller.ErrorException);
            }
            else
            {
                SaveAction.JSProperties.Add("cpErrorMessage", controller.ValidationMessage());
                SaveAction.JSProperties.Add("cpHasErrors", true);
            }
        }
        protected void JobStatusDataSource_Selecting(object sender, LinqDataSourceSelectEventArgs e)
        {
            JobFormController controller = Context.Items["#boController"] as JobFormController;
            e.Result = controller.GetJobStatuses();
        }

        protected void JobTypeDataSource_Selecting(object sender, LinqDataSourceSelectEventArgs e)
        {
            JobFormController controller = Context.Items["#boController"] as JobFormController;
            e.Result = controller.GetJobTypes();
        }
}
}
