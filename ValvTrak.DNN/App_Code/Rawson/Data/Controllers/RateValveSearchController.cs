using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Rawson.Data.Controllers;
using Rawson.Data.Model;
using Rawson.Data;
using Rawson.App.Security;
using System.Reflection;
using Rawson.App;

/// <summary>
/// Summary description for RateValveSearchController
/// </summary>
public class RateValveSearchController : BaseController<RateValveTest>
{
    public List<RateValveTest> GetAuthorizedValveTests(RateValveQuery q, int userId)
    {
        IQueryable<RateValveTest> qTests = Fetch(BuildUpWhere(q, userId));

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

    public override bool Delete(object Pk)
    {
        int result = -1;
        try
        {
            var valve = this.Context.RateValveTests.FirstOrDefault(rv => rv.RateValveTestID == Convert.ToInt32(Pk));
            if (valve != null)
            {
                foreach(RateValveTestPart rvtp in valve.RateValveTestParts)
                    this.Context.RateValveTestParts.DeleteOnSubmit(rvtp);

                this.Context.RateValveTests.DeleteOnSubmit(valve);

                this.Context.SubmitChanges();
            }

            result = 1;
        }
        catch (Exception ex)
        {
            this.SetError(ex);
            return false;
        }

        if (result < 1)
        {
            this.SetError("Nothing to delete");
            return false;
        }

        return true;
    }

    private Specification<RateValveTest> BuildUpWhere(RateValveQuery q, int userId)
    {
        Specification<RateValveTest> specs = null;

        PropertyInfo[] props = q.GetType().GetProperties();
        foreach (PropertyInfo prop in props)
        {
            object value = prop.GetValue(q, null);

            switch (prop.Name)
            {
                case "JobID":
                    int jobId;
                    if (Int32.TryParse(value.ToString(), out jobId) && jobId > 0)
                        specs = Join(specs, RateValveTestSpecifications.ForJobID(jobId));

                    break;
                case "RateValveTestID":
                    int valveId;
                    if (Int32.TryParse(value.ToString(), out valveId) && valveId > 0)
                        specs = Join(specs, RateValveTestSpecifications.ForID(valveId));

                    break;
                case "SerialNum":
                    if (!String.IsNullOrEmpty((string)value))
                        specs = Join(specs, RateValveTestSpecifications.ForSerialNum((string)value));

                    break;
                case "FSRNum":
                    if (!String.IsNullOrEmpty((string)value))
                        specs = Join(specs, RateValveTestSpecifications.ForFSRNum((string)value));

                    break;
                case "Client":
                    if ((int)value >= 0)
                        specs = Join(specs, RateValveTestSpecifications.ForClient((int)value));

                    break;
                case "ClientLocation":
                    if ((int)value >= 0)
                        specs = Join(specs, RateValveTestSpecifications.ForLocation((int)value));

                    break;
                case "TestedEndDate":
                    DateTime date1;
                    if (DateTime.TryParse(value.ToString(), out date1))
                        specs = Join(specs, RateValveTestSpecifications.DateTestedOnOrBeforeDate(date1));

                    break;
                case "TestedStartDate":
                    DateTime date2;
                    if (DateTime.TryParse(value.ToString(), out date2))
                        specs = Join(specs, RateValveTestSpecifications.DateTestedOnOrAfterDate(date2));

                    break;
                case "JobStatus":
                    if ((int)value >= 0)
                        specs = Join(specs, RateValveTestSpecifications.HasJobStatus((int)value));

                    break;
            }
        }


        UserAuthorization auth = new UserAuthorization(userId);

        if (!auth.IsDataAdmin)
        {
            List<int> clients = auth.DataGroups.Select(sz => Convert.ToInt32(sz)).ToList();
            List<int> locations = auth.DataSingles.Select(sz => Convert.ToInt32(sz)).ToList();

            specs = Join(specs, (RateValveTestSpecifications.ForAllowedClients(clients) |
                 RateValveTestSpecifications.ForAllowedLocations(locations)));
        }

        return specs;
    }

    private Specification<T> Join<T>(Specification<T> spec, Specification<T> join)
    {
        return (spec == null ? join : spec & join);
    }

}