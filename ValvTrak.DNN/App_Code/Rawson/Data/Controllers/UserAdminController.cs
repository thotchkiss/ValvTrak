using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using Rawson.App.Security;
using DotNetNuke.Entities.Users;
using DotNetNuke.Security.Roles;
using System.Web.Caching;

namespace Rawson.Data.Controllers
{
    /// <summary>
    /// Summary description for UserAdminController
    /// </summary>
    public class UserAdminController
    {
        /// <summary>
        /// Occurs when [state changed].
        /// </summary>
        public event EventHandler<UserAdminStateChangedArgs> StateChanged;

        /// <summary>
        /// Initializes a new instance of the <see cref="UserAdminController"/> class.
        /// </summary>
        public UserAdminController()
        {
            PortalId = 1;
        }

        /// <summary>
        /// Initializes a new instance of the <see cref="UserAdminController"/> class.
        /// </summary>
        /// <param name="portalId">The portal id.</param>
        public UserAdminController(int portalId)
        {
            PortalId = portalId;
        }

        /// <summary>
        /// Gets or sets the portal id.
        /// </summary>
        /// <value>The portal id.</value>
        public int PortalId { get; set; }

        /// <summary>
        /// Resets the state.
        /// </summary>
        public void ResetState()
        {
            StateChanged(this, new UserAdminStateChangedArgs
            {
                UpdateUserGrid = true,
                UpdateRoleGrid = true,
                UpdateAuthTree = true,
                State = new UserAdminState
                {
                    Users = new UserInfo[] { },
                    Roles = new RoleInfo[] { },
                    Authorizations = new TreeData[] { }
                }
            });
        }

        /// <summary>
        /// Changes the alpha user.
        /// </summary>
        /// <param name="letter">The letter.</param>
        public void ChangeAlphaUser(string letter)
        {
            StateChanged(this, new UserAdminStateChangedArgs
            {
                UpdateUserGrid = true,
                UpdateRoleGrid = true,
                UpdateAuthTree = true,
                State = new UserAdminState
                {
                    Users = UserController.GetUsers(PortalId, true).Cast<UserInfo>().Where(ui => letter == "All" ? ui.PortalID == PortalId : ui.Username.StartsWith(letter)).ToArray(),
                    Roles = new RoleInfo[] { },
                    Authorizations = new TreeData[] { }
                }
            });
        }

        public void ChangeUserName(string userName)
        {
            StateChanged(this, new UserAdminStateChangedArgs
            {
                UpdateUserGrid = true,
                UpdateRoleGrid = true,
                UpdateAuthTree = true,
                State = new UserAdminState
                {
                    Users = UserController.GetUsers(PortalId, true).Cast<UserInfo>().Where(ui => ui.Username.ToLower().StartsWith(userName.ToLower()) ).ToArray(),
                    Roles = new RoleInfo[] { },
                    Authorizations = new TreeData[] { }
                }
            });
        }

        /// <summary>
        /// Changes the user.
        /// </summary>
        /// <param name="userId">The user id.</param>
        public void ChangeUser(object userId)
        {
            StateChanged(this, new UserAdminStateChangedArgs
            {
                UpdateUserGrid = true,
                UpdateRoleGrid = true,
                UpdateAuthTree = true,
                State = new UserAdminState
                {
                    Users = new UserInfo[] { UserController.GetUserById(PortalId, Convert.ToInt32(userId)) },
                    Roles = ConvertRoleAuthorizationToRoleInfo(RoleAuthorization.GetRoleAuthorizationsForUser(userId)),
                    Authorizations = new TreeData[] { }
                }
            });
        }

        /// <summary>
        /// Changes the role.
        /// </summary>
        /// <param name="roleId">The role id.</param>
        public void ChangeRole(object roleName)
        {
            StateChanged(this, new UserAdminStateChangedArgs
            {
                UpdateUserGrid = true,
                UpdateRoleGrid = true,
                UpdateAuthTree = true,
                State = new UserAdminState
                {
                    Users = new RoleController().GetUserRolesByRoleName(PortalId, (string)roleName).Cast<UserRoleInfo>().Select(uri => UserController.GetUserById(PortalId, uri.UserID)).ToArray(),
                    Roles = new RoleInfo[] { new RoleController().GetRoleByName(PortalId, (string)roleName) },
                    Authorizations = new TreeData[] { }
                }
            });
        }

        /// <summary>
        /// Changes the branch filter.
        /// </summary>
        /// <param name="filterId">The filter id.</param>
        public void ChangeBranchFilter(object branchId)
        {
            StateChanged(this, new UserAdminStateChangedArgs
            {
                UpdateUserGrid = true,
                UpdateRoleGrid = true,
                UpdateAuthTree = true,
                State = new UserAdminState
                {
                    Users = new object[] { },
                    Roles = ConvertRoleAuthorizationToRoleInfo(RoleAuthorization.GetRoleAuthorizationsForBranch(branchId)),
                    Authorizations = new TreeData[] { }
                }
            });
        }

        /// <summary>
        /// Changes the leaf filter.
        /// </summary>
        /// <param name="filterId">The filter id.</param>
        public void ChangeLeafFilter(object leafId)
        {
            StateChanged(this, new UserAdminStateChangedArgs
            {
                UpdateUserGrid = true,
                UpdateRoleGrid = true,
                UpdateAuthTree = true,
                State = new UserAdminState
                {
                    Users = new UserInfo[] { },
                    Roles = ConvertRoleAuthorizationToRoleInfo(RoleAuthorization.GetRoleAuthorizationsForLeaf(leafId)),
                    Authorizations = new TreeData[] { }
                }
            });
        }

