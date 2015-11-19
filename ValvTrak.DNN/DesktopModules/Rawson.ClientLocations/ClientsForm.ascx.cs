using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Rawson.Data.Controllers;
using DotNetNuke.Services.Exceptions;
using DevExpress.Web;
using DotNetNuke.Entities.Modules;
using Rawson.Data.Model;

namespace Rawson.ClientLocations
{
    public partial class ClientsForm : PortalModuleBase
    {
        protected void Page_Init(object sender, EventArgs e)
        {
            ClientFormController controller = new ClientFormController();
            Context.Items.Add("#boController", controller);
        }

        protected void ClientsGridSource_Selecting(object sender, LinqDataSourceSelectEventArgs e)
        {
            ClientFormController controller = Context.Items["#boController"] as ClientFormController;
            e.Result = controller.GetClients();
        }

        protected void LocationsGridSource_Selecting(object sender, LinqDataSourceSelectEventArgs e)
        {
            ClientFormController controller = Context.Items["#boController"] as ClientFormController;

            if (hfSelectedClient.Contains("ClientID"))
                controller.Load(hfSelectedClient["ClientID"]);

            e.Result = controller.GetCurrentLocations();
        }

        protected void StatesDataSource_Selecting(object sender, LinqDataSourceSelectEventArgs e)
        {
            ClientFormController controller = Context.Items["#boController"] as ClientFormController;
            e.Result = controller.GetStatesList();
        }

        protected void LocationClientsList_Selecting(object sender, LinqDataSourceSelectEventArgs e)
        {
            ClientFormController controller = Context.Items["#boController"] as ClientFormController;
            e.Result = controller.GetParentClientList();
        }

        protected void JobTypesDataSource_Selecting(object sender, LinqDataSourceSelectEventArgs e)
        {
            ClientFormController controller = Context.Items["#boController"] as ClientFormController;
            e.Result = controller.Scheduler.GetJobTypesList();
        }

        protected void ServiceIntervalsDataSource_Selecting(object sender, LinqDataSourceSelectEventArgs e)
        {
            ClientFormController controller = Context.Items["#boController"] as ClientFormController;
            e.Result = controller.Scheduler.GetServiceIntervalsList();
        }

        protected void ClientDetailsPanel_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            string action = (string)hfSelectedClient["Action"];

            if (action == "Edit")
            {
                int loadID = Convert.ToInt32(e.Parameter);

                ClientFormController controller = Context.Items["#boController"] as ClientFormController;
                controller.Load(loadID);

                txtClientName.Text = controller.Entity.Name;
                txtClientAddress.Text = controller.Entity.Address;
                txtClientCity.Text = controller.Entity.City;
                cmbClientState.Value = controller.Entity.State;
                txtClientZipcode.Text = controller.Entity.ZipCode;
                txtClientPhone.Text = controller.Entity.Phone;
                chkClientActive.Checked = controller.Entity.Active;

                hfSelectedClient["ClientID"] = controller.Entity.ClientID;

                btnNewLocation.Enabled = true;
                btnExportLocations.Enabled = true;
                LocationsGrid.Enabled = true;
            }
            else // New
            {
                txtClientName.Text = String.Empty;
                txtClientAddress.Text = String.Empty;
                txtClientCity.Text = String.Empty;
                cmbClientState.Value = String.Empty;
                txtClientZipcode.Text = String.Empty;
                txtClientPhone.Text = String.Empty;
                chkClientActive.Checked = true;

                hfSelectedClient["ClientID"] = -1;

                btnNewLocation.Enabled = false;
                btnExportLocations.Enabled = false;
                LocationsGrid.Enabled = false;
            }

            LocationsGrid.DataBind();
        }

        protected void LocationDetailsPanel_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            string action = (string)hfSelectedLocation["Action"];

