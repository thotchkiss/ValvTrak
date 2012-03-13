using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Rawson.App.Security;
using Rawson.App;
using System.Reflection;
using Rawson.Data.Model;


namespace Rawson.Data.Controllers
{
    /// <summary>
    /// Summary description for WellSafetySearchController
    /// </summary>
    public class WellSafetySearchController : BaseController<WellSafetyTest>
    {
        public WellSafetySearchController() { }

        public List<WellSafetyTest> GetAuthorizedWellSafetyTests(WellSafetyQuery q, int userId)
        {
            IQueryable<WellSafetyTest> qItems = Fetch(BuildWhere(q, userId));

            //var cnt = qItems.Count();

            //IEnumerable<WellSafetyTest> items = new List<WellSafetyTest>();
            //Specification<WellSafetyTest> batchSpec = null;

            //UserAuthorization auth = new UserAuthorization(userId);
            //var jauth = auth.GetAllAuthorizedProjects().ToArray();

            //if (jauth.Count() > 1000)
            //{
            //    double whole_parts = Math.Floor(jauth.Count() / 1000.0);

            //    int rem_size = 0;
            //    Math.DivRem(jauth.Count(), 1000, out rem_size);

            //    if (rem_size > 0)
            //    {
            //        var array = new int[rem_size];
            //        Array.Copy(jauth, jauth.Count() - rem_size, array, 0, rem_size);

            //        batchSpec = new Specification<WellSafetyTest>(wst => array.Contains(wst.Job.ClientLocationID));

            //        items = items.Concat(qItems.Where(batchSpec.Predicate).AsEnumerable());
            //    }

            //    for (var i = 0; i < whole_parts; i++)
            //    {
            //        var arr = new int[1000];
            //        Array.Copy(jauth, i * 1000, arr, 0, 1000);

            //        batchSpec = new Specification<WellSafetyTest>(wst => arr.Contains(wst.Job.ClientLocationID));

            //        items = items.Concat(qItems.Where(batchSpec.Predicate).AsEnumerable());
            //    }
            //}
            //else
            //{
            //    batchSpec = new Specification<WellSafetyTest>(wst => jauth.Contains(wst.Job.ClientLocationID));

            //    items = items.Concat(qItems.Where(batchSpec.Predicate).AsEnumerable());
            //}

            //return items.Distinct().ToList();

            return qItems.Distinct().ToList();
        }

        public List<ComboBoxValue<int>> GetAuthorizedClients(int userId)
        {
            List<ComboBoxValue<int>> comboItems = base.GetAuthorizedClients(userId);
            comboItems.Insert(0, new ComboBoxValue<int>("-- All --", -1));

            return comboItems;
        }

        public List<ComboBoxValue<int>> GetAuthorizedLocations(int userId, int clientId)
        {
            List<ComboBoxValue<int>> comboItems = base.GetAuthorizedLocations(userId, clientId);
            comboItems.Insert(0, new ComboBoxValue<int>("-- All --", -1));

            return comboItems;
        }

        public List<ComboBoxValue<int>> GetEmployees()
        {
            List<ComboBoxValue<int>> comboItems = base.GetEmployeesList();
            comboItems.Insert(0, new ComboBoxValue<int>("-- All --", -1));

            return comboItems;
        }

        private Specification<WellSafetyTest> BuildWhere(WellSafetyQuery q, int userId)
        {
            Specification<WellSafetyTest> specs = null;

            PropertyInfo[] props = q.GetType().GetProperties();
            foreach (PropertyInfo prop in props)
            {
                object value = prop.GetValue(q, null);

                switch (prop.Name)
                {
                    case "JobID":
                        int jobId;
                        if (Int32.TryParse(value.ToString(), out jobId) && jobId > 0)
                            specs = Join(specs, WellSafetyTestSpecifications.ForJobID(jobId));

                        break;
                    case "WellSafetyTestID":
                        int wellId;
                        if (Int32.TryParse(value.ToString(), out wellId) && wellId > 0)
                            specs = Join(specs, WellSafetyTestSpecifications.ForID(wellId));

                        break;
                    case "SerialNum":
                        if (!String.IsNullOrEmpty((string)value))
                            specs = Join(specs, WellSafetyTestSpecifications.ForSerialNum((string)value));

                        break;
                    case "FSRNum":
                        if (!String.IsNullOrEmpty((string)value))
                            specs = Join(specs, WellSafetyTestSpecifications.ForFSRNum((string)value));

                        break;
                    case "Client":
                        if ((int)value >= 0)
                            specs = Join(specs, WellSafetyTestSpecifications.ForClient((int)value));

                        break;
                    case "ClientLocation":
                        if ((int)value >= 0)
                            specs = Join(specs, WellSafetyTestSpecifications.ForLocation((int)value));

                        break;
                    case "TestedEndDate":
                        DateTime date1;
                        if (DateTime.TryParse(value.ToString(), out date1))
                            specs = Join(specs, WellSafetyTestSpecifications.CompletionOnOrBeforeDate(date1));

                        break;
                    case "TestedStartDate":
                        DateTime date2;
                        if (DateTime.TryParse(value.ToString(), out date2))
                            specs = Join(specs, WellSafetyTestSpecifications.CompletionOnOrAfterDate(date2));

                        break;
                    case "SystemLocation":
                        if (!String.IsNullOrEmpty((string)value))
                            specs = Join(specs, WellSafetyTestSpecifications.HasSystemLocation((string)value));

                        break;
                    case "TestResult":
                        if ((int)value >= 0)
                            specs = Join(specs, WellSafetyTestSpecifications.HasTestResult((int)value));

                        break;
                }
            }

            UserAuthorization auth = new UserAuthorization(userId);

            if (!auth.IsDataAdmin)
            {
                List<int> clients = auth.DataGroups.Select(sz => Convert.ToInt32(sz)).ToList();
                List<int> locations = auth.DataSingles.Select(sz => Convert.ToInt32(sz)).ToList();

                specs = Join(specs, (WellSafetyTestSpecifications.ForAllowedClients(clients) |
                     WellSafetyTestSpecifications.ForAllowedLocations(locations)));
            }

            return specs;
        }

        private Specification<T> Join<T>(Specification<T> spec, Specification<T> join)
        {
            return (spec == null ? join : spec & join);
        }
    }
}
