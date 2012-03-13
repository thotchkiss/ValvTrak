using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Rawson.Data.Controllers;
using DotNetNuke.Entities.Modules;

namespace Rawson.Employees
{
    public partial class EmployeeForm : PortalModuleBase
    {
        protected void Page_Init(object sender, EventArgs e)
        {
            EmployeeFormController controller = new EmployeeFormController();
            Context.Items.Add("#boController", controller);
        }

        protected void btnExport_Click(object sender, EventArgs e)
        {
            EmployeesExporter.WriteXlsToResponse();
        }

        protected void EmployeesDataSource_Selecting(object sender, LinqDataSourceSelectEventArgs e)
        {
            EmployeeFormController controller = Context.Items["#boController"] as EmployeeFormController;
            e.Result = controller.GetAllEmployees();
        }

        protected void UsersDataSource_Selecting(object sender, LinqDataSourceSelectEventArgs e)
        {
            EmployeeFormController controller = Context.Items["#boController"] as EmployeeFormController;
            e.Result = controller.GetUsers(PortalId);
        }

        protected void LocationsDataSource_Selecting(object sender, LinqDataSourceSelectEventArgs e)
        {
            EmployeeFormController controller = Context.Items["#boController"] as EmployeeFormController;
            e.Result = controller.GetEmployeeLocations();
        }

        protected void DetailsPanel_Callback(object sender, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
            if (String.IsNullOrEmpty(e.Parameter)) // New
            {
                txtFirstName.Text = String.Empty;
                txtLastName.Text = String.Empty;
                txtWorkPhone.Text = String.Empty;
                txtCellPhone.Text = String.Empty;
                txtEmail.Text = String.Empty;
                cmbLocation.SelectedIndex = -1;
                cmbUser.SelectedIndex = -1;
                chkActive.Checked = true;

                EmployeeLocalData["EmployeeID"] = -1;
            }
            else
            {
                EmployeeFormController controller = Context.Items["#boController"] as EmployeeFormController;
                controller.Load(e.Parameter);

                txtFirstName.Text = controller.Entity.FirstName;
                txtLastName.Text = controller.Entity.LastName;
                txtWorkPhone.Text = controller.Entity.WorkPhone;
                txtCellPhone.Text = controller.Entity.CellPhone;
                txtEmail.Text = controller.Entity.Email;
                cmbLocation.Value = controller.Entity.EFC_LocationID;
                cmbUser.Value = controller.Entity.UserID.HasValue ? controller.Entity.UserID : -1 ;
                chkActive.Checked = controller.Entity.Active;

                EmployeeLocalData["EmployeeID"] = controller.Entity.EmployeeID;
            }
        }

        protected void EmployeeSaveAction_Callback(object source, DevExpress.Web.ASPxCallback.CallbackEventArgs e)
        {
            EmployeeFormController controller = Context.Items["#boController"] as EmployeeFormController;
            controller.Load(EmployeeLocalData["EmployeeID"]);

            controller.Entity.FirstName = txtFirstName.Text;
            controller.Entity.LastName = txtLastName.Text;
            controller.Entity.WorkPhone = txtWorkPhone.Text;
            controller.Entity.CellPhone = txtCellPhone.Text;
            controller.Entity.Email = txtEmail.Text;
            controller.Entity.EFC_LocationID = cmbLocation.Value == null ? -1 :  (int)cmbLocation.Value;
            controller.Entity.UserID = cmbUser.Value == null ? -1 : (int)cmbUser.Value;
            controller.Entity.Active = chkActive.Checked;

            EmployeeSaveAction.JSProperties["cpHasErrors"] = false;

            if (controller.Validate())
            {
                if (controller.Save())
                {
                    EmployeeSaveAction.JSProperties["cpEmployeeID"] = controller.Entity.EmployeeID; 
                }
                else
                {
                    EmployeeSaveAction.JSProperties["cpHasErrors"] = true;
                    EmployeeSaveAction.JSProperties["cpErrorMessage"] = controller.ErrorMessage;
                }
            }
            else
            {
                EmployeeSaveAction.JSProperties["cpHasErrors"] = true;
                EmployeeSaveAction.JSProperties["cpErrorMessage"] = controller.ValidationMessage();
            }
        }

    }
}