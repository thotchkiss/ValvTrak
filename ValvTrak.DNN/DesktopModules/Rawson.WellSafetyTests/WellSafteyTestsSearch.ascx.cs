using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DotNetNuke.Entities.Modules;
using Rawson.Data;
using DevExpress.Data;
using Rawson.App;
using DevExpress.Web;
using System.Reflection;
using Rawson.Data.Controllers;
using System.IO;
using Rawson.Reports.Constants;
using DotNetNuke.Common.Utilities;
using System.Web.Script.Serialization;

namespace Rawson.WellSafetyTests
{
    public partial class WellSafteyTestsSearch : PortalModuleBase
    {
        public bool CanEdit;

        protected void Page_Init(object sender, EventArgs e)
        {
            WellSafetySearchController controller = new WellSafetySearchController();

            CanEdit = controller.CanEdit;
            reportingGrid.Columns["colEdit"].Visible = CanEdit;

            Context.Items.Add("#boController", controller);
            Context.Items.Add("#queryKey", Request.UserHostName + "\\" + UserInfo.Username + "\\WellSafetyQuery");
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            bool usePrevQuery = false;

            WellSafetyQuery q = DataCache.GetCache<WellSafetyQuery>((string)Context.Items["#queryKey"]);

            if (q != null)
                reportingGrid.SettingsPager.PageSize = q.PageSize;
            else
                SaveQuery();

            reportingGrid.Templates.PagerBar = new CustomPagerBarTemplate();

            if (!Page.IsPostBack)
            {
                //use the previous saved query if there is one
                //check to make sure there is a query object
                if (q != null)
                {
                    usePrevQuery = true;
                    //restore control values from saved query
                    JobIDFilter.Text = q.JobID == -1 ? "" : q.JobID.ToString();
                    txtWellSafetyTestID.Text = q.WellSafetyTestID == -1 ? "" : q.WellSafetyTestID.ToString();
                    SerialNumFilter.Text = q.SerialNum;
                    txtFSRNum.Text = q.FSRNum;
                    ClientFilter.Value = q.Client;
                    LocationFilter.Value = q.ClientLocation;
                    SystemLocationFilter.Value = q.SystemLocation;
                    TestResultFilter.Value = q.TestResult;
                    TestedStartDate.Text = q.TestedStartDate;
                    TestedEndDate.Text = q.TestedEndDate;

                    reportingGrid.SortBy(reportingGrid.Columns[q.SortOrder.Key], q.SortOrder.Value);
                    reportingGrid.PageIndex = q.PageIndex;
                }

                //if not using a previous query set defaults
                if (!usePrevQuery)
                {
                    //default completion date to past 30 days
                    DateTime end = DateTime.Today;
                    TestedEndDate.Text = end.ToString("d");
                    TestedStartDate.Text = end.AddDays(-90).ToString("d");

                    ClientFilter.Value = -1;
                    LocationFilter.Value = -1;
                    SystemLocationFilter.Value = String.Empty;
                    TestResultFilter.Value = -1;

                    SaveQuery();
                }
            }
        }

        private void SaveQuery()
        {
            WellSafetyQuery q = DataCache.GetCache<WellSafetyQuery>((string)Context.Items["#queryKey"]);
            if (q == null)
                q = new WellSafetyQuery();

            int jobId = -1;
            int wellId = -1;

            if (!Int32.TryParse(JobIDFilter.Text, out jobId)) jobId = -1;
            if (!Int32.TryParse(txtWellSafetyTestID.Text, out wellId)) wellId = -1;

            q.JobID = jobId;
            q.WellSafetyTestID = wellId;
            q.SerialNum = this.SerialNumFilter.Text;
            q.FSRNum = this.txtFSRNum.Text;
            q.Client = ClientFilter.Value == null ? -1 : Convert.ToInt32(ClientFilter.Value);
            q.ClientLocation = LocationFilter.Value == null ? -1 : Convert.ToInt32(LocationFilter.Value);
            q.SystemLocation = SystemLocationFilter.Value == null ? String.Empty : (string)SystemLocationFilter.Value;
            q.TestResult = TestResultFilter.Value == null ? -1 : Convert.ToInt32(TestResultFilter.Value);
            q.TestedStartDate = TestedStartDate.Text;
            q.TestedEndDate = TestedEndDate.Text;

            DataCache.SetCache((string)Context.Items["#queryKey"], q, false);
        }

        protected void LinqGridDatasource_Selecting(object sender, LinqDataSourceSelectEventArgs e)
        {
            //Get saved query object.  There should always be a saved query object, even when the page first loads.
            WellSafetyQuery q = DataCache.GetCache<WellSafetyQuery>((string)Context.Items["#queryKey"]);
            if (q == null)
            {//save from controls and then get the query object again
                SaveQuery();
                q = DataCache.GetCache<WellSafetyQuery>((string)Context.Items["#queryKey"]);
            }

            WellSafetySearchController controller = Context.Items["#boController"] as WellSafetySearchController;
            e.Result = controller.GetAuthorizedWellSafetyTests(q, UserId);
        }

