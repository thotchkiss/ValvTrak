using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DotNetNuke.Entities.Modules;
using Rawson.Data;
using Rawson.App;
using System.Reflection;
using Rawson.App.Security;
using DevExpress.Web.ASPxGridView;
using DevExpress.Data;
using Rawson.Data.Controllers;
using System.ServiceModel.Syndication;
using Rawson.Reports.Constants;
using DotNetNuke.Common.Utilities;
using System.Web.Script.Serialization;

namespace Rawson.GreasingRecords
{
    public partial class GreasingRecordsSearch : PortalModuleBase
    {
        public bool CanEdit;

        protected void Page_Init(object sender, EventArgs e)
        {
            GreasingRecordSearchController controller = new GreasingRecordSearchController();

            CanEdit = controller.CanEdit;
            reportingGrid.Columns["colEdit"].Visible = CanEdit;

            btnEdit.Visibility = controller.CanEdit ? GridViewCustomButtonVisibility.AllDataRows : GridViewCustomButtonVisibility.Invisible;
            btnDelete.Visibility = controller.CanEdit ? GridViewCustomButtonVisibility.AllDataRows : GridViewCustomButtonVisibility.Invisible;

            Context.Items.Add("#boController", controller);
            Context.Items.Add("#queryKey", Request.UserHostName + "\\" + UserInfo.Username + "\\GreasingRecordQuery");
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            bool usePrevQuery = false;

            GreasingRecordQuery q = DataCache.GetCache<GreasingRecordQuery>((string)Context.Items["#queryKey"]);

            if (q != null)
                reportingGrid.SettingsPager.PageSize = q.PageSize;
            else
                SaveQuery();

            reportingGrid.Templates.PagerBar = new CustomPagerBarTemplate();
            reportingGrid.SettingsPager.AlwaysShowPager = true;

            if (!Page.IsPostBack)
            {
                //use the previous saved query if there is one
                //check to make sure there is a query object
                if (q != null)
                {
                    usePrevQuery = true;
                    //restore control values from saved query
                    JobIDFilter.Text = q.JobID == -1 ? "" : q.JobID.ToString();
                    txtGreasingRecordID.Text = q.GreasingRecordID == -1 ? "" : q.GreasingRecordID.ToString();
                    FsrNumFilter.Text = q.FsrNum;
                    SerialNumFilter.Text = q.SerialNum;
                    PsvFilter.Text = q.Psv;
                    ClientFilter.Value = q.Client;
                    LocationFilter.Value = q.ClientLocation;
                    SapWoFilter.Value = q.SapWO;
                    TestedStartDate.Text = q.GreasedStartDate;
                    TestedEndDate.Text = q.GreasedEndDate;

                    reportingGrid.SortBy(reportingGrid.Columns[q.SortOrder.Key], q.SortOrder.Value);
                    reportingGrid.PageIndex = q.PageIndex;
                }

                //if not using a previous query set defaults
                if (!usePrevQuery)
                {
                    //default completion date to past 30 days
                    DateTime end = DateTime.Today;
                    TestedEndDate.Text = end.ToString("d");
                    TestedStartDate.Text = end.AddDays(-30).ToString("d");

                    ClientFilter.Value = -1;
                    LocationFilter.Value = -1;

                    SaveQuery();
                }
            }
        }

        private void SaveQuery()
        {
            GreasingRecordQuery q = DataCache.GetCache<GreasingRecordQuery>((string)Context.Items["#queryKey"]);
            if (q == null)
                q = new GreasingRecordQuery();

            int jobId = -1;
            int grId = -1;

            if (!Int32.TryParse(JobIDFilter.Text, out jobId)) jobId = -1;
            if (!Int32.TryParse(txtGreasingRecordID.Text, out grId)) grId = -1;

            q.JobID = jobId;
            q.GreasingRecordID = grId;
            q.FsrNum = this.FsrNumFilter.Text;
            q.SerialNum = this.SerialNumFilter.Text;
            q.Psv = this.PsvFilter.Text;
            q.Client = ClientFilter.Value == null ? -1 : (int)ClientFilter.Value;
            q.ClientLocation = LocationFilter.Value == null ? -1 : Convert.ToInt32(LocationFilter.Value);
            q.SapWO = this.SapWoFilter.Text;

            q.GreasedStartDate = TestedStartDate.Text;
            q.GreasedEndDate = TestedEndDate.Text;

            DataCache.SetCache((string)Context.Items["#queryKey"], q, false);
        }

        protected void gridLinqDataSource_Selecting(object sender, LinqDataSourceSelectEventArgs e)
        {
            //Get saved query object.  There should always be a saved query object, even when the page first loads.
            GreasingRecordQuery q = DataCache.GetCache<GreasingRecordQuery>((string)Context.Items["#queryKey"]); ;
            if (q == null)
            {//save from controls and then get the query object again
                SaveQuery();
                q = DataCache.GetCache<GreasingRecordQuery>((string)Context.Items["#queryKey"]); ;
            }

            GreasingRecordSearchController controller = Context.Items["#boController"] as GreasingRecordSearchController;
            e.Result = controller.GetAuthorizedGreasingRecordItems(q, UserId);
        }

