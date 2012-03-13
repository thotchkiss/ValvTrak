using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DotNetNuke.Entities.Modules;

using Rawson.App;
using Rawson.Data;
using DevExpress.Data;
using System.Reflection;
using DevExpress.Web.ASPxGridView;
using Rawson.App.Security;
using DotNetNuke.Common.Utilities;
using Rawson.Data.Controllers;
using Rawson.Reports.Constants;

public partial class ValveTestsSearch : PortalModuleBase
{
    public bool CanEdit;

    protected void Page_Init(object sender, EventArgs e)
    {
        ValveTestSearchController controller = new ValveTestSearchController();

        CanEdit = controller.CanEdit;
        reportingGrid.Columns["colEdit"].Visible = CanEdit;

        Context.Items.Add("#boController", controller);
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        bool usePrevQuery = false;

        ValveTestQuery q = Session[ "ValveTestQuery" ] as ValveTestQuery;

        if (q != null)
            reportingGrid.SettingsPager.PageSize = q.PageSize;
        else
            Session["ValveTestQuery"] = new ValveTestQuery();

        reportingGrid.Templates.PagerBar = new CustomPagerBarTemplate ();

        if ( !Page.IsPostBack )
        {
            //use the previous saved query if there is one
            //check to make sure there is a query object
            if ( q != null )
            {
                usePrevQuery = true;
                //restore control values from saved query
                txtJobID.Text = q.JobID == -1 ? null : q.JobID.ToString();
                txtValveTestID.Text = q.ValveTestID == -1 ? null : q.ValveTestID.ToString();
                txtSerialNum.Text = q.SerialNum;
                txtFSR.Text = q.FSRNum;
                ClientFilter.Value = q.Client;
                LocationFilter.Value = q.ClientLocation;
                JobStatusFilter.Value = q.JobStatus;
                TestResultFilter.Value = q.TestResult;
                TestedStartDate.Text = q.TestedStartDate;
                TestedEndDate.Text = q.TestedEndDate;

                reportingGrid.SortBy ( reportingGrid.Columns[ q.SortOrder.Key ], q.SortOrder.Value );
                reportingGrid.PageIndex = q.PageIndex;
            }

            //if not using a previous query set defaults
            if ( !usePrevQuery )
            {
                //default completion date to past 30 days
                DateTime end = DateTime.Today;
                TestedEndDate.Text = end.ToString ( "d" );
                TestedStartDate.Text = end.AddDays ( -30 ).ToString ( "d" );

                ClientFilter.Value = -1;
                LocationFilter.Value = -1;
                JobStatusFilter.Value = -1;
                TestResultFilter.Value = -1;
                                
                SaveQuery ();
            }
        }
    }

    protected void gridLinqDataSource_Selecting ( object sender, LinqDataSourceSelectEventArgs e )
    {
        ValveTestQuery q = Session[ "ValveTestQuery" ] as ValveTestQuery;
        if ( q == null )
        {
            SaveQuery ();
            q = Session[ "ValveTestQuery" ] as ValveTestQuery;
        }

        ValveTestSearchController controller = Context.Items["#boController"] as ValveTestSearchController;
        e.Result = controller.GetAuthorizedValveTests(q, UserId);
    }

    protected void reportingGrid_CustomCallback ( object sender, ASPxGridViewCustomCallbackEventArgs e )
    {
        if (!String.IsNullOrEmpty(e.Parameters))
        {
            ValveTestQuery q = Session["ValveTestQuery"] as ValveTestQuery;
            q.PageSize = int.Parse(e.Parameters);

            reportingGrid.SettingsPager.PageSize = q.PageSize;
        }
        
        reportingGrid.JSProperties["cpShowReport"] = false;

        SaveQuery();
        reportingGrid.DataBind();
    }

