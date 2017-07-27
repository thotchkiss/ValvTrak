using DotNetNuke.Entities.Modules;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Rawson.Data.Controllers;
using DotNetNuke.Services.Exceptions;

namespace Rawson.WellSafetyTests
{
    public partial class WellSafetyTestExtForm : PortalModuleBase
    {
        protected void Page_Init(object sender, EventArgs e)
        {
            WellSafetyTestExtController controller = new WellSafetyTestExtController();

            if (Request.QueryString["WellSafetyTestExtID"] == null)
            {
                controller.Options.TrackingMode = TrackingModes.Disconnected;
                controller.NewEntity();

                int jobId;
                if (!Int32.TryParse(Request.QueryString["JobID"], out jobId))
                    Exceptions.ProcessModuleLoadException("JobID is required.", this, null);

                controller.LoadJob(jobId);
            }
            else
            {
                int wsId;
                if (int.TryParse(Request.QueryString["WellSafetyTestExtID"], out wsId))
                {
                    controller.Options.TrackingMode = TrackingModes.Connected;
                    controller.Load(wsId);
                }
                else
                    Exceptions.ProcessModuleLoadException("Unable to match WellSafetyTestID", this, null);
            }

            Context.Items.Add("#boController", controller);
        }
    }
}