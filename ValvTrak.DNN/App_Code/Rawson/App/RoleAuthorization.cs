using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Linq;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Configuration;

using Rawson.App.Security;
using Rawson.Data.Model;

using Microsoft.Practices.EnterpriseLibrary.Data;
using DotNetNuke.Common.Utilities;
using System.Data.Common;
using DotNetNuke.Entities.Users;
using DotNetNuke.Security.Roles;

namespace Rawson.App.Security
{
    /// <summary>
    /// Summary description for RoleAuthorization
    /// </summary>
    public class RoleAuthorization
    {
        object _roleId;
        List<KeyValuePair<object, object>> _authItems = new List<KeyValuePair<object, object>>();

        #region Instance Methods

        public RoleAuthorization(object roleId)
        {
            _roleId = roleId;

            DatabaseFactory.SetDatabaseProviderFactory(new DatabaseProviderFactory(), false);
            Database db = DatabaseFactory.CreateDatabase("SiteSqlServer");

            DbCommand cmd = new SqlCommand("select distinct customerid, projectid from roleauthorizations where roleid = @RoleId ");
            cmd.Parameters.Add(new SqlParameter("@RoleId", roleId));

            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                    _authItems.Add(new KeyValuePair<object, object>(dr.GetValue(0), dr.GetValue(1)));
            }

        }

        public object RoleID { get { return _roleId; } }

        public List<object> RootAuthorizations
        {
            get { return _authItems.Where(ai => ai.Value.Equals(-1)).Select(kv => kv.Key).ToList(); }
        }

        public List<object> BranchAuthorizations
        {
            get { return _authItems.Where(ai => !ai.Value.Equals(-1)).Select(kv => kv.Key).Distinct().ToList(); }
        }

        public List<object> LeafAuthorizations
        {
            get { return _authItems.Where(ai => !ai.Value.Equals(-1)).Select(kv => kv.Value).Distinct().ToList(); }
        }

        public List<object> GetLeavesForBranch(object branchId)
        {
            return _authItems.Where(ai => !ai.Key.Equals(branchId)).Select(kv => kv.Value).Distinct().ToList();
        }

        public bool IsAuthorized(object oid)
        {
            return _authItems.Any(ai => ai.Key == oid || ai.Value == oid);
        }

        public void AddBranch(object branchId, params object[] leafIds)
        {
            if (IsAuthorized(branchId)) { RemoveBranch(branchId); }

            Database db = DatabaseFactory.CreateDatabase("SiteSqlServer");
            DbCommand cmd = new SqlCommand("insert roleauthorizations (RoleID, CustomerId, ProejctId) values (@RoleId, @ClientId, @LocationId)");

            if (leafIds.Length == 0)
            {
                cmd.Parameters.AddRange(new SqlParameter[] {
                
                    new SqlParameter("@RoleID", _roleId),
                    new SqlParameter("@ClientID", branchId),
                    new SqlParameter("@LocationId", DBNull.Value)
                });

                db.ExecuteNonQuery(cmd);

                _authItems.Add(new KeyValuePair<object, object>(branchId, null));
            }
            else
            {
                for (int i = 0; i < leafIds.Length; i++)
                {
                    cmd.Parameters.Clear();
                    cmd.Parameters.AddRange(new SqlParameter[] {
                
                        new SqlParameter("@RoleId", _roleId),
                        new SqlParameter("@ClientId", branchId),
                        new SqlParameter("@LocationId", leafIds[i])
                    });

                    db.ExecuteNonQuery(cmd);

                    _authItems.Add(new KeyValuePair<object, object>(branchId, leafIds[i]));
                }
            }
        }

        public void RemoveBranch(object branchId)
        {
            Database db = DatabaseFactory.CreateDatabase("SiteSqlServer");
            DbCommand cmd = new SqlCommand("delete from roleauthorizations where roleid = @RoleID and customerid = @ClientId");
            cmd.Parameters.AddRange(new SqlParameter[] {
                
                new SqlParameter("@RoleID", _roleId),
                new SqlParameter("@ClientID", branchId)
            });

            db.ExecuteNonQuery(cmd);

            var items = _authItems.Where(kv => kv.Key.Equals(branchId)).ToList();
            items.ForEach(item => _authItems.Remove(item));
        }

