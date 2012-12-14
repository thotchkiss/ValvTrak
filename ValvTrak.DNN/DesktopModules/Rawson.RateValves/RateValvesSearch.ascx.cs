using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DotNetNuke.Entities.Modules;
using Rawson.Data.Controllers;
using DotNetNuke.Services.Exceptions;
using DevExpress.Web.ASPxGridView;
using DotNetNuke.Common.Utilities;
using Rawson.App;
using Rawson.Reports.Constants;
using DevExpress.Data;
using System.Web.Script.Serialization;

public partial class RateValvesSearch : PortalModuleBase
{
    public bool CanEdit;

    protected void Page_Init(object sender, EventArgs e)
    {
        RateValveSearchController controller = new RateValveSearchController();
        Context.Items.Add("#boController", controller);
        Context.Items.Add("#queryKey", Request.UserHostName + "\\" + UserInfo.Username + "\\RateValveQuery");

        CanEdit = controller.CanEdit;

        btnEdit.Visibility = controller.CanEdit ? GridViewCustomButtonVisibility.AllDataRows : GridViewCustomButtonVisibility.Invisible;
        btnDelete.Visibility = controller.CanEdit ? GridViewCustomButtonVisibility.AllDataRows : GridViewCustomButtonVisibility.Invisible;

    }

    protected void Page_Load(object sender, EventArgs e)
    {
        bool usePrevQuery = false;

        RateValveQuery q = DataCache.GetCache<RateValveQuery>((string)Context.Items["#queryKey"]);

        if (q != null)
            reportingGrid.SettingsPager.PageSize = q.PageSize;
        else
            SaveQuery();

        reportingGrid.Templates.PagerBar = new CustomPagerBarTemplate();

        if (!Page.IsPostBack)
        {
            if (q != null)
            {
                usePrevQuery = true;
                //restore control values from saved query
                txtJobID.Text = q.JobID == -1 ? null : q.JobID.ToString();
                txtValveTestID.Text = q.RateValveTestID == -1 ? null : q.RateValveTestID.ToString();
                txtSerialNum.Text = q.SerialNum;
                txtFSR.Text = q.FSRNum;
                ClientFilter.Value = q.Client;
                LocationFilter.Value = q.ClientLocation;
                JobStatusFilter.Value = q.JobStatus;
                TestedStartDate.Text = q.TestedStartDate;
                TestedEndDate.Text = q.TestedEndDate;

                reportingGrid.SortBy(reportingGrid.Columns[q.SortOrder.Key], q.SortOrder.Value);
                reportingGrid.PageIndex = q.PageIndex;
            }

            if (!usePrevQuery)
            {
                DateTime end = DateTime.Today;
                TestedEndDate.Text = end.ToString("d");
                TestedStartDate.Text = end.AddDays(-30).ToString("d");

                ClientFilter.Value = -1;
                LocationFilter.Value = -1;
                JobStatusFilter.Value = -1;

                SaveQuery();
            }
        }
    }

    private void SaveQuery()
    {
        RateValveQuery q = DataCache.GetCache<RateValveQuery>((string)Context.Items["#queryKey"]);

        if (q == null)
            q = new RateValveQuery();

        int jobId;
        int valveId;

        if (!Int32.TryParse(txtJobID.Text, out jobId)) jobId = -1;
        if (!Int32.TryParse(txtValveTestID.Text, out valveId)) valveId = -1;

        q.JobID = jobId;
        q.RateValveTestID = valveId;
        q.SerialNum = this.txtSerialNum.Text;
        q.FSRNum = this.txtFSR.Text;
        q.Client = ClientFilter.Value == null ? -1 : Convert.ToInt32(ClientFilter.Value);
        q.ClientLocation = LocationFilter.Value == null ? -1 : Convert.ToInt32(LocationFilter.Value);
        q.JobStatus = JobStatusFilter.Value == null ? -1 : Convert.ToInt32(JobStatusFilter.Value);
        q.TestedStartDate = TestedStartDate.Text;
        q.TestedEndDate = TestedEndDate.Text;

        DataCache.SetCache((string)Context.Items["#queryKey"], q, false);
    }

    protected void gridLinqDataSource_Selecting(object sender, LinqDataSourceSelectEventArgs e)
    {
        RateValveQuery q = DataCache.GetCache<RateValveQuery>((string)Context.Items["#queryKey"]);
        if (q == null)
        {
            SaveQuery();
            q = DataCache.GetCache<RateValveQuery>((string)Context.Items["#queryKey"]);
        }

        RateValveSearchController controller = Context.Items["#boController"] as RateValveSearchController;
        e.Result = controller.GetAuthorizedValveTests(q, UserId);
    }

    protected void reportingGrid_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
    {
        if (!String.IsNullOrEmpty(e.Parameters))
        {
            RateValveQuery q = DataCache.GetCache<RateValveQuery>((string)Context.Items["#queryKey"]);
            q.PageSize = int.Parse(e.Parameters);

            reportingGrid.SettingsPager.PageSize = q.PageSize;
        }

        reportingGrid.JSProperties["cpShowReport"] = false;

        SaveQuery();
        reportingGrid.DataBind();
    }

