using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Rawson.Data.Model;
using Microsoft.Practices.EnterpriseLibrary.Validation;
using Rawson.App;
using Rawson.Data.Specifications;

namespace Rawson.Data.Controllers
{
    /// <summary>
    /// Summary description for ServiceItemWrapper
    /// </summary>
    public class ServiceItemFormController : boController<ServiceItem, ValvTrakDBDataContext>
    {
        public ServiceItemFormController ()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        public override ServiceItem NewEntity()
        {
            ServiceItem sv = base.NewEntity();

            sv.InletFlangeRating = 0;
            sv.OutletFlangeRating = 0;
            sv.InletSize = 0;
            sv.OutletSize = 0;
            sv.Active = true;

            return sv;
        }

        public ClientLocation SetClientLocation ( int cId )
        {
            Entity.ClientLocation = Context.ClientLocations.First ( cl => cl.ClientLocationID == cId );
            return Entity.ClientLocation;
        }

        public ClientLocation GetClientLocation(int cId)
        {
            return Context.ClientLocations.First(cl => cl.ClientLocationID == cId);
        }

        public List<ComboBoxValue<int>> GetServiceItems(int clientLocationID)
        {
            List<ComboBoxValue<int>> list = Fetch(ServiceItemSpecifications.ForClientLocation(clientLocationID)).OrderBy(s => s.SerialNum).Select(s => new ComboBoxValue<int> { DisplayMember = s.SerialNum, ValueMember = s.ServiceItemID }).ToList();
            list.Insert(0, new ComboBoxValue<int> { DisplayMember = "-- Select Valve --", ValueMember = -1 });

            return list;
        }

        public List<ComboBoxValue<int>> GetServiceItemTypes (int serviceItemCategoryID)
        {
            List<ComboBoxValue<int>> list = Context.ServiceItemTypes.Where(st => st.ServiceItemCategoryID == serviceItemCategoryID).OrderBy(st => st.Type).Select(st => new ComboBoxValue<int> { DisplayMember = st.Type, ValueMember = st.ServiceItemTypeID }).ToList();
            list.Insert(0, new ComboBoxValue<int> { DisplayMember = "-- Select Type --", ValueMember = -1 });

            return list;
        }

        public List<ComboBoxValue<int>> GetManufacturers()
        {
            List<ComboBoxValue<int>> list = Context.Manufacturers.OrderBy(m => m.Name).Select(m => new ComboBoxValue<int> { DisplayMember = m.Name, ValueMember = m.ManufacturerID }).ToList();
            list.Insert(0, new ComboBoxValue<int> { DisplayMember = "-- Select Manufacturer --", ValueMember = -1 });

            return list;
        }

        public List<ComboBoxValue<int>> GetManufacturerModels(int manufacturerID)
        {
            List<ComboBoxValue<int>> list = Context.ManufacturerModels.Where(mm => mm.ManufacturerID == manufacturerID).OrderBy(m => m.Model).Select(m => new ComboBoxValue<int> { DisplayMember = m.Model, ValueMember = m.ManufacturerModelID }).ToList();
            list.Insert(0, new ComboBoxValue<int> { DisplayMember = "-- Select Model --", ValueMember = -1 });

            return list;
        }

        public int CreateManufacturer(string name)
        {
            Manufacturer manufacturer = Activator.CreateInstance<Manufacturer>();
            manufacturer.Name = name;
            manufacturer.Active = true;

            if (Context.GetTable<Manufacturer>().Count(m => m.Name.ToUpper() == name.ToUpper()) > 0)
                throw new ApplicationException("Name already exisits.");

            Context.GetTable<Manufacturer>().InsertOnSubmit(manufacturer);
            Context.SubmitChanges();

            return Context.GetTable<Manufacturer>().Single(m => m.Name == name).ManufacturerID;
        }

        public int CreateModel(int manufacturerID, string name)
        {
            ManufacturerModel model = Activator.CreateInstance<ManufacturerModel>();
            model.Model = name;
            model.ManufacturerID = manufacturerID;
            model.Active = true;

            Context.GetTable<ManufacturerModel>().InsertOnSubmit(model);
            Context.SubmitChanges();

            return Context.GetTable<ManufacturerModel>().Single(m => m.Model == name).ManufacturerModelID;
        }

        public override bool Validate()
        {
            Validator<ServiceItem> validator = ValidationFactory.CreateValidator<ServiceItem>("Default");
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

        public override void Detach()
        {
            ServiceItem si = Activator.CreateInstance<ServiceItem>();

            si.Active = Entity.Active;
            si.ClientLocationID = Entity.ClientLocationID;
            si.Description = Entity.Description;
            si.Flanged = Entity.Flanged;
            si.InletFlangeRating = Entity.InletFlangeRating;
            si.InletSize = Entity.InletSize;
            si.ManufacturerID = Entity.ManufacturerID;
            si.ManufacturerModelID = Entity.ManufacturerModelID;
            si.OutletFlangeRating = Entity.OutletFlangeRating;
            si.OutletSize = Entity.OutletSize;
            si.SapEquipNum = Entity.SapEquipNum;
            si.SerialNum = Entity.SerialNum;
            si.ServiceItemTypeID = Entity.ServiceItemTypeID;
            si.Threaded = Entity.Threaded;

            Entity = si;
        }
    }
}
