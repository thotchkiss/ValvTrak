using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using Microsoft.Reporting.WebForms;
using System.Collections.Specialized;
using System.Data;
using System.Drawing.Printing;

namespace Rawson.Reports
{
    /// <summary>
    /// Summary description for ValveTestFieldReportConfigurator
    /// </summary>
    public class ValveTestFieldReportConfigurator : IReportConfigurator
    {
        #region IReportConfigurator Members

        public void Configure ( ReportViewer rpt, NameValueCollection param )
        {
            rpt.LocalReport.ReportPath = null;
            rpt.LocalReport.DataSources.Clear();

            rpt.ProcessingMode = ProcessingMode.Local;
            rpt.LocalReport.ReportPath = HttpContext.Current.Server.MapPath ( "~/Desktopmodules/Rawson.Reports/Field" ) + "\\ValveTestFieldReport.rdlc";

            dsValveTestsFieldReportTableAdapters.dtValveTestsTableAdapter adapter = new dsValveTestsFieldReportTableAdapters.dtValveTestsTableAdapter();
            adapter.Connection.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ValvTrakData"].ConnectionString;

            DataTable dt = adapter.GetData();
            dt.DefaultView.RowFilter = String.Format("ValveTestID IN ({0})", HttpContext.Current.Session["ReportData"]);

            HttpContext.Current.Session["ReportData"] = null;

            rpt.LocalReport.DataSources.Add(new ReportDataSource("ValvTrak", dt.DefaultView));

        }

        #endregion
    }
}
