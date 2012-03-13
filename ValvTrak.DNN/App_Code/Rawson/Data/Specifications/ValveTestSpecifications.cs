using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Rawson.App.Security;
using Rawson.Data.Model;

namespace Rawson.Data
{
    public static class ValveTestSpecifications
    {
        public static Specification<ValveTest> ForID ( int id )
        {
            return new Specification<ValveTest> ( j => j.ValveTestID == id );
        }

        public static Specification<ValveTest> ForJobID ( int jobId )
        {
            return new Specification<ValveTest> ( j => j.Job.JobID == jobId );
        }

        public static Specification<ValveTest> ForClient ( int clientID )
        {
            return new Specification<ValveTest> ( j => j.Job.ClientLocation.ClientID == clientID );
        }

        public static Specification<ValveTest> ForLocation ( int locationID )
        {
            return new Specification<ValveTest> ( j => j.Job.ClientLocationID == locationID );
        }

        public static Specification<ValveTest> ForSalesOrder ( string salesOrder )
        {
            return new Specification<ValveTest> ( j => j.Job.SalesOrderNum == salesOrder );
        }

        public static Specification<ValveTest> ForSerialNum ( string serialNum )
        {
            return new Specification<ValveTest> ( j => j.ServiceItem.SerialNum.StartsWith ( serialNum ) );
        }

        public static Specification<ValveTest> ForFSRNum(string fsrNum)
        {
            return new Specification<ValveTest>(j => j.FSRNum.StartsWith(fsrNum));
        }

        public static Specification<ValveTest> ForSapEquipNum ( string sapEquipNum )
        {
            return new Specification<ValveTest> ( j => j.ServiceItem.SapEquipNum.StartsWith ( sapEquipNum ) );
        }

        public static Specification<ValveTest> HasJobType ( int jobType )
        {
            return new Specification<ValveTest> ( j => j.Job.JobTypeID == jobType );
        }

        public static Specification<ValveTest> HasJobStatus ( int jobStatus )
        {
            return new Specification<ValveTest> ( j => j.Job.JobStatusID == jobStatus );
        }

        public static Specification<ValveTest> HasTestResult ( int testResult )
        {
            return new Specification<ValveTest> ( j => j.TestResult.TestResultID == testResult );
        }

        public static Specification<ValveTest> HasDeliveryMethod ( int deliveryMethod )
        {
            return new Specification<ValveTest> ( j => j.Job.DeliveryMethodID == deliveryMethod );
        }

        public static Specification<ValveTest> IsActive
        {
            get { return new Specification<ValveTest> ( j => j.Job.Active == true ); }
        }

        public static Specification<ValveTest> IsNotActive
        {
            get { return new Specification<ValveTest> ( j => j.Job.Active == false ); }
        }

        public static Specification<ValveTest> IsAssignedBy ( int employeeID )
        {
            return new Specification<ValveTest> ( j => j.Job.AssignedByID == employeeID );
        }

        public static Specification<ValveTest> IsApprovedBy ( int employeeID )
        {
            return new Specification<ValveTest> ( j => j.Job.ApprovedByID == employeeID );
        }

        public static Specification<ValveTest> IsAssignedTo ( int employeeID )
        {
            return new Specification<ValveTest> ( j => j.Job.AssignedToID == employeeID );
        }

        public static Specification<ValveTest> CallInBetweenDates ( DateTime startDate, DateTime endDate )
        {
            return new Specification<ValveTest> ( j => j.Job.CallDate >= startDate && j.Job.CallDate <= endDate );
        }

        public static Specification<ValveTest> CallInOnOrBeforeDate ( DateTime endDate )
        {
            return new Specification<ValveTest> ( j => j.Job.CallDate <= endDate );
        }

        public static Specification<ValveTest> CallInOnOrAfterDate ( DateTime startDate )
        {
            return new Specification<ValveTest> ( j => j.Job.CallDate >= startDate );
        }

        public static Specification<ValveTest> ServiceBetweenDates ( DateTime startDate, DateTime endDate )
        {
            return new Specification<ValveTest> ( j => j.Job.ServiceDate >= startDate && j.Job.ServiceDate <= endDate );
        }

        public static Specification<ValveTest> ServiceOnOrBeforeDate ( DateTime endDate )
        {
            return new Specification<ValveTest> ( j => j.Job.ServiceDate <= endDate );
        }

        public static Specification<ValveTest> ServiceOnOrAfterDate ( DateTime startDate )
        {
            return new Specification<ValveTest> ( j => j.Job.ServiceDate >= startDate );
        }

        public static Specification<ValveTest> CompletionBetweenDates ( DateTime startDate, DateTime endDate )
        {
            return new Specification<ValveTest> ( j => j.Job.CompletionDate >= startDate && j.Job.CompletionDate <= endDate );
        }

        public static Specification<ValveTest> CompletionOnOrBeforeDate ( DateTime endDate )
        {
            return new Specification<ValveTest> ( j => j.Job.CompletionDate <= endDate );
        }

        public static Specification<ValveTest> CompletionOnOrAfterDate ( DateTime startDate )
        {
            return new Specification<ValveTest> ( j => j.Job.CompletionDate >= startDate );
        }

        public static Specification<ValveTest> DateTestedBetweenDates ( DateTime startDate, DateTime endDate )
        {
            return new Specification<ValveTest> ( j => j.DateTested >= startDate && j.DateTested <= endDate );
        }

        public static Specification<ValveTest> DateTestedOnOrBeforeDate ( DateTime endDate )
        {
            return new Specification<ValveTest> ( j => j.DateTested <= endDate );
        }

        public static Specification<ValveTest> DateTestedOnOrAfterDate ( DateTime startDate )
        {
            return new Specification<ValveTest> ( j => j.DateTested >= startDate );
        }

        public static Specification<ValveTest> ForAllowedClients ( List<int> clientIds )
        {
            return new Specification<ValveTest> ( j => clientIds.Contains ( j.Job.ClientLocation.Client.ClientID ) );
        }

        public static Specification<ValveTest> ForAllowedLocations(List<int> clientLocationIds)
        {
            return new Specification<ValveTest>(j => clientLocationIds.Contains(j.Job.ClientLocationID));
        }
    }
}

