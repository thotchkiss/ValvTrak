using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using Reporting;
using System.Web.Services.Protocols;
using System.Net;
using System.IO;
using ICSharpCode.SharpZipLib.Zip;
using System.Diagnostics;
using Microsoft.Practices.EnterpriseLibrary.ExceptionHandling;
using System.Text;
using System.Configuration;

namespace Rawson.Reports
{
    /// <summary>
    /// Summary description for ReportsController
    /// </summary>
    public class ReportsController : IDisposable
    {
        ReportingService _rs;

        public ReportsController()
        {
            _rs = new ReportingService();

            string user = ConfigurationManager.AppSettings["Reporting.user"];
            string password = ConfigurationManager.AppSettings["Reporting.password"];
            string domain = ConfigurationManager.AppSettings["Reporting.domain"];

            _rs.Credentials = new NetworkCredential(user, password, domain);
        }

        public ReportsController( string rsUrl ) : this()
        {
            _rs.Url = rsUrl;
        }

        public void WriteResponse(HttpResponse response, string reportPath, Dictionary<string, object> parameters, string format, bool compress)
        {
            byte[] doc = RenderDocument(reportPath, parameters, format);

            response.Clear();

            switch (format.ToUpper())
            {
                case "PDF":
                    response.ContentType = "application/pdf";
                    response.AddHeader("Content-Type", "application/pdf");
                    response.AddHeader("Content-Disposition", "inline;filename=ValvTrak.pdf");

                    break;
                case "EXCEL":
                    response.ContentType = "application/vnd.ms-excel";
                    response.AddHeader("Content-Type", "application/vnd.ms-excel");
                    response.AddHeader("Content-Disposition", "inline;filename=ValvTrak.xls");

                    break;
                case "XML":
                    //response.ContentType = "application/pdf";
                    //response.AddHeader("Content-Type", "application/pdf");
                    //response.AddHeader("Content-Disposition", "inline;filename=ValvTrak.pdf");

                    break;
                case "IMAGE":
                    //response.ContentType = "application/pdf";
                    //response.AddHeader("Content-Type", "application/pdf");
                    //response.AddHeader("Content-Disposition", "inline;filename=ValvTrak.pdf");

                    break;
                case "CSV":
                    //response.ContentType = "application/pdf";
                    //response.AddHeader("Content-Type", "application/pdf");
                    //response.AddHeader("Content-Disposition", "inline;filename=ValvTrak.pdf");

                    break;
            }

            if (compress)
                response.BinaryWrite(Compress(doc));
            else
                response.BinaryWrite(doc);

            response.End();
        }

        private byte[] Compress(byte[] toCompress)
        {
            using (MemoryStream storage = new MemoryStream())
            {
                using (var zipper = new ZipOutputStream(storage))
                {
                    zipper.SetComment("ValvTrak Compressed Delivery");
                    zipper.SetLevel(9); //0 - store only to 9 - means best compression

                    ZipEntry ze = new ZipEntry(DateTime.Now.ToUniversalTime().ToString());
                    ze.DateTime = DateTime.Now;

                    zipper.PutNextEntry(ze);
                    zipper.Write(toCompress, 0, (int)toCompress.Length);

                    zipper.Finish();

                    byte[] buffer = new byte[(int)storage.Length];
                    Array.Copy(storage.ToArray(), buffer, (int)(storage.Length));

                    return buffer;
                }
            }
        }

        private byte[] RenderDocument(string reportPath, Dictionary<string, object> parameters, string format)
        {
            Func<Dictionary<string, object>, string> writeParams = (d) =>
            {
                StringBuilder sb = new StringBuilder();

                foreach (KeyValuePair<string, object> kv in d)
                {
                    sb.Append(Environment.NewLine);
                    sb.AppendFormat("Name : {0}, Value : {1}", kv.Key, kv.Value);
                }

                sb.Append(Environment.NewLine);

                return sb.ToString();
            };

            EventLog.WriteEntry("ValvTrak", String.Format("Report Path =  {0}\r\n# Parameters = {1}" + writeParams(parameters) + "\r\nRS = {2}", reportPath, parameters.Count, (_rs != null)), EventLogEntryType.Information);

            string deviceInfo = null;
            Byte[] document = null;
            string encoding;
            string mimeType;
            Warning[] warnings = null;
            ParameterValue[] reportHistoryParameters = null;
            string[] streamIDs = null;

            try
            {
                document = _rs.Render(
                    reportPath,
                    format,
                    null,
                    deviceInfo,
                    GetParameters(parameters),
                    null,
                    null,
                    out encoding,
                    out mimeType,
                    out reportHistoryParameters,
                    out warnings,
                    out streamIDs);
            }
            catch (SoapException sex)
            {
                ExceptionPolicy.HandleException(sex, "Default");
            }
            catch (Exception ex)
            {
                ExceptionPolicy.HandleException(ex, "Default");
            }

            return document;
        }

        private ParameterValue[] GetParameters(Dictionary<string, object> parameters)
        {
            List<ParameterValue> parms = new List<ParameterValue>();

            foreach (KeyValuePair<string, object> kv in parameters)
                parms.Add(new ParameterValue { Name = kv.Key, Value = kv.Value.ToString() }); 

            return parms.ToArray();
        }

        #region IDisposable

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }

        protected virtual void Dispose(bool disposing)
        {
            if (disposing)
                if (_rs != null)
                {
                    _rs.Dispose();
                    _rs = null;
                }
        }

        ~ReportsController()
        {
            Dispose(false);
        }

        #endregion
    }
}