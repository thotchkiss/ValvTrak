using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Rawson.App.Security;
using Rawson.Data.Model;

namespace Rawson.Data
{
    public static class WellSafetyTestSpecifications
    {
        public static Specification<WellSafetyTest> ForID ( int id )
        {
            return new Specification<WellSafetyTest> ( w => w.WellSafetyTestID == id );
        }

        public static Specification<WellSafetyTest> ForJobID ( int jobId )
        {
            return new Specification<WellSafetyTest> ( w => w.Job.JobID == jobId );
        }

        public static Specification<WellSafetyTest> ForClient ( int clientID )
        {
            return new Specification<WellSafetyTest> ( w => w.Job.ClientLocation.ClientID == clientID );
        }

        public static Specification<WellSafetyTest> ForLocation ( int locationID )
        {
            return new Specification<WellSafetyTest> ( w => w.Job.ClientLocationID == locationID );
        }

        public static Specification<WellSafetyTest> ForSalesOrder ( string salesOrder )
        {
            return new Specification<WellSafetyTest> ( w => w.Job.SalesOrderNum == salesOrder );
        }

        public static Specification<WellSafetyTest> ForSerialNum ( string serialNum )
        {
            return new Specification<WellSafetyTest> ( w => w.ServiceItem.SerialNum.StartsWith ( serialNum ) );
        }

        public static Specification<WellSafetyTest> ForFSRNum(string fsrNum)
        {
            return new Specification<WellSafetyTest>(w => w.FSR_Num.StartsWith(fsrNum));
        }

        public static Specification<WellSafetyTest> ForSapEquipNum ( string sapEquipNum )
        {
            return new Specification<WellSafetyTest> ( w => w.ServiceItem.SapEquipNum.StartsWith ( sapEquipNum ) );
        }

        public static Specification<WellSafetyTest> HasSystemLocation ( string sysLocation )
        {
            return new Specification<WellSafetyTest> ( w => w.SystemLocation == sysLocation );
        }

        public static Specification<WellSafetyTest> HasTestResult ( int testResult )
        {
            return new Specification<WellSafetyTest> ( w => w.TestResult.TestResultID == testResult );
        }

        public static Specification<WellSafetyTest> CompletionBetweenDates ( DateTime startDate, DateTime endDate )
        {
            return new Specification<WellSafetyTest> ( w => w.Job.CompletionDate >= startDate && w.Job.CompletionDate <= endDate );
        }

        public static Specification<WellSafetyTest> CompletionOnOrBeforeDate ( DateTime endDate )
        {
            return new Specification<WellSafetyTest> ( w => w.Job.CompletionDate <= endDate );
        }

        public static Specification<WellSafetyTest> CompletionOnOrAfterDate ( DateTime startDate )
        {
            return new Specification<WellSafetyTest> ( w => w.Job.CompletionDate >= startDate );
        }

        public static Specification<WellSafetyTest> ForAllowedClients ( List<int> clientIds )
        {
            return new Specification<WellSafetyTest> ( w => clientIds.Contains ( w.Job.ClientLocation.Client.ClientID ) );
        }

        public static Specification<WellSafetyTest> ForAllowedLocations(List<int> clientLocationIds)
        {
            return new Specification<WellSafetyTest>(w => clientLocationIds.Contains(w.Job.ClientLocationID));
        }
    }
}