    protected void reportingGrid_CustomButtonCallback ( object sender, ASPxGridViewCustomButtonCallbackEventArgs e )
    {
        object[] values = reportingGrid.GetRowValues ( e.VisibleIndex, "ValveTestID", "JobID" ) as object[];

        if (e.ButtonID == "btnEdit")
            Response.RedirectLocation = DotNetNuke.Common.Globals.NavigateURL(TabId, "Valve", "mid=" + ModuleId, "ValveTestID=" + values[0]);
        else
        {
            Session["ReportData"] = values[0];

            reportingGrid.JSProperties["cpShowReport"] = true;
            reportingGrid.JSProperties["cpReportUrl"] = ResourcePaths.DownloadHelperPath + DocumentPaths.ValveTestFieldReport;
        }
    }

    protected void reportingGrid_DataBound ( object sender, EventArgs e )
    {
        reportingGrid.JSProperties[ "cpPageCount" ] = reportingGrid.PageCount;
    }

    protected void reportingGrid_BeforeColumnSortingGrouping ( object sender, ASPxGridViewBeforeColumnGroupingSortingEventArgs e )
    {
        if ( Session[ "ValveTestQuery" ] != null )
        {
            var q = Session[ "ValveTestQuery" ] as ValveTestQuery;
            q.SortOrder = new KeyValuePair<int, ColumnSortOrder> ( e.Column.Index, e.Column.SortOrder );
        }
    }

    protected void reportingGrid_PageIndexChanged ( object sender, EventArgs e )
    {
        if ( Session[ "ValveTestQuery" ] != null )
        {
            var q = Session[ "ValveTestQuery" ] as ValveTestQuery;
            q.PageIndex = reportingGrid.PageIndex;
        }
    }

    protected void reportingGrid_CustomUnboundColumnData ( object sender, ASPxGridViewColumnDataEventArgs e )
    {
        if ( e.Column.FieldName == "Tolerance" )
        {
            float setPressure = Null.SetNullSingle ( e.GetListSourceFieldValue ( "SetPressure" ) );
            float backPressure = Null.SetNullSingle(e.GetListSourceFieldValue("BackPressure"));

            float coldDiffPressure = setPressure - backPressure;
            float leftPressure = Null.SetNullSingle ( e.GetListSourceFieldValue ( "SetPressureLeft" ) );

            if (setPressure >= 70)
                e.Value = ((coldDiffPressure - leftPressure) / setPressure) * -100;
            else
                e.Value = (coldDiffPressure - leftPressure) * -1;
        }
    }

    protected void reportingGrid_HtmlRowPrepared ( object sender, ASPxGridViewTableRowEventArgs e )
    {
        float setPressure = Null.SetNullSingle(e.GetValue("SetPressure"));
        float tolerance = Convert.ToSingle(e.GetValue("Tolerance"));

        if (setPressure >= 70)
        {
            if (tolerance < -3 || tolerance > 3)
            {
                e.Row.BackColor = System.Drawing.Color.Red;
                e.Row.ForeColor = System.Drawing.Color.White;
            }
        }
        else
        {
            if (tolerance < -2 || tolerance > 2)
            {
                e.Row.BackColor = System.Drawing.Color.Red;
                e.Row.ForeColor = System.Drawing.Color.White;
            }
        }

    }

