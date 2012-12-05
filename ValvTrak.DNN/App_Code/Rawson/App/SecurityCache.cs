using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DotNetNuke.Entities.Users;
using Rawson.App.Security;
using Rawson.Data;
using Rawson.Data.Model;

namespace Rawson.App
{
    /// <summary>
    /// Summary description for SecurityCache
    /// </summary>
    public class SecurityCache : IHttpModule
    {
        public void Dispose()
        {
           
        }

        public void Init(HttpApplication context)
        {
            context.PreRequestHandlerExecute += new EventHandler(context_PreRequestHandlerExecute);
        }

        void context_PreRequestHandlerExecute(object sender, EventArgs e)
        {
            HttpApplication app = (HttpApplication)sender;
            HttpContext context = app.Context;

            if (context.Session != null)
            {
                string szCookieHeader = context.Request.Headers["Cookie"];
                UserInfo userInfo = context.Items["UserInfo"] as UserInfo;

                if (szCookieHeader != null && userInfo != null && userInfo.UserID > 0)
                {
                    UserAuthorization ua;

                    if (context.Session["UserAuthorization"] == null)
                        ua = new UserAuthorization(userInfo.UserID);
                    else
                    {
                        ua = context.Session["UserAuthorization"] as UserAuthorization;

                        if (!ua.UserId.Equals(userInfo.UserID))
                            ua = new UserAuthorization(userInfo.UserID);
                    }

                    context.Session["UserAuthorization"] = ua;
                    context.Session["AuthorizedClientsList"] = GetAuthorizedClients(ua);
                }

            }

        }

        List<ComboBoxValue<int>> GetAuthorizedClients(UserAuthorization ua)
        {
            using (var context = Activator.CreateInstance<ValvTrakDBDataContext>())
            {
                IEnumerable<Client> clients;

                if (ua.IsDataAdmin)
                    clients = context.Clients.Where(c => c.Active == true).ToList();
                else
                {
                    var cauth = ua.DataGroups.Select(sz => Convert.ToInt32(sz));
                    var pauth = ua.DataSingles.Select(sz => Convert.ToInt32(sz));

                    clients = context.Clients.Where(c => (cauth.Contains(c.ClientID) || c.ClientLocations.Any(cl => pauth.Contains(cl.ClientLocationID))) && c.Active == true).ToList();
                }
                
                var list = clients.Distinct().Select(c => new ComboBoxValue<int> { DisplayMember = c.Name, ValueMember = c.ClientID }).OrderBy(cv => cv.DisplayMember).ToList();

                return list;
            }

            
        }


    }
}