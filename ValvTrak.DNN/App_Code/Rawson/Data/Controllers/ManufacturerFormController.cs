using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Web;
using Rawson.Data.Model;
using System.Collections;
using Microsoft.Practices.EnterpriseLibrary.Validation;

namespace Rawson.Data.Controllers
{
    /// <summary>
    /// Summary description for ManufacturerFormController
    /// </summary>
    public class ManufacturerFormController : BaseController<Manufacturer>
    {
        public override Manufacturer Load(object pk)
        {
            int key = Convert.ToInt32(pk);

            if ( key == -1)
                return NewEntity();
            else
                return base.Load(key);
        }

        public IList GetManufacturers()
        {
            return Context.Manufacturers.OrderBy(m => m.Name).ToList();
        }

        public IList GetCurrentModels()
        {
            return Entity == null ? new List<ManufacturerModel>() : Entity.ManufacturerModels.OrderBy(m => m.Model).ToList();
        }

        public ManufacturerModel GetModel(int manufacturerModelID)
        {
            if (manufacturerModelID == -1)
            {
                ManufacturerModel model = Activator.CreateInstance<ManufacturerModel>();

                model.ManufacturerID = Entity.ManufacturerID;
                model.Model = "New Model";

                if (Options.TrackingMode == TrackingModes.Connected)
                {
                    Table<ManufacturerModel> table = Context.GetTable <ManufacturerModel>();
                    table.InsertOnSubmit(model);
                }

                return model;
            }
            else
                return Entity.ManufacturerModels.First(mm => mm.ManufacturerModelID == manufacturerModelID);
        }

        public override bool Validate()
        {
            Validator<Manufacturer> validator = ValidationFactory.CreateValidator<Manufacturer>("Default");
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