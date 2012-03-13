using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Rawson.Data;
using Rawson.Data.Model;

namespace Rawson.Data.Specifications
{
    /// <summary>
    /// Summary description for ServiceItemSpecifications
    /// </summary>
    public static class ServiceItemSpecifications
    {
        public static Specification<ServiceItem> ForID ( int id )
        {
            return new Specification<ServiceItem> ( s => s.ServiceItemID == id );
        }

        public static Specification<ServiceItem> ForClientLocation ( int clientLocationID )
        {
            return new Specification<ServiceItem> ( s => s.ClientLocationID == clientLocationID );
        }


    }
}
