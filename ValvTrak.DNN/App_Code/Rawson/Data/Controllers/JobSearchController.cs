using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Linq;
using System.Data.Entity;
using System.Linq;
using System.Web;
using Rawson.Data;
using System.Reflection;
using Rawson.App.Security;
using Rawson.App;
using Rawson.Data.Model;
using System.Data.Common;
using System.Data.SqlClient;

namespace Rawson.Data.Controllers
{
    /// <summary>
    /// Summary description for obJob
    /// </summary>
    public class JobSearchController : BaseController<Job>
    {
        public JobSearchController() { }

        public override List<ComboBoxValue<int>> GetAuthorizedLocations(int userId, int clientId)
        {
            List<ComboBoxValue<int>> comboItems = base.GetAuthorizedLocations(userId, clientId);
            comboItems.Insert(0, new ComboBoxValue<int>("-- All --", -1));

            return comboItems;
        }

        public override bool Delete(object Pk)
        {
            Job j = Context.Jobs.FirstOrDefault(jb => jb.JobID == Convert.ToInt32(Pk));
            if (j != null)
            {
                if (Context.Connection.State == ConnectionState.Closed)
                    Context.Connection.Open();

                using (Context.Transaction = Context.Connection.BeginTransaction())
                {
                    try
                    {
                        if (j.ValveTests.Count() > 0)
                        {
                            Context.ValveTests.DeleteAllOnSubmit(j.ValveTests);
                            Context.SubmitChanges();
                        }

                        if (j.GreasingRecords.Count() > 0)
                        {
                            foreach (GreasingRecord gr in j.GreasingRecords)
                            {
                                Context.GreasingRecordItems.DeleteAllOnSubmit(gr.GreasingRecordItems);
                                Context.SubmitChanges();
                            }

                            Context.GreasingRecords.DeleteAllOnSubmit(j.GreasingRecords);
                            Context.SubmitChanges();
                        }

                        if (j.WellSafetyTests.Count() > 0)
                        {
                            Context.WellSafetyTests.DeleteAllOnSubmit(j.WellSafetyTests);
                            Context.SubmitChanges();
                        }

                        Context.Jobs.DeleteOnSubmit(j);
                        Context.SubmitChanges();

                        Context.Transaction.Commit();
                    }
                    catch (Exception ex)
                    {
                        Context.Transaction.Rollback();
                        return false;
                    }
                }
            }

            return true;
        }

        public List<Job> GetAuthorizedJobs(JobSearchQuery q, int userId)
        {
            IQueryable<Job> qJobs = Fetch(BuildWhere(q, userId));

            //IEnumerable<Job> jobs = new List<Job>();
            //Specification<Job> batchSpec = null;

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

            //        batchSpec = new Specification<Job>(j => array.Contains(j.ClientLocationID));

            //        jobs = jobs.Concat(qJobs.Where(batchSpec.Predicate).AsEnumerable());
            //    }

            //    for (var i = 0; i < whole_parts; i++)
            //    {
            //        var arr = new int[1000];
            //        Array.Copy(jauth, i * 1000, arr, 0, 1000);

            //        batchSpec = new Specification<Job>(j => arr.Contains(j.ClientLocationID));

            //        jobs = jobs.Concat(qJobs.Where(batchSpec.Predicate).AsEnumerable());
            //    }
            //}
            //else
            //{
            //    batchSpec = new Specification<Job>(j => jauth.Contains(j.ClientLocationID));

            //    jobs = jobs.Concat(qJobs.Where(batchSpec.Predicate).AsEnumerable());
            //}

            //return jobs.Distinct().ToList();

            return qJobs.Distinct().ToList();
        }

