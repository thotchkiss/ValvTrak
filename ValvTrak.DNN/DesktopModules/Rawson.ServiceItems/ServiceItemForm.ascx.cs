using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Rawson.Data.Controllers;
using DotNetNuke.Services.Exceptions;
using Rawson.Data;
using DotNetNuke.Common.Utilities;
using Rawson.App;
using Rawson.Data.Specifications;
using Rawson.Data.Model;
using Mehroz;
using DevExpress.Web.ASPxEditors;

namespace Rawson.ServiceItems
{
    public partial class ServiceItemForm : System.Web.UI.UserControl
    {
        //****************************
        //Variables used for Fractions
        //****************************

        Fraction inlet;
        Fraction outlet;

        //****************************

        public int ClientLocationID
        {
            get
            {
                if (hfServiceItem.Contains("siClientLocationID"))
                    return (int)hfServiceItem["siClientLocationID"];
                else
                    return -1;
            }
            set
            {
                hfServiceItem["siClientLocationID"] = value;

                ServiceItemFormController controller = Context.Items[this.UniqueID + "_boController"] as ServiceItemFormController;

                ServiceItemLocationLabel.Text = controller.GetClientLocation(value).Name;
                ServiceItemSelect.DataBind();
            }
        }

        public int ServiceItemID
        {
            get
            {
                if (hfServiceItem.Contains("siServiceItemID"))
                    return (int)hfServiceItem["siServiceItemID"];
                else
                    return -1;
            }
            set
            {
                if (value > 0)
                {
                    hfServiceItem["siServiceItemID"] = value;
                    ServiceItemSelect.Value = value;
                }
                else
                {
                    hfServiceItem["siServiceItemID"] = -1;
                    ServiceItemSelect.Value = -1;
                }

                if (value > 0)
                    btnEdit.Enabled = true;

            }
        }

        public int ServiceItemCategoryID { get; set; }

        private short _tabIndex;
        public short TabIndex
        {
            get
            {
                return _tabIndex;
            }
            set
            {
                _tabIndex = value;

                ServiceItemSelect.TabIndex = _tabIndex;
                btnEdit.TabIndex = _tabIndex++;
                btnAdd.TabIndex = btnEdit.TabIndex++;
            }
        }

        public override void Focus()
        {
            //base.Focus();
            ServiceItemSelect.Focus();
        }

        protected void Page_Init(object sender, EventArgs e)
        {
            ServiceItemFormController controller = new ServiceItemFormController();
            Context.Items.Add(this.UniqueID + "_boController", controller);
        }

        protected void ManufacturerDataSource_Selecting(object sender, LinqDataSourceSelectEventArgs e)
        {
            ServiceItemFormController controller = Context.Items[this.UniqueID + "_boController"] as ServiceItemFormController;
            e.Result = controller.GetManufacturers();
        }

        protected void ModelDataSource_Selecting(object sender, LinqDataSourceSelectEventArgs e)
        {
            ServiceItemFormController controller = Context.Items[this.UniqueID + "_boController"] as ServiceItemFormController;

            if (ManufacturerSelect.Value != null)
                e.Result = controller.GetManufacturerModels((int)ManufacturerSelect.Value);
            else
                e.Result = controller.GetManufacturerModels(-1);
        }

        protected void ServiceItemTypeDataSource_Selecting(object sender, LinqDataSourceSelectEventArgs e)
        {
            ServiceItemFormController controller = Context.Items[this.UniqueID + "_boController"] as ServiceItemFormController;
            e.Result = controller.GetServiceItemTypes(ServiceItemCategoryID);
        }

        protected void ServiceItemDataSource_Selecting(object sender, LinqDataSourceSelectEventArgs e)
        {
            ServiceItemFormController controller = Context.Items[this.UniqueID + "_boController"] as ServiceItemFormController;
            e.Result = controller.GetServiceItems(ClientLocationID);
        }

