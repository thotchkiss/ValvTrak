using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DevExpress.Data;
using Rawson.App.Security;


namespace Rawson.Data
{
    public class WellSafetyQuery
    {
        public WellSafetyQuery ()
        {
            this.JobID = -1;
            this.WellSafetyTestID = -1;
            this.SerialNum = "";
            this.FSRNum = "";
            this.Client = -1;
            this.ClientLocation = -1;
            this.SystemLocation = "";
            this.TestedStartDate = "";
            this.TestedEndDate = "";
            this.TestResult = -1;

            this.PageIndex = 0;
            this.PageSize = 10;
            this.SortOrder = new KeyValuePair<int, ColumnSortOrder> ( 4, ColumnSortOrder.Ascending );
        }

        public int JobID { get; set; }
        public int WellSafetyTestID { get; set; }
        public string SerialNum { get; set; }
        public string FSRNum { get; set; }
        public int Client { get; set; }
        public int ClientLocation { get; set; }
        public string SystemLocation { get; set; }
        public int TestResult { get; set; }
        public string TestedStartDate { get; set; }
        public string TestedEndDate { get; set; }

        public KeyValuePair<int, ColumnSortOrder> SortOrder { get; set; }
        public int PageIndex { get; set; }
        public int PageSize { get; set; }
    }
}

