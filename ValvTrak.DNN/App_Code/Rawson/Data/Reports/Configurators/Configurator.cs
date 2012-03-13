using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Collections.Specialized;
using System.Web.UI.WebControls;
using Microsoft.Reporting.WebForms;

namespace Rawson.Reports
{
    /// <summary>
    /// Summary description for Configurator
    /// </summary>
    public class Configurator
    {
        private Configurator ()
        {
        }

        public static void Configure ( ReportViewer rpt, NameValueCollection param )
        {
            string reportType = param[ "rpt" ];

            if ( reportType == null )
                throw new ArgumentException ( "Invalid report type." );

            IReportConfigurator config;

            switch ( reportType )
            {
                case "vtfr":
                    config = new ValveTestFieldReportConfigurator();
                    break;
                case "grfr":
                    config = new GreasingRecordFieldReportConfigurator();
                    break;
                case "wsfr":
                    config = new WellTestFieldReportConfigurator();
                    break;
                default:
                    throw new ArgumentException ( "Invalid report type." );
            }

            config.Configure ( rpt, param );

        }
    }
}
