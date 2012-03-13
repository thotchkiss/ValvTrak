using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Rawson.App.Security;
using Rawson.Data.Model;

namespace Rawson.Data
{
    public static class ClientSpecifications
    {
        public static Specification<Client> ForID ( int id )
        {
            return new Specification<Client> ( j => j.ClientID == id );
        }

    }
}