        /// <summary>
        /// Converts the <see cref="Rawson.Data.RoleAuthorization"/> to <see cref="Dotnetnuke.Security.Roles.RoleInfo"/>.
        /// </summary>
        /// <param name="roles">The roles.</param>
        /// <returns></returns>
        private RoleInfo[] ConvertRoleAuthorizationToRoleInfo(IEnumerable<RoleAuthorization> roles)
        {
            RoleController rc = new RoleController();
            RoleInfo[] ris = rc.GetRolesByGroup(PortalId, RoleController.GetRoleGroupByName(PortalId, "Data Access Restrictions").RoleGroupID)
                    .Cast<RoleInfo>().Where(ri => roles.Any(ra => ra.RoleID.Equals(ri.RoleID))).Distinct().ToArray();

            return ris;
        }


        /// <summary>
        /// Converts the <see cref="Rawson.Data.RoleAuthorization"/> to <see cref="Rawson.Data.TreeData"/>.
        /// </summary>
        /// <param name="roles">The roles.</param>
        /// <returns></returns>
        private TreeData[] ConvertRoleAuthorizationToTreeData(RoleAuthorization role)
        {
            using (ValvTrakDBDataContext context = new ValvTrakDBDataContext())
            {
                List<TreeData> nodes = new List<TreeData>();

                if (role.RootAuthorizations.Count > 0)
                {
                    List<TreeData> rootNodes = context.Clients.Where(c => c.Active == true && role.RootAuthorizations.Contains(c.ClientID))
                        .Select(c => new TreeData { ID = Guid.NewGuid(), ParentID = Guid.Empty, Label = c.Name, DataID = c.ClientID, IsLeaf = false }).ToList();

                    RecurseBranches(context, rootNodes);
                    AddTreeLeaves(context, rootNodes);

                    nodes.AddRange(rootNodes);
                }

                if (role.LeafAuthorizations.Count > 0)
                {
                    List<TreeData> branches = context.ClientLocations.Where(cl => cl.Active == true && role.LeafAuthorizations.Contains(cl.ClientLocationID)).ToList()
                        .Select(cl => new TreeData { ID = Guid.NewGuid(), ParentID = (nodes.Exists(td => td.DataID == cl.Client.ParentID) ? nodes.First(td => td.DataID == cl.Client.ParentID).ID : Guid.Empty), DataID = cl.ClientID.Value, IsLeaf = false, Label = cl.Client.Name }).ToList();

                    List<TreeData> leaves = context.ClientLocations.Where(cl => cl.Active == true && role.LeafAuthorizations.Contains(cl.ClientLocationID)).ToList()
                        .Select(cl => new TreeData { ID = Guid.NewGuid(), ParentID = branches.First(td => td.DataID == cl.ClientID).ID, DataID = cl.ClientLocationID, IsLeaf = true, Label = cl.Name }).ToList();

                    branches.AddRange(leaves);
                    nodes.AddRange(branches);
                }

                return nodes.ToArray();
            }
        }

        private void RecurseBranches(ValvTrakDBDataContext context, List<TreeData> root)
        {
            int[] rootIds = root.Select(td => td.DataID).ToArray();
            List<TreeData> branches = context.Clients.Where(c => rootIds.Contains(c.ParentID)).ToList()
                .Select(c => new TreeData { ID = Guid.NewGuid(), ParentID = root.First(td => td.DataID == c.ParentID).ID, DataID = c.ClientID, IsLeaf = false, Label = c.Name }).ToList();

            if (branches.Count > 0)
            {
                RecurseBranches(context, branches);
                root.AddRange(branches);
            }
        }

        private void AddTreeLeaves(ValvTrakDBDataContext context, List<TreeData> branches)
        {
            int[] branchIds = branches.Select(td => td.DataID).ToArray();
            List<TreeData> leaves = context.ClientLocations.Where(c => branchIds.Contains(c.ClientID.Value)).ToList()
                .Select(c => new TreeData { ID = Guid.NewGuid(), ParentID = branches.First(td => td.DataID == c.ClientID).ID, DataID = c.ClientLocationID, IsLeaf = true, Label = c.Name }).ToList();

            if (leaves.Count > 0)
                branches.AddRange(leaves);
        }

        public void CacheState(string key, UserAdminState state)
        {
            DotNetNuke.Services.Cache.CachingProvider.Instance().Insert(key, state);
        }

        public void PurgeState(string key)
        {
            DotNetNuke.Services.Cache.CachingProvider.Instance().Remove(key);
        }

        public void LoadState(string key)
        {
            UserAdminState state = DotNetNuke.Services.Cache.CachingProvider.Instance().GetItem(key) as UserAdminState;

            if (state != null)
            {
                StateChanged(this, new UserAdminStateChangedArgs
                {
                    UpdateUserGrid = true,
                    UpdateRoleGrid = true,
                    UpdateAuthTree = true,
                    State = state
                });
            }
            else
            {
                StateChanged(this, new UserAdminStateChangedArgs
                {
                    UpdateUserGrid = true,
                    UpdateRoleGrid = true,
                    UpdateAuthTree = true,
                    State = new UserAdminState
                    {
                        Users = new UserInfo[] { },
                        Roles = new RoleInfo[] { },
                        Authorizations = new TreeData[] { }
                    }
                });
            }
        }
    }

    [Serializable]
    public class UserAdminStateChangedArgs : EventArgs
    {
        public bool UpdateUserGrid { get; set; }
        public bool UpdateRoleGrid { get; set; }
        public bool UpdateAuthTree { get; set; }

        public UserAdminState State { get; set; }
    }

    [Serializable]
    public class UserAdminState
    {
        public object[] Users { get; set; }
        public object[] Roles { get; set; }
        public object[] Authorizations { get; set; }
    }
}