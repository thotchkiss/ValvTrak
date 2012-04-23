using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Rawson.App;
using Rawson.App.Security;
using Rawson.Data.Model;
using Microsoft.Practices.EnterpriseLibrary.Validation;
using System.Collections.Specialized;

namespace Rawson.Data.Controllers
{
    /// <summary>
    /// Summary description for BaseController
    /// </summary>
    public abstract class BaseController<TEntity> : boController<TEntity, ValvTrakDBDataContext> where TEntity : class, new()
    {
        public BaseController() : base()
        {
        }

        public virtual List<ComboBoxValue<int>> GetAuthorizedClients(int userId)
        {
            if (HttpContext.Current.Session["AuthorizedClientsList"] == null)
                RefreshAuthorizedClientsList();

            List<ComboBoxValue<int>> list = HttpContext.Current.Session["AuthorizedClientsList"] as List<ComboBoxValue<int>>;
            return list;
        }

        public virtual void RefreshAuthorizedClientsList()
        {
            UserAuthorization auth = HttpContext.Current.Session["UserAuthorization"] as UserAuthorization;
            IEnumerable<Client> clients;

            if (auth.IsDataAdmin)
                clients = Context.Clients.Where(c => c.Active == true);
            else
            {
                var cauth = auth.DataGroups.ToList();
                cauth.AddRange(auth.DataSinglesGroups);

                var iauth = cauth.Cast<int>();

                clients = Context.Clients.Where(c => iauth.Contains(c.ClientID) && c.Active == true);
            }

            var clientsList = clients.Select(c => new ComboBoxValue<int> { DisplayMember = c.Name, ValueMember = c.ClientID }).OrderBy(cv => cv.DisplayMember).ToList();

            HttpContext.Current.Session["AuthorizedClientsList"] = clientsList;
        }

        public virtual List<ComboBoxValue<int>> GetAuthorizedLocations(int userId, int clientId)
        {
            UserAuthorization auth = HttpContext.Current.Session["UserAuthorization"] as UserAuthorization;
            IEnumerable<ClientLocation> locations;

            if (auth.IsDataAdmin)
                locations = Context.ClientLocations.Where(l => l.Client.ClientID == clientId && l.Active == true);
            else
            {
                var jauth = auth.GetDataSinglesForGroup(clientId).Select(sz => Convert.ToInt32(sz)).ToList();
                locations = Context.ClientLocations.Where(l => jauth.Contains(l.ClientLocationID) && l.Active == true);
            }

            var list = locations.Select(l => new ComboBoxValue<int> { DisplayMember = l.Name, ValueMember = l.ClientLocationID }).OrderBy(cv => cv.DisplayMember).ToList();
            
            return list;
        }

        public virtual List<ComboBoxValue<int>> GetEmployeesList()
        {
            return Context.Employees.Select(e => new ComboBoxValue<int> { DisplayMember = e.FirstName + " " + e.LastName, ValueMember = e.EmployeeID })
                .OrderBy(c => c.DisplayMember).ToList();
        }

        public virtual string GetEmployeeName(int id)
        {
            Employee emp = Context.Employees.FirstOrDefault(e => e.EmployeeID == id);

            if (emp == null)
                return "UnKnown";
            else
                return emp.FirstName + " " + emp.LastName;
        }

        public virtual int ResolveEmployeeID(int id)
        {
            Employee emp = Context.Employees.FirstOrDefault(e => e.UserID == id);

            if (emp == null)
                return -1;
            else
                return emp.EmployeeID;
        }

        public virtual List<ComboBoxValue<int>> GetJobTypesList()
        {
            return Context.JobTypes.Where(jt => jt.Enabled == true).Select(jt => new ComboBoxValue<int> { DisplayMember = jt.Type, ValueMember = jt.JobTypeID }).OrderBy(cb => cb.DisplayMember).ToList();
        }

        public virtual List<ComboBoxValue<int>> GetJobStatuses()
        {
            return Context.JobStatus.Select(js => new ComboBoxValue<int> { DisplayMember = js.Status, ValueMember = js.JobStatusID }).OrderBy(cb => cb.DisplayMember).ToList();
        }

        public virtual List<ComboBoxValue<int>> GetServiceIntervalsList()
        {
            return Context.ServiceIntervals.Select(si => new ComboBoxValue<int> { DisplayMember = si.Name, ValueMember = si.ServiceIntervalId }).OrderBy(cb => cb.DisplayMember).ToList();
        }

        public virtual Dictionary<string, string> GetStates()
        {
            Dictionary<string, string> states = new Dictionary<string, string>();

            states.Add("ALASKA","AK");
            states.Add("ALABAMA","AL");
            states.Add("ARKANSAS","AR");
            states.Add("ARIZONA ","AZ");
            states.Add("CALIFORNIA ","CA");
            states.Add("COLORADO ","CO");
            states.Add("CONNECTICUT","CT");
            states.Add("DISTRICT OF COLUMBIA","DC");
            states.Add("DELAWARE","DE");
            states.Add("FLORIDA","FL");
            states.Add("GEORGIA","GA");
            states.Add("HAWAII","HI");
            states.Add("IOWA","IA");
            states.Add("IDAHO","ID");
            states.Add("ILLINOIS","IL");
            states.Add("INDIANA","IN");
            states.Add("KANSAS","KS");
            states.Add("KENTUCKY","KY");
            states.Add("LOUISIANA","LA");
            states.Add("MASSACHUSETTS","MA");
            states.Add("MARYLAND","MD");
            states.Add("MAINE","ME");
            states.Add("MICHIGAN","MI");
            states.Add("MINNESOTA","MN");
            states.Add("MISSOURI","MO");
            states.Add("MISSISSIPPI","MS");
            states.Add("MONTANA","MT");
            states.Add("NORTH CAROLINA","NC");
            states.Add("NORTH DAKOTA","ND");
            states.Add("NEBRASKA","NE");
            states.Add("NEW HAMPSHIRE","NH");
            states.Add("NEW JERSEY","NJ");
            states.Add("NEW MEXICO","NM");
            states.Add("NEVADA","NV");
            states.Add("NEW YORK","NY");
            states.Add("OHIO","OH");
            states.Add("OKLAHOMA","OK");
            states.Add("OREGON","OR");
            states.Add("PENNSYLVANIA","PA");
            states.Add("RHODE ISLAND","RI");
            states.Add("SOUTH CAROLINA","SC");
            states.Add("SOUTH DAKOTA","SD");
            states.Add("TENNESSEE","TN");
            states.Add("TEXAS","TX");
            states.Add("UTAH","UT");
            states.Add("VIRGINIA ","VA");
            states.Add("VERMONT","VT");
            states.Add("WASHINGTON","WA");
            states.Add("WISCONSIN","WI");
            states.Add("WEST VIRGINIA","WV");
            states.Add("WYOMING","WY");

            return states;
        }

        public override bool Validate()
        {
            Validator<TEntity> validator = ValidationFactory.CreateValidator<TEntity>("Default");
            ValidationResults vr = validator.Validate(Entity);

            if (!vr.IsValid)
            {
                foreach (ValidationResult r in vr)
                {
                    ValidationErrors.Add(r.Message);
                }
            }

            return vr.IsValid;
        } 
    }
}