    protected void LocationFilter_Callback(object sender, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
    {
        LocationFilter.DataBind();
        LocationFilter.Value = -1;

        //SaveQuery();
        //reportingGrid.DataBind();
    }

    protected void ClientDataSource_Selecting(object sender, LinqDataSourceSelectEventArgs e)
    {
        ValveTestSearchController controller = Context.Items["#boController"] as ValveTestSearchController;
        e.Result = controller.GetAuthorizedClients(UserId);
    }

    //protected void EmployeeDataSource_Selecting ( object sender, LinqDataSourceSelectEventArgs e )
    //{
    //    ValveTestSearchController controller = Context.Items["#boController"] as ValveTestSearchController;
    //    e.Result = controller.GetEmployees();
    //}

    protected void LocationDataSource_Selecting ( object sender, LinqDataSourceSelectEventArgs e )
    {
        int clientID;
        if (ClientFilter.Value == null || !int.TryParse(ClientFilter.Value.ToString(), out clientID))
            clientID = -1;

        ValveTestSearchController controller = Context.Items["#boController"] as ValveTestSearchController;
        e.Result = controller.GetAuthorizedLocations(UserId, clientID);
    }

    protected void JobStatusDataSource_Selecting(object sender, LinqDataSourceSelectEventArgs e)
    {
        ValveTestSearchController controller = Context.Items["#boController"] as ValveTestSearchController;
        e.Result = controller.GetJobStatus();
    }

    private void SaveQuery ()
    {
        ValveTestQuery q = Session["ValveTestQuery"] as ValveTestQuery;

        if (q == null)
            q = new ValveTestQuery();

        int jobId;
        int valveId;

        if (!Int32.TryParse(txtJobID.Text, out jobId)) jobId = -1;
        if (!Int32.TryParse(txtValveTestID.Text, out valveId)) valveId = -1;

        q.JobID = jobId;
        q.ValveTestID = valveId;
        q.SerialNum = this.txtSerialNum.Text;
        q.FSRNum = this.txtFSR.Text;
        q.Client = String.IsNullOrEmpty(ClientFilter.ClientValue) ? -1 : Convert.ToInt32 ( ClientFilter.ClientValue );
        q.ClientLocation = String.IsNullOrEmpty(LocationFilter.ClientValue) ? -1 : Convert.ToInt32 ( LocationFilter.ClientValue );
        q.JobStatus = String.IsNullOrEmpty(JobStatusFilter.ClientValue) ? -1 : Convert.ToInt32 ( JobStatusFilter.ClientValue );
        q.TestResult = String.IsNullOrEmpty(TestResultFilter.ClientValue) ? -1 : Convert.ToInt32 ( TestResultFilter.ClientValue );
        q.TestedStartDate = TestedStartDate.Text;
        q.TestedEndDate = TestedEndDate.Text;

        Session[ "ValveTestQuery" ] = q;
    }

    protected void PrintSelected_Callback(object source, DevExpress.Web.ASPxCallback.CallbackEventArgs e)
    {
        if (reportingGrid.Selection.Count <= 0)
            return;

        List<object> values = reportingGrid.GetSelectedFieldValues(new string[] { "ValveTestID" });
        List<string> idList = new List<string>();

        foreach (object value in values)
        {
            idList.Add(value.ToString());
        }

        Session["ReportData"] = String.Join(",", idList.ToArray());

        PrintSelected.JSProperties["cpShowReport"] = true;
        PrintSelected.JSProperties["cpReportUrl"] = ResourcePaths.DownloadHelperPath + DocumentPaths.ValveTestFieldReport;
    }

    protected void PrintAll_Callback(object source, DevExpress.Web.ASPxCallback.CallbackEventArgs e)
    {
        ValveTestQuery q = Session["ValveTestQuery"] as ValveTestQuery;

        if (q == null)
        {
            SaveQuery();
            q = Session["ValveTestQuery"] as ValveTestQuery;
        }

        ValveTestSearchController controller = Context.Items["#boController"] as ValveTestSearchController;
        int[] ids = controller.GetAuthorizedValveTests(q, UserId).Select(vt => vt.ValveTestID).ToArray();

        if (ids.Length > 1000)
            throw new ApplicationException("Can not print more than 1000 records at time. Please narrow your search and try again.");
        else
        {
            List<string> idList = new List<string>();

            foreach (int value in ids)
            {
                idList.Add(value.ToString());
            }

            Session["ReportData"] = String.Join(",", idList.ToArray());

            PrintAll.JSProperties["cpShowReport"] = true;
            PrintAll.JSProperties["cpReportUrl"] = ResourcePaths.DownloadHelperPath + DocumentPaths.ValveTestFieldReport;

        }
    }

    private void RunReport ( int singleId )
    {
        RunReport ( new List<int> { singleId } );
    }

    private void RunReport ( List<int> idList )
    {
        Response.Redirect ( @"~/Reports/ValveTestReportViewer2.aspx" );
    }

    protected void btnExportExcel_Click ( object sender, EventArgs e )
    {
        ASPxGridViewExporter1.GridViewID = "reportingGrid";
        ASPxGridViewExporter1.WriteXlsToResponse ();
    }


    
}
