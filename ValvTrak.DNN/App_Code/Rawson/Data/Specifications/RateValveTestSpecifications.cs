using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Rawson.Data.Model;
using Rawson.Data;

/// <summary>
/// Summary description for RateValveTestSpecifications
/// </summary>
public static class RateValveTestSpecifications
{

    public static Specification<RateValveTest> ForID(int id)
    {
        return new Specification<RateValveTest>(j => j.RateValveTestID == id);
    }

    public static Specification<RateValveTest> ForJobID(int jobId)
    {
        return new Specification<RateValveTest>(j => j.Job.JobID == jobId);
    }

    public static Specification<RateValveTest> ForClient(int clientID)
    {
        return new Specification<RateValveTest>(j => j.Job.ClientLocation.ClientID == clientID);
    }

    public static Specification<RateValveTest> ForLocation(int locationID)
    {
        return new Specification<RateValveTest>(j => j.Job.ClientLocationID == locationID);
    }

    public static Specification<RateValveTest> ForSalesOrder(string salesOrder)
    {
        return new Specification<RateValveTest>(j => j.Job.SalesOrderNum == salesOrder);
    }

    public static Specification<RateValveTest> ForSerialNum(string serialNum)
    {
        return new Specification<RateValveTest>(j => j.ServiceItem.SerialNum.StartsWith(serialNum));
    }

    public static Specification<RateValveTest> ForFSRNum(string fsrNum)
    {
        return new Specification<RateValveTest>(j => j.FSRNum.StartsWith(fsrNum));
    }

    public static Specification<RateValveTest> HasJobStatus(int jobStatus)
    {
        return new Specification<RateValveTest>(j => j.Job.JobStatusID == jobStatus);
    }

    public static Specification<RateValveTest> CallInBetweenDates(DateTime startDate, DateTime endDate)
    {
        return new Specification<RateValveTest>(j => j.Job.CallDate >= startDate && j.Job.CallDate <= endDate);
    }

    public static Specification<RateValveTest> CallInOnOrBeforeDate(DateTime endDate)
    {
        return new Specification<RateValveTest>(j => j.Job.CallDate <= endDate);
    }

    public static Specification<RateValveTest> CallInOnOrAfterDate(DateTime startDate)
    {
        return new Specification<RateValveTest>(j => j.Job.CallDate >= startDate);
    }

    public static Specification<RateValveTest> ServiceBetweenDates(DateTime startDate, DateTime endDate)
    {
        return new Specification<RateValveTest>(j => j.Job.ServiceDate >= startDate && j.Job.ServiceDate <= endDate);
    }

    public static Specification<RateValveTest> ServiceOnOrBeforeDate(DateTime endDate)
    {
        return new Specification<RateValveTest>(j => j.Job.ServiceDate <= endDate);
    }

    public static Specification<RateValveTest> ServiceOnOrAfterDate(DateTime startDate)
    {
        return new Specification<RateValveTest>(j => j.Job.ServiceDate >= startDate);
    }

    public static Specification<RateValveTest> CompletionBetweenDates(DateTime startDate, DateTime endDate)
    {
        return new Specification<RateValveTest>(j => j.Job.CompletionDate >= startDate && j.Job.CompletionDate <= endDate);
    }

    public static Specification<RateValveTest> CompletionOnOrBeforeDate(DateTime endDate)
    {
        return new Specification<RateValveTest>(j => j.Job.CompletionDate <= endDate);
    }

    public static Specification<RateValveTest> CompletionOnOrAfterDate(DateTime startDate)
    {
        return new Specification<RateValveTest>(j => j.Job.CompletionDate >= startDate);
    }

    public static Specification<RateValveTest> DateTestedBetweenDates(DateTime startDate, DateTime endDate)
    {
        return new Specification<RateValveTest>(j => j.DateTested >= startDate && j.DateTested <= endDate);
    }

    public static Specification<RateValveTest> DateTestedOnOrBeforeDate(DateTime endDate)
    {
        return new Specification<RateValveTest>(j => j.DateTested <= endDate);
    }

    public static Specification<RateValveTest> DateTestedOnOrAfterDate(DateTime startDate)
    {
        return new Specification<RateValveTest>(j => j.DateTested >= startDate);
    }

    public static Specification<RateValveTest> ForAllowedClients(List<int> clientIds)
    {
        return new Specification<RateValveTest>(j => clientIds.Contains(j.Job.ClientLocation.Client.ClientID));
    }

    public static Specification<RateValveTest> ForAllowedLocations(List<int> clientLocationIds)
    {
        return new Specification<RateValveTest>(j => clientLocationIds.Contains(j.Job.ClientLocationID));
    }
}