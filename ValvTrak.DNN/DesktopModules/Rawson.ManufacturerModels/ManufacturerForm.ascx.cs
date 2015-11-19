using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DotNetNuke.Entities.Modules;
using Rawson.Data.Controllers;
using Rawson.Data.Model;

namespace Rawson.ManufacturerModels
{
    public partial class ManufacturerForm : PortalModuleBase
    {
        protected void Page_Init(object sender, EventArgs e)
        {
            ManufacturerFormController controller = new ManufacturerFormController();
            Context.Items.Add("#boController", controller);
        }

        protected void ManufacturerGridPanel_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            ManufacturerGrid.FilterExpression = "[ManufacturerID] = " + e.Parameter;
            ManufacturerGrid.DataBind();
        }

        protected void ModelGridPanel_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            ManufacturerFormController controller = Context.Items["#boController"] as ManufacturerFormController;

            if (hfModelGridLocalData.Contains("ManufacturerID"))
            {
                controller.Load(hfModelGridLocalData["ManufacturerID"]);
                lblModels.Text = "Models For " + controller.Entity.Name;
            }

            if (!String.IsNullOrEmpty(e.Parameter))
                ModelGrid.FilterExpression = "[ManufacturerModelID] = " + e.Parameter;

            ModelGrid.DataBind();
        }

        protected void ManufacturerPanel_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            ManufacturerFormController controller = Context.Items["#boController"] as ManufacturerFormController;
            controller.Load(hfManufacturerGridLocalData["ManufacturerID"]);

            if (controller.Entity.Version == null) // New
            {
                controller.Entity.Name = "New Manufacturer";
                controller.Entity.Active = true;
            }

            txtManufacturerName.Text = controller.Entity.Name;
            chkManufacturerActive.Checked = controller.Entity.Active;

            txtManufacturerName.Focus();
        }

        protected void ModelPanel_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            ManufacturerFormController controller = Context.Items["#boController"] as ManufacturerFormController;
            controller.Load(hfModelGridLocalData["ManufacturerID"]);

            int modelID = Convert.ToInt32(hfModelGridLocalData["ManufacturerModelID"]);
            ManufacturerModel model = controller.GetModel(modelID);

            txtModelName.Text = model.Model;
            chkModelActive.Checked = model.Active;

            txtModelName.Focus();
        }

        protected void ManufacturerSaveAction_Callback(object source, DevExpress.Web.CallbackEventArgs e)
        {
            ManufacturerFormController controller = Context.Items["#boController"] as ManufacturerFormController;
            controller.Load(hfManufacturerGridLocalData["ManufacturerID"]);

            controller.Entity.Name = txtManufacturerName.Text;
            controller.Entity.Active = chkManufacturerActive.Checked;

            if (controller.Validate())
            {
                if (controller.Save())
                {
                    ManufacturerSaveAction.JSProperties.Add("cpManufacturerID", controller.Entity.ManufacturerID);
                    ManufacturerSaveAction.JSProperties.Add("cpHasErrors", false);
                }
                else
                {
                    ManufacturerSaveAction.JSProperties.Add("cpErrorMessage", controller.ErrorMessage);
                    ManufacturerSaveAction.JSProperties.Add("cpHasErrors", true);
                }
            }
            else
            {
                ManufacturerSaveAction.JSProperties.Add("cpErrorMessage", controller.ValidationMessage());
                ManufacturerSaveAction.JSProperties.Add("cpHasErrors", true);
            }
        }

        protected void ModelSaveAction_Callback(object source, DevExpress.Web.CallbackEventArgs e)
        {
            ManufacturerFormController controller = Context.Items["#boController"] as ManufacturerFormController;
            controller.Load(hfModelGridLocalData["ManufacturerID"]);

            var model = controller.GetModel(Convert.ToInt32(hfModelGridLocalData["ManufacturerModelID"]));

            model.Model = txtModelName.Text;
            model.Active = chkModelActive.Checked;

            if (controller.Validate())
            {
                if (controller.Save())
                {
                    ModelSaveAction.JSProperties.Add("cpManufacturerModelID", model.ManufacturerModelID);
                    ModelSaveAction.JSProperties.Add("cpHasErrors", false);
                }
                else
                {
                    ModelSaveAction.JSProperties.Add("cpErrorMessage", controller.ErrorMessage);
                    ModelSaveAction.JSProperties.Add("cpHasErrors", true);
                }
            }
            else
            {
                ModelSaveAction.JSProperties.Add("cpErrorMessage", controller.ValidationMessage());
                ModelSaveAction.JSProperties.Add("cpHasErrors", true);
            }
        }

        protected void ManufacturerDataSource_Selecting(object sender, LinqDataSourceSelectEventArgs e)
        {
            ManufacturerFormController controller = Context.Items["#boController"] as ManufacturerFormController;
            e.Result = controller.GetManufacturers();
        }

        protected void ModelDataSource_Selecting(object sender, LinqDataSourceSelectEventArgs e)
        {
            ManufacturerFormController controller = Context.Items["#boController"] as ManufacturerFormController;
            
            if (hfModelGridLocalData.Contains("ManufacturerID"))
                controller.Load(hfModelGridLocalData["ManufacturerID"]);

            e.Result = controller.GetCurrentModels();
        }

       
    }
}