using System;
using System.Data.Services;
using System.Data.Services.Common;
using System.Collections.Generic;
using System.Linq;
using System.ServiceModel.Web;
using ValvTrak.Model;


public class ValvTrackDataService : DataService<ValvTrakEntities>
{
    // This method is called only once to initialize service-wide policies.
    public static void InitializeService(DataServiceConfiguration config)
    {
        // TODO: set rules to indicate which entity sets and service operations are visible, updatable, etc.
        // Examples:
        config.SetEntitySetAccessRule("Clients", EntitySetRights.All);
        //config.SetServiceOperationAccessRule("MyServiceOperation", ServiceOperationRights.All);
        
        config.DataServiceBehavior.MaxProtocolVersion = DataServiceProtocolVersion.V2;
    }
}
