using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DotNetNuke.Entities.Modules;
using Rawson.Data.Controllers;
using DotNetNuke.Services.Exceptions;
using Rawson.Data.Model;

public partial class RateValvesForm : PortalModuleBase
{
    protected void Page_Init(object sender, EventArgs e)
    {
        RateValveFormController controller = new RateValveFormController();

        if (Request.QueryString["RateValveTestID"] == null)
        {
            controller.Options.TrackingMode = TrackingModes.Disconnected;
            controller.NewEntity();

            int jobId;
            if (!Int32.TryParse(Request.QueryString["JobID"], out jobId))
                Exceptions.ProcessModuleLoadException("JobID is required.", this, null);

            controller.SetJob(jobId);
        }
        else
        {
            int rvtId;
            if (int.TryParse(Request.QueryString["RateValveTestID"], out rvtId))
            {
                controller.Options.TrackingMode = TrackingModes.Connected;
                controller.Load(rvtId);
            }
            else
                Exceptions.ProcessModuleLoadException("Unable to match RateValveTestID", this, null);
        }

        Context.Items.Add("#boController", controller);

    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            LoadData();
            FSRNumTextBox.Focus();
        }
    }

    private void LoadData()
    {
        RateValveFormController controller = Context.Items["#boController"] as RateValveFormController;
        RateValveTest rvt = controller.Entity;

        if (rvt.JobID == 0)
            RateValveTestIDLabel.Text = "NEW";
        else
            RateValveTestIDLabel.Text = rvt.RateValveTestID.ToString();

        siEdit.ClientLocationID = rvt.Job.ClientLocationID;
        siEdit.ServiceItemID = rvt.ServiceItemID;

        SalesOrderLabel.Text = rvt.Job.SalesOrderNum ?? "";
        FSRNumTextBox.Text = rvt.FSRNum ?? "";
        CustomerLabel.Text = rvt.Job.ClientLocation.Client.Name;
        LocationLabel.Text = rvt.Job.ClientLocation.Name;

        int LocationID = rvt.Job.ClientLocationID;

        DateTestedEdit.Value = rvt.DateTested;

        txtLatitude.Text = rvt.Job.ClientLocation.Latitude;
        txtLongitude.Text = rvt.Job.ClientLocation.Longitude;

        // TODO : Synchronize with values from TestResults table
        cmbWearSleeve.Value = rvt.ConditionOfWearSleeve;
        cmbCondDisc.Value = rvt.ConditionOfDisc;
        cmbPercDiscWear.Value = rvt.PercentDiscWear;
        cmbExternalCond.Value = rvt.ExternalCondition;

        se51960230.Value = rvt.RateValveTestParts.FirstOrDefault(rvtp => rvtp.RateValvePart.PartNumber == "51960230") == null ? 0 : rvt.RateValveTestParts.First(rvtp => rvtp.RateValvePart.PartNumber == "51960230").Quantity;
        se51961525.Value = rvt.RateValveTestParts.FirstOrDefault(rvtp => rvtp.RateValvePart.PartNumber == "51961525") == null ? 0 : rvt.RateValveTestParts.First(rvtp => rvtp.RateValvePart.PartNumber == "51961525").Quantity;
        se51974200.Value = rvt.RateValveTestParts.FirstOrDefault(rvtp => rvtp.RateValvePart.PartNumber == "51974200") == null ? 0 : rvt.RateValveTestParts.First(rvtp => rvtp.RateValvePart.PartNumber == "51974200").Quantity;
        se52070434.Value = rvt.RateValveTestParts.FirstOrDefault(rvtp => rvtp.RateValvePart.PartNumber == "52070434") == null ? 0 : rvt.RateValveTestParts.First(rvtp => rvtp.RateValvePart.PartNumber == "52070434").Quantity;
        se52119435.Value = rvt.RateValveTestParts.FirstOrDefault(rvtp => rvtp.RateValvePart.PartNumber == "52119435") == null ? 0 : rvt.RateValveTestParts.First(rvtp => rvtp.RateValvePart.PartNumber == "52119435").Quantity;
        seBBL00025.Value = rvt.RateValveTestParts.FirstOrDefault(rvtp => rvtp.RateValvePart.PartNumber == "BBL00025") == null ? 0 : rvt.RateValveTestParts.First(rvtp => rvtp.RateValvePart.PartNumber == "BBL00025").Quantity;
        seBSE00001.Value = rvt.RateValveTestParts.FirstOrDefault(rvtp => rvtp.RateValvePart.PartNumber == "BSE00001") == null ? 0 : rvt.RateValveTestParts.First(rvtp => rvtp.RateValvePart.PartNumber == "BSE00001").Quantity;
        seBST00008.Value = rvt.RateValveTestParts.FirstOrDefault(rvtp => rvtp.RateValvePart.PartNumber == "BST00008") == null ? 0 : rvt.RateValveTestParts.First(rvtp => rvtp.RateValvePart.PartNumber == "BST00008").Quantity;
        seCD1.Value = rvt.RateValveTestParts.FirstOrDefault(rvtp => rvtp.RateValvePart.PartNumber == "CD1") == null ? 0 : rvt.RateValveTestParts.First(rvtp => rvtp.RateValvePart.PartNumber == "CD1").Quantity;
        seCD2.Value = rvt.RateValveTestParts.FirstOrDefault(rvtp => rvtp.RateValvePart.PartNumber == "CD2") == null ? 0 : rvt.RateValveTestParts.First(rvtp => rvtp.RateValvePart.PartNumber == "CD2").Quantity;
        seCRKFBA2006.Value = rvt.RateValveTestParts.FirstOrDefault(rvtp => rvtp.RateValvePart.PartNumber == "CRK-FBA2006") == null ? 0 : rvt.RateValveTestParts.First(rvtp => rvtp.RateValvePart.PartNumber == "CRK-FBA2006").Quantity;
        seCSKSFDAL2015.Value = rvt.RateValveTestParts.FirstOrDefault(rvtp => rvtp.RateValvePart.PartNumber == "CSK-SFDAL2015") == null ? 0 : rvt.RateValveTestParts.First(rvtp => rvtp.RateValvePart.PartNumber == "CSK-SFDAL2015").Quantity;
        seCSKSFDAL2050D2.Value = rvt.RateValveTestParts.FirstOrDefault(rvtp => rvtp.RateValvePart.PartNumber == "CSK-SFDAL2050-D2") == null ? 0 : rvt.RateValveTestParts.First(rvtp => rvtp.RateValvePart.PartNumber == "CSK-SFDAL2050-D2").Quantity;
        seCST00022.Value = rvt.RateValveTestParts.FirstOrDefault(rvtp => rvtp.RateValvePart.PartNumber == "CST00022") == null ? 0 : rvt.RateValveTestParts.First(rvtp => rvtp.RateValvePart.PartNumber == "CST00022").Quantity;
        seCST00051.Value = rvt.RateValveTestParts.FirstOrDefault(rvtp => rvtp.RateValvePart.PartNumber == "CST00051") == null ? 0 : rvt.RateValveTestParts.First(rvtp => rvtp.RateValvePart.PartNumber == "CST00051").Quantity;
        seDRV38.Value = rvt.RateValveTestParts.FirstOrDefault(rvtp => rvtp.RateValvePart.PartNumber == "DRV38") == null ? 0 : rvt.RateValveTestParts.First(rvtp => rvtp.RateValvePart.PartNumber == "DRV38").Quantity;
        seFT000024.Value = rvt.RateValveTestParts.FirstOrDefault(rvtp => rvtp.RateValvePart.PartNumber == "FT000024") == null ? 0 : rvt.RateValveTestParts.First(rvtp => rvtp.RateValvePart.PartNumber == "FT000024").Quantity;
        seSB140125.Value = rvt.RateValveTestParts.FirstOrDefault(rvtp => rvtp.RateValvePart.PartNumber == "SB140125") == null ? 0 : rvt.RateValveTestParts.First(rvtp => rvtp.RateValvePart.PartNumber == "SB140125").Quantity;
        seWSXA0066.Value = rvt.RateValveTestParts.FirstOrDefault(rvtp => rvtp.RateValvePart.PartNumber == "WSXA0066") == null ? 0 : rvt.RateValveTestParts.First(rvtp => rvtp.RateValvePart.PartNumber == "WSXA0066").Quantity;

        RemarksTextBox.Text = rvt.Remarks ?? "";
        TechIDSelect.Value = rvt.TechID ?? -1;
        CustomerWitnessTextBox.Text = rvt.CustomerWitness ?? "";
    }

    protected void EmployeeDataSource_Selecting(object sender, LinqDataSourceSelectEventArgs e)
    {
        RateValveFormController controller = Context.Items["#boController"] as RateValveFormController;
        e.Result = controller.GetEmployeesList();
    }

    protected void ASPxSpellChecker1_CheckedElementResolve(object sender, DevExpress.Web.ASPxClasses.ControlResolveEventArgs e)
    {
        e.ResolvedControl = RemarksTextBox;
    }

    protected void SaveAction_Callback(object source, DevExpress.Web.ASPxCallback.CallbackEventArgs e)
    {
        RateValveFormController controller = Context.Items["#boController"] as RateValveFormController;
        RateValveTest rvt = controller.Entity;

        rvt.ServiceItemID = siEdit.ServiceItemID;
        rvt.FSRNum = FSRNumTextBox.Text;
        rvt.DateTested = (DateTime)DateTestedEdit.Value;

        decimal latitude = 0;
        decimal longitude = 0;

        rvt.Job.ClientLocation.Latitude = Decimal.TryParse(txtLatitude.Text, out latitude) ? latitude.ToString() : null;
        rvt.Job.ClientLocation.Longitude = Decimal.TryParse(txtLongitude.Text, out longitude) ? longitude.ToString() : null;

        rvt.ConditionOfWearSleeve = Convert.ToInt32(cmbWearSleeve.Value);
        rvt.ConditionOfDisc = Convert.ToInt32(cmbCondDisc.Value);
        rvt.PercentDiscWear = Convert.ToInt32(cmbPercDiscWear.Value);
        rvt.ExternalCondition = Convert.ToInt32(cmbExternalCond.Value);

        rvt.Remarks = RemarksTextBox.Text;

        if (TechIDSelect.Value == null)
            rvt.TechID = null;
        else
            rvt.TechID = Convert.ToInt32(TechIDSelect.Value);

        rvt.CustomerWitness = CustomerWitnessTextBox.Text;

        if (rvt.RateValveTestParts.Count == 0)
            controller.CreatePartsList();

        rvt.RateValveTestParts.First(rvtp => rvtp.RateValvePart.PartNumber == "51960230").Quantity = Convert.ToInt32(se51960230.Value);
        rvt.RateValveTestParts.First(rvtp => rvtp.RateValvePart.PartNumber == "51961525").Quantity = Convert.ToInt32(se51961525.Value);
        rvt.RateValveTestParts.First(rvtp => rvtp.RateValvePart.PartNumber == "51974200").Quantity = Convert.ToInt32(se51974200.Value);
        rvt.RateValveTestParts.First(rvtp => rvtp.RateValvePart.PartNumber == "52070434").Quantity = Convert.ToInt32(se52070434.Value);
        rvt.RateValveTestParts.First(rvtp => rvtp.RateValvePart.PartNumber == "52119435").Quantity = Convert.ToInt32(se52119435.Value);
        rvt.RateValveTestParts.First(rvtp => rvtp.RateValvePart.PartNumber == "BBL00025").Quantity = Convert.ToInt32(seBBL00025.Value);
        rvt.RateValveTestParts.First(rvtp => rvtp.RateValvePart.PartNumber == "BSE00001").Quantity = Convert.ToInt32(seBSE00001.Value);
        rvt.RateValveTestParts.First(rvtp => rvtp.RateValvePart.PartNumber == "BST00008").Quantity = Convert.ToInt32(seBST00008.Value);
        rvt.RateValveTestParts.First(rvtp => rvtp.RateValvePart.PartNumber == "CD1").Quantity = Convert.ToInt32(seCD1.Value);
        rvt.RateValveTestParts.First(rvtp => rvtp.RateValvePart.PartNumber == "CD2").Quantity = Convert.ToInt32(seCD2.Value);
        rvt.RateValveTestParts.First(rvtp => rvtp.RateValvePart.PartNumber == "CRK-FBA2006").Quantity = Convert.ToInt32(seCRKFBA2006.Value);
        rvt.RateValveTestParts.First(rvtp => rvtp.RateValvePart.PartNumber == "CSK-SFDAL2015").Quantity = Convert.ToInt32(seCSKSFDAL2015.Value);
        rvt.RateValveTestParts.First(rvtp => rvtp.RateValvePart.PartNumber == "CSK-SFDAL2050-D2").Quantity = Convert.ToInt32(seCSKSFDAL2050D2.Value);
        rvt.RateValveTestParts.First(rvtp => rvtp.RateValvePart.PartNumber == "CST00022").Quantity = Convert.ToInt32(seCST00022.Value);
        rvt.RateValveTestParts.First(rvtp => rvtp.RateValvePart.PartNumber == "CST00051").Quantity = Convert.ToInt32(seCST00051.Value);
        rvt.RateValveTestParts.First(rvtp => rvtp.RateValvePart.PartNumber == "DRV38").Quantity = Convert.ToInt32(seDRV38.Value);
        rvt.RateValveTestParts.First(rvtp => rvtp.RateValvePart.PartNumber == "FT000024").Quantity = Convert.ToInt32(seFT000024.Value);
        rvt.RateValveTestParts.First(rvtp => rvtp.RateValvePart.PartNumber == "SB140125").Quantity = Convert.ToInt32(seSB140125.Value);
        rvt.RateValveTestParts.First(rvtp => rvtp.RateValvePart.PartNumber == "WSXA0066").Quantity = Convert.ToInt32(seWSXA0066.Value);

        if (rvt.Version == null)
        {
            rvt.Job.RateValveTests.Add(rvt);
            // Remove active datacontext relations
            //controller.Detach();
            //rvt = controller.Entity;
            //////////////////////////////////////

            rvt.CreatedBy = controller.ResolveEmployeeID(UserId);
            rvt.DateCreated = DateTime.Now;
        }

        rvt.ModifiedBy = controller.ResolveEmployeeID(UserId);
        rvt.DateModified = DateTime.Now;

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

    void Print()
    {
        RateValveFormController controller = Context.Items["#boController"] as RateValveFormController;
        Response.Redirect(DotNetNuke.Common.Globals.NavigateURL(TabId, "Reports", "mid=" + ModuleId, "rpt=vtfr", "vtid=" + controller.Entity.RateValveTestID));
    }

}