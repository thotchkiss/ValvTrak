using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Rawson.App.Security;
using Rawson.Data.Model;

namespace Rawson.Data
{
    public static class ClientLocationSpecifications
    {
        public static Specification<ClientLocation> ForID ( int id )
        {
            return new Specification<ClientLocation> ( j => j.ClientLocationID == id );
        }

        public static Specification<ClientLocation> ForClient ( int clientId )
        {
            return new Specification<ClientLocation> ( j => j.Client.ClientID == clientId );
        }

    }
}

