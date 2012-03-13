using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Rawson.Reports.Constants
{
    /// <summary>
    /// Summary description for ResourcePaths
    /// </summary>
    public class ResourcePaths
    {
        public const string ReportServerPath = "http://localhost/reportserver/reportservice.asmx";
        public const string DownloadHelperPath = "http://valvtrak.rawsonenergyservices.com/desktopmodules/rawson.reports/downloadhelper.aspx?ReportPath={0}&cacheKey={1}";
        
        // Local testing only
        //public const string DownloadHelperPath = "http://localhost/srd/desktopmodules/rawson.reports/downloadhelper.aspx?ReportPath={0}&cacheKey={1}";

    }
}