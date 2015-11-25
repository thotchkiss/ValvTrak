using DotNetNuke.Common.Utilities;
using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Data;
using System.Linq;
using System.Web;

namespace Rawson.Reports
{
    /// <summary>
    /// Summary description for RateValveFieldReportConfigurator
    /// </summary>
    public class RateValveFieldReportConfigurator : IReportConfigurator
    {
        public void Configure(ReportViewer rpt, NameValueCollection param)
        {
            rpt.LocalReport.ReportPath = null;
            rpt.LocalReport.DataSources.Clear();

            rpt.ProcessingMode = ProcessingMode.Local;
            rpt.LocalReport.ReportPath = HttpContext.Current.Server.MapPath("~/Desktopmodules/Rawson.Reports/Field") + "\\RateValveFieldReport.rdlc";

            rpt.LocalReport.SubreportProcessing += new SubreportProcessingEventHandler(LocalReport_SubreportProcessing);

            dsRateValveFieldReportTableAdapters.dsRateValveFieldReportTableAdapter rvAdapter = new dsRateValveFieldReportTableAdapters.dsRateValveFieldReportTableAdapter();
            rvAdapter.Connection.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ValvTrakData"].ConnectionString;

            string ids = (string)DataCache.GetCache(param["key"]);
            DataTable dtRv = rvAdapter.GetData(ids);

            rpt.LocalReport.DataSources.Add(new ReportDataSource("RateValveTest", dtRv.DefaultView));
            rpt.LocalReport.Refresh();
        }

        void LocalReport_SubreportProcessing(object sender, SubreportProcessingEventArgs e)
        {
            dsGreasingRecordFieldReportTableAdapters.dsGreasingRecordItemsTableAdapter griAdapter = new dsGreasingRecordFieldReportTableAdapters.dsGreasingRecordItemsTableAdapter();
            griAdapter.Connection.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ValvTrakData"].ConnectionString;

            DataTable dtGri = griAdapter.GetData(Convert.ToInt32(e.Parameters["RateValveTestID"].Values[0]));
            e.DataSources.Add(new ReportDataSource("RateValveTestParts", dtGri));

        }

    }
}