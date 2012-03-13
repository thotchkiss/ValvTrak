using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DotNetNuke.Entities.Modules;
using Rawson.Data.Controllers;

namespace Rawson.ChemicalPumps
{
    public partial class ChemicalPumpTestForm : PortalModuleBase
    {
        ChemicalPumpFormController _controller;

        protected void Page_Init(object sender, EventArgs e)
        {
            _controller = new ChemicalPumpFormController();
        }

        protected void ASPxCallbackPanel1_Callback(object sender, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {

        }


    }
}