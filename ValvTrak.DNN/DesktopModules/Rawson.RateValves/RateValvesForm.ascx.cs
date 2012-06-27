using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RateValvesForm : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void EmployeeDataSource_Selecting(object sender, LinqDataSourceSelectEventArgs e)
    {

    }

    protected void ASPxSpellChecker1_CheckedElementResolve(object sender, DevExpress.Web.ASPxClasses.ControlResolveEventArgs e)
    {
        //e.ResolvedControl = RemarksTextBox;
    }

    protected void ASPxSpellChecker2_CheckedElementResolve(object sender, DevExpress.Web.ASPxClasses.ControlResolveEventArgs e)
    {
        //e.ResolvedControl = ItemsForImmediateReviewTextBox;
    }

    protected void SaveAction_Callback(object source, DevExpress.Web.ASPxCallback.CallbackEventArgs e)
    {
        //Save();
    }
}