    protected void reportingGrid_CustomButtonCallback(object sender, ASPxGridViewCustomButtonCallbackEventArgs e)
    {
        object[] values = reportingGrid.GetRowValues(e.VisibleIndex, "RateValveTestID", "JobID") as object[];
        reportingGrid.JSProperties["cpShowReport"] = false;

        if (e.ButtonID == "btnEdit")
            Response.RedirectLocation = DotNetNuke.Common.Globals.NavigateURL(TabId, "RateValve", "mid=" + ModuleId, "RateValveTestID=" + values[0]);
        else if (e.ButtonID == "btnPrint")
        {
            string cacheKey = Guid.NewGuid().ToString();
            DataCache.SetCache(cacheKey, values[0].ToString(), new TimeSpan(0, 3, 0));

            /*******************************************************************************************************************/

            reportingGrid.JSProperties["cpShowReport"] = true;
            reportingGrid.JSProperties["cpReportUrl"] = String.Format(ResourcePaths.DownloadHelperPath, DocumentPaths.RateValveFieldReport, cacheKey);
        }
        else
        {
            RateValveSearchController controller = Context.Items["#boController"] as RateValveSearchController;
            controller.Delete(values[0]);

            reportingGrid.DataBind();
        }
    }

    protected void reportingGrid_DataBound(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            RateValveQuery q = DataCache.GetCache<RateValveQuery>((string)Context.Items["#queryKey"]);

            if (q != null)
            {
                if (reportingGrid.VisibleRowCount > q.FocusedRowIndex)
                    reportingGrid.FocusedRowIndex = q.FocusedRowIndex;
                else if (reportingGrid.VisibleRowCount > 0)
                    reportingGrid.FocusedRowIndex = 0;
                else
                    reportingGrid.FocusedRowIndex = -1;
            }
        }

        reportingGrid.JSProperties["cpPageCount"] = reportingGrid.PageCount;
    }

    protected void reportingGrid_FocusedRowChanged(object sender, EventArgs e)
    {
        var q = DataCache.GetCache<RateValveQuery>((string)Context.Items["#queryKey"]);
        if (q != null)
            q.FocusedRowIndex = reportingGrid.FocusedRowIndex;
    }

    protected void reportingGrid_BeforeColumnSortingGrouping(object sender, ASPxGridViewBeforeColumnGroupingSortingEventArgs e)
    {
        var q = DataCache.GetCache<RateValveQuery>((string)Context.Items["#queryKey"]);
        if (q != null)
            q.SortOrder = new KeyValuePair<int, ColumnSortOrder>(e.Column.Index, e.Column.SortOrder);
    }

    protected void reportingGrid_PageIndexChanged(object sender, EventArgs e)
    {
        var q = DataCache.GetCache<RateValveQuery>((string)Context.Items["#queryKey"]);
        if (q != null)
            q.PageIndex = reportingGrid.PageIndex;
    }

    protected void LocationFilter_Callback(object sender, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
    {
        LocationFilter.DataBind();
        LocationFilter.Value = -1;
    }

    protected void ClientDataSource_Selecting(object sender, LinqDataSourceSelectEventArgs e)
    {
        RateValveSearchController controller = Context.Items["#boController"] as RateValveSearchController;
        e.Result = controller.GetAuthorizedClients(UserId);
    }

    protected void LocationDataSource_Selecting(object sender, LinqDataSourceSelectEventArgs e)
    {
        int clientID;
        if (ClientFilter.Value == null || !int.TryParse(ClientFilter.Value.ToString(), out clientID))
            clientID = -1;

        RateValveSearchController controller = Context.Items["#boController"] as RateValveSearchController;
        e.Result = controller.GetAuthorizedLocations(UserId, clientID);
    }

    protected void JobStatusDataSource_Selecting(object sender, LinqDataSourceSelectEventArgs e)
    {
        RateValveSearchController controller = Context.Items["#boController"] as RateValveSearchController;
        e.Result = controller.GetJobStatus();
    }

    protected void PrintSelected_Callback(object source, DevExpress.Web.ASPxCallback.CallbackEventArgs e)
    {
        JavaScriptSerializer js = new JavaScriptSerializer();

        string cacheKey = Guid.NewGuid().ToString();
        DataCache.SetCache(cacheKey, String.Join(",", js.Deserialize<string[]>(e.Parameter)), new TimeSpan(0, 3, 0));

        /*******************************************************************************************************************/

        PrintSelected.JSProperties["cpShowReport"] = true;
        PrintSelected.JSProperties["cpReportUrl"] = String.Format(ResourcePaths.DownloadHelperPath, DocumentPaths.RateValveFieldReport, cacheKey);
    }

    protected void PrintAll_Callback(object source, DevExpress.Web.ASPxCallback.CallbackEventArgs e)
    {
        RateValveQuery q = DataCache.GetCache<RateValveQuery>((string)Context.Items["#queryKey"]);

        if (q == null)
        {
            SaveQuery();
            q = DataCache.GetCache<RateValveQuery>((string)Context.Items["#queryKey"]);
        }

        RateValveSearchController controller = Context.Items["#boController"] as RateValveSearchController;
        int[] ids = controller.GetAuthorizedValveTests(q, UserId).Select(vt => vt.RateValveTestID).ToArray();

        if (ids.Length > 1000)
            throw new ApplicationException("Can not print more than 1000 records at time. Please narrow your search and try again.");
        else
        {
            List<string> idList = new List<string>();

            foreach (int value in ids)
            {
                idList.Add(value.ToString());
            }

            string cacheKey = Guid.NewGuid().ToString();
            DataCache.SetCache(cacheKey, String.Join(",", idList.ToArray()), new TimeSpan(0, 3, 0));

            /***************************************************************************************************************/

            PrintAll.JSProperties["cpShowReport"] = true;
            PrintAll.JSProperties["cpReportUrl"] = String.Format(ResourcePaths.DownloadHelperPath, DocumentPaths.RateValveFieldReport, cacheKey);
        }
    }

    protected void btnExportExcel_Click(object sender, EventArgs e)
    {
        ASPxGridViewExporter1.GridViewID = "reportingGrid";
        ASPxGridViewExporter1.WriteXlsToResponse();
    }

    
}