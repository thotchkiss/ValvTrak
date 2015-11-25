using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using Microsoft.Reporting.WebForms;
using System.Collections.Specialized;
using System.Data;
using System.Drawing.Printing;
using DotNetNuke.Common.Utilities;

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
            try
            {
                rpt.LocalReport.ReportPath = null;
                rpt.LocalReport.DataSources.Clear();

                rpt.ProcessingMode = ProcessingMode.Local;
                rpt.LocalReport.ReportPath = HttpContext.Current.Server.MapPath("~/Desktopmodules/Rawson.Reports/Field") + "\\ValveTestFieldReport.rdlc";

                dsValveTestsFieldReportTableAdapters.dsValveTestsTableAdapter adapter = new dsValveTestsFieldReportTableAdapters.dsValveTestsTableAdapter();
                adapter.Connection.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ValvTrakData"].ConnectionString;

                string ids = (string)DataCache.GetCache(param["key"]);
                DataTable dt = adapter.GetData(ids);

                rpt.LocalReport.DataSources.Add(new ReportDataSource("ValvTrak", dt.DefaultView));
            }
            catch(Exception ex)
            {
                Console.WriteLine(ex.ToString());
                throw;
            }

        }

        #endregion
    }
}
