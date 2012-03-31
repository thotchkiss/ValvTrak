using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DotNetNuke.Entities.Modules;
using Rawson.Data.Controllers;
using DotNetNuke.Services.Exceptions;
using Rawson.Data;
using DotNetNuke.Entities.Users;
using Rawson.App;
using Rawson.Data.Model;

namespace Rawson.ValveTests
{
    public partial class ValveTestForm : PortalModuleBase
    {
        protected void Page_Init ( object sender, EventArgs e )
        {
            ValveTestFormController controller = new ValveTestFormController ();

            if ( Request.QueryString[ "ValveTestID" ] == null )
            {
                controller.Options.TrackingMode = TrackingModes.Disconnected;
                controller.NewEntity ();

                int jobId;
                if (!Int32.TryParse(Request.QueryString["JobID"], out jobId))
                    Exceptions.ProcessModuleLoadException("JobID is required.", this, null);

                controller.SetJob ( jobId );
            }
            else
            {
                int vtId;
                if ( int.TryParse ( Request.QueryString[ "ValveTestID" ], out vtId ) )
                {
                    controller.Options.TrackingMode = TrackingModes.Connected;
                    controller.Load ( vtId );
                }
                else
                    Exceptions.ProcessModuleLoadException ( "Unable to match ValveTestID", this, null );
            }

            Context.Items.Add ( "#boController", controller );
        }

        protected void Page_Load ( object sender, EventArgs e )
        {
            if ( !Page.IsPostBack )
            {
                LoadData ();
                FSRNumTextBox.Focus();
            }
        }

        private void LoadData ()
        {
            ValveTestFormController controller = Context.Items["#boController"] as ValveTestFormController;
            ValveTest vt = controller.Entity;

            if ( vt.JobID == 0 )
                ValveTestIDLabel.Text = "NEW";
            else
                ValveTestIDLabel.Text = vt.ValveTestID.ToString ();

            //bind the serviceitems
            siEdit.ClientLocationID = vt.Job.ClientLocationID;
            siEdit.ServiceItemID = vt.ServiceItemID;



            SalesOrderLabel.Text = vt.Job.SalesOrderNum ?? "";
            FSRNumTextBox.Text = vt.FSRNum ?? "";
            CustomerLabel.Text = vt.Job.ClientLocation.Client.Name;
            LocationLabel.Text = vt.Job.ClientLocation.Name;
            int LocationID = vt.Job.ClientLocationID;

            CostCenterTextBox.Text = vt.CostCenter;
            SapPsvTextBox.Text = vt.SapPsv;
            PsvApplicationTextBox.Text = vt.PsvApplication;
            DateTestedEdit.Value = vt.DateTested;

            if ( vt.Coded == null )
                CodedSelect.Value = -1;
            else if ( vt.Coded == true )
                CodedSelect.Value = 1;
            else
                CodedSelect.Value = 0;
            if ( vt.IsolationValve == null )
                IsolationValveSelect.Value = -1;
            else if ( vt.IsolationValve == true )
                IsolationValveSelect.Value = 1;
            else
                IsolationValveSelect.Value = 0;
            ReliefValveSupportSelect.Value = vt.ReliefValveSupport.GetValueOrDefault ( -1 );
            if ( vt.TestPort == null )
                TestPortSelect.Value = -1;
            else if ( vt.TestPort == true )
                TestPortSelect.Value = 1;
            else
                TestPortSelect.Value = 0;
            WeatherCapSelect.Value = vt.WeatherCap.GetValueOrDefault ( -1 );
            if ( vt.DotLocation == null )
                DOTLocationSelect.Value = -1;
            else if ( vt.DotLocation == true )
                DOTLocationSelect.Value = 1;
            else
                DOTLocationSelect.Value = 0;
            JSACompleteCheckBox.Checked = vt.JsaComplete;

            seSetPressure.Value= vt.SetPressure.GetValueOrDefault ( 0 );
            seBackPressure.Value = vt.BackPressure.GetValueOrDefault ( 0 );
            ColdDiffPressureTextBox.Text = vt.ColdDiffPressure.GetValueOrDefault ( 0 ).ToString ( "N2" );
            TempCorrTextBox.Text = vt.TempCorr.GetValueOrDefault ( 0 ).ToString ( "N2" );
            CapacityTextBox.Text = vt.Capacity.GetValueOrDefault ( 0 ).ToString ( "N2" );

            CapacityTypeSelect.DataBind ();
            CapacityTypeSelect.Value = vt.CapacityTypeID ?? 4; //4=Not Specified in Lists table

            SealNumTextBox.Text = vt.SealNum ?? "";
            GuageNumTextBox.Text = vt.GaugeNum ?? "";
            CalibrationDueDateEdit.Value = vt.CalibrationDue;
            ValveDateEdit.Value = vt.ValveDate;
            SetPressureFoundTextBox.Text = vt.SetPressureFound.GetValueOrDefault ( 0 ).ToString ( "N2" );
            SetPressureLeftTextBox.Text = vt.SetPressureLeft.GetValueOrDefault ( 0 ).ToString ( "N2" );

            TestResultIDSelect.Value = vt.TestResultID.GetValueOrDefault(-1);

            RemarksTextBox.Text = vt.Notes ?? "";
            ItemsForImmediateReviewTextBox.Text = vt.ReviewItems ?? "";

            TechIDSelect.Value = vt.TechID ?? -1;

            CustomerWitnessTextBox.Text = vt.CustomerWitness ?? "";
        }