        protected void reportingGrid_CustomButtonCallback(object sender, ASPxGridViewCustomButtonCallbackEventArgs e)
        {
            ASPxGridView grid = sender as ASPxGridView;

            object[] values = grid.GetRowValues(e.VisibleIndex, "WellSafetyTestID", "JobID") as object[];
            reportingGrid.JSProperties["cpShowReport"] = false;

            if (e.ButtonID == "btnEdit")
                Response.RedirectLocation = DotNetNuke.Common.Globals.NavigateURL(TabId, "Well", "mid=" + ModuleId, "JobID=" + values[1], "WellSafetyTestID=" + values[0]);
            else
            {
                string cacheKey = Guid.NewGuid().ToString();
                DataCache.SetCache(cacheKey, values[0].ToString(), new TimeSpan(0, 3, 0));

                /*******************************************************************************************************************/

                reportingGrid.JSProperties["cpShowReport"] = true;
                reportingGrid.JSProperties["cpReportUrl"] = String.Format("DesktopModules/Rawson.Reports/Reports.aspx?rpt=wsfr&key={0}", cacheKey);
            }

        }

        protected void ClientDataSource_Selecting(object sender, LinqDataSourceSelectEventArgs e)
        {
            WellSafetySearchController controller = Context.Items["#boController"] as WellSafetySearchController;
            e.Result = controller.GetAuthorizedClients(UserId);
        }

        protected void LocationFilter_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            LocationFilter.DataBind();
            LocationFilter.Value = "-1";

            SaveQuery();
            reportingGrid.DataBind();
        }

        protected void LocationDataSource_Selecting(object sender, LinqDataSourceSelectEventArgs e)
        {
            int clientID;
            if (ClientFilter.Value == null || !int.TryParse(ClientFilter.Value.ToString(), out clientID))
                clientID = -1;

            WellSafetySearchController controller = Context.Items["#boController"] as WellSafetySearchController;
            e.Result = controller.GetAuthorizedLocations(UserId, clientID);
        }

        // Custom paging support methods
        protected void reportingGrid_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            int pageSize;
            if (Int32.TryParse(e.Parameters, out pageSize))
            {
                WellSafetyQuery q = DataCache.GetCache<WellSafetyQuery>((string)Context.Items["#queryKey"]);
                q.PageSize = pageSize;

                reportingGrid.SettingsPager.PageSize = q.PageSize;
            }

            reportingGrid.JSProperties["cpShowReport"] = false;

            SaveQuery();
            reportingGrid.DataBind();
        }

        protected void reportingGrid_DataBound(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                WellSafetyQuery q = DataCache.GetCache<WellSafetyQuery>((string)Context.Items["#queryKey"]);

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
            var q = DataCache.GetCache<WellSafetyQuery>((string)Context.Items["#queryKey"]);
            if (q != null)
                q.FocusedRowIndex = reportingGrid.FocusedRowIndex;
        }

        protected void reportingGrid_BeforeColumnSortingGrouping(object sender, ASPxGridViewBeforeColumnGroupingSortingEventArgs e)
        {
            var q = DataCache.GetCache<WellSafetyQuery>((string)Context.Items["#queryKey"]);
            if (q != null)
                q.SortOrder = new KeyValuePair<int, ColumnSortOrder>(e.Column.Index, e.Column.SortOrder);
        }

        protected void reportingGrid_PageIndexChanged(object sender, EventArgs e)
        {
            var q = DataCache.GetCache<WellSafetyQuery>((string)Context.Items["#queryKey"]);
            if (q != null)
                q.PageIndex = reportingGrid.PageIndex;
        }

        protected void PrintSelected_Callback(object source, DevExpress.Web.CallbackEventArgs e)
        {
            JavaScriptSerializer js = new JavaScriptSerializer();

            string cacheKey = Guid.NewGuid().ToString();
            DataCache.SetCache(cacheKey, String.Join(",", js.Deserialize<string[]>(e.Parameter)), new TimeSpan(0, 3, 0));

            /*******************************************************************************************************************/

            PrintSelected.JSProperties["cpShowReport"] = true;
            PrintSelected.JSProperties["cpReportUrl"] = String.Format("DesktopModules/Rawson.Reports/Reports.aspx?rpt=wsfr&key={0}", cacheKey);
        }

        protected void PrintAll_Callback(object source, DevExpress.Web.CallbackEventArgs e)
        {
            WellSafetyQuery q = DataCache.GetCache<WellSafetyQuery>((string)Context.Items["#queryKey"]);
            if (q == null)
            {
                SaveQuery();
                q = DataCache.GetCache<WellSafetyQuery>((string)Context.Items["#queryKey"]);
            }

            WellSafetySearchController controller = Context.Items["#boController"] as WellSafetySearchController;
            int[] values = controller.GetAuthorizedWellSafetyTests(q, UserId).Select(ws => ws.WellSafetyTestID).ToArray();

            if (values.Length > 1000)
                throw new ApplicationException("Can not print more than 1000 records at time. Please narrow your search and try again.");
            else
            {
                List<string> idList = new List<string>();

                foreach (int value in values)
                {
                    idList.Add(value.ToString());
                }

                string cacheKey = Guid.NewGuid().ToString();
                DataCache.SetCache(cacheKey, String.Join(",", idList.ToArray()), new TimeSpan(0, 3, 0));

                /***************************************************************************************************************/

                PrintAll.JSProperties["cpShowReport"] = true;
                PrintAll.JSProperties["cpReportUrl"] = String.Format("DesktopModules/Rawson.Reports/Reports.aspx?rpt=wsfr&key={0}", cacheKey);
            }
        }

        protected void btnExportExcel_Click(object sender, EventArgs e)
        {
            ASPxGridViewExporter1.GridViewID = "reportingGrid";
            ASPxGridViewExporter1.WriteXlsToResponse();
        }


        
}
}
