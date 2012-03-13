using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Rawson.App.Security;
using Rawson.Data.Model;


namespace Rawson.Data
{
    public static class GreasingRecordItemSpecifications
    {
        public static Specification<GreasingRecordItem> ForJobID ( int jobId )
        {
            return new Specification<GreasingRecordItem> ( gri => gri.GreasingRecord.JobID == jobId );
        }

        public static Specification<GreasingRecordItem> ForGreasingRecordID(int grId)
        {
            return new Specification<GreasingRecordItem>(gri => gri.GreasingRecordID == grId);
        }

        public static Specification<GreasingRecordItem> ForFsrNumber ( string fsrNumber )
        {
            return new Specification<GreasingRecordItem> ( gri => gri.GreasingRecord.FSRNum.StartsWith ( fsrNumber ) );
        }

        public static Specification<GreasingRecordItem> ForSerialNumber ( string serialNumber )
        {
            return new Specification<GreasingRecordItem> ( gri => gri.ServiceItem.SerialNum.StartsWith ( serialNumber ) );
        }

        public static Specification<GreasingRecordItem> ForPipelineSegment ( string psv )
        {
            return new Specification<GreasingRecordItem> ( gri => gri.GreasingRecord.PipelineSegment.StartsWith ( psv ) );
        }

        public static Specification<GreasingRecordItem> ForSapWO ( string sapWo )
        {
            return new Specification<GreasingRecordItem> ( gri => gri.GreasingRecord.Job.SapWoNum.StartsWith ( sapWo ) );
        }

        public static Specification<GreasingRecordItem> ForSapEquipNumber ( string sapEquip )
        {
            return new Specification<GreasingRecordItem> ( gri => gri.GreasingRecord.SapPSV.StartsWith ( sapEquip ) );
        }

        public static Specification<GreasingRecordItem> ForClient ( int clientID )
        {
            return new Specification<GreasingRecordItem> ( gri => gri.GreasingRecord.Job.ClientLocation.ClientID == clientID );
        }

        public static Specification<GreasingRecordItem> ForLocation ( int locationID )
        {
            return new Specification<GreasingRecordItem> ( gri => gri.GreasingRecord.Job.ClientLocationID == locationID );
        }

        public static Specification<GreasingRecordItem> CallBetweenDates ( DateTime startDate, DateTime endDate )
        {
            return new Specification<GreasingRecordItem> ( gri => gri.GreasingRecord.Job.CallDate >= startDate && gri.GreasingRecord.Job.CallDate <= endDate );
        }

        public static Specification<GreasingRecordItem> CallOnOrBeforeDate ( DateTime endDate )
        {
            return new Specification<GreasingRecordItem> ( gri => gri.GreasingRecord.Job.CallDate <= endDate );
        }

        public static Specification<GreasingRecordItem> CallOnOrAfterDate ( DateTime startDate )
        {
            return new Specification<GreasingRecordItem> ( gri => gri.GreasingRecord.Job.CallDate >= startDate );
        }

        public static Specification<GreasingRecordItem> CompletionBetweenDates ( DateTime startDate, DateTime endDate )
        {
            return new Specification<GreasingRecordItem> ( gri => gri.GreasingRecord.Job.CompletionDate >= startDate && gri.GreasingRecord.Job.CompletionDate <= endDate );
        }

        public static Specification<GreasingRecordItem> CompletionOnOrBeforeDate ( DateTime endDate )
        {
            return new Specification<GreasingRecordItem> ( gri => gri.GreasingRecord.Job.CompletionDate <= endDate );
        }

        public static Specification<GreasingRecordItem> CompletionOnOrAfterDate ( DateTime startDate )
        {
            return new Specification<GreasingRecordItem> ( gri => gri.GreasingRecord.Job.CompletionDate >= startDate );
        }

        public static Specification<GreasingRecordItem> ForAllowedClients ( List<int> clientIds )
        {
            return new Specification<GreasingRecordItem> ( gri => clientIds.Contains ( gri.GreasingRecord.Job.ClientLocation.Client.ClientID ) );
        }

        public static Specification<GreasingRecordItem> ForAllowedLocations(List<int> clientLocationIds)
        {
            return new Specification<GreasingRecordItem>(gri => clientLocationIds.Contains(gri.GreasingRecord.Job.ClientLocationID));
        }

    }
}

