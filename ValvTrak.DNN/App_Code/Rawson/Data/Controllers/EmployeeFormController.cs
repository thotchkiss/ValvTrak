using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Rawson.Data.Model;
using System.Collections;

using DotNetNuke.Entities.Users;
using DotNetNuke.Entities.Portals;
using Rawson.App;

namespace Rawson.Data.Controllers
{
    /// <summary>
    /// Summary description for EmployeeFormController
    /// </summary>
    public class EmployeeFormController : BaseController<Employee>
    {
        public EmployeeFormController()
        {
        }

        public override Employee Load(object pk)
        {
            if (Convert.ToInt32(pk) == -1)
                return NewEntity();
            else
                return base.Load(pk);
        }

        public IList GetAllEmployees()
        {
            return Context.Employees.OrderBy(e => e.FirstName + " " + e.LastName).ToList();
        }

        public IList GetUsers(int portalID)
        {
            UserController uc = new UserController();
            ArrayList ac = uc.GetUsers(portalID, true, false);
            
            List<ComboBoxValue<int>> users = new  List<ComboBoxValue<int>>();
            foreach (UserInfo ui in ac)
            {
                users.Add(new ComboBoxValue<int> { DisplayMember = ui.DisplayName, ValueMember = ui.UserID });
            }

            users.Sort((x, y) => x.DisplayMember.CompareTo(y.DisplayMember));

            return users;
        }

        public IList GetEmployeeLocations()
        {
            List<ComboBoxValue<int>> list = new List<ComboBoxValue<int>>();

            list.Add( new ComboBoxValue<int>{ DisplayMember = "Kilgore", ValueMember = 1});
            list.Add( new ComboBoxValue<int>{ DisplayMember = "Longview", ValueMember = 2});
            list.Add( new ComboBoxValue<int>{ DisplayMember = "Bridgeport", ValueMember = 3});
            list.Add( new ComboBoxValue<int>{ DisplayMember = "Cleburne", ValueMember = 4});
            list.Add( new ComboBoxValue<int>{ DisplayMember = "Teague", ValueMember = 5});
            list.Add( new ComboBoxValue<int>{ DisplayMember = "Minden", ValueMember = 6});
            list.Add( new ComboBoxValue<int>{ DisplayMember = "Canadian", ValueMember = 7});

            list.Add( new ComboBoxValue<int>{ DisplayMember = "Corpus Christi", ValueMember = 8});
            list.Add( new ComboBoxValue<int>{ DisplayMember = "Green Briar", ValueMember = 9});
            list.Add( new ComboBoxValue<int>{ DisplayMember = "Mansfield", ValueMember = 10});
            list.Add( new ComboBoxValue<int>{ DisplayMember = "Odessa", ValueMember = 11});
            list.Add(new ComboBoxValue<int> { DisplayMember = "Richmond", ValueMember = 12 });

            return list;
        }


    }
}