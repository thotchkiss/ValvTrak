using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Reporting.WebForms;
using DotNetNuke.Services.Exceptions;
using DotNetNuke.Entities.Modules;
using System.Collections.Specialized;

namespace Rawson.Reports
{
    public partial class ReportViewer : PortalModuleBase
    {
        protected void Page_Load ( object sender, EventArgs e )
        {
            //string userAgent = Request.ServerVariables.Get("HTTP_USER_AGENT");

            //if (userAgent.Contains("MSIE 7.0") || userAgent.Contains("MSIE 8.0"))
            //    ReportViewer1.Attributes.Add("style", "margin-bottom: 50px;");

            if ( !Page.IsPostBack )
            {
                try
                {
                    //////////////// Test, emulation of QueryString ////////////////////////////////
                    //NameValueCollection nvc = new NameValueCollection ();

                    //nvc.Add ( "rpt", "vtfr" );
                    //nvc.Add ( "vtid", "3456" );

                    //Configurator.Configure ( ObjectDataSource1, ReportViewer1, nvc );
                    ////////////////////////////////////////////////////////////////////////////////

                    Microsoft.Reporting.WebForms.ReportViewer vrender = new Microsoft.Reporting.WebForms.ReportViewer();
                    Configurator.Configure ( vrender, Request.QueryString );

                    Warning[] warnings;
                    string[] streamIds;
                    string mimeType = string.Empty;
                    string encoding = string.Empty;
                    string extension = string.Empty;
                   
                    byte[] bytes = vrender.LocalReport.Render(
                        "PDF",
                        null,
                        out mimeType,
                        out encoding,
                        out extension,
                        out streamIds,
                        out warnings);

                    Response.Buffer = true;
                    Response.Clear();
                    Response.ContentType = mimeType;
                    //Response.AddHeader(
                    //    "content-disposition",
                    //    "attachment; filename= filename" + "." + extension);
                    Response.OutputStream.Write(bytes, 0, bytes.Length); // create the file  
                    Response.Flush(); // send it to the client to download  
                    Response.End();
                }
                catch ( Exception ex )
                {
                    Exceptions.ProcessModuleLoadException ( ex.Message + ex.StackTrace, this, null );
                    throw;
                }
            }
        }

        
        
    }
}
