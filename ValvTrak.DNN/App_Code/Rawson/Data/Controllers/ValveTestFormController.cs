using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Linq.Expressions;
using DotNetNuke.Entities.Modules;
using DotNetNuke.Entities.Tabs;
using Rawson.App;
using DotNetNuke.Entities.Users;
using Rawson.Data.Model;
using Microsoft.Practices.EnterpriseLibrary.Validation;
using DotNetNuke.Common.Utilities;
using Rawson.App.Security;

namespace Rawson.Data.Controllers
{
    /// <summary>
    /// Summary description for boValveTest
    /// </summary>
    public class ValveTestFormController : BaseController<ValveTest>
    {
        public ValveTestFormController ()
        {

        }

        public bool CanEdit(int userId)
        {
            UserAuthorization ua = new UserAuthorization(userId);
            return ua.IsDataAdmin;
        }

        public Job SetJob(int jobID)
        {
            Entity.Job = Context.Jobs.Where ( j => j.JobID == jobID ).First ();
            return Entity.Job;
        }

        public ServiceItem SetServiceItem ( int serviceItemID )
        {
            Entity.ServiceItem = Context.ServiceItems.FirstOrDefault ( si => si.ServiceItemID == serviceItemID );
            return Entity.ServiceItem;
        }

        public List<ComboBoxValue<string>> GetCapacityList ()
        {
            return Context.Lists.Where ( l => l.ListKey == "ValveTestCapacity" )
                    .OrderBy ( l => l.SortOrder )
                    .Select ( l => new ComboBoxValue<string> { DisplayMember = l.Display1, ValueMember = l.ListValue.ToString () } ).ToList ();
        }

        public override void Detach()
        {
            ValveTest dvt = Activator.CreateInstance<ValveTest>();

            dvt.BackPressure = Entity.BackPressure;
            dvt.CalibrationDue = Entity.CalibrationDue;
            dvt.Capacity = Entity.Capacity;
            dvt.CapacityTypeID = Entity.CapacityTypeID;
            dvt.Coded = Entity.Coded;
            dvt.ColdDiffPressure = Entity.ColdDiffPressure;
            dvt.CostCenter = Entity.CostCenter;
            dvt.CustomerWitness = Entity.CustomerWitness;
            dvt.DateTested = Entity.DateTested;
            dvt.DotLocation = Entity.DotLocation;
            dvt.FSRNum = Entity.FSRNum;
            dvt.GaugeNum = Entity.GaugeNum;
            dvt.IsolationValve = Entity.IsolationValve;
            dvt.JobID = Entity.JobID;
            dvt.JsaComplete = Entity.JsaComplete;
            dvt.Notes = Entity.Notes;
            dvt.PsvApplication = Entity.PsvApplication;
            dvt.ReliefValveSupport = Entity.ReliefValveSupport;
            dvt.ReviewItems = Entity.ReviewItems;
            dvt.SapPsv = Entity.SapPsv;
            dvt.SealNum = Entity.SealNum;
            dvt.ServiceItemID = Entity.ServiceItemID;
            dvt.SetPressure = Entity.SetPressure;
            dvt.SetPressureFound = Entity.SetPressureFound;
            dvt.SetPressureLeft = Entity.SetPressureLeft;
            dvt.TechID = Entity.TechID;
            dvt.TempCorr = Entity.TempCorr;
            dvt.TestPort = Entity.TestPort;
            dvt.TestResultID = Entity.TestResultID;
            dvt.ValveDate = Entity.ValveDate;
            dvt.WeatherCap = Entity.WeatherCap;

            Entity = dvt;
        }

    }
}