            if (action == "Edit")
            {
                ClientFormController controller = Context.Items["#boController"] as ClientFormController;
                controller.Load(hfSelectedClient["ClientID"]);

                ClientLocation location = controller.GetLocation(Convert.ToInt32(e.Parameter));

                cbAssociatedClient.Value = location.ClientID;
                
                txtLocationName.Text = location.Name;
                txtLocationAddress.Text = location.Address;
                txtLocationCity.Text = location.City;
                cmbLocationState.Value = location.State;
                txtClientZipcode.Value = location.ZipCode;
                txtLocationPhone.Value = location.Phone;
                txtPropertyNumber.Text = location.PropertyNumber;

                decimal latitude;
                decimal longitude;

                if (!decimal.TryParse(location.Latitude, out latitude))
                    latitude = 0;

                if (!decimal.TryParse(location.Longitude, out longitude))
                    longitude = 0;

                seLocationLatitude.Number = latitude;
                seLocationLongitude.Number = longitude;
                
                chkLocationActive.Checked = location.Active;

                hfSelectedLocation["ClientLocationID"] = location.ClientLocationID;

                btnSetServiceSchedules.Enabled = true;
            }
            else // New
            {
                ClientFormController controller = Context.Items["#boController"] as ClientFormController;
                controller.Load(hfSelectedClient["ClientID"]);

                cbAssociatedClient.Value = controller.Entity.ClientID;

                txtLocationName.Text = String.Empty;
                txtLocationAddress.Text = String.Empty;
                txtLocationCity.Text = String.Empty;
                cmbLocationState.Value = String.Empty;
                txtClientZipcode.Value = String.Empty;
                txtLocationPhone.Text = String.Empty;
                txtPropertyNumber.Text = String.Empty;
                seLocationLatitude.Number = 0;
                seLocationLatitude.Number = 0;
                chkLocationActive.Checked = true;

                hfSelectedLocation["ClientLocationID"] = -1;

                btnSetServiceSchedules.Enabled = false;
            }
        }

        protected void ClientSaveAction_Callback(object source, DevExpress.Web.CallbackEventArgs e)
        {
            ClientFormController controller = Context.Items["#boController"] as ClientFormController;

            string action = (string)hfSelectedClient["Action"];

            if (action == "New")
                controller.NewEntity();
            else
                controller.Load(hfSelectedClient["ClientID"]);

            controller.Entity.Name = txtClientName.Text;
            controller.Entity.Address = txtClientAddress.Text;
            controller.Entity.City = txtClientCity.Text;
            controller.Entity.State = (string)cmbClientState.Value;
            controller.Entity.ZipCode = txtClientZipcode.Text;
            controller.Entity.Phone = txtClientPhone.Text;
            controller.Entity.Active = chkClientActive.Checked;

            ClientSaveAction.JSProperties["cpHasErrors"] = false;

            if (controller.Save())
            {
                ClientSaveAction.JSProperties["cpClientID"] = controller.Entity.ClientID;
            }
            else
            {
                ClientSaveAction.JSProperties["cpHasErrors"] = true;
                ClientSaveAction.JSProperties["cpErrorMessage"] = controller.ErrorMessage;
            }

            // Needs Ent Lib Validation Configuration

            //if (controller.Validate())
            //{
            //    if (controller.Save())
            //    {
            //        ClientSaveAction.JSProperties["cpClientID"] = controller.Entity.ClientID;
            //    }
            //    else
            //    {
            //        ClientSaveAction.JSProperties["cpHasErrors"] = true;
            //        ClientSaveAction.JSProperties["cpErrorMessage"] = controller.ErrorMessage;
            //    }
            //}
            //else
            //{
            //    ClientSaveAction.JSProperties["cpHasErrors"] = true;
            //    ClientSaveAction.JSProperties["cpErrorMessage"] = controller.ValidationMessage();
            //}
        }

        protected void LocationSaveAction_Callback(object source, DevExpress.Web.CallbackEventArgs e)
        {
            ClientFormController controller = Context.Items["#boController"] as ClientFormController;
            controller.Load(hfSelectedClient["ClientID"]);

            string action = (string)hfSelectedLocation["Action"];

            ClientLocation location = action == "New" ? controller.GetLocation(-1) : controller.GetLocation((int)hfSelectedLocation["ClientLocationID"]);

            location.ClientID = int.Parse(cbAssociatedClient.Value.ToString());
            location.Name = txtLocationName.Text;
            location.Address = txtLocationAddress.Text;
            location.City = txtLocationCity.Text;
            location.State = (string)cmbLocationState.Value;
            location.ZipCode = txtLocationZipcode.Text;
            location.Phone = txtLocationPhone.Text;
            location.PropertyNumber = txtPropertyNumber.Text;

            location.Latitude = seLocationLatitude.Number == 0 ? null : seLocationLatitude.Number.ToString();
            location.Longitude = seLocationLongitude.Number == 0 ? null : seLocationLongitude.Number.ToString();

            location.Active = chkLocationActive.Checked;

            location.ServiceDate = null;

            if (action == "New")
                location.CreationDate = DateTime.Now;

            LocationSaveAction.JSProperties["cpHasErrors"] = false;

            if (controller.Save())
            {
                //LocationSaveAction.JSProperties["cpClientID"] = location.ClientID;
                LocationSaveAction.JSProperties["cpClientID"] = controller.Entity.ClientID;
            }
            else
            {
                LocationSaveAction.JSProperties["cpHasErrors"] = true;
                LocationSaveAction.JSProperties["cpErrorMessage"] = controller.ErrorMessage;
            }

            // Needs Ent Lib Validation Configuration

            //if (controller.Validate())
            //{
            //    if (controller.Save())
            //    {
            //        LocationSaveAction.JSProperties["cpClientID"] = location.ClientID;
            //    }
            //    else
            //    {
            //        LocationSaveAction.JSProperties["cpHasErrors"] = true;
            //        LocationSaveAction.JSProperties["cpErrorMessage"] = controller.ErrorMessage;
            //    }
            //}
            //else
            //{
            //    LocationSaveAction.JSProperties["cpHasErrors"] = true;
            //    LocationSaveAction.JSProperties["cpErrorMessage"] = controller.ValidationMessage();
            //}
        }

        protected void btnExport_Click(object sender, EventArgs e)
        {
            ClientsGridViewExporter.WriteXlsToResponse();
        }

        protected void btnExportLocations_Click(object sender, EventArgs e)
        {
            LocationsGridViewExporter.WriteXlsToResponse();
        }

        protected void ClientsGrid_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            ClientsGrid.DataBind();
        }

        protected void LocationSchedulingCallbackPanel_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            ClientFormController controller = Context.Items["#boController"] as ClientFormController;

            int locId = Convert.ToInt32(hfScheduling["ClientLocationID"]);
            int jtId = cmbSchedJob.Value == null ? -1 : (int)cmbSchedJob.Value;
            string action = hfScheduling["Action"].ToString();

            ClientLocation loc = controller.Scheduler.GetClientLocation(locId);
            ClientLocationServiceSchedule schedule = controller.Scheduler.GetLocationServiceScheduleForJobType(locId, jtId);

            if (action == "Apply")
            {
                if (schedule == null)
                {
                    schedule = controller.Scheduler.Load(-1);
                    schedule.JobTypeId = jtId;
                }
                else
                    schedule = controller.Scheduler.Load(schedule.ClientLocationServiceScheduleId);

                schedule.ServiceIntervalId = cmbSchedInterval.Value == null ? -1 : (int)cmbSchedInterval.Value;
                schedule.LastServiceDate = deSchedLastDate.Value == null ? DateTime.Today : Convert.ToDateTime(deSchedLastDate.Value);

                controller.Scheduler.Save();

                lblSchedNextDate.Text = schedule.NextServiceDate.Value.ToShortDateString();

            }
            else if (action == "JobTypeChanged")
            {
                if (schedule != null)
                {
                    cmbSchedJob.Value = schedule.JobTypeId;
                    cmbSchedInterval.Value = schedule.ServiceIntervalId;

                    deSchedLastDate.Value = schedule.LastServiceDate;
                    lblSchedNextDate.Text = schedule.NextServiceDate.Value.ToShortDateString();
                }
                else
                {
                    deSchedLastDate.Value = null;
                    lblSchedNextDate.Text = String.Empty;
                }
                
            }

            
            
        }
    }
}