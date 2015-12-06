using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.Reporting.WebForms;
using System.Collections.Specialized;
using System.Data;
using System.Drawing.Printing;
using DotNetNuke.Common.Utilities;

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

            dsWellTestFieldReportTableAdapters.dsWellSafetyTestsTableAdapter adapter = new dsWellTestFieldReportTableAdapters.dsWellSafetyTestsTableAdapter();
            adapter.Connection.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ValvTrakData"].ConnectionString;

            string ids = (string)DataCache.GetCache(param["key"]);
            DataTable dt = adapter.GetData(ids);

            rpt.LocalReport.DataSources.Add(new ReportDataSource("ValvTrak", dt.DefaultView));
            rpt.LocalReport.Refresh();
        }
    }
}