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
	public RateValveFormController()
	{
		//
		// TODO: Add constructor logic here
		//
	}

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
        return Context.RateValveParts.Select(rvp => new RateValveTestPart { RateValvePartID = rvp.RateValvePartID, RateValveTestID = Entity.RateValveTestID, Quantity = 0 }).ToList();
    }

    public List<RateValveTestPart> SetPartsList(int rateValveTestId)
    {
        List<RateValveTestPart> parts = Context.RateValveTestParts.Where(rvtpu => rvtpu.RateValveTestID == rateValveTestId).ToList();
        Entity.RateValveTestParts.AddRange(parts);

        return parts;
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