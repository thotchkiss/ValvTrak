using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Data;
using System.Reflection;
using Rawson.App;
using DevExpress.Web;

using DotNetNuke.Entities.Modules;
using Rawson.Data;
using Rawson.App.Security;
using Rawson.Data.Controllers;
using DotNetNuke.Common.Utilities;

public partial class JobsSearch : PortalModuleBase
{
    protected void Page_Init(object sender, EventArgs e)
    {
        JobSearchController controller = new JobSearchController();

        Context.Items.Add("#boController", controller);
        Context.Items.Add("#queryKey", Request.UserHostName + "\\" + UserInfo.Username + "\\JobSearchQuery");
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        JobSearchQuery q = DataCache.GetCache<JobSearchQuery>((string)Context.Items["#queryKey"]);

        if (q != null)
            JobsGrid.SettingsPager.PageSize = q.PageSize;
        else
        {
            JobsGrid.SettingsPager.PageSize = 10;
            SaveQuery();
        }

        JobsGrid.Templates.PagerBar = new CustomPagerBarTemplate ();
        lnkNewJob.NavigateUrl = DotNetNuke.Common.Globals.NavigateURL ( TabId, "Job", "mid=" + ModuleId );

        if ( !Page.IsPostBack )
        {
            if ( q != null )
            {
                //restore control values from saved query
                JobIDFilter.Text = q.JobID;
                SalesOrderFilter.Text = q.SalesOrder;
                JobTypeFilter.Value = q.JobType;
                ClientFilter.Value = q.Client;
                LocationFilter.Value = q.ClientLocation;
                //AssignedByFilter.Value = q.AssignedBy;
                //ApprovedByFilter.Value = q.ApprovedBy;
                AssignedToFilter.Value = q.AssignedTo;
                JobStatusFilter.Value = q.JobStatus;
                //ActiveFilter.Value = q.Active;
                CallInStartDate.Text = q.CallInStartDate;
                CallInEndDate.Text = q.CallInEndDate;
                ServiceStartDate.Text = q.ServiceStartDate;
                ServiceEndDate.Text = q.ServiceEndDate;
                CompletionStartDate.Text = q.CompletionStartDate;
                CompletionEndDate.Text = q.CompletionEndDate;

                JobsGrid.SortBy ( JobsGrid.Columns[ q.SortOrder.Key ], q.SortOrder.Value );
                JobsGrid.PageIndex = q.PageIndex;
            }
            else
            {
                DateTime end = DateTime.Today;
                CompletionEndDate.Text = end.ToString ( "d" );
                CompletionStartDate.Text = end.AddDays ( -30 ).ToString ( "d" );

                ClientFilter.Value = -1;
                //AssignedByFilter.Value = -1;
                AssignedToFilter.Value = -1;
                //ApprovedByFilter.Value = -1;
                LocationFilter.Value = -1;

                SaveQuery ();
            }
        }
    }

    private void SaveQuery()
    {
        JobSearchQuery q = DataCache.GetCache<JobSearchQuery>((string)Context.Items["#queryKey"]);
        if (q == null)
            q = new JobSearchQuery();

        q.JobID = this.JobIDFilter.Text;
        q.SalesOrder = this.SalesOrderFilter.Text;
        q.JobType = JobTypeFilter.Value == null ? -1 : (int)JobTypeFilter.Value;
        q.Client = ClientFilter.Value == null ? -1 : (int)ClientFilter.Value;
        q.ClientLocation = LocationFilter.Value == null ? -1 : (int)LocationFilter.Value;
        //q.AssignedBy = AssignedByFilter.Value == null ? -1 : (int)AssignedByFilter.Value;
        //q.ApprovedBy = ApprovedByFilter.Value == null ? -1 : (int)ApprovedByFilter.Value;
        q.AssignedTo = AssignedToFilter.Value == null ? -1 :  (int)AssignedToFilter.Value;
        q.JobStatus = JobStatusFilter.Value == null ? -1 : (int)JobStatusFilter.Value;
        //q.Active = ActiveFilter.Value == null ? -1 : (int)ActiveFilter.Value;
        q.CallInStartDate = CallInStartDate.Text;
        q.CallInEndDate = CallInEndDate.Text;
        q.ServiceStartDate = ServiceStartDate.Text;
        q.ServiceEndDate = ServiceEndDate.Text;
        q.CompletionStartDate = CompletionStartDate.Text;
        q.CompletionEndDate = CompletionEndDate.Text;

        DataCache.SetCache((string)Context.Items["#queryKey"], q, false);
    }

    protected void JobGridDataSource_Selecting ( object sender, LinqDataSourceSelectEventArgs e )
    {
        JobSearchQuery q = DataCache.GetCache<JobSearchQuery>((string)Context.Items["#queryKey"]);
        if (q == null)
        {
            SaveQuery();
            q = DataCache.GetCache<JobSearchQuery>((string)Context.Items["#queryKey"]);
        }

        JobSearchController controller = Context.Items["#boController"] as JobSearchController;
        e.Result = controller.GetAuthorizedJobs(q, UserId);
    }

