using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DevExpress.Data;
using Rawson.App.Security;


namespace Rawson.Data
{
    [Serializable]
    public class ValveTestQuery
    {
        public ValveTestQuery ()
        {
            //initialize properties to defaults
            this.JobID = -1;
            this.ValveTestID = -1;
            this.SerialNum = "";
            this.Client = -1;
            this.ClientLocation = -1;
            this.JobStatus = -1;
            this.TestedStartDate = "";
            this.TestedEndDate = "";
            this.TestResult = -1;

            // Added TJH 2/1/2010
            this.PageIndex = 0;
            this.PageSize = 10;
            this.SortOrder = new KeyValuePair<int, ColumnSortOrder> ( 13, ColumnSortOrder.Ascending );
        }

        public int JobID { get; set; }
        public int ValveTestID { get; set; }
        public string FSRNum { get; set; }
        public string SerialNum { get; set; }
        public int Client { get; set; }
        public int ClientLocation { get; set; }
        public int JobStatus { get; set; }
        public int TestResult { get; set; }
        public string TestedStartDate { get; set; }
        public string TestedEndDate { get; set; }

        // Added TJH 2/1/2010
        public KeyValuePair<int, ColumnSortOrder> SortOrder { get; set; }
        public int PageIndex { get; set; }
        public int PageSize { get; set; }
    }
}

