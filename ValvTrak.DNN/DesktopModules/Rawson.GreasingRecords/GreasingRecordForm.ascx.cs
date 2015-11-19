using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DotNetNuke.Entities.Modules;
using Rawson.Data.Controllers;
using DotNetNuke.Services.Exceptions;
using Rawson.App;
using Rawson.Data;
using DevExpress.Web;
using Rawson.Data.Model;

namespace Rawson.GreasingRecords
{
    public partial class GreasingRecordForm : PortalModuleBase
    {
        protected void Page_Init(object sender, EventArgs e)
        {
            GreasingRecordFormController controller = new GreasingRecordFormController();

            if (Request.QueryString["GreasingRecordID"] == null)
            {
                controller.Options.TrackingMode = TrackingModes.Disconnected;
                controller.NewEntity();

                if (Request.QueryString["JobID"] == null)
                    Exceptions.ProcessModuleLoadException("JobID is required for this operation.", this, null);
                else
                    controller.SetJob(Int32.Parse(Request.QueryString["JobID"]));
            }
            else
            {
                int grId;
                if (int.TryParse(Request.QueryString["GreasingRecordID"], out grId))
                {
                    controller.Options.TrackingMode = TrackingModes.Connected;
                    controller.Load(grId);
                }
                else
                {
                    Exceptions.ProcessModuleLoadException("Unable to match JobID", this, null);
                }
            }

            btnEdit.Visibility = controller.CanEdit ? GridViewCustomButtonVisibility.AllDataRows : GridViewCustomButtonVisibility.Invisible;
            btnDelete.Visibility = controller.CanEdit ? GridViewCustomButtonVisibility.AllDataRows : GridViewCustomButtonVisibility.Invisible;

            ASPxLoadingPanel1.Text = "Loading.....";

            Context.Items.Add("#boController", controller);
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            GreasingItemsGrid.Templates.PagerBar = new CustomPagerBarTemplate();
            GreasingItemsGrid.SettingsPager.AlwaysShowPager = true;

            if (!Page.IsPostBack)
            {
                LoadData();
                FSRTextBox.Focus();
            }
        }

        private void LoadData()
        {
            GreasingRecordFormController controller = Context.Items["#boController"] as GreasingRecordFormController;
            GreasingRecord gr = controller.Entity;

            if (gr.GreasingRecordID <= 0)
            {
                GreasingRecordIDLabel.Text = "NEW";

                lnkNewItem.NavigateUrl = "#";
                lnkNewItem.Enabled = false;
            }
            else
            {
                GreasingRecordIDLabel.Text = gr.GreasingRecordID.ToString();



                lnkNewItem.NavigateUrl = DotNetNuke.Common.Globals.NavigateURL(TabId, "GreaseItem", "mid=" + ModuleId, "GreasingRecordID=" + gr.GreasingRecordID.ToString());
                lnkNewItem.Enabled = true;
            }

            // load Latitude and Longitude if available
            txtLatitude.Text = gr.Job.ClientLocation.Latitude;
            txtLongitude.Text = gr.Job.ClientLocation.Longitude;

            lblClientName.Text = gr.Job.ClientLocation.Client.Name;
            LocationLabel.Text = gr.Job.ClientLocation.Name;
            txtPipeLineSegment.Text = gr.PipelineSegment ?? "";
            FSRTextBox.Text = gr.FSRNum;
            lblSapWoNum.Text = gr.Job.SapWoNum ?? "";


            if (gr.Job.CompletionDate.HasValue)
                CompletionDateLabel.Text = gr.Job.CompletionDate.Value.ToString("d");

            FieldTextBox.Text = gr.Field ?? "";
            txtSapPsv.Text = gr.SapPSV ?? "";

            if (gr.Job.AssignedToID.HasValue)
                TechLabel.Text = controller.GetEmployeeName(gr.Job.AssignedToID.Value);

            JobNumLabel.Text = gr.JobID.ToString();
            SOLabel.Text = gr.Job.SalesOrderNum ?? "";
        }


        protected void GreasingRecordItemDataSource_Selecting(object sender, LinqDataSourceSelectEventArgs e)
        {
            GreasingRecordFormController controller = Context.Items["#boController"] as GreasingRecordFormController;
            e.Result = controller.GetCurrentGreasingRecordItems();
        }

