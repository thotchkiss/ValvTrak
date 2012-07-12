using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DotNetNuke.Entities.Users;
using DotNetNuke.Entities.Portals;
using Rawson.Data.Model;
using Microsoft.Practices.EnterpriseLibrary.Validation;

namespace Rawson.Data.Controllers
{
    /// <summary>
    /// Summary description for GreasingRecordFormController
    /// </summary>
    public class GreasingRecordFormController : BaseController<GreasingRecord>
    {
        public GreasingRecordFormController()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        public Job SetJob(int jobId)
        {
            Entity.Job = Context.GetTable<Job>().FirstOrDefault(j => j.JobID == jobId);
            return Entity.Job;
        }

        public List<GreasingRecordItem> GetCurrentGreasingRecordItems()
        {
            return Entity.GreasingRecordItems.ToList();
        }

        public string GetYesNoDisplay(object yesno)
        {
            return Convert.ToInt32(yesno) == 0 ? "N/A" : Convert.ToInt32(yesno) == 1 ? "Yes" : "No";
        }

        public string GetLubeTypeDisplay(object listValue)
        {
            int val = Convert.ToInt32(listValue);

            string retVal = "";

            List lubeType = Context.Lists.Where(li => li.ListKey == "LubeType" && li.ListValue == val).SingleOrDefault();
            if (lubeType != null)
                retVal = lubeType.Display1;

            return retVal;
        }

        public override bool Validate()
        {
            Validator<GreasingRecord> validator = ValidationFactory.CreateValidator<GreasingRecord>("Default");
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

            var orig = Context.GreasingRecords.GetOriginalEntityState(Entity);

            if (orig == null)
                Context.GreasingRecords.Attach(Entity);

            return SubmitChanges();
        }

        public override void Detach()
        {
            GreasingRecord gr = Activator.CreateInstance<GreasingRecord>();

            gr.ClientFieldOffice = Entity.ClientFieldOffice;
            gr.Field = Entity.Field;
            gr.FSRNum = Entity.FSRNum;
            gr.JobID = Entity.JobID;
            gr.PipelineSegment = Entity.PipelineSegment;
            gr.SapPSV = Entity.SapPSV;

            Entity = gr;
        }

        public override bool Delete(object Pk)
        {
            GreasingRecordItem gi = Context.GreasingRecordItems.FirstOrDefault(g => g.GreasingRecordItemID == Convert.ToInt32(Pk));
            if (gi != null)
            {
                Context.GreasingRecordItems.DeleteOnSubmit(gi);
                Context.SubmitChanges();

                return true;
            }

            return false;
        }

    }
}