        protected void CapacityTypeDataSource_Selecting ( object sender, LinqDataSourceSelectEventArgs e )
        {
            ValveTestFormController controller = Context.Items[ "#boController" ] as ValveTestFormController;
            e.Result = controller.GetCapacityList ();
        }

        protected void EmployeeDataSource_Selecting ( object sender, LinqDataSourceSelectEventArgs e )
        {
            ValveTestFormController controller = Context.Items[ "#boController" ] as ValveTestFormController;
            e.Result = controller.GetEmployeesList();
        }

        //private void LoadServiceItemDisplay ( ServiceItem si )
        //{
        //    if (si != null)
        //    {
        //        LatitudeLabel.Text = si.ClientLocation.Latitude ?? "";
        //        LongitudeLabel.Text = si.ClientLocation.Longitude ?? "";
        //        ModelLabel.Text = si.ManufacturerModel.Model ?? "";
        //        ManufacturerLabel.Text = si.ManufacturerModel.Manufacturer.Name ?? "";
        //        SerialLabel.Text = si.SerialNum ?? "";
        //    }
        //    else
        //    {
        //        LatitudeLabel.Text = "";
        //        LongitudeLabel.Text = "";
        //        ModelLabel.Text = "";
        //        ManufacturerLabel.Text = "";
        //        SerialLabel.Text = "";
        //    }
        //}

        //protected void ServiceItemSelect1_SelectedIndexChanged ( object sender, EventArgs e )
        //{
        //    ValveTestFormController controller = Context.Items[ "#boController" ] as ValveTestFormController;
        //    LoadServiceItemDisplay ( controller.SetServiceItem ( Convert.ToInt32 ( siEdit.ServiceItemID ) ) );
        //}

        protected void ASPxSpellChecker1_CheckedElementResolve ( object sender, DevExpress.Web.ASPxClasses.ControlResolveEventArgs e )
        {
            e.ResolvedControl = RemarksTextBox;
        }

        protected void ASPxSpellChecker2_CheckedElementResolve ( object sender, DevExpress.Web.ASPxClasses.ControlResolveEventArgs e )
        {
            e.ResolvedControl = ItemsForImmediateReviewTextBox;
        }

        protected void SaveAction_Callback(object source, DevExpress.Web.ASPxCallback.CallbackEventArgs e)
        {
            Save();
        }

