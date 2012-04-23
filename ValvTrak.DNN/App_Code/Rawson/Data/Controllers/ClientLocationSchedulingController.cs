using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Rawson.Data.Controllers;
using Rawson.Data.Model;
using Rawson.App;

/// <summary>
/// Summary description for ClientLocationSchedulingController
/// </summary>
public class ClientLocationSchedulingController : BaseController<ClientLocationServiceSchedule>
{
	public ClientLocationSchedulingController()
	{
		
	}

	public override ClientLocationServiceSchedule Load(object pk)
	{
		if (Convert.ToInt32(pk) == -1)
			return NewEntity();
		else
			return base.Load(pk);
	}

	public override List<ComboBoxValue<int>> GetJobTypesList()
	{
		List<ComboBoxValue<int>> list = base.GetJobTypesList();
		list.Insert(0, new ComboBoxValue<int> { DisplayMember = "-- Select Job Type --", ValueMember = -1 });

		return list;
	}

	public override List<ComboBoxValue<int>> GetServiceIntervalsList()
	{
		List<ComboBoxValue<int>> list = base.GetServiceIntervalsList();
		list.Insert(0, new ComboBoxValue<int> { DisplayMember = "-- Select Interval --", ValueMember = -1 });

		return list;
	}

    public ClientLocation GetClientLocation(int clientLocationId)
    {
        return Context.ClientLocations.First(cl => cl.ClientLocationID == clientLocationId);
    }

	public List<ClientLocationServiceSchedule> GetLocationSchedulesForLocation(int clientLocationId)
	{
		return Context.ClientLocationServiceSchedules.Where(sched => sched.ClientLocationId == clientLocationId).ToList();
	}

	public ClientLocationServiceSchedule GetLocationServiceScheduleForJobType(int clientLocationId, int jobTypeId)
	{
        return Context.ClientLocationServiceSchedules.FirstOrDefault(sched => sched.ClientLocationId == clientLocationId && sched.JobTypeId == jobTypeId);
	}

}