        public void AddLeaf(object parentNode, object leafId)
        {
            if (!IsAuthorized(leafId))
            {
                Database db = DatabaseFactory.CreateDatabase("SiteSqlServer");
                DbCommand cmd = new SqlCommand("insert roleauthorizations (RoleID, CustomerId, ProjectId) Values (@RoleId, @ClientId, @LocationId)");
                cmd.Parameters.AddRange(new SqlParameter[] {
                
                    new SqlParameter("@RoleId", _roleId),
                    new SqlParameter("@ClientID", parentNode),
                    new SqlParameter("@LocationID", leafId)
                });

                db.ExecuteNonQuery(cmd);

                _authItems.Add(new KeyValuePair<object, object>(parentNode, leafId));
            }
        }

        public void RemoveLeaf(object leafId)
        {
            Database db = DatabaseFactory.CreateDatabase("SiteSqlServer");
            DbCommand cmd = new SqlCommand("delete from roleauthorizations where roleid = @RoleID and projectid = @LocationId");
            cmd.Parameters.AddRange(new SqlParameter[] {
                
                new SqlParameter("@RoleID", _roleId),
                new SqlParameter("@Location", leafId)
            });

            db.ExecuteNonQuery(cmd);

            var items = _authItems.Where(kv => kv.Value.Equals(leafId)).ToList();
            items.ForEach(item => _authItems.Remove(item));
        }

        #endregion

        #region Static Methods

        public static List<RoleAuthorization> GetRoleAuthorizationsForUser(object userId)
        {
            List<RoleAuthorization> roles = new List<RoleAuthorization>();

            DatabaseFactory.SetDatabaseProviderFactory(new DatabaseProviderFactory(), false);
            Database db = DatabaseFactory.CreateDatabase("SiteSqlServer");

            DbCommand cmd = new SqlCommand("select distinct du.roleid from dnn_userroles du inner join roleauthorizations ra on du.roleid = ra.roleid where du.userid = @UserId");
            cmd.Parameters.Add(new SqlParameter("@UserId", userId));

            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                    roles.Add(new RoleAuthorization(dr.GetValue(0)));
            }

            return roles;
        }

        public static List<RoleAuthorization> GetRoleAuthorizationsForRole(object roleId)
        {
            List<RoleAuthorization> roles = new List<RoleAuthorization>();

            DatabaseFactory.SetDatabaseProviderFactory(new DatabaseProviderFactory(), false);
            Database db = DatabaseFactory.CreateDatabase("SiteSqlServer");

            DbCommand cmd = new SqlCommand("select distinct du.roleid from dnn_userroles du inner join roleauthorizations ra on du.roleid = ra.roleid where du.roleid = @RoleId");
            cmd.Parameters.Add(new SqlParameter("@RoleId", roleId));

            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                    roles.Add(new RoleAuthorization(dr.GetValue(0)));
            }

            return roles;
        }

        public static List<RoleAuthorization> GetRoleAuthorizationsForBranch(object branchId)
        {
            List<object> roles = new List<object>();

            DatabaseFactory.SetDatabaseProviderFactory(new DatabaseProviderFactory(), false);
            Database db = DatabaseFactory.CreateDatabase("SiteSqlServer");

            DbCommand cmd = new SqlCommand("select distinct du.roleid from dnn_userroles du inner join roleauthorizations ra on du.roleid = ra.roleid where du.customerid = @CustomerId");
            cmd.Parameters.Add(new SqlParameter("@CustomerId", branchId));

            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                    roles.Add(dr.GetValue(0));
            }

            return roles.Cast<RoleAuthorization>().ToList();
        }

        public static List<RoleAuthorization> GetRoleAuthorizationsForLeaf(object leafId)
        {
            List<object> roles = new List<object>();

            DatabaseFactory.SetDatabaseProviderFactory(new DatabaseProviderFactory(), false);
            Database db = DatabaseFactory.CreateDatabase("SiteSqlServer");

            DbCommand cmd = new SqlCommand("select distinct du.roleid from dnn_userroles du inner join roleauthorizations ra on du.roleid = ra.roleid where du.projectid = @ProjectId");
            cmd.Parameters.Add(new SqlParameter("@ProjectId", leafId));

            using (IDataReader dr = db.ExecuteReader(cmd))
            {
                while (dr.Read())
                    roles.Add(dr.GetValue(0));
            }

            return roles.Cast<RoleAuthorization>().ToList();
        }


        #endregion


    }
}