        protected void ServiceItemnSaveAction_Callback(object source, DevExpress.Web.ASPxCallback.CallbackEventArgs e)
        {
            //Save the new valve
            ServiceItemFormController controller = Context.Items[this.UniqueID + "_boController"] as ServiceItemFormController;

            if (ServiceItemID >= 0)
            {
                controller.Options.TrackingMode = TrackingModes.Connected;
                controller.Load(ServiceItemID);
            }
            else
            {
                controller.Options.TrackingMode = TrackingModes.Disconnected;
                controller.NewEntity();

                if (ClientLocationID >= 0)
                    controller.SetClientLocation(ClientLocationID);
            }

            ServiceItem si = controller.Entity;

            si.SerialNum = SerialNum.Text;
            si.SapEquipNum = txtSapEquipNum.Text;

            si.ServiceItemTypeID = int.Parse(ServiceItemTypeSelect.Value.ToString());
            si.ClientLocationID = this.ClientLocationID;
            si.ManufacturerID = ManufacturerSelect.Value == null ? -1 : (int)ManufacturerSelect.Value;
            si.ManufacturerModelID = ModelSelect.Value == null ? -1 : (int)ModelSelect.Value;
            si.Description = NotesTB.Text;

            si.Threaded = chkThreaded.Checked;
            si.Flanged = chkFlanged.Checked;

            /// *******************************************************
            /// The logic below is to parse the input form the inlet
            /// and outlet textboxes from fraction => double => string
            /// => decimal which is the final format being saved to
            /// the database
            /// *******************************************************
            if (txtInletFrac.Text.Contains("."))
            {
                si.InletSize = decimal.Parse(txtInletFrac.Text);
            }
            else
            {
                //check for whitespace or dashes denoting whole numbers
                if (txtInletFrac.Text.Contains(" ") || txtInletFrac.Text.Contains("-"))
                {
                    inlet = new Fraction();//initialize fraction
                    string theFraction = txtInletFrac.Text;//get the string
                    int spacer = theFraction.IndexOf(" ");//find the space for the integer
                    string theInteger = theFraction.Substring(0, spacer);//get the integer
                    theFraction = theFraction.Substring(spacer + 1);//get the fraction string

                    inlet = Fraction.ToFraction(theFraction); //make the string a fraction
                    double inletdbl = double.Parse(theInteger) + inlet.ToDouble(); // convert to a double
                    si.InletSize = decimal.Parse(inletdbl.ToString()); // convert to decimal and store
                }
                else
                {
                    inlet = new Fraction();
                    inlet = Fraction.ToFraction(txtInletFrac.Text);
                    double inletdbl = inlet.ToDouble();
                    si.InletSize = decimal.Parse(inletdbl.ToString());
                }
            }


            if (txtOutletFrac.Text.Contains("."))
            {
                si.OutletSize = decimal.Parse(txtOutletFrac.Text);
            }
            else
            {
                //check for whitespace or dashes denoting whole numbers
                if (txtOutletFrac.Text.Contains(" ") || txtOutletFrac.Text.Contains("-"))
                {
                    outlet = new Fraction();//initialize fraction
                    string theFraction = txtOutletFrac.Text;//get the string
                    int spacer = theFraction.IndexOf(" ");//find the space for the integer
                    string theInteger = theFraction.Substring(0, spacer);//get the integer
                    theFraction = theFraction.Substring(spacer + 1);//get the fraction string

                    outlet = Fraction.ToFraction(theFraction); //make the string a fraction
                    double outletdbl = double.Parse(theInteger) + outlet.ToDouble(); // convert to a double
                    si.OutletSize = decimal.Parse(outletdbl.ToString()); // convert to decimal and store
                }
                else
                {
                    outlet = new Fraction();
                    outlet = Fraction.ToFraction(txtOutletFrac.Text);
                    double outletdbl = outlet.ToDouble();
                    si.OutletSize = decimal.Parse(outletdbl.ToString());
                }
            }

            ///********************************************************

            si.InletFlangeRating = seInletFlangeRating.Number;
            si.OutletFlangeRating = seOutletFlangeRating.Number;

            si.Active = chkActive.Checked;

            if (si.Version == null)
                controller.Detach();

            if (controller.Validate())
            {
                ServiceItemSaveAction.JSProperties.Add("cpHasErrors", false);

                if (controller.Save())
                {
                    ServiceItemSelect.DataBind();

                    ServiceItemID = controller.Entity.ServiceItemID;
                    ServiceItemSaveAction.JSProperties.Add("cpServiceItemID", ServiceItemID);
                }
                else
                    Exceptions.ProcessModuleLoadException(controller.ErrorMessage, this, controller.ErrorException);

            }
            else
            {
                ServiceItemSaveAction.JSProperties.Add("cpErrorMessage", controller.ValidationMessage());
                ServiceItemSaveAction.JSProperties.Add("cpHasErrors", true);
            }
        }