    protected void JobsGrid_DataBound ( object sender, EventArgs e )
    {
        if (!IsPostBack)
        {
            JobSearchQuery q = DataCache.GetCache<JobSearchQuery>((string)Context.Items["#queryKey"]);

            if (q != null)
            {
                if (JobsGrid.VisibleRowCount > q.FocusedRowIndex)
                    JobsGrid.FocusedRowIndex = q.FocusedRowIndex;
                else if (JobsGrid.VisibleRowCount > 0)
                    JobsGrid.FocusedRowIndex = 0;
                else
                    JobsGrid.FocusedRowIndex = -1;
            }
        }

        JobsGrid.JSProperties[ "cpPageCount" ] = JobsGrid.PageCount;
    }

    protected void JobsGrid_FocusedRowChanged(object sender, EventArgs e)
    {
        var q = DataCache.GetCache<JobSearchQuery>((string)Context.Items["#queryKey"]);
        if (q != null)
            q.FocusedRowIndex = JobsGrid.FocusedRowIndex;
    }

    protected void JobsGrid_CustomCallback ( object sender, ASPxGridViewCustomCallbackEventArgs e )
    {
        int pageSize;
        if ( Int32.TryParse ( e.Parameters, out pageSize ) )
        {
            JobSearchQuery q = DataCache.GetCache<JobSearchQuery>((string)Context.Items["#queryKey"]);
            q.PageSize = int.Parse ( e.Parameters );

            JobsGrid.SettingsPager.PageSize = q.PageSize;
        }

        SaveQuery ();
        JobsGrid.DataBind ();
    }

    // Added TJH 1/31/2010
    protected void JobsGrid_BeforeColumnSortingGrouping ( object sender, DevExpress.Web.ASPxGridViewBeforeColumnGroupingSortingEventArgs e )
    {
        var q =  DataCache.GetCache<JobSearchQuery>((string)Context.Items["#queryKey"]);
        if ( q != null )
            q.SortOrder = new KeyValuePair<int, ColumnSortOrder> ( e.Column.Index, e.Column.SortOrder );
    }

    // Added TJH 2/1/2010
    protected void JobsGrid_PageIndexChanged ( object sender, EventArgs e )
    {
        var q =  DataCache.GetCache<JobSearchQuery>((string)Context.Items["#queryKey"]);
        if ( q != null )
            q.PageIndex = JobsGrid.PageIndex;
    }

    protected void ClientDataSource_Selecting ( object sender, LinqDataSourceSelectEventArgs e )
    {
        JobSearchController controller = Context.Items["#boController"] as JobSearchController;

        List<ComboBoxValue<int>> list = controller.GetAuthorizedClients(UserId);
        list.Insert(0, new ComboBoxValue<int> { DisplayMember = "-- All --", ValueMember = -1 });

        e.Result = list;
    }

    protected void EmployeeDataSource_Selecting ( object sender, LinqDataSourceSelectEventArgs e )
    {
        JobSearchController controller = Context.Items["#boController"] as JobSearchController;

        List<ComboBoxValue<int>> list = controller.GetEmployeesList();
        list.Insert(0, new ComboBoxValue<int> { DisplayMember = "-- All --", ValueMember = -1 });

        e.Result = list;        
    }

    protected void LocationDataSource_Selecting ( object sender, LinqDataSourceSelectEventArgs e )
    {
        int clientID;
        if (ClientFilter.Value == null && !int.TryParse((string)ClientFilter.ClientValue, out clientID))
            clientID = -1;
        else
            clientID = (int)ClientFilter.Value;

        JobSearchController controller = Context.Items["#boController"] as JobSearchController;

        List<ComboBoxValue<int>> list = controller.GetAuthorizedLocations(UserId, clientID);
        list.Insert(0, new ComboBoxValue<int> { DisplayMember = "-- All --", ValueMember = -1 });

        e.Result = list;
    }

    protected void JobsGrid_CustomButtonCallback ( object sender, ASPxGridViewCustomButtonCallbackEventArgs e )
    {
        object[] values = JobsGrid.GetRowValues(e.VisibleIndex, "JobID", "JobTypeID") as object[];

        if (e.ButtonID == "btnEdit")
            Response.RedirectLocation = DotNetNuke.Common.Globals.NavigateURL(TabId, "Job", "mid=" + ModuleId, "JobID=" + values[0]);
        else
        {
            JobSearchController controller = Context.Items["#boController"] as JobSearchController;
            controller.Delete(values[0]);
        }

        JobsGrid.DataBind();
    }

    protected void LocationFilter_Callback ( object sender, DevExpress.Web.CallbackEventArgsBase e )
    {
        LocationFilter.DataBind();
        LocationFilter.Value = -1;
    }

    protected void JobTypeDataSource_Selecting(object sender, LinqDataSourceSelectEventArgs e)
    {
        JobSearchController controller = Context.Items["#boController"] as JobSearchController;
        List<ComboBoxValue<int>> list = controller.GetJobTypesList();

        list.Insert(0, new ComboBoxValue<int> { DisplayMember = "-- All --", ValueMember = -1 });
        e.Result = list;
    }

    protected void JobStatusDataSource_Selecting(object sender, LinqDataSourceSelectEventArgs e)
    {
        JobSearchController controller = Context.Items["#boController"] as JobSearchController;
        List<ComboBoxValue<int>> list = controller.GetJobStatuses();

        list.Insert(0, new ComboBoxValue<int> { DisplayMember = "-- All --", ValueMember = -1 });
        e.Result = list;
    }
    
}
