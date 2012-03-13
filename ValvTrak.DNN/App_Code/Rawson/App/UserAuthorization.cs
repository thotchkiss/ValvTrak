using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Common;
using System.Linq;

using DotNetNuke.Entities.Users;

using Microsoft.ApplicationBlocks.Data;

using Rawson.Data;
using DotNetNuke.Services.Log.EventLog;
using DotNetNuke.Entities.Portals;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data.SqlClient;


namespace Rawson.App.Security
{
    /// <summary>
    /// 
    /// </summary>
    public class UserAuthorization
    {
        object _userId = null;
        private bool _dataAdmin = false;
        List<RoleAuthorization> _roles = new List<RoleAuthorization>();

        /// <summary>
        /// Initializes a new instance of the <see cref="UserAuthorization"/> class.
        /// </summary>
        /// <param name="userId">The user id.</param>
        public UserAuthorization ( object userId )
        {
            _userId = userId;

            UserController uc = new UserController();
            UserInfo user = uc.GetUser(uc.PortalId, Convert.ToInt32(_userId));

            if (user.IsInRole("Administrators") || user.IsInRole("DataEntry") || user.IsInRole("App Admin") || user.IsSuperUser)
                _dataAdmin = true;
            else
                _roles = RoleAuthorization.GetRoleAuthorizationsForUser(_userId);
        }

        public object UserId
        {
            get { return _userId; }
        }

        public bool IsDataAdmin
        {
            get { return _dataAdmin; }
        }

        public string[] DataGroups 
        {
            get
            {
                List<string> szGroups = new List<string>();
                _roles.Select(ra => ra.RootAuthorizations).ToList().ForEach(o => o.ForEach(oz => szGroups.Add(oz.ToString())));

                szGroups.AddRange(RecurseGroups(szGroups));

                return szGroups.ToArray();
            }
        }

        private string[] RecurseGroups(List<string> sdGroups)
        {
            List<string> szGroups = new List<string>();
            sdGroups.ForEach(sz => { recursed.Clear(); szGroups.AddRange(RecurseGroup(sz)); });

            return szGroups.ToArray();
        }

        List<string> recursed = new List<string>();
        private string[] RecurseGroup(string group)
        {
            Database db = DatabaseFactory.CreateDatabase("ValvTrakData");
            DbCommand cmd = new SqlCommand("select clientid from clients where parentid = @ParentId");
            cmd.Parameters.Add(new SqlParameter("@ParentId", Convert.ToInt32(group)));

            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                {
                    string val = dr.GetValue(0).ToString();

                    recursed.Add(val);
                    RecurseGroup(val);
                }
            }

            return recursed.ToArray();
        }

        public string[] DataSingles
        {
            get
            {
                List<string> szSingles = new List<string>();

                _roles.Select(ra => ra.LeafAuthorizations).ToList().ForEach(o => o.ForEach(oz => szSingles.Add(oz.ToString())));
                return szSingles.ToArray();
            }
        }

        public string[] DataSinglesGroups
        {
            get
            {
                List<string> szSingles = new List<string>();

                _roles.Select(ra => ra.LeafAuthorizations).ToList().ForEach(o => o.ForEach(oz => szSingles.Add(oz.ToString())));
                return szSingles.ToArray();
            }
        }

        public string[] GetDataSinglesForGroup(object group)
        {
            List<string> szSingles = new List<string>();

            if (DataGroups.Contains(Convert.ToString(group)))
            {
                Database db = DatabaseFactory.CreateDatabase("ValvTrakData");
                
                DbCommand cmd = new SqlCommand("select clientlocationid from clientlocations where clientid = @ClientId");
                cmd.Parameters.Add(new SqlParameter("@ClientId", group));

                using (IDataReader dr = db.ExecuteReader(cmd))
                {
                    while (dr.Read())
                        szSingles.Add(dr.GetValue(0).ToString());
                }
            }
            else
                _roles.Where(ra => ra.BranchAuthorizations.Any(sz => sz == group)).Select(ra => ra.GetLeavesForBranch(group)).ToList().ForEach(o => o.ForEach(oc => szSingles.Add(oc.ToString())));
            
            return szSingles.ToArray();
        }
    }
}
