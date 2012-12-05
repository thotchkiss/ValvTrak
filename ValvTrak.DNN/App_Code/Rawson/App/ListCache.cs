using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Rawson.Data;
using Rawson.Data.Model;
using Rawson.App;
using System.Web.SessionState;
using DotNetNuke.Entities.Portals;
using DotNetNuke.Entities.Tabs;
using DotNetNuke.Entities.Users;
using Rawson.App.Security;

namespace Rawson.App
{
    /// <summary>
    /// Summary description for ListCache
    /// </summary>
    public class ListCache : IHttpModule
    {
        public void Dispose()
        {
        }

        public void Init(HttpApplication context)
        {
            context.BeginRequest += new EventHandler(context_BeginRequest);
            context.PostAcquireRequestState += new EventHandler(context_PostAcquireRequestState);
        }

        void context_PostAcquireRequestState(object sender, EventArgs e)
        {
            HttpApplication application = (HttpApplication)sender;
            HttpContext context = application.Context;


        }

        void context_BeginRequest(object sender, EventArgs e)
        {
            HttpApplication application = (HttpApplication)sender;
            HttpContext context = application.Context;

            using (ValvTrakDBDataContext db = new ValvTrakDBDataContext())
            {
                if (context.Application["Customers"] == null)
                    context.Application["Customers"] = db.Clients.OrderBy(c => c.Name).Select(c => new ComboBoxValue<string>(c.Name, c.ClientID.ToString())).ToList();

                if (context.Application["Locations"] == null)
                    context.Application["Locations"] = db.ClientLocations.OrderBy(c => c.Name).Select(c => new ComboBoxValue<string>(c.Name, c.ClientLocationID.ToString())).ToList();
            }
        }

    }
}