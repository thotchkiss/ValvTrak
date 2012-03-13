using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.Reporting.WebForms;
using System.Collections.Specialized;
using System.Data;
using System.Drawing.Printing;

namespace Rawson.Reports
{
    /// <summary>
    /// Summary description for WellTestFieldReportConfigurator
    /// </summary>
    public class WellTestFieldReportConfigurator : IReportConfigurator
    {
        public void Configure(ReportViewer rpt, NameValueCollection param)
        {
            rpt.LocalReport.ReportPath = null;
            rpt.LocalReport.DataSources.Clear();

            rpt.ProcessingMode = ProcessingMode.Local;
            rpt.LocalReport.ReportPath = HttpContext.Current.Server.MapPath("~/Desktopmodules/Rawson.Reports/Field") + "\\WellSafetyFieldReport.rdlc";

            dsWellTestFieldReportTableAdapters.vw_WellSafetyTestsTableAdapter adapter = new dsWellTestFieldReportTableAdapters.vw_WellSafetyTestsTableAdapter();
            adapter.Connection.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ValvTrakData"].ConnectionString;

            DataTable dt = adapter.GetData();
            dt.DefaultView.RowFilter = String.Format("WellSafetyTestID IN ({0})", HttpContext.Current.Session["ReportData"]);

            HttpContext.Current.Session["ReportData"] = null;

            rpt.LocalReport.DataSources.Add(new ReportDataSource("WellSafetyTests", dt.DefaultView));
            rpt.LocalReport.Refresh();
        }
    }
}