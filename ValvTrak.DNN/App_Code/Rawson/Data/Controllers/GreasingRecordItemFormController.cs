using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Rawson.App;
using Rawson.Data.Model;
using Microsoft.Practices.EnterpriseLibrary.Validation;

namespace Rawson.Data.Controllers
{
    /// <summary>
    /// Summary description for GreasingRecordItemFormController
    /// </summary>
    public class GreasingRecordItemFormController : BaseController<GreasingRecordItem>
    {
        public GreasingRecordItemFormController()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        public void LoadGreasingRecord( int grId )
        {
            Entity.GreasingRecord = Context.GreasingRecords.SingleOrDefault(gr => gr.GreasingRecordID == grId); 
        }

        public List<ComboBoxValue<string>> GetLubeTypes()
        {
            return Context.Lists.Where(li => li.ListKey == "LubeType").Select(li => new ComboBoxValue<string> { DisplayMember = li.Display1, ValueMember = li.ListValue.ToString() }).ToList();
        }

        public override bool Validate()
        {
            Validator<GreasingRecordItem> validator = ValidationFactory.CreateValidator<GreasingRecordItem>("Default");
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
            GreasingRecordItem gri = Activator.CreateInstance<GreasingRecordItem>();

            gri.ActuatorInspected = Entity.ActuatorInspected;
            gri.ActuatorLubed = Entity.ActuatorLubed;
            gri.AmountInjected = Entity.AmountInjected;
            gri.EaseOfOperation = Entity.EaseOfOperation;
            gri.FlangeOrScrew = Entity.FlangeOrScrew;
            gri.GreasingRecordID = Entity.GreasingRecordID;
            gri.Leaking = Entity.Leaking;
            gri.LubeTypeID = Entity.LubeTypeID;
            gri.Notes = Entity.Notes;
            gri.PercentCycled = Entity.PercentCycled;
            gri.SeatsChecked = Entity.SeatsChecked;
            gri.SeatsLubed = Entity.SeatsLubed;
            gri.ServiceItemID = Entity.ServiceItemID;
            gri.ValveLocation = Entity.ValveLocation;
            gri.ValveSecured = Entity.ValveSecured;

            Entity = gri;
        }
    }
}