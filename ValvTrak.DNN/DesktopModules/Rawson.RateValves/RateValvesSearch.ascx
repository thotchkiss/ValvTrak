<%@ Control Language="C#" AutoEventWireup="true" CodeFile="RateValvesSearch.ascx.cs" Inherits="RateValvesSearch" %>

<%@ Register Assembly="DevExpress.Web.v11.2" Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v11.2" Namespace="DevExpress.Web.ASPxCallbackPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v11.2" Namespace="DevExpress.Web.ASPxLoadingPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v11.2" Namespace="DevExpress.Web.ASPxGlobalEvents" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v11.2.Export" Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v11.2" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v11.2" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v11.2" Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dxrp" %>
<%@ Register Assembly="DevExpress.Web.v11.2" Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dxp" %>
<%@ Register assembly="DevExpress.Web.v11.2" namespace="DevExpress.Web.ASPxCallback" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.2" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.2" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.2.Export" namespace="DevExpress.Web.ASPxGridView.Export" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v11.2" namespace="DevExpress.Web.ASPxPanel" tagprefix="dx" %>

<script type="text/javascript" src="../../js/json2.js"></script>
<script id="scrCommon" type="text/javascript">

    function DevExComboUnboundItem(s, e, itemText, itemValue) {
        if (s.GetSelectedIndex() == -1) {
            s.InsertItem(0, itemText, itemValue);
        }
        else if (s.GetItem(0).value != itemValue) {
            s.InsertItem(0, itemText, itemValue);
        }
        if (s.GetSelectedIndex() == -1) { s.SetSelectedIndex(0); }
    }

    function OnGridGetSelectedValues(selectedValues) {

        if (is_array(selectedValues) && selectedValues.length > 0)
            printSelected.PerformCallback(JSON.stringify(selectedValues));
        else
            alert("No rows selected.");
    }

    function OnConfirmCustomButtonClick(vtID) {

        return confirm("Do you wish to delete valve test " + vtID + "?");
    }

    function OnPrintSetupEnd(s, e) {

        if (s.cpShowReport == true) {

            pdfPopper.SetContentUrl(s.cpReportUrl);
            pdfPopper.Show();
        }
        else {

            pdfPopper.Hide();
            pdfPopper.SetContentUrl('');
        }

    }

    function is_array(input) { return typeof (input) == 'object' && (input instanceof Array); }

</script>
<script id="scrCustomPager" type="text/javascript">
    function pageBarFirstButton_Click() {
        reportingGrid.GotoPage(0);
    }
    function pageBarPrevButton_Click() {
        reportingGrid.PrevPage();
    }
    function pageBarNextButton_Click() {
        reportingGrid.NextPage();
    }
    function pageBarLastButton_Click(s, e) {
        reportingGrid.GotoPage(reportingGrid.cpPageCount - 1);
    }
    function pageBarTextBox_Init(s, e) {
        s.SetText(s.cpText);
    }
    function pageBarTextBox_KeyPress(s, e) {
        if (e.htmlEvent.keyCode != 13)
            return;
        e.htmlEvent.cancelBubble = true;
        e.htmlEvent.returnValue = false;
        var pageIndex = (parseInt(s.GetText()) <= 0) ? 0 : parseInt(s.GetText()) - 1;
        reportingGrid.GotoPage(pageIndex);
    }
    function pageBarTextBox_ValueChanged(s, e) {
        var pageIndex = (parseInt(s.GetText()) <= 0) ? 0 : parseInt(s.GetText()) - 1;
        reportingGrid.GotoPage(pageIndex);
    }
    function pagerBarComboBox_SelectedIndexChanged(s, e) {
        reportingGrid.PerformCallback(s.GetSelectedItem().text);
    }
</script>

<table cellpadding="0" cellspacing="0" width="900px">
    <tr>
        <td>
        </td>
    </tr>
    <tr>
        <td style="padding-top: 20px" align="right">
        </td>
    </tr>
    <tr>
        <td>

        </td>
    </tr>
</table>
