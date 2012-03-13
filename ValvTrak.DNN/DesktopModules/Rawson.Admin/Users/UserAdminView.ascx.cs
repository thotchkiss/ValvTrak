using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Microsoft.ApplicationBlocks.Data;

using DotNetNuke.Entities.Modules;
using System.Configuration;
using DotNetNuke.Security.Roles;

using Rawson.Data.Model;
using Rawson.Data;
using Rawson.App;
using DotNetNuke.Entities.Users;
using System.Collections;
using Rawson.App.Security;
using DotNetNuke.Common.Utilities;
using System.Data;
using Rawson.Data.Controllers;
using DevExpress.Web.ASPxEditors;
using System.Web.Script.Serialization;

namespace Rawson.Admin.Users
{
    public partial class UserAdminView : PortalModuleBase
    {
        string _letterFilter;
        int _userFilter;
        int _roleFilter;
        int _clientFilter;

        UserAdminController controller;

        protected void Page_Init(object sender, EventArgs e)
        {
            lnkNewUser.NavigateUrl = DotNetNuke.Common.Globals.NavigateURL(TabId, "EditUser", "mid=" + ModuleId);
            lnkNewRole.NavigateUrl = DotNetNuke.Common.Globals.NavigateURL(TabId, "EditRole", "mid=" + ModuleId);

            bool enabled = this.IsViewStateEnabled;
            

        }

        protected void Page_Load(object sender, EventArgs e)
        {
            controller = new UserAdminController(PortalId);
            controller.StateChanged += new EventHandler<UserAdminStateChangedArgs>(OnStateChanged);

            if (ViewState["state"] != null)
                controller.LoadState((string)ViewState["state"]);

            if (!Page.IsPostBack)
            {
                if (!String.IsNullOrEmpty(Request.Params["letter"]))
                    controller.ChangeAlphaUser(Request.Params["letter"]);
                else if (!String.IsNullOrEmpty(Request.Params["user"]))
                    controller.ChangeUser(Request.Params["user"]);
                else if (!String.IsNullOrEmpty(Request.Params["role"]))
                    controller.ChangeRole(Request.Params["role"]);
                else if (!String.IsNullOrEmpty(Request.Params["branch"]))
                    controller.ChangeBranchFilter(Request.Params["branch"]);
                else if (!String.IsNullOrEmpty(Request.Params["leaf"]))
                    controller.ChangeBranchFilter(Request.Params["leaf"]);
                else
                    controller.ResetState();
            }
        }

        void OnStateChanged(object sender, UserAdminStateChangedArgs e)
        {
            if (e.UpdateUserGrid)
            {
                dvUserGrid.DataSource = e.State.Users;
                dvUserGrid.DataBind();
            }

            if (e.UpdateRoleGrid)
            {
                dvRoleGrid.DataSource = e.State.Roles;
                dvRoleGrid.DataBind();
            }

            if (e.UpdateAuthTree)
            {
                tvAuthorizations.DataSource = e.State.Authorizations;
                tvAuthorizations.DataBind();
            }

            if (ViewState["state"] != null)
                controller.PurgeState((string)ViewState["state"]);

            ViewState["state"] = Guid.NewGuid().ToString();

            controller.CacheState((string)ViewState["state"], e.State);
        }

        #region Static List Data Sources

        protected void ldsUserphabet_Selecting(object sender, LinqDataSourceSelectEventArgs e)
        {
            string alphabet = "a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,All";
            string[] datapbabet = alphabet.Split(",".ToCharArray());

            e.Result = datapbabet;
        }

        protected void ldsListRoles_Selecting(object sender, LinqDataSourceSelectEventArgs e)
        {
            Dictionary<string, RoleInfo> roles = RoleController.GetRoleGroupByName(PortalId, "Data Access Restrictions").Roles;

            List<RoleInfo> lroles = new List<RoleInfo>(roles.Values);
            e.Result = lroles;
        }

        protected void ldsListClients_Selecting(object sender, LinqDataSourceSelectEventArgs e)
        {
            using (ValvTrakDBDataContext context = new ValvTrakDBDataContext())
            {
                e.Result = context.Clients.Where(cl => cl.Active == true).Select(cl => new ComboBoxValue<int> { DisplayMember = cl.Name, ValueMember = cl.ClientID }).OrderBy(cbv => cbv.DisplayMember).ToList();
            }
        }

        protected void ldsListLocations_Selecting(object sender, LinqDataSourceSelectEventArgs e)
        {
            using (ValvTrakDBDataContext context = new ValvTrakDBDataContext())
            {
                if (cmbClients.Value != null)
                    e.Result = context.ClientLocations.Where(cl => cl.Active == true && cl.ClientID == Convert.ToInt32(cmbClients.Value))
                        .Select(cl => new ComboBoxValue<int> { DisplayMember = cl.Name, ValueMember = cl.ClientLocationID }).OrderBy(cbv => cbv.DisplayMember).ToList();
                else
                    e.Result = new List<ComboBoxValue<int>>();
            }
        }

        #endregion

        #region Postback URLs

        public string LetterFilterUrl(string filter)
        {
            string url = DotNetNuke.Common.Globals.NavigateURL(TabId, "", "letter=" + filter);
            return url;
        }

        public string UserFilterUrl(string filter)
        {
            string url = DotNetNuke.Common.Globals.NavigateURL(TabId, "", "user=" + filter);
            return url;
        }

        public string UserEditUrl(string filter)
        {
            string url = DotNetNuke.Common.Globals.NavigateURL(TabId, "EditUser", "user=" + filter);
            return url;
        }

        public string RoleFilterUrl(string filter)
        {
            string url = DotNetNuke.Common.Globals.NavigateURL(TabId, "", "role=" + filter);
            return url;
        }

        public string RoleEditUrl(string filter)
        {
            string url = DotNetNuke.Common.Globals.NavigateURL(TabId, "EditRole", "role=" + filter);
            return url;
        }

        #endregion

        #region Commands
        
        protected void cmbLocations_Callback(object sender, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
            cmbLocations.DataBind();
        }

        protected void btnUsersInRole_Click(object sender, EventArgs e)
        {
            controller.ChangeRole(cmbRoles.Text);
        }

        protected void btnRolesForClient_Click(object sender, EventArgs e)
        {
            if (cmbLocations.Value == null)
                controller.ChangeBranchFilter(cmbClients.Value);
            else
                controller.ChangeLeafFilter(cmbLocations.Value);
        }

        protected void btnUserSearch_Click(object sender, EventArgs e)
        {
            controller.ChangeUserName(txtUserSearchFilter.Text);
        }

        #endregion

    }
}