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
        public static string ReportServerPath = HttpContext.Current.Request.Url.Host == "localhost" ? "http://valvtrak.rawsonenergyservices.com/reportserver/reportservice.asmx" : "http://localhost/reportserver/reportservice.asmx";
        public static string DownloadHelperPath = HttpContext.Current.Request.Url.Host == "localhost" ? "http://localhost/beta/desktopmodules/rawson.reports/downloadhelper.aspx?ReportPath={0}&cacheKey={1}" : "http://valvtrak.rawsonenergyservices.com/desktopmodules/rawson.reports/downloadhelper.aspx?ReportPath={0}&cacheKey={1}";
        
        // Local testing only
        //public const string DownloadHelperPath = "http://localhost/beta/desktopmodules/rawson.reports/downloadhelper.aspx?ReportPath={0}&cacheKey={1}";

    }
}