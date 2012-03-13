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
            string userAgent = Request.ServerVariables.Get("HTTP_USER_AGENT");

            if (userAgent.Contains("MSIE 7.0") || userAgent.Contains("MSIE 8.0"))
                ReportViewer1.Attributes.Add("style", "margin-bottom: 50px;");

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
                    Configurator.Configure ( ReportViewer1, Request.QueryString );
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
