using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DevExpress.Data;
using Rawson.App.Security;


namespace Rawson.Data
{
    public class GreasingRecordQuery
    {
        public GreasingRecordQuery ()
        {
            //initialize properties to defaults
            this.SapWO = "";
            this.GreasingRecordID = -1;
            this.JobID = -1;
            this.FsrNum = "";
            this.SerialNum = "";
            this.Psv = "";
            this.Client = -1;
            this.ClientLocation = -1;
            this.GreasedStartDate = "";
            this.GreasedEndDate = "";

            this.PageIndex = 0;
            this.PageSize = 10;
            this.SortOrder = new KeyValuePair<int, ColumnSortOrder> ( 4, ColumnSortOrder.Ascending );

            // Added TJH 12/12/2012
            this.FocusedRowIndex = 0;
        }

        public int JobID { get; set; }
        public int GreasingRecordID { get; set; }
        
        public string FsrNum { get; set; }
        public string SerialNum { get; set; }

        public string SapWO { get; set; }
        public string Psv { get; set; }
        public int Client { get; set; }
        public int ClientLocation { get; set; }
        public string GreasedStartDate { get; set; }
        public string GreasedEndDate { get; set; }

        public KeyValuePair<int, ColumnSortOrder> SortOrder { get; set; }
        public int PageIndex { get; set; }
        public int PageSize { get; set; }

        // Added TJH 12/12/2012
        public int FocusedRowIndex { get; set; }

    }
}