        private Specification<Job> BuildWhere(JobSearchQuery q, int userId)
        {
            Specification<Job> specs = null;

            PropertyInfo[] props = q.GetType().GetProperties();
            foreach (PropertyInfo prop in props)
            {
                object value = prop.GetValue(q, null);

                switch (prop.Name)
                {
                    case "JobID":
                        int jobId;
                        if (Int32.TryParse(value.ToString(), out jobId))
                            specs = Join(specs, JobSpecifications.ForID(jobId));

                        break;
                    case "SalesOrder":
                        if (!String.IsNullOrEmpty((string)value))
                            specs = Join(specs, JobSpecifications.ForSalesOrder((string)value));

                        break;
                    case "Client":
                        if ((int)value >= 0)
                            specs = Join(specs, JobSpecifications.ForClient((int)value));

                        break;
                    case "ClientLocation":
                        if ((int)value >= 0)
                            specs = Join(specs, JobSpecifications.ForLocation((int)value));

                        break;
                    case "Active":
                        if ((int)value >= 0)
                            specs = Join(specs, (int)value == 1 ? JobSpecifications.IsActive : JobSpecifications.IsNotActive);

                        break;
                    case "ApprovedBy":
                        if ((int)value >= 0)
                            specs = Join(specs, JobSpecifications.IsApprovedBy((int)value));

                        break;
                    case "AssignedBy":
                        if ((int)value >= 0)
                            specs = Join(specs, JobSpecifications.IsAssignedBy((int)value));

                        break;
                    case "AssignedTo":
                        if ((int)value >= 0)
                            specs = Join(specs, JobSpecifications.IsAssignedTo((int)value));

                        break;
                    case "CallInEndDate":
                        DateTime date;
                        if (DateTime.TryParse(value.ToString(), out date))
                            specs = Join(specs, JobSpecifications.CallInOnOrBeforeDate(date));

                        break;
                    case "CallInStartDate":
                        DateTime date0;
                        if (DateTime.TryParse(value.ToString(), out date0))
                            specs = Join(specs, JobSpecifications.CallInOnOrAfterDate(date0));

                        break;
                    case "CompletionEndDate":
                        DateTime date1;
                        if (DateTime.TryParse(value.ToString(), out date1))
                            specs = Join(specs, JobSpecifications.CompletionOnOrBeforeDate(date1));

                        break;
                    case "CompletionStartDate":
                        DateTime date2;
                        if (DateTime.TryParse(value.ToString(), out date2))
                            specs = Join(specs, JobSpecifications.CompletionOnOrAfterDate(date2));

                        break;
                    case "DeliveryMethod":
                        if ((int)value >= 0)
                            specs = Join(specs, JobSpecifications.HasDeliveryMethod((int)value));

                        break;
                    case "JobStatus":
                        if ((int)value >= 0)
                            specs = Join(specs, JobSpecifications.HasJobStatus((int)value));

                        break;
                    case "JobType":
                        if ((int)value >= 0)
                            specs = Join(specs, JobSpecifications.HasJobType((int)value));

                        break;
                    case "ServiceEndDate":
                        DateTime date3;
                        if (DateTime.TryParse(value.ToString(), out date3))
                            specs = Join(specs, JobSpecifications.ServiceOnOrBeforeDate(date3));

                        break;
                    case "ServiceStartDate":
                        DateTime date4;
                        if (DateTime.TryParse(value.ToString(), out date4))
                            specs = Join(specs, JobSpecifications.ServiceOnOrAfterDate(date4));

                        break;
                }
            }

            UserAuthorization auth = new UserAuthorization(userId);

            if (!auth.IsDataAdmin)
            {
                List<int> clients = auth.DataGroups.Select(sz => Convert.ToInt32(sz)).ToList();
                List<int> locations = auth.DataSingles.Select(sz => Convert.ToInt32(sz)).ToList();

                specs = Join(specs, (JobSpecifications.ForAllowedClients(clients) |
                     JobSpecifications.ForAllowedLocations(locations)));
            }

            return specs;
        }

        private Specification<T> Join<T>(Specification<T> spec, Specification<T> join)
        {
            return (spec == null ? join : spec & join);
        }
    }
}
