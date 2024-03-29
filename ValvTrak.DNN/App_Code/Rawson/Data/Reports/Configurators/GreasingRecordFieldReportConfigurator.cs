﻿using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using Microsoft.Reporting.WebForms;
using System.Drawing.Printing;
using DotNetNuke.Common.Utilities;

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

            dsGreasingRecordFieldReportTableAdapters.dsGreasingRecordsTableAdapter grAdapter = new dsGreasingRecordFieldReportTableAdapters.dsGreasingRecordsTableAdapter();
            grAdapter.Connection.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ValvTrakData"].ConnectionString;

            string ids = (string)DataCache.GetCache(param["key"]);
            DataTable dtGr = grAdapter.GetData(ids);

            rpt.LocalReport.DataSources.Add(new ReportDataSource("ValvTrak", dtGr.DefaultView));
            rpt.LocalReport.Refresh();
        }

        void LocalReport_SubreportProcessing(object sender, SubreportProcessingEventArgs e)
        {
            dsGreasingRecordFieldReportTableAdapters.dsGreasingRecordItemsTableAdapter griAdapter = new dsGreasingRecordFieldReportTableAdapters.dsGreasingRecordItemsTableAdapter();
            griAdapter.Connection.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ValvTrakData"].ConnectionString;
            
            DataTable dtGri = griAdapter.GetData(Convert.ToInt32(e.Parameters["GreasingRecordID"].Values[0]));
            e.DataSources.Add(new ReportDataSource("ValvTrak", dtGri));
            
        }

        
    }
}