        private void ClearData()
        {
            ServiceItemFormController controller = Context.Items[this.UniqueID + "_boController"] as ServiceItemFormController;
            //controller.Load(ServiceItemID);

            SerialNum.Text = String.Empty;
            txtSapEquipNum.Text = String.Empty;

            ServiceItemTypeSelect.Value = -1;
            
            ManufacturerSelect.DataSource = controller.GetManufacturers();
            ManufacturerSelect.DataBind();

            ManufacturerSelect.Value = -1;

            ModelSelect.DataSource = controller.GetManufacturerModels(-1);
            ModelSelect.DataBind();

            ModelSelect.Value = -1;
            
            NotesTB.Text = String.Empty;

            chkThreaded.Checked = false;
            chkFlanged.Checked = false;
            txtInletFrac.Text = "0";
            txtOutletFrac.Text = "0";
            seInletFlangeRating.Value = 0;
            seOutletFlangeRating.Value = 0;

            chkActive.Checked = true;
        }

        private void LoadData()
        {
            ServiceItemFormController controller = Context.Items[this.UniqueID + "_boController"] as ServiceItemFormController;
            controller.Load(ServiceItemID);

            SerialNum.Text = controller.Entity.SerialNum;
            txtSapEquipNum.Text = controller.Entity.SapEquipNum;

            ServiceItemTypeSelect.Value = controller.Entity.ServiceItemTypeID.HasValue ? controller.Entity.ServiceItemTypeID : -1;

            ManufacturerSelect.DataSource = controller.GetManufacturers();
            ManufacturerSelect.DataBind();

            ManufacturerSelect.Value = controller.Entity.ManufacturerID.HasValue ? controller.Entity.ManufacturerID : -1;

            ModelSelect.DataSource = controller.GetManufacturerModels(Convert.ToInt32(ManufacturerSelect.Value));
            ModelSelect.DataBind();

            ModelSelect.Value = controller.Entity.ManufacturerModelID.HasValue ? controller.Entity.ManufacturerModelID : -1;

            NotesTB.Text = controller.Entity.Description;

            chkThreaded.Checked = controller.Entity.Threaded.HasValue ? controller.Entity.Threaded.Value : false;
            chkFlanged.Checked = controller.Entity.Flanged.HasValue ? controller.Entity.Flanged.Value : false;

            txtInletFrac.Text = controller.Entity.InletSize.HasValue ? controller.Entity.InletSize.Value.ToString() : "0";
            txtOutletFrac.Text = controller.Entity.OutletSize.HasValue ? controller.Entity.OutletSize.Value.ToString() : "0";
            
            seInletFlangeRating.Value = controller.Entity.InletFlangeRating.HasValue ? controller.Entity.InletFlangeRating : 0;
            seOutletFlangeRating.Value = controller.Entity.OutletFlangeRating.HasValue ? controller.Entity.OutletFlangeRating : 0;

            chkActive.Checked = controller.Entity.Active.HasValue ? controller.Entity.Active.Value : false;
        }

        protected void ServiceItemPanel_Callback(object sender, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
            if (ServiceItemID >= 0)
            {
                LoadData();
            }
            else
                ClearData();
        }

        protected void ServiceItemSelect_Callback(object sender, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
            ServiceItemSelect.DataBind();
        }

        protected void ManufacturerSelect_Callback(object sender, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
            ServiceItemFormController controller = Context.Items[this.UniqueID + "_boController"] as ServiceItemFormController;
            //controller.Load(ServiceItemID);

            ManufacturerSelect.DataSource = controller.GetManufacturers();
            ManufacturerSelect.DataBind();

            if (!String.IsNullOrEmpty(e.Parameter))
            {
                ManufacturerSelect.Value = Convert.ToInt32(e.Parameter); 
                ManufacturerSelect.JSProperties["cpManufacturerID"] = Convert.ToInt32(e.Parameter);
            }
        }

