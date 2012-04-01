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

namespace Rawson.GreasingRecords
{
    public partial class GreasingRecordItemForm : PortalModuleBase
    {
        protected void Page_Init(object sender, EventArgs e)
        {
            GreasingRecordItemFormController controller = new GreasingRecordItemFormController();

            if (Request.QueryString["GreasingRecordItemID"] == null)
            {
                controller.Options.TrackingMode = TrackingModes.Disconnected;
                controller.NewEntity();

                int grId;
                if (!Int32.TryParse(Request.QueryString["GreasingRecordID"], out grId))
                    Exceptions.ProcessModuleLoadException("GreasingRecordID is required.", this, null);

                controller.LoadGreasingRecord(grId);
            }
            else
            {
                int itemId;
                if (int.TryParse(Request.QueryString["GreasingRecordItemID"], out itemId))
                {
                    controller.Options.TrackingMode = TrackingModes.Connected;
                    controller.Load(itemId);
                }
                else
                    Exceptions.ProcessModuleLoadException("Unable to match GreasingRecordItemID", this, null);
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
            GreasingRecordItemFormController controller = Context.Items["#boController"] as GreasingRecordItemFormController;
            GreasingRecordItem item = controller.Entity;

            if (item.Version == null)
                GreasingRecordItemIDLabel.Text = "NEW";
            else
                GreasingRecordItemIDLabel.Text = item.GreasingRecordItemID.ToString();

            //bind the serviceitems
            siEdit.ClientLocationID = item.GreasingRecord.Job.ClientLocationID;
            siEdit.ServiceItemID = item.ServiceItemID;

            ActuatorInspSelect.Value = item.ActuatorInspected.GetValueOrDefault(0);
            ActuatorLubedSelect.Value = item.ActuatorLubed.GetValueOrDefault(0);
            sePercentCycled.Value = item.PercentCycled.GetValueOrDefault(0);
            ValveSecuredSelect.Value = item.ValveSecured.GetValueOrDefault(0);

            if (item.FlangeOrScrew.HasValue)
                FlangeOrScrewSelect.Value = item.FlangeOrScrew;
            else
                FlangeOrScrewSelect.Value = null;

            EaseOfOpSelect.Value = item.EaseOfOperation.GetValueOrDefault(0);
            SeatsCheckedSelect.Value = item.SeatsChecked.GetValueOrDefault(0);
            SeatsLubedSelect.Value = item.SeatsLubed.GetValueOrDefault(0);
            LeakingSelect.Value = item.Leaking.GetValueOrDefault(0);
            LubeTypeSelect.Value = item.LubeTypeID.GetValueOrDefault(-1);
            seAmountInjected.Value = item.AmountInjected;
            RemarksTextBox.Text = item.Notes ?? "";

            siEdit.Focus();
        }

        protected void ASPxSpellChecker1_CheckedElementResolve(object sender, DevExpress.Web.ASPxClasses.ControlResolveEventArgs e)
        {
            e.ResolvedControl = RemarksTextBox;
        }

        protected void LubeTypeDataSource_Selecting(object sender, LinqDataSourceSelectEventArgs e)
        {
            GreasingRecordItemFormController controller = Context.Items["#boController"] as GreasingRecordItemFormController;
        }
        protected void LubeTypeDataSource_Selecting1(object sender, LinqDataSourceSelectEventArgs e)
        {
            GreasingRecordItemFormController controller = Context.Items["#boController"] as GreasingRecordItemFormController;
            e.Result = controller.GetLubeTypes();
        }

        protected void SaveAction_Callback(object source, DevExpress.Web.ASPxCallback.CallbackEventArgs e)
        {
            GreasingRecordItemFormController controller = Context.Items["#boController"] as GreasingRecordItemFormController;
            GreasingRecordItem gri = controller.Entity;

            gri.ServiceItemID = siEdit.ServiceItemID;
            gri.ActuatorInspected = Convert.ToInt32(ActuatorInspSelect.Value);
            gri.ActuatorLubed = Convert.ToInt32(ActuatorLubedSelect.Value);
            gri.PercentCycled = Convert.ToInt32(sePercentCycled.Value);
            gri.ValveSecured = Convert.ToInt32(ValveSecuredSelect.Value);
            gri.FlangeOrScrew = String.IsNullOrEmpty((string)FlangeOrScrewSelect.Value) ? (char?)null : Convert.ToChar(FlangeOrScrewSelect.Value);
            gri.EaseOfOperation = Convert.ToInt32(EaseOfOpSelect.Value);
            gri.SeatsChecked = Convert.ToInt32(SeatsCheckedSelect.Value);
            gri.SeatsLubed = Convert.ToInt32(SeatsLubedSelect.Value);
            gri.Leaking = Convert.ToInt32(LeakingSelect.Value);
            gri.LubeTypeID = (LubeTypeSelect.Value == "-1") ? (int?)null : Convert.ToInt32(LubeTypeSelect.Value);
            gri.AmountInjected = Convert.ToSingle(seAmountInjected.Number);
            gri.Notes = RemarksTextBox.Text;

            if (gri.Version == null)
            {
                // Remove active datacontext relations
                controller.Detach();
                gri = controller.Entity;
                //////////////////////////////////////

                gri.CreatedBy = controller.ResolveEmployeeID(UserId);
                gri.CreatedDate = DateTime.Now;
            }

            gri.ModifiedBy = controller.ResolveEmployeeID(UserId);
            gri.ModifiedDate = DateTime.Now;

            if (controller.Validate())
            {
                SaveAction.JSProperties.Add("cpHasErrors", false);

                if (controller.Save())
                {
                    Response.RedirectLocation = DotNetNuke.Common.Globals.NavigateURL(TabId, "Grease", "mid=" + ModuleId, "GreasingRecordID=" + gri.GreasingRecordID.ToString());
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
