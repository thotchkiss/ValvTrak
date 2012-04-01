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
using Rawson.Data.Model;
using Microsoft.Practices.EnterpriseLibrary.Validation;

namespace Rawson.WellSafetyTests
{
    public partial class WellSafetyTestForm : PortalModuleBase
    {
        protected void Page_Init(object sender, EventArgs e)
        {
            WellSafetyFormController controller = new WellSafetyFormController();

            if (Request.QueryString["WellSafetyTestID"] == null)
            {
                controller.Options.TrackingMode = TrackingModes.Disconnected;
                controller.NewEntity();

                int jobId;
                if (!Int32.TryParse(Request.QueryString["JobID"], out jobId))
                    Exceptions.ProcessModuleLoadException("JobID is required.", this, null);

                controller.LoadJob(jobId);
            }
            else
            {
                int wsId;
                if (int.TryParse(Request.QueryString["WellSafetyTestID"], out wsId))
                {
                    controller.Options.TrackingMode = TrackingModes.Connected;
                    controller.Load(wsId);
                }
                else
                    Exceptions.ProcessModuleLoadException("Unable to match WellSafetyTestID", this, null);
            }

            Context.Items.Add("#boController", controller);
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                LoadData();
            }
        }

        private void LoadData()
        {
            WellSafetyFormController controller = Context.Items["#boController"] as WellSafetyFormController;
            WellSafetyTest wt = controller.Entity;

            if (wt.Version == null)
                WellSafetyTestIdLabel.Text = "NEW";
            else
                WellSafetyTestIdLabel.Text = wt.WellSafetyTestID.ToString();

            //bind the serviceitems
            ServiceItemSelect.ClientLocationID = wt.Job.ClientLocationID;
            ServiceItemSelect.ServiceItemID = wt.ServiceItemID;

            JobIDLabel.Text = wt.Job.JobID.ToString();
            SalesOrderNumLabel.Text = wt.Job.SalesOrderNum;
            FSR_NumTextBox.Text = wt.FSR_Num ?? "";
            CompletionDateLabel.Text = wt.Job.CompletionDate.HasValue ? wt.Job.CompletionDate.Value.ToString("d") : "Not Completed";

            ClientLocationIdLabel.Text = wt.Job.ClientLocation.Name;
            SSV_SAP_TextBox.Text = wt.SSV_SAP_Num ?? "";
            FormDateEdit.Value = wt.FormDate;
            BodyMaterialSelect.Value = wt.BodyMaterial ?? "";
            PlugMaterialSelect.Value = wt.PlugMaterial ?? "";
            SteamMaterialSelect.Value = wt.SteamMaterial ?? "";
            GateMaterialSelect.Value = wt.GateMaterial ?? "";
            PortSizeTextBox.Text = wt.PortSize ?? "";
            PressClassTextBox.Text = wt.PressClass ?? "";
            ActuatorTypeSelect.Value = wt.ActuatorType ?? "";
            ActuatorModelTextBox.Text = wt.ActuatorModel ?? "";
            ActuatorSerialNumTextBox.Text = wt.ActuatorSerialNum ?? "";
            AirSupplyMediumSelect.Value = wt.AirSupplyMedium.HasValue ? wt.AirSupplyMedium.Value : Char.Parse(" ");
            ConditionTextBox.Text = wt.Condition ?? "";
            DateManufacturedEdit.Value = wt.DateManufactured;
            SystemLocationSelect.Value = wt.SystemLocation ?? "";
            SystemLocationSelect.Value = wt.SystemLocation;
            ControllerTypeTextBox.Text = wt.ControllerType ?? "";
            HiTextBox.Text = wt.HI ?? "";
            LoTextBox.Text = wt.LO ?? "";
            NotesTextBox.Text = wt.Notes ?? "";
            AssignedToIDLabel.Text = wt.Job.AssignedToID.HasValue ? controller.GetEmployeeName(wt.Job.AssignedToID.Value) : String.Empty;
            CustomerWitnessTextBox.Text = wt.CustomerWitness ?? "";
            ManualOverrideSelect.Value = wt.ManualOverride ?? "";
            TestResultIDSelect.Value = wt.TestResultID.GetValueOrDefault(-1);
           
            CreatedByLabel.Text = wt.CreatedBy.HasValue ? controller.GetEmployeeName(wt.CreatedBy.Value) : controller.GetEmployeeName(controller.ResolveEmployeeID(UserId));
            CreatedDateLabel.Text = wt.CreatedDate.HasValue ? wt.CreatedDate.Value.ToString("d") : DateTime.Now.ToShortDateString();

            ModifiedByLabel.Text = wt.ModifiedBy.HasValue ? controller.GetEmployeeName(wt.ModifiedBy.Value) : controller.GetEmployeeName(controller.ResolveEmployeeID(UserId));
            ModifiedDateLabel.Text = wt.ModifiedDate.HasValue ? wt.ModifiedDate.Value.ToString("d") : DateTime.Now.ToShortDateString();

            FSR_NumTextBox.Focus();
        }

