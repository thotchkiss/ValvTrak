using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ICSharpCode.SharpZipLib.Zip;
using Rawson.Data.Model;
using System.IO;
using Rawson.Reports.Constants;
using DotNetNuke.Common.Utilities;
using System.Diagnostics;

namespace Rawson.Reports
{
    public partial class DownloadHelper : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ReportsController controller = new ReportsController(ResourcePaths.ReportServerPath);

            string path = Request.QueryString["ReportPath"];
            string cacheKey = Request.QueryString["cacheKey"];
            string format = "PDF";

            Dictionary<string, object> parameters = new Dictionary<string, object>();
            bool compress = String.IsNullOrEmpty(Request.QueryString["compressed"]) ? false : Boolean.Parse(Request.QueryString["compressed"]);

            //switch (path)
            //{
            //    case DocumentPaths.ValveTestFieldReport:
            //        parameters.Add("ValveTestIds", Session["ReportData"]);
            //        break;
            //    case DocumentPaths.GreasingRecordFieldReport:
            //        parameters.Add("GreasingRecordIds", Session["ReportData"]);
            //        break;
            //    case DocumentPaths.WellSafetyFieldReport:
            //        parameters.Add("WellSafetyTestIds", Session["ReportData"]);
            //        break;
            //}

            //Session["ReportData"] = null;

            string data = DataCache.GetCache<string>(cacheKey);
            switch (path)
            {
                case DocumentPaths.ValveTestFieldReport:
                    parameters.Add("ValveTestIds", data);
                    break;
                case DocumentPaths.GreasingRecordFieldReport:
                    parameters.Add("GreasingRecordIds", data);
                    break;
                case DocumentPaths.WellSafetyFieldReport:
                    parameters.Add("WellSafetyTestIds", data);
                    break;
            }

            DotNetNuke.Services.Cache.CachingProvider.Instance().Remove(cacheKey);
            
            /*********************************************************************************************************/
            controller.WriteResponse(Response, path, parameters, format, compress);

        }

    }
}
