using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Rawson.App.Security;
using System.Reflection;
using Rawson.App;
using Rawson.Data.Model;
using System.Collections;

namespace Rawson.Data.Controllers
{
    /// <summary>
    /// Summary description for ValveTestSearchController
    /// </summary>
    public class ValveTestSearchController : BaseController<ValveTest>
    {
        public ValveTestSearchController()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        public List<ValveTest> GetAuthorizedValveTests(ValveTestQuery q, int userId)
        {
            IQueryable<ValveTest> qTests = Fetch(BuildUpWhere(q, userId));

            //IEnumerable<ValveTest> vtests = new List<ValveTest>();
            //Specification<ValveTest> batchSpec = null;

            //UserAuthorization auth = new UserAuthorization(userId);
            //var jauth = auth.GetAllAuthorizedProjects().ToArray();

            //if (jauth.Count() > 50)
            //{
            //    double whole_parts = Math.Floor(jauth.Count() / 50.0);

            //    int rem_size = 0;
            //    Math.DivRem(jauth.Count(), 50, out rem_size);

            //    if (rem_size > 0)
            //    {
            //        var array = new int[rem_size];
            //        Array.Copy(jauth, jauth.Count() - rem_size, array, 0, rem_size);

            //        batchSpec = new Specification<ValveTest>(vt => array.Contains(vt.Job.ClientLocationID));

            //        vtests = vtests.Concat(qTests.Where(batchSpec.Predicate).AsEnumerable());
            //    }

            //    for (var i = 0; i < whole_parts; i++)
            //    {
            //        var arr = new int[50];
            //        Array.Copy(jauth, i * 50, arr, 0, 50);

            //        batchSpec = new Specification<ValveTest>(vt => arr.Contains(vt.Job.ClientLocationID));

            //        vtests = vtests.Concat(qTests.Where(batchSpec.Predicate).AsEnumerable());
            //    }
            //}
            //else
            //{
            //    batchSpec = new Specification<ValveTest>(vt => jauth.Contains(vt.Job.ClientLocationID));

            //    vtests = vtests.Concat(qTests.Where(batchSpec.Predicate).AsEnumerable());
            //}

            //return vtests.Distinct().ToList();

            return qTests.Distinct().ToList();
        }

        public override List<ComboBoxValue<int>> GetAuthorizedClients(int userId)
        {
            List<ComboBoxValue<int>> comboItems = base.GetAuthorizedClients(userId);
            comboItems.Insert(0, new ComboBoxValue<int>("-- All --", -1));

            return comboItems;
        }

        public override List<ComboBoxValue<int>> GetAuthorizedLocations(int userId, int clientId)
        {
            List<ComboBoxValue<int>> comboItems = base.GetAuthorizedLocations(userId, clientId);
            comboItems.Insert(0, new ComboBoxValue<int>("-- All --", -1));

            return comboItems;
        }

        public List<ComboBoxValue<int>> GetJobStatus()
        {
            return Context.JobStatus.OrderBy(j => j.Status).Select(j => new ComboBoxValue<int> { DisplayMember = j.Status, ValueMember = j.JobStatusID }).ToList();
        }

        private Specification<ValveTest> BuildUpWhere(ValveTestQuery q, int userId)
        {
            Specification<ValveTest> specs = null;

            PropertyInfo[] props = q.GetType().GetProperties();
            foreach (PropertyInfo prop in props)
            {
                object value = prop.GetValue(q, null);

                switch (prop.Name)
                {
                    case "JobID":
                        int jobId;
                        if (Int32.TryParse(value.ToString(), out jobId) && jobId > 0)
                            specs = Join(specs, ValveTestSpecifications.ForJobID(jobId));

                        break;
                    case "ValveTestID":
                        int valveId;
                        if (Int32.TryParse(value.ToString(), out valveId) && valveId > 0)
                            specs = Join(specs, ValveTestSpecifications.ForID(valveId));

                        break;
                    case "SerialNum":
                        if (!String.IsNullOrEmpty((string)value))
                            specs = Join(specs, ValveTestSpecifications.ForSerialNum((string)value));

                        break;
                    case "FSRNum":
                        if (!String.IsNullOrEmpty((string)value))
                            specs = Join(specs, ValveTestSpecifications.ForFSRNum((string)value));

                        break;
                    case "Client":
                        if ((int)value >= 0)
                            specs = Join(specs, ValveTestSpecifications.ForClient((int)value));

                        break;
                    case "ClientLocation":
                        if ((int)value >= 0)
                            specs = Join(specs, ValveTestSpecifications.ForLocation((int)value));

                        break;
                    case "TestedEndDate":
                        DateTime date1;
                        if (DateTime.TryParse(value.ToString(), out date1))
                            specs = Join(specs, ValveTestSpecifications.CompletionOnOrBeforeDate(date1));

                        break;
                    case "TestedStartDate":
                        DateTime date2;
                        if (DateTime.TryParse(value.ToString(), out date2))
                            specs = Join(specs, ValveTestSpecifications.CompletionOnOrAfterDate(date2));

                        break;
                    case "JobStatus":
                        if ((int)value >= 0)
                            specs = Join(specs, ValveTestSpecifications.HasJobStatus((int)value));

                        break;
                    case "TestResult":
                        if ((int)value >= 0)
                            specs = Join(specs, ValveTestSpecifications.HasTestResult((int)value));

                        break;
                }
            }

            
            UserAuthorization auth = new UserAuthorization(userId);

            if (!auth.IsDataAdmin)
            {
                List<int> clients = auth.DataGroups.Select(sz => Convert.ToInt32(sz)).ToList();
                List<int> locations = auth.DataSingles.Select(sz => Convert.ToInt32(sz)).ToList();

                specs = Join(specs, (ValveTestSpecifications.ForAllowedClients(clients) |
                     ValveTestSpecifications.ForAllowedLocations(locations)));
            }

            return specs;
        }

        private Specification<T> Join<T>(Specification<T> spec, Specification<T> join)
        {
            return (spec == null ? join : spec & join);
        }

    }
}