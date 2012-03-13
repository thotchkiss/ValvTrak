using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using Microsoft.Reporting.WebForms;
using System.Collections.Specialized;

namespace Rawson.Reports
{
    /// <summary>
    /// Summary description for ReportConfigurator
    /// </summary>
    public interface IReportConfigurator
    {
        void Configure ( ReportViewer rpt, NameValueCollection param );
    }
}