        protected void reportingGrid_CustomButtonCallback(object sender, ASPxGridViewCustomButtonCallbackEventArgs e)
        {
            ASPxGridView grid = sender as ASPxGridView;

            object[] values = grid.GetRowValues(e.VisibleIndex, "GreasingRecordID", "GreasingRecord.JobID") as object[];
            reportingGrid.JSProperties["cpShowReport"] = false;

            if (e.ButtonID == "btnEdit")
            {
                Response.RedirectLocation = DotNetNuke.Common.Globals.NavigateURL(TabId, "Grease", "mid=" + ModuleId, "JobID=" + values[1], "GreasingRecordID=" + values[0]);
            }
            else if (e.ButtonID == "btnPrint")
            {
                string cacheKey = Guid.NewGuid().ToString();
                DataCache.SetCache(cacheKey, values[0].ToString(), new TimeSpan(0, 3, 0));

                /*******************************************************************************************************************/

                reportingGrid.JSProperties["cpShowReport"] = true;
                reportingGrid.JSProperties["cpReportUrl"] = String.Format(ResourcePaths.DownloadHelperPath, DocumentPaths.GreasingRecordFieldReport, cacheKey);
            }
            else
            {
                GreasingRecordSearchController controller = Context.Items["#boController"] as GreasingRecordSearchController;
                controller.Delete(values[0]);

                reportingGrid.DataBind();
            }
        }

        protected void ClientDataSource_Selecting(object sender, LinqDataSourceSelectEventArgs e)
        {
            GreasingRecordSearchController controller = Context.Items["#boController"] as GreasingRecordSearchController;
            e.Result = controller.GetAuthorizedClients(UserId);
        }

        protected void LocationFilter_Callback(object sender, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
            LocationFilter.DataBind();

            SaveQuery();
            reportingGrid.DataBind();
        }

        protected void LocationDataSource_Selecting(object sender, LinqDataSourceSelectEventArgs e)
        {
            int clientID = (int)ClientFilter.Value;

            GreasingRecordSearchController controller = Context.Items["#boController"] as GreasingRecordSearchController;
            e.Result = controller.GetAuthorizedLocations(UserId, clientID);
        }

        protected void LubeTypeDataSource_Selecting(object sender, LinqDataSourceSelectEventArgs e)
        {
            GreasingRecordSearchController controller = Context.Items["#boController"] as GreasingRecordSearchController;
            e.Result = controller.GetLubeTypes();
        }

        protected void PrintSelected_Callback(object source, DevExpress.Web.ASPxCallback.CallbackEventArgs e)
        {
            JavaScriptSerializer js = new JavaScriptSerializer();

            string cacheKey = Guid.NewGuid().ToString();
            DataCache.SetCache(cacheKey, String.Join(",", js.Deserialize<string[]>(e.Parameter)), new TimeSpan(0, 3, 0));

            /*******************************************************************************************************************/

            PrintSelected.JSProperties["cpShowReport"] = true;
            PrintSelected.JSProperties["cpReportUrl"] = String.Format(ResourcePaths.DownloadHelperPath, DocumentPaths.GreasingRecordFieldReport, cacheKey);
        }

        protected void PrintAll_Callback(object source, DevExpress.Web.ASPxCallback.CallbackEventArgs e)
        {
            GreasingRecordQuery q = DataCache.GetCache<GreasingRecordQuery>((string)Context.Items["#queryKey"]);
            if (q == null)
            {
                SaveQuery();
                q = DataCache.GetCache<GreasingRecordQuery>((string)Context.Items["#queryKey"]);
            }

            GreasingRecordSearchController controller = Context.Items["#boController"] as GreasingRecordSearchController;
            int[] values = controller.GetAuthorizedGreasingRecordItems(q, UserId).Select(gr => gr.GreasingRecordID).ToArray();

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
                PrintAll.JSProperties["cpReportUrl"] = String.Format(ResourcePaths.DownloadHelperPath, DocumentPaths.GreasingRecordFieldReport, cacheKey);
            }
        }


        protected void btnExportExcel_Click(object sender, EventArgs e)
        {
            ASPxGridViewExporter1.GridViewID = "reportingGrid";
            ASPxGridViewExporter1.WriteXlsToResponse();
        }

        // Custom paging support ****************************************************************************

        protected void reportingGrid_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            int pageSize;
            if (Int32.TryParse(e.Parameters, out pageSize))
            {
                GreasingRecordQuery q = Session["GreasingRecordQuery"] as GreasingRecordQuery;
                q.PageSize = int.Parse(e.Parameters);

                reportingGrid.SettingsPager.PageSize = q.PageSize;
            }

            reportingGrid.JSProperties["cpShowReport"] = false;

            SaveQuery();
            reportingGrid.DataBind();
        }

        protected void reportingGrid_DataBound(object sender, EventArgs e)
        {
            reportingGrid.JSProperties["cpPageCount"] = reportingGrid.PageCount;
        }

        protected void reportingGrid_BeforeColumnSortingGrouping(object sender, ASPxGridViewBeforeColumnGroupingSortingEventArgs e)
        {
            var q = DataCache.GetCache<GreasingRecordQuery>((string)Context.Items["#queryKey"]);
            if (q != null)
                q.SortOrder = new KeyValuePair<int, ColumnSortOrder>(e.Column.Index, e.Column.SortOrder);
        }

        protected void reportingGrid_PageIndexChanged(object sender, EventArgs e)
        {
            var q = DataCache.GetCache<GreasingRecordQuery>((string)Context.Items["#queryKey"]);
            if (q != null)
                q.PageIndex = reportingGrid.PageIndex;
        }

        //*****************************************************************************************************

    }
}