        protected void ASPxSpellChecker1_CheckedElementResolve(object sender, DevExpress.Web.ASPxClasses.ControlResolveEventArgs e)
        {
            e.ResolvedControl = NotesTextBox;
        }

        protected void SaveAction_Callback(object source, DevExpress.Web.ASPxCallback.CallbackEventArgs e)
        {
            WellSafetyFormController controller = Context.Items["#boController"] as WellSafetyFormController;
            WellSafetyTest wt = controller.Entity;

            //set the properties
            wt.ServiceItemID = ServiceItemSelect.ServiceItemID;
            wt.FSR_Num = FSR_NumTextBox.Text;
            wt.SSV_SAP_Num = SSV_SAP_TextBox.Text;
            wt.FormDate = (DateTime?)FormDateEdit.Value;
            wt.BodyMaterial = String.IsNullOrEmpty((string)BodyMaterialSelect.Value) ? null : (string)BodyMaterialSelect.Value;
            wt.PlugMaterial = String.IsNullOrEmpty((string)PlugMaterialSelect.Value) ? null : (string)PlugMaterialSelect.Value;
            wt.SteamMaterial = String.IsNullOrEmpty((string)SteamMaterialSelect.Value) ? null : (string)SteamMaterialSelect.Value;
            wt.GateMaterial = String.IsNullOrEmpty((string)GateMaterialSelect.Value) ? null : (string)GateMaterialSelect.Value;
            wt.PortSize = PortSizeTextBox.Text;
            wt.PressClass = PressClassTextBox.Text;
            wt.ActuatorType = String.IsNullOrEmpty((string)ActuatorTypeSelect.Value) ? null : (string)ActuatorTypeSelect.Value;
            wt.ActuatorModel = ActuatorModelTextBox.Text;
            wt.ActuatorSerialNum = ActuatorSerialNumTextBox.Text;
            wt.AirSupplyMedium = String.IsNullOrEmpty((string)AirSupplyMediumSelect.Value) ? Char.Parse(" ") : Convert.ToChar(AirSupplyMediumSelect.Value);
            wt.Condition = ConditionTextBox.Text;
            wt.DateManufactured = (DateTime?)DateManufacturedEdit.Value;
            wt.SystemLocation = String.IsNullOrEmpty((string)SystemLocationSelect.Value) ? null : (string)SystemLocationSelect.Value;
            wt.ControllerType = ControllerTypeTextBox.Text;
            wt.HI = HiTextBox.Text;
            wt.LO = LoTextBox.Text;
            wt.Notes = NotesTextBox.Text;
            wt.CustomerWitness = CustomerWitnessTextBox.Text;
            wt.ManualOverride = String.IsNullOrEmpty((string)ManualOverrideSelect.Value) ? null : (string)ManualOverrideSelect.Value;
            wt.TestResultID = (TestResultIDSelect.Value == "-1") ? (int?)null : Convert.ToInt32(TestResultIDSelect.Value);
            //wt.CreatedDate = Convert.ToDateTime(CreatedDateLabel.Text);

            if (wt.Version == null)
            {
                // Remove active datacontext relations
                controller.Detach();
                wt = controller.Entity;
                //////////////////////////////////////

                wt.CreatedBy = controller.ResolveEmployeeID(UserId);
                wt.CreatedDate = DateTime.Now;
            }

            wt.ModifiedBy = controller.ResolveEmployeeID(UserId);
            wt.ModifiedDate = DateTime.Now;

            if (controller.Validate())
            {
                SaveAction.JSProperties.Add("cpHasErrors", false);

                if (controller.Save())
                {
                    //Back to base form which called this edit form.
                    //Response.RedirectLocation = DotNetNuke.Common.Globals.NavigateURL(TabId);
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