        protected void GreasingItemsGrid_CustomButtonCallback(object sender, DevExpress.Web.ASPxGridViewCustomButtonCallbackEventArgs e)
        {
            ASPxGridView grid = sender as ASPxGridView;
            object[] values = grid.GetRowValues(e.VisibleIndex, "GreasingRecordItemID", "GreasingRecordID") as object[];

            if (e.ButtonID == "btnEdit")
                Response.RedirectLocation = DotNetNuke.Common.Globals.NavigateURL(TabId, "GreaseItem", "mid=" + ModuleId, "GreasingRecordItemID=" + values[0]);
            else
            {
                GreasingRecordFormController controller = Context.Items["#boController"] as GreasingRecordFormController;
                controller.Delete(values[0]);

                grid.DataBind();
            }
        }

        protected void GreasingItemsGrid_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
        {
            int pageSize;
            if (Int32.TryParse(e.Parameters, out pageSize))
                GreasingItemsGrid.SettingsPager.PageSize = pageSize;

            GreasingItemsGrid.DataBind();
        }

        protected void GreasingItemsGrid_DataBound(object sender, EventArgs e)
        {
            GreasingItemsGrid.JSProperties["cpPageCount"] = GreasingItemsGrid.PageCount;
        }

        protected void GreasingItemsGrid_CustomColumnDisplayText(object sender, ASPxGridViewColumnDisplayTextEventArgs e)
        {
            GreasingRecordFormController controller = Context.Items["#boController"] as GreasingRecordFormController;

            switch (e.Column.FieldName)
            {
                case "ActuatorLubed":
                    e.DisplayText = controller.GetYesNoDisplay(e.Value);
                    break;
                case "ActuatorInspected":
                    e.DisplayText = controller.GetYesNoDisplay(e.Value);
                    break;
                case "ValveSecured":
                    e.DisplayText = controller.GetYesNoDisplay(e.Value);
                    break;
                case "FlangeOrScrew":
                    break;
                case "EaseOfOperation":
                    break;
                case "LubeTypeID":
                    e.DisplayText = controller.GetLubeTypeDisplay(e.Value);
                    break;
            }
        }

        protected void SaveAction_Callback(object source, DevExpress.Web.CallbackEventArgs e)
        {
            GreasingRecordFormController controller = Context.Items["#boController"] as GreasingRecordFormController;
            GreasingRecord gr = controller.Entity;

            gr.PipelineSegment = txtPipeLineSegment.Text;
            gr.Field = FieldTextBox.Text;
            gr.SapPSV = txtSapPsv.Text;
            gr.FSRNum = FSRTextBox.Text;

            decimal latitude = 0;
            decimal longitude = 0;

            gr.Job.ClientLocation.Latitude = Decimal.TryParse(txtLatitude.Text, out latitude) ? latitude.ToString() : null;
            gr.Job.ClientLocation.Longitude = Decimal.TryParse(txtLongitude.Text, out longitude) ? longitude.ToString() : null;

            if (gr.Version == null)
            {
                gr.Job.GreasingRecords.Add(gr);
                // Remove active datacontext relations
                //controller.Detach();
                //gr = controller.Entity;
                //////////////////////////////////////

                gr.CreatedBy = controller.ResolveEmployeeID(UserId);
                gr.CreatedDate = DateTime.Now;
            }

            gr.ModifiedBy = controller.ResolveEmployeeID(UserId);
            gr.ModifiedDate = DateTime.Now;

            if (controller.Validate())
            {
                SaveAction.JSProperties.Add("cpHasErrors", false);

                if (controller.Save())
                {
                    Response.RedirectLocation = DotNetNuke.Common.Globals.NavigateURL(TabId, "Grease", "mid=" + ModuleId, "GreasingRecordID=" + gr.GreasingRecordID.ToString());
                }
                else
                    Exceptions.ProcessModuleLoadException(controller.ErrorMessage, this, controller.ErrorException);
            }
            else
            {
                SaveAction.JSProperties.Add("cpErrorMessage", controller.ValidationMessage());
                SaveAction.JSProperties.Add("cpHasErrors", true);
            }
        }

    }
}