        void Save ()
        {
            ValveTestFormController controller = Context.Items[ "#boController" ] as ValveTestFormController;
            ValveTest vt = controller.Entity;

            vt.ServiceItemID = siEdit.ServiceItemID;
            vt.FSRNum = FSRNumTextBox.Text;
            vt.CostCenter = CostCenterTextBox.Text;
            vt.PsvApplication = PsvApplicationTextBox.Text;
            vt.SapPsv = SapPsvTextBox.Text;
            vt.DateTested = (DateTime?)DateTestedEdit.Value;
            vt.SetPressure = Convert.ToDouble(seSetPressure.Number);
            vt.BackPressure = Convert.ToDouble(seBackPressure.Number);
            vt.ColdDiffPressure = Convert.ToDouble(seSetPressure.Number - seBackPressure.Number);
            vt.TempCorr = ( TempCorrTextBox.Text == "" ) ? (double?)null : double.Parse ( TempCorrTextBox.Text );
            vt.Capacity = ( CapacityTextBox.Text == "" ) ? (double?)null : double.Parse ( CapacityTextBox.Text );
            vt.CapacityTypeID = Convert.ToInt32 ( CapacityTypeSelect.Value );
            vt.SealNum = SealNumTextBox.Text;
            vt.GaugeNum = GuageNumTextBox.Text;
            vt.CalibrationDue = (DateTime?)CalibrationDueDateEdit.Value;
            vt.ValveDate = (DateTime?)ValveDateEdit.Value;


            bool? CodedVar = null;
            if ( (int)CodedSelect.Value == -1 )
                CodedVar = null;
            else if ( (int)CodedSelect.Value == 1 )
                CodedVar = true;
            else
                CodedVar = false;
            vt.Coded = CodedVar;

            bool? isolationValveValue = null;
            if ( (int)IsolationValveSelect.Value == -1 )
                isolationValveValue = null;
            else if ( (int)IsolationValveSelect.Value == 1 )
                isolationValveValue = true;
            else
                isolationValveValue = false;
            vt.IsolationValve = isolationValveValue;

            vt.ReliefValveSupport = ( (int)ReliefValveSupportSelect.Value == -1 ) ? (int?)null : Convert.ToInt32 ( ReliefValveSupportSelect.Value );

            bool? TestPortValue = null;
            if ( (int)TestPortSelect.Value == -1 )
                TestPortValue = null;
            else if ( (int)TestPortSelect.Value == 1 )
                TestPortValue = true;
            else TestPortValue = false;
            vt.TestPort = TestPortValue;

            vt.WeatherCap = ( (int)WeatherCapSelect.Value == -1 ) ? (int?)null : Convert.ToInt32 ( WeatherCapSelect.Value );

            bool? DotLocValue = null;
            if ( (int)DOTLocationSelect.Value == -1 )
                DotLocValue = null;
            else if ( (int)DOTLocationSelect.Value == 1 )
                DotLocValue = true;
            else DotLocValue = false;
            vt.DotLocation = DotLocValue;

            vt.JsaComplete = JSACompleteCheckBox.Checked;
            vt.SetPressureFound = ( SetPressureFoundTextBox.Text == "" ) ? (decimal?)null : decimal.Parse ( SetPressureFoundTextBox.Text );
            vt.SetPressureLeft = ( SetPressureLeftTextBox.Text == "" ) ? (decimal?)null : decimal.Parse ( SetPressureLeftTextBox.Text );

            vt.TestResultID = ( (int)TestResultIDSelect.Value == -1 ) ? (int?)null : Convert.ToInt32 ( TestResultIDSelect.Value );

            vt.Notes = RemarksTextBox.Text;
            vt.ReviewItems = ItemsForImmediateReviewTextBox.Text;
            vt.TechID = ( (int)TechIDSelect.Value == -1 ) ? (int?)null : Convert.ToInt32 ( TechIDSelect.Value );
            vt.CustomerWitness = CustomerWitnessTextBox.Text;

            if ( vt.Version == null )
            {
                // Remove active datacontext relations
                controller.Detach();
                vt = controller.Entity;
                //////////////////////////////////////

                vt.CreatedBy = controller.ResolveEmployeeID(UserId);
                vt.CreatedDate = DateTime.Now;
            }

            vt.ModifiedBy = controller.ResolveEmployeeID(UserId);
            vt.ModifiedDate = DateTime.Now;

            if (controller.Validate())
            {
                SaveAction.JSProperties.Add("cpHasErrors", false);

                if (controller.Save())
                {
                    //Back to base form which called this edit form.
                    //Response.RedirectLocation = DotNetNuke.Common.Globals.NavigateURL(TabId);
                }
                else
                {
                    SaveAction.JSProperties.Add("cpErrorMessage", controller.ErrorMessage);
                    SaveAction.JSProperties.Add("cpHasErrors", true);
                }
            }
            else
            {
                SaveAction.JSProperties.Add("cpErrorMessage", controller.ValidationMessage());
                SaveAction.JSProperties.Add("cpHasErrors", true);
            }
        }

        void Print ()
        {
            ValveTestFormController controller = Context.Items[ "#boController" ] as ValveTestFormController;
            Response.Redirect ( DotNetNuke.Common.Globals.NavigateURL ( TabId, "Reports", "mid=" + ModuleId, "rpt=vtfr", "vtid=" + controller.Entity.ValveTestID ) );
        }

    }
}
