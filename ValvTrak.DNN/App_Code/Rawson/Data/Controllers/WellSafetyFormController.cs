using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Rawson.Data.Model;
using Microsoft.Practices.EnterpriseLibrary.Validation;

namespace Rawson.Data.Controllers
{
    /// <summary>
    /// Summary description for WellSafetyFormController
    /// </summary>
    public class WellSafetyFormController : BaseController<WellSafetyTest>
    {
        public WellSafetyFormController()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        public Job LoadJob(int jobId)
        {
            Entity.Job = Context.Jobs.SingleOrDefault(j => j.JobID == jobId);
            return Entity.Job;
        }

        public override bool Validate()
        {
            Validator<WellSafetyTest> validator = ValidationFactory.CreateValidator<WellSafetyTest>("Default");
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

        public override bool Save()
        {
            if (AutoValidate && !Validate())
                return false;

            var orig = Context.WellSafetyTests.GetOriginalEntityState(Entity);

            if (orig == null)
                Context.WellSafetyTests.Attach(Entity);

            return SubmitChanges();
        }

        public override void Detach()
        {
            WellSafetyTest wt = Activator.CreateInstance<WellSafetyTest>();

            wt.ActuatorModel = Entity.ActuatorModel;
            wt.ActuatorSerialNum = Entity.ActuatorSerialNum;
            wt.ActuatorType = Entity.ActuatorType;
            wt.AirSupplyMedium = Entity.AirSupplyMedium;
            wt.BodyMaterial = Entity.BodyMaterial;
            wt.Condition = Entity.Condition;
            wt.ControllerType = Entity.ControllerType;
            wt.CustomerWitness = Entity.CustomerWitness;
            wt.DateManufactured = Entity.DateManufactured;
            wt.FormDate = Entity.FormDate;
            wt.FSR_Num = Entity.FSR_Num;
            wt.GateMaterial = Entity.GateMaterial;
            wt.HI = Entity.HI;
            wt.JobID = Entity.JobID;
            wt.LO = Entity.LO;
            wt.ManualOverride = Entity.ManualOverride;
            wt.Notes = Entity.Notes;
            wt.PlugMaterial = Entity.PlugMaterial;
            wt.PortSize = Entity.PortSize;
            wt.PressClass = Entity.PressClass;
            wt.ServiceItemID = Entity.ServiceItemID;
            wt.SSV_SAP_Num = Entity.SSV_SAP_Num;
            wt.SteamMaterial = Entity.SteamMaterial;
            wt.SystemLocation = Entity.SystemLocation;
            wt.TestResultID = Entity.TestResultID;

            Entity = wt;


        }
    }
}