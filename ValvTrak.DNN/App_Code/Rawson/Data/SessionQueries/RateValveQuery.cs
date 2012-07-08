using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DevExpress.Data;

/// <summary>
/// Summary description for RateValveQuery
/// </summary>
public class RateValveQuery
{
	public RateValveQuery()
	{
        //initialize properties to defaults
        this.JobID = -1;
        this.RateValveTestID = -1;
        this.SerialNum = "";
        this.Client = -1;
        this.ClientLocation = -1;
        this.JobStatus = -1;
        this.TestedStartDate = "";
        this.TestedEndDate = "";

        // Added TJH 2/1/2010
        this.PageIndex = 0;
        this.PageSize = 10;
        this.SortOrder = new KeyValuePair<int, ColumnSortOrder>(13, ColumnSortOrder.Ascending);
	}

    public int JobID { get; set; }
    public int RateValveTestID { get; set; }
    public string FSRNum { get; set; }
    public string SerialNum { get; set; }
    public int Client { get; set; }
    public int ClientLocation { get; set; }
    public int JobStatus { get; set; }
    public string TestedStartDate { get; set; }
    public string TestedEndDate { get; set; }

    // Added TJH 2/1/2010
    public KeyValuePair<int, ColumnSortOrder> SortOrder { get; set; }
    public int PageIndex { get; set; }
    public int PageSize { get; set; }
}