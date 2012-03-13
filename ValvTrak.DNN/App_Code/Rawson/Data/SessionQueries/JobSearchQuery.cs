using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DevExpress.Data;
using Rawson.App.Security;


namespace Rawson.Data
{
    [Serializable ()]
    public class JobSearchQuery
    {
        public JobSearchQuery ()
        {
            //initialize properties to defaults
            this.JobID = "";
            this.SalesOrder = "";
            this.JobType = -1;
            this.Client = -1;
            this.ClientLocation = -1;
            this.AssignedBy = -1;
            this.ApprovedBy = -1;
            this.AssignedTo = -1;
            this.JobStatus = -1;
            this.Active = -1;
            this.CallInStartDate = "";
            this.CallInEndDate = "";
            this.ServiceStartDate = "";
            this.ServiceEndDate = "";
            this.CompletionStartDate = "";
            this.CompletionEndDate = "";

            // Added TJH 2/1/2010
            this.PageIndex = 0;
            this.PageSize = 10;
            this.SortOrder = new KeyValuePair<int, ColumnSortOrder> ( 3, ColumnSortOrder.Ascending );
        }

        public string JobID { get; set; }
        public string SalesOrder { get; set; }
        public int JobType { get; set; }
        public int Client { get; set; }
        public int ClientLocation { get; set; }
        public int AssignedBy { get; set; }
        public int ApprovedBy { get; set; }
        public int AssignedTo { get; set; }
        public int JobStatus { get; set; }
        public int Active { get; set; }
        public string CallInStartDate { get; set; }
        public string CallInEndDate { get; set; }
        public string ServiceStartDate { get; set; }
        public string ServiceEndDate { get; set; }
        public string CompletionStartDate { get; set; }
        public string CompletionEndDate { get; set; }

        // Added TJH 2/1/2010
        public KeyValuePair<int, ColumnSortOrder> SortOrder { get; set; }
        public int PageIndex { get; set; }
        public int PageSize { get; set; }

    }
}