        protected void ModelSelect_Callback(object sender, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
            ServiceItemFormController controller = Context.Items[this.UniqueID + "_boController"] as ServiceItemFormController;
            //controller.Load(ServiceItemID);

            ModelSelect.DataSource = controller.GetManufacturerModels(Convert.ToInt32(ManufacturerSelect.Value));
            ModelSelect.DataBind();

            if (!String.IsNullOrEmpty(e.Parameter))
            {
                ModelSelect.Value = Convert.ToInt32(e.Parameter);
                ModelSelect.JSProperties["cpManufacturerModelID"] = Convert.ToInt32(e.Parameter);
            }
        }

        protected void ModelSaveAction_Callback(object source, DevExpress.Web.ASPxCallback.CallbackEventArgs e)
        {
            ServiceItemFormController controller = Context.Items[this.UniqueID + "_boController"] as ServiceItemFormController;

            int manufacturerID = Convert.ToInt32(ManufacturerSelect.Value);
            string name = e.Parameter;

            ModelSaveAction.JSProperties["cpError"] = null;

            if (manufacturerID == -1)
            {
                ModelSaveAction.JSProperties["cpError"] = "Must select manufacturer";
            }
            else if (String.IsNullOrEmpty(name))
            {
                ModelSaveAction.JSProperties["cpError"] = "Must provide model name.";
            }
            else
            {
                try
                {
                    ModelSaveAction.JSProperties["cpManufacturerModelID"] = controller.CreateModel(manufacturerID, name);
                }
                catch (Exception ex)
                {
                    ModelSaveAction.JSProperties["cpError"] = ex.Message;
                }
            }
        }

        protected void ManufacturerSaveAction_Callback(object source, DevExpress.Web.ASPxCallback.CallbackEventArgs e)
        {
            ServiceItemFormController controller = Context.Items[this.UniqueID + "_boController"] as ServiceItemFormController;

            ManufacturerSaveAction.JSProperties["cpError"] = null;

            if (String.IsNullOrEmpty(e.Parameter))
                ManufacturerSaveAction.JSProperties["cpError"] = "Must provide manufacturer name.";
            else
            {
                try
                {
                    ManufacturerSaveAction.JSProperties["cpManufacturerID"] = controller.CreateManufacturer(e.Parameter);
                }
                catch (Exception ex)
                {
                    ManufacturerSaveAction.JSProperties["cpError"] = ex.Message;
                }
            }

        }

        protected void ModelSelect_ItemRequestedByValue(object source, ListEditItemRequestedByValueEventArgs e)
        {
            if (e.Value != null)
            {
                if (ManufacturerSelect.Value != null)
                {
                    int manufacturerID = Convert.ToInt32(ManufacturerSelect.Value);
                    ServiceItemFormController controller = Context.Items[this.UniqueID + "_boController"] as ServiceItemFormController;

                    ModelSelect.DataSource = controller.GetModelItemRequestedByValue(manufacturerID, e);
                    ModelSelect.DataBind();
                }

            }
        }

        protected void ModelSelect_ItemsRequestedByFilterCondition(object source, ListEditItemsRequestedByFilterConditionEventArgs e)
        {
            if (ManufacturerSelect.Value != null)
            {
                int manufacturerID = Convert.ToInt32(ManufacturerSelect.Value);
                ServiceItemFormController controller = Context.Items[this.UniqueID + "_boController"] as ServiceItemFormController;

                ModelSelect.DataSource = controller.GetModelItemsRequestedByFilterCondition(manufacturerID, e);
                ModelSelect.DataBind();
            }
        }

        protected void ManufacturerSelect_ItemRequestedByValue(object source, ListEditItemRequestedByValueEventArgs e)
        {
            if (e.Value != null)
            {
                ServiceItemFormController controller = Context.Items[this.UniqueID + "_boController"] as ServiceItemFormController;

                ManufacturerSelect.DataSource = controller.GetManufacturerItemRequestedByValue(e);
                ManufacturerSelect.DataBind();
            }
        }

        protected void ManufacturerSelect_ItemsRequestedByFilterCondition(object source, ListEditItemsRequestedByFilterConditionEventArgs e)
        {
            ServiceItemFormController controller = Context.Items[this.UniqueID + "_boController"] as ServiceItemFormController;

            ManufacturerSelect.DataSource = controller.GetManufacturerItemsRequestedByFilterCondition(e);
            ManufacturerSelect.DataBind();
        }
}

}
