using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Rawson.Data.Controllers;
using Rawson.Data.Model;
using Rawson.App.Security;

/// <summary>
/// Summary description for RateValveFormController
/// </summary>
public class RateValveFormController : BaseController<RateValveTest>
{
    public bool CanEdit(int userId)
    {
        UserAuthorization ua = new UserAuthorization(userId);
        return ua.IsDataAdmin;
    }

    public Job SetJob(int jobID)
    {
        Entity.Job = Context.Jobs.Where(j => j.JobID == jobID).First();
        return Entity.Job;
    }

    public ServiceItem SetServiceItem(int serviceItemID)
    {
        Entity.ServiceItem = Context.ServiceItems.FirstOrDefault(si => si.ServiceItemID == serviceItemID);
        return Entity.ServiceItem;
    }

    public List<RateValveTestPart> CreatePartsList()
    {
        var parts = Context.RateValveParts.ToList();
        List<RateValveTestPart> testParts = new List<RateValveTestPart>();

        parts.ForEach((rvp) => 
            {
                var rvtp = Activator.CreateInstance<RateValveTestPart>();

                rvtp.RateValvePart = rvp;
                rvp.RateValveTestParts.Add(rvtp);

                rvtp.RateValveTest = Entity;
                Entity.RateValveTestParts.Add(rvtp);

                testParts.Add(rvtp);
            });

        return testParts;
    }

    public override bool Save()
    {
        if (AutoValidate && !Validate())
            return false;

        var orig = Context.RateValveTests.GetOriginalEntityState(Entity);

        if (orig == null)
            Context.RateValveTests.Attach(Entity);

        return SubmitChanges();
    }

    public override void Detach()
    {
        RateValveTest rvt = Activator.CreateInstance<RateValveTest>();

        rvt.ConditionOfDisc = Entity.ConditionOfDisc;
        rvt.ConditionOfWearSleeve = Entity.ConditionOfWearSleeve;
        rvt.DateTested = Entity.DateTested;
        rvt.ExternalCondition = Entity.ExternalCondition;
        rvt.FSRNum = Entity.FSRNum;
        rvt.JobID = Entity.JobID;
        rvt.PercentDiscWear = Entity.PercentDiscWear;
        rvt.ServiceItemID = Entity.ServiceItemID;
        rvt.TechID = Entity.TechID;

        Entity = rvt;
    }
}