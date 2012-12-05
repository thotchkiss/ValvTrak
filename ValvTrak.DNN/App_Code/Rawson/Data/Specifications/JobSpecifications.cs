using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Rawson.Data;
using Rawson.App.Security;
using Rawson.Data.Model;

namespace Rawson.Data
{
    public static class JobSpecifications
    {
        public static Specification<Job> ForID ( int id )
        {
            return new Specification<Job> ( j => j.JobID == id );
        }

        public static Specification<Job> ForClient ( int clientID )
        {
            return new Specification<Job> ( j => j.ClientLocation.ClientID == clientID );
        }

        public static Specification<Job> ForLocation ( int locationID )
        {
            return new Specification<Job> ( j => j.ClientLocationID == locationID );
        }

        public static Specification<Job> ForSalesOrder ( string salesOrder )
        {
            return new Specification<Job> ( j => j.SalesOrderNum.StartsWith(salesOrder) );
        }

        public static Specification<Job> HasJobType ( int jobType )
        {
            return new Specification<Job> ( j => j.JobTypeID == jobType );
        }

        public static Specification<Job> HasJobStatus ( int jobStatus )
        {
            return new Specification<Job> ( j => j.JobStatusID == jobStatus );
        }

        public static Specification<Job> HasDeliveryMethod ( int deliveryMethod )
        {
            return new Specification<Job> ( j => j.DeliveryMethodID == deliveryMethod );
        }

        public static Specification<Job> IsActive
        {
            get { return new Specification<Job> ( j => j.Active == true ); }
        }

        public static Specification<Job> IsNotActive
        {
            get { return new Specification<Job> ( j => j.Active == false ); }
        }

        public static Specification<Job> IsAssignedBy ( int employeeID )
        {
            return new Specification<Job> ( j => j.AssignedByID == employeeID );
        }

        public static Specification<Job> IsApprovedBy ( int employeeID )
        {
            return new Specification<Job> ( j => j.ApprovedByID == employeeID );
        }

        public static Specification<Job> IsAssignedTo ( int employeeID )
        {
            return new Specification<Job> ( j => j.AssignedToID == employeeID );
        }

        public static Specification<Job> CallInBetweenDates ( DateTime startDate, DateTime endDate )
        {
            return new Specification<Job> ( j => j.CallDate >= startDate && j.CallDate <= endDate );
        }

        public static Specification<Job> CallInOnOrBeforeDate ( DateTime endDate )
        {
            return new Specification<Job> ( j => j.CallDate <= endDate );
        }

        public static Specification<Job> CallInOnOrAfterDate ( DateTime startDate )
        {
            return new Specification<Job> ( j => j.CallDate >= startDate );
        }

        public static Specification<Job> ServiceBetweenDates ( DateTime startDate, DateTime endDate )
        {
            return new Specification<Job> ( j => j.ServiceDate >= startDate && j.ServiceDate <= endDate );
        }

        public static Specification<Job> ServiceOnOrBeforeDate ( DateTime endDate )
        {
            return new Specification<Job> ( j => j.ServiceDate <= endDate );
        }

        public static Specification<Job> ServiceOnOrAfterDate ( DateTime startDate )
        {
            return new Specification<Job> ( j => j.ServiceDate >= startDate );
        }

        public static Specification<Job> CompletionBetweenDates ( DateTime startDate, DateTime endDate )
        {
            return new Specification<Job> ( j => j.CompletionDate >= startDate && j.CompletionDate <= endDate );
        }

        public static Specification<Job> CompletionOnOrBeforeDate ( DateTime endDate )
        {
            return new Specification<Job> ( j => j.CompletionDate <= endDate );
        }

        public static Specification<Job> CompletionOnOrAfterDate ( DateTime startDate )
        {
            return new Specification<Job> ( j => j.CompletionDate >= startDate );
        }

        public static Specification<Job> ForAllowedClients(List<int> clientIds)
        {
            return new Specification<Job>(j => clientIds.Contains(j.ClientLocation.Client.ClientID));
        }

        public static Specification<Job> ForAllowedLocations(List<int> clientLocationIds)
        {
            return new Specification<Job>(j => clientLocationIds.Contains(j.ClientLocationID));
        }
    }
}

