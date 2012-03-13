using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Rawson.App.Security;
using Rawson.App;
using System.Reflection;
using Rawson.Data.Model;
using System.Data.Linq;
using System.Data;

namespace Rawson.Data.Controllers
{
    /// <summary>
    /// Summary description for GreasingRecordSearchController
    /// </summary>
    public class GreasingRecordSearchController : BaseController<GreasingRecord>
    {
        public GreasingRecordSearchController() 
        {
            DataLoadOptions options = new System.Data.Linq.DataLoadOptions();
            options.LoadWith<GreasingRecordItem>(gri => gri.GreasingRecord);
            options.LoadWith<GreasingRecordItem>(gri => gri.ServiceItem);
            options.LoadWith<GreasingRecord>(gr => gr.Job);
            options.LoadWith<Job>(j => j.ClientLocation);
            options.LoadWith<Job>(j => j.Employee);

            Context.LoadOptions = options;
        }

        public List<GreasingRecordItem> GetAuthorizedGreasingRecordItems(GreasingRecordQuery q, int userId)
        {
            IQueryable<GreasingRecordItem> qItems = Fetch(BuildWhere(q, userId));
            return qItems.ToList();
        }

        public List<ComboBoxValue<int>> GetAuthorizedClients(int userId)
        {
            List<ComboBoxValue<int>> clients = base.GetAuthorizedClients(userId);
            clients.Insert(0, new ComboBoxValue<int>("-- All --", -1));

            return clients;
        }

        public List<ComboBoxValue<int>> GetAuthorizedLocations(int userId, int clientId)
        {
            List<ComboBoxValue<int>> locations = base.GetAuthorizedLocations(userId, clientId);
            locations.Insert(0, new ComboBoxValue<int>("-- All --", -1));

            return locations;

        }

        public List<ComboBoxValue<int>> GetEmployees()
        {
            List<ComboBoxValue<int>> comboItems = base.GetEmployeesList();
            comboItems.Insert(0, new ComboBoxValue<int>("-- All --", -1));

            return comboItems;
        }

        public List<ComboBoxValue<string>> GetLubeTypes()
        {
            List<ComboBoxValue<string>> comboItems = new List<ComboBoxValue<string>>();

            comboItems.AddRange(Context.Lists.Where( l => l.ListKey == "LubeType" ).OrderBy(l => l.SortOrder)
                .Select(l => new ComboBoxValue<string> { DisplayMember = l.Display1, ValueMember = l.ListValue.ToString() })
            );

            return comboItems;
        }

        public override bool Delete(object Pk)
        {
            GreasingRecord gr = Context.GreasingRecords.FirstOrDefault(g => g.GreasingRecordID == Convert.ToInt32(Pk));

            if (gr != null)
            {
                if (Context.Connection.State == ConnectionState.Closed)
                    Context.Connection.Open();

                using (Context.Transaction = Context.Connection.BeginTransaction())
                {
                    try
                    {
                        if (gr.GreasingRecordItems.Count() > 0)
                        {
                            Context.GreasingRecordItems.DeleteAllOnSubmit(gr.GreasingRecordItems);
                            Context.SubmitChanges();
                        }

                        Context.GreasingRecords.DeleteOnSubmit(gr);
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

        private Specification<GreasingRecordItem> BuildWhere(GreasingRecordQuery q, int userId)
        {
            Specification<GreasingRecordItem> specs = null;

            PropertyInfo[] props = q.GetType().GetProperties();
            foreach (PropertyInfo prop in props)
            {
                object value = prop.GetValue(q, null);

                switch (prop.Name)
                {
                    case "JobID":
                        int jobId;
                        if (Int32.TryParse(value.ToString(), out jobId) && jobId > 0)
                            specs = Join(specs, GreasingRecordItemSpecifications.ForJobID(jobId));

                        break;
                    case "GreasingRecordID":
                        int grId;
                        if (Int32.TryParse(value.ToString(), out grId) && grId > 0)
                            specs = Join(specs, GreasingRecordItemSpecifications.ForGreasingRecordID(grId));

                        break;
                    case "FsrNum":
                        if (!String.IsNullOrEmpty((string)value))
                            specs = Join(specs, GreasingRecordItemSpecifications.ForFsrNumber((string)value));

                        break;
                    case "SerialNum":
                        if (!String.IsNullOrEmpty((string)value))
                            specs = Join(specs, GreasingRecordItemSpecifications.ForSerialNumber((string)value));

                        break;
                    case "Psv":
                        if (!String.IsNullOrEmpty((string)value))
                            specs = Join(specs, GreasingRecordItemSpecifications.ForPipelineSegment((string)value));

                        break;
                    case "Client":
                        if ((int)value >= 0)
                            specs = Join(specs, GreasingRecordItemSpecifications.ForClient((int)value));

                        break;
                    case "ClientLocation":
                        if ((int)value >= 0)
                            specs = Join(specs, GreasingRecordItemSpecifications.ForLocation((int)value));

                        break;
                    case "GreasedEndDate":
                        DateTime date1;
                        if (DateTime.TryParse(value.ToString(), out date1))
                            specs = Join(specs, GreasingRecordItemSpecifications.CompletionOnOrBeforeDate(date1));

                        break;
                    case "GreasedStartDate":
                        DateTime date2;
                        if (DateTime.TryParse(value.ToString(), out date2))
                            specs = Join(specs, GreasingRecordItemSpecifications.CompletionOnOrAfterDate(date2));

                        break;
                    case "SapWO":
                        if (!String.IsNullOrEmpty((string)value))
                            specs = Join(specs, GreasingRecordItemSpecifications.ForSapWO((string)value));

                        break;
                    
                }
            }

            UserAuthorization auth = new UserAuthorization(userId);

            if (!auth.IsDataAdmin)
            {
                List<int> clients = auth.DataGroups.Select(sz => Convert.ToInt32(sz)).ToList();
                List<int> locations = auth.DataSingles.Select(sz => Convert.ToInt32(sz)).ToList();

                specs = Join(specs, (GreasingRecordItemSpecifications.ForAllowedClients(clients) |
                     GreasingRecordItemSpecifications.ForAllowedLocations(locations)));
            }

            return specs;
        }

        private Specification<T> Join<T>(Specification<T> spec, Specification<T> join)
        {
            return (spec == null ? join : spec & join);
        }

    }
}