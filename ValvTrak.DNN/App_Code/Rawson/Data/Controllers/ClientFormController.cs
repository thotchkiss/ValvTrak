using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Collections;
using Rawson.Data.Model;
using Microsoft.Practices.EnterpriseLibrary.Validation;
using Rawson.App;
using System.Collections.Specialized;

namespace Rawson.Data.Controllers
{
    /// <summary>
    /// Summary description for ClientFormController
    /// </summary>
    public class ClientFormController : BaseController<Client>
    {
        public ClientFormController()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        public override Client Load(object pk)
        {
            if (Convert.ToInt32(pk) == -1)
                return NewEntity();
            else
                return base.Load(pk);
        }

        public IList GetParentClientList()
        {
            return Context.Clients.OrderBy(c => c.Name).Select(c => new { Display = c.Name, ID = c.ClientID }).ToList();
        }

        public IList GetClients()
        {
            return Context.Clients.OrderBy(c => c.Name).ToList();
        }

        public IList GetCurrentLocations()
        {
            return Entity == null ? new List<ClientLocation>() : Entity.ClientLocations.OrderBy(l => l.Name).ToList();
        }

        public ClientLocation GetLocation(int clientLocationID)
        {
            if (clientLocationID == -1)
            {
                ClientLocation entity = Activator.CreateInstance<ClientLocation>();
                Entity.ClientLocations.Add(entity);

                return entity;
            }
            else
                return Entity.ClientLocations.First(cl => cl.ClientLocationID == clientLocationID);
        }

        public List<ComboBoxValue<string>> GetStatesList()
        {
            Dictionary<string, string> stc = GetStates();
            List<ComboBoxValue<string>> states = new List<ComboBoxValue<string>>();

            foreach (KeyValuePair<string, string> kv in stc)
                states.Add(new ComboBoxValue<string> { DisplayMember = kv.Value, ValueMember = kv.Value });

            states.Sort((x, y) => x.DisplayMember.CompareTo(y.DisplayMember));

            return states;
        }

        public override bool Validate()
        {
            Validator<Client> validator = ValidationFactory.CreateValidator<Client>("Default");
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