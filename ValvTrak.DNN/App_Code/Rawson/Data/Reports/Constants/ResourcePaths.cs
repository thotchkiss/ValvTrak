using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;

namespace Rawson.Reports.Constants
{
    /// <summary>
    /// Summary description for ResourcePaths
    /// </summary>
    public class ResourcePaths
    {
        public static string ReportServerPath { get { return "http://valvtrak.rawsonenergyservices.com/reportserver/reportservice.asmx"; } }
        public static string DownloadHelperPath { get { return String.Format("http://{0}/desktopmodules/rawson.reports/downloadhelper.aspx{1}", HttpContext.Current.Request.Url.GetDownloadHelperPath(), "?ReportPath={0}&cacheKey={1}"); } }
    }

    static class Extensions
    {
        public static string GetDownloadHelperPath(this Uri uri)
        {
            StringBuilder path = new StringBuilder();

            path.Append(uri.Host);
            path.Append(":");
            path.Append(uri.Port);
            path.Append("/");
            path.Append(uri.Segments.ToList().Contains("app") ? "app" : "beta");

            return path.ToString();
        }
    }
}