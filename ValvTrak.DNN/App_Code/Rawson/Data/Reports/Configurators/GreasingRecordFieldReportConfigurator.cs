using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using Microsoft.Reporting.WebForms;
using System.Drawing.Printing;

namespace Rawson.Reports
{
    /// <summary>
    /// Summary description for GreasingRecordFieldReportConfigurator
    /// </summary>
    public class GreasingRecordFieldReportConfigurator : IReportConfigurator 
    {
        public void Configure(ReportViewer rpt, NameValueCollection param)
        {
            rpt.LocalReport.ReportPath = null;
            rpt.LocalReport.DataSources.Clear();

            rpt.ProcessingMode = ProcessingMode.Local;
            rpt.LocalReport.ReportPath = HttpContext.Current.Server.MapPath("~/Desktopmodules/Rawson.Reports/Field") + "\\GreasingRecordFieldReport.rdlc";

            rpt.LocalReport.SubreportProcessing += new SubreportProcessingEventHandler(LocalReport_SubreportProcessing);

            dsGreasingRecordFieldReportTableAdapters.vw_GreasingRecordsTableAdapter grAdapter = new dsGreasingRecordFieldReportTableAdapters.vw_GreasingRecordsTableAdapter();
            grAdapter.Connection.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ValvTrakData"].ConnectionString;

            DataTable dtGr = grAdapter.GetData();
            dtGr.DefaultView.RowFilter = String.Format("GreasingRecordID IN ({0})", HttpContext.Current.Session["ReportData"]);

            HttpContext.Current.Session["ReportData"] = null;

            rpt.LocalReport.DataSources.Add(new ReportDataSource("GreasingRecord", dtGr.DefaultView));
            rpt.LocalReport.Refresh();

            //rpt.LocalReport.SubreportProcessing -= LocalReport_SubreportProcessing;

        }

        void LocalReport_SubreportProcessing(object sender, SubreportProcessingEventArgs e)
        {
            dsGreasingRecordFieldReportTableAdapters.vw_GreasingRecordItemsTableAdapter griAdapter = new dsGreasingRecordFieldReportTableAdapters.vw_GreasingRecordItemsTableAdapter();
            griAdapter.Connection.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ValvTrakData"].ConnectionString;
            
            DataTable dtGri = griAdapter.GetData(Convert.ToInt32(e.Parameters["GreasingRecordID"].Values[0]));
            e.DataSources.Add(new ReportDataSource("GreasingRecordItems", dtGri));
            
        }

        
    }
}