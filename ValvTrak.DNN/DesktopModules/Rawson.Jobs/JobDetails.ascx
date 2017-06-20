<%@ Control Language="C#" AutoEventWireup="true" CodeFile="JobDetails.ascx.cs" Inherits="Rawson.Jobs.Details" EnableTheming="true" %>
<%@ Register Assembly="DevExpress.Web.v15.2" Namespace="DevExpress.Web" TagPrefix="dx" %>




<%@ Register Assembly="DevExpress.Web.v15.2" Namespace="DevExpress.Web" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v15.2" Namespace="DevExpress.Web" TagPrefix="dxe" %>

<%@ Register Assembly="DevExpress.Web.v15.2" Namespace="DevExpress.Web" TagPrefix="dxrp" %>
<%@ Register Assembly="DevExpress.Web.v15.2" Namespace="DevExpress.Web" TagPrefix="dxp" %>
<%@ Register assembly="DevExpress.Web.v15.2" namespace="DevExpress.Data.Linq" tagprefix="dx" %>

<style type="text/css">
    .style1
    {
        height: 23px;
    }
</style>

<script type="text/javascript">

    function DevExComboUnboundItem(s, e, itemText, itemValue) {
        if (s.GetSelectedIndex() == -1) {
            s.InsertItem(0, itemText, itemValue);
        }
        else if (s.GetItem(0).value != itemValue) {
            s.InsertItem(0, itemText, itemValue);
        }
        if (s.GetSelectedIndex() == -1) { s.SetSelectedIndex(0); }
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
</script>

<script type="text/javascript">
    function pageBarFirstButton_Click() {
        formGrid.GotoPage(0);
    }
    function pageBarPrevButton_Click() {
        formGrid.PrevPage();
    }
    function pageBarNextButton_Click() {
        formGrid.NextPage();
    }
    function pageBarLastButton_Click(s, e) {
        formGrid.GotoPage(formGrid.cpPageCount - 1);
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
        formGrid.GotoPage(pageIndex);
    }
    function pageBarTextBox_ValueChanged(s, e) {
        var pageIndex = (parseInt(s.GetText()) <= 0) ? 0 : parseInt(s.GetText()) - 1;
        formGrid.GotoPage(pageIndex);
    }
    function pagerBarComboBox_SelectedIndexChanged(s, e) {
        formGrid.PerformCallback(s.GetSelectedItem().text);
    }
</script>
<table cellpadding="0" cellspacing="0" width="910px">
    <tr>
        <td>
            <dxe:ASPxLabel ID="ASPxLabel14" runat="server" Text="Add/Edit Job" Font-Bold="true">
            </dxe:ASPxLabel>
        </td>
    </tr>
    <tr>
        <td>
            <dxrp:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" ShowHeader="False" 
                Width="100%" DefaultButton="btnSave">
                <PanelCollection>
                    <dxp:PanelContent ID="PanelContent1" runat="server">
                        <table cellpadding="0" cellspacing="3px" style="white-space: nowrap;">
                            <tr>
                                <td>
                                    <dxe:ASPxLabel ID="ASPxLabel1" runat="server" Text="Job ID :">
                                    </dxe:ASPxLabel> 
                                </td>
                                <td>
                                    <dxe:ASPxLabel ID="lblJobID" runat="server"> 
                                    </dxe:ASPxLabel>
                                </td>
                                <td>
                                    <dxe:ASPxImage ID="ASPxImage1" runat="server" ImageUrl="~/spacer.gif" AlternateText=" " Width="30px">
                                    </dxe:ASPxImage>
                                </td>
                                <td>
                                    <dxe:ASPxLabel ID="ASPxLabel19" runat="server" Text="DOT # :">
                                    </dxe:ASPxLabel>
                                </td>
                                <td>
                                    <dxe:ASPxTextBox ID="DotNumberTextBox" runat="server" TabIndex="6" 
                                        Width="170px">
                                    </dxe:ASPxTextBox>
                                </td>
                                <td>
                                    <dxe:ASPxImage ID="ASPxImage2" runat="server" ImageUrl="~/spacer.gif" AlternateText=" " Width="10px">
                                    </dxe:ASPxImage>
                                </td>
                                <td>
                                    <dxe:ASPxLabel ID="ASPxLabel2" runat="server" Text="Date Created :">
                                    </dxe:ASPxLabel>
                                </td>
                                <td>
                                    <dxe:ASPxLabel ID="CreationDateLabel" runat="server">
                                    </dxe:ASPxLabel>
                                </td>
                            </tr>
                            <tr>
                                <td class="style1">
                                    <dxe:ASPxLabel ID="ASPxLabel4" runat="server" Text="Client :">
                                    </dxe:ASPxLabel>
                                </td>
                                <td class="style1">
                                    <dxe:ASPxComboBox ID="ClientSelect" runat="server" AutoPostBack="true" 
                                        DataSourceID="ClientDataSource" TextField="DisplayMember" 
                                        ValueField="ValueMember" ValueType="System.Int32" OnSelectedIndexChanged="OnClientSelectedIndexChanged" 
                                        EnableIncrementalFiltering="True" TabIndex="1" EnableCallbackMode="True" 
                                        ShowLoadingPanel="False">
                                        <ClientSideEvents
                                            GotFocus="function(s, e) { if (s.GetValue() == -1) { s.SelectAll(); s.ShowDropDown(); } }" />
                                    </dxe:ASPxComboBox>
                                    <!--SelectedIndexChanged="function(s,e) { locations.PerformCallback(); }"-->
                                </td>
                                <td class="style1"></td>
                                <td class="style1">
                                    <dxe:ASPxLabel ID="ASPxLabel21" runat="server" Text="VR Stamp :">
                                    </dxe:ASPxLabel>
                                </td>
                                <td class="style1">
                                    <dxe:ASPxTextBox ID="VRstampTextBox" runat="server" TabIndex="7" Width="170px">
                                    </dxe:ASPxTextBox>
                                </td>
                                <td class="style1"></td>
                                <td class="style1">
                                    <dxe:ASPxLabel ID="ASPxLabel3" runat="server" Text="Created By :">
                                    </dxe:ASPxLabel>
                                </td>
                                <td class="style1">
                                    <dxe:ASPxLabel ID="CreatedByLabel" runat="server">
                                    </dxe:ASPxLabel>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dxe:ASPxLabel ID="ASPxLabel7" runat="server" Text="Location :">
                                    </dxe:ASPxLabel>
                                </td>
                                <td>
                                    <dxe:ASPxComboBox ID="LocationSelect" runat="server" DataSourceID="LocationDataSource"
                                        TextField="DisplayMember" ValueField="ValueMember" ClientInstanceName="locations"
                                        OnCallback="LocationSelect_Callback" TabIndex="2" AutoPostBack="false" 
                                        EnableIncrementalFiltering="True" ValueType="System.Int32" 
                                        EnableCallbackMode="True" ShowLoadingPanel="False">
                                        <ClientSideEvents
                                            EndCallback="function(s,e) { s.Focus(); }" 
                                            GotFocus="function(s, e) { if (s.GetValue() == -1){ s.SelectAll(); s.ShowDropDown(); } }" />
                                    </dxe:ASPxComboBox>
                                </td>
                                <td></td>
                                <td>
                                    <dxe:ASPxLabel ID="ASPxLabel5" runat="server" Text="Call Date :">
                                    </dxe:ASPxLabel>
                                </td>
                                <td>
                                    <dxe:ASPxDateEdit ID="CallDateEdit" runat="server" TabIndex="8" Width="100px">
                                    </dxe:ASPxDateEdit>
                                </td>
                                <td></td>
                                <td>
                                    <dxe:ASPxLabel ID="ASPxLabel15" runat="server" Text="Assigned To:">
                                    </dxe:ASPxLabel>
                                </td>
                                <td>
                                    <dxe:ASPxComboBox ID="AssignedToSelect" runat="server" 
                                        DataSourceID="EmployeeDataSource" EnableIncrementalFiltering="True" 
                                        IncrementalFilteringMode="StartsWith" TabIndex="12" TextField="DisplayMember" 
                                        ValueField="ValueMember" ValueType="System.Int32">
                                        <ClientSideEvents GotFocus="function(s, e) { s.SelectAll(); s.ShowDropDown(); }" 
                                            Init="function(s, e) { DevExComboUnboundItem(s, e, '-- Assigned To --', -1); }" />
                                    </dxe:ASPxComboBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dxe:ASPxLabel ID="ASPxLabel16" runat="server" Text="Job Type :">
                                    </dxe:ASPxLabel>
                                </td>
                                <td>
                                    <dxe:ASPxComboBox ID="JobTypeSelect" runat="server" 
                                        DataSourceID="JobTypeDataSource" EnableIncrementalFiltering="True" 
                                        IncrementalFilteringMode="StartsWith" TabIndex="3" TextField="DisplayMember" 
                                        ValueField="ValueMember" ValueType="System.Int32">
                                        <ClientSideEvents GotFocus="function(s, e) { s.SelectAll(); s.ShowDropDown(); }" />
                                    </dxe:ASPxComboBox>
                                </td>
                                <td></td>
                                <td>
                                    <dxe:ASPxLabel ID="ASPxLabel8" runat="server" Text="Sched. Date :">
                                    </dxe:ASPxLabel>
                                </td>
                                <td>
                                    <dxe:ASPxDateEdit ID="ServiceDateEdit" runat="server" TabIndex="9" Width="100px">
                                    </dxe:ASPxDateEdit>
                                </td>
                                <td></td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    <dxe:ASPxLabel ID="ASPxLabel10" runat="server" Text="SO # :">
                                    </dxe:ASPxLabel>
                                </td>
                                <td>
                                    <dxe:ASPxTextBox ID="SalesOrderNumTextBox" runat="server" TabIndex="4" 
                                        Width="170px">
                                    </dxe:ASPxTextBox>
                                </td>
                                <td></td>
                                <td>
                                    <dxe:ASPxLabel ID="ASPxLabel11" runat="server" Text="Date Completed :">
                                    </dxe:ASPxLabel>
                                </td>
                                <td>
                                    <dxe:ASPxDateEdit ID="CompletionDateEdit" runat="server" OnValidation="CompletionDateEdit_Validation" TabIndex="10" Width="100px">
                                    </dxe:ASPxDateEdit>
                                </td>
                                <td></td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    <dxe:ASPxLabel ID="ASPxLabel23" runat="server" Text="SAP WO :">
                                    </dxe:ASPxLabel>
                                </td>
                                <td>
                                    <dxe:ASPxTextBox ID="txtSapWoNum" runat="server" TabIndex="5" Width="170px">
                                    </dxe:ASPxTextBox>
                                </td>
                                <td></td>
                                <td>
                                    <dxe:ASPxLabel ID="ASPxLabel13" runat="server" Text="Job Status :">
                                    </dxe:ASPxLabel>
                                </td>
                                <td>
                                    <dxe:ASPxComboBox ID="JobStatusSelect" runat="server" 
                                        DataSourceID="JobStatusDataSource" EnableIncrementalFiltering="True" 
                                        IncrementalFilteringMode="StartsWith" TabIndex="11" TextField="DisplayMember" 
                                        ValueField="ValueMember" ValueType="System.Int32">
                                        <ClientSideEvents GotFocus="function(s, e) { s.SelectAll(); s.ShowDropDown(); }" />
                                    </dxe:ASPxComboBox>
                                </td>
                                <td></td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                                <td>&nbsp;</td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                                <td></td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                                <td></td>
                                <td align="right" colspan="2">
                                    <dxe:ASPxButton ID="btnSave" runat="server" AutoPostBack="False" TabIndex="13" 
                                        Text="Save" Width="200px" >
                                        <ClientSideEvents Click="function(s,e) { 
                                            saveAction.PerformCallback(); }" />
                                    </dxe:ASPxButton>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td colspan="2" align="right">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td colspan="8">&nbsp;</td>
                            </tr>
                        </table>
                    </dxp:PanelContent>
                </PanelCollection>
            </dxrp:ASPxRoundPanel>
        </td>
    </tr>
    <tr>
        <td>
            <dxe:ASPxImage ID="ASPxImage3" runat="server" ImageUrl="~/spacer.gif" AlternateText=" " Height="10px">
            </dxe:ASPxImage>
        </td>
    </tr>
    <tr>
        <td>
            <table cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td align="left">
                        <dxe:ASPxLabel ID="FormListLabel" runat="server" Text="Forms" Font-Bold="true">
                        </dxe:ASPxLabel>
                    </td>
                    <td align="right">
                        <dxe:ASPxHyperLink ID="lnkNew" runat="server" Text="Add New Form" 
                            EnableClientSideAPI="true" ClientInstanceName="lnkNew" 
                            TabIndex="14" >
                        </dxe:ASPxHyperLink>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <dxwgv:ASPxGridView ID="ServiceDetailsGrid" runat="server" AutoGenerateColumns="False"
                            DataSourceID="ServiceDetailDataSource" Width="100%" ClientInstanceName="formGrid"
                            oncustombuttoncallback="ServiceDetailsGrid_CustomButtonCallback" 
                            EnableCallbackCompression="False" EnableCallBacks="true" 
                            oncustomcallback="ServiceDetailsGrid_CustomCallback" 
                            ondatabound="ServiceDetailsGrid_DataBound" TabIndex="18">
                            <ClientSideEvents 
                                CustomButtonClick="function(s,e) { e.processOnServer = true; }"
                                BeginCallback="function(s,e){ s.cpShowReport = false; }"
                                EndCallback="function (s,e) { OnPrintSetupEnd(s,e); }" 
                            />
                            <SettingsLoadingPanel Mode="Disabled" />
                            <SettingsPager Position="Top"></SettingsPager>
                            <Columns>
                                <dxwgv:GridViewCommandColumn ButtonType="Image" VisibleIndex="0" Caption=" " Width="24px">
                                    <CustomButtons>
                                        <dxwgv:GridViewCommandColumnCustomButton ID="btnEdit" Visibility="AllDataRows" Text="Edit">
                                            <Image Url="~/images/edit.gif" AlternateText="Edit"  Height="16px" Width="16px" />
                                        </dxwgv:GridViewCommandColumnCustomButton>
                                    </CustomButtons>
                                </dxwgv:GridViewCommandColumn>
                                <dxwgv:GridViewCommandColumn  ButtonType="Image" VisibleIndex="0" Caption=" " Width="24px">
                                    <CustomButtons>
                                        <dxwgv:GridViewCommandColumnCustomButton ID="btnPrint" Visibility="AllDataRows">
                                            <Image Url="~/images/print.gif" AlternateText="Print"  Height="16px" Width="16px" />
                                        </dxwgv:GridViewCommandColumnCustomButton>
                                    </CustomButtons>
                                </dxwgv:GridViewCommandColumn>
                                <dxwgv:GridViewDataTextColumn Caption="ID" FieldName="ID" Name="ID" VisibleIndex="0">
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="ServiceItemID" FieldName="ServiceItemID" Name="ServiceItemID"
                                    VisibleIndex="1">
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Job Type ID" FieldName="JobTypeID" Name="JobTypeID"
                                    VisibleIndex="2" Visible="False">
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Serial #" FieldName="SerialNum" Name="SerialNum"
                                    VisibleIndex="3">
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Result" FieldName="Result" Name="Result" VisibleIndex="4">
                                </dxwgv:GridViewDataTextColumn>
                            </Columns>
                        </dxwgv:ASPxGridView>
                        <asp:LinqDataSource ID="ServiceDetailDataSource" runat="server" OnSelecting="ServiceDetailDataSource_Selecting">
                        </asp:LinqDataSource>
                        <dx:ASPxGlobalEvents ID="ASPxGlobalEvents1" runat="server">
                            <ClientSideEvents BeginCallback="function(s,e) { lpanel.Show(); }"
                                 EndCallback="function(s,e){ lpanel.Hide(); }" />
                        </dx:ASPxGlobalEvents>
                        <dx:ASPxLoadingPanel ID="ASPxLoadingPanel1" runat="server" ClientInstanceName="lpanel" Modal="true">
                            <ClientSideEvents Init="function(s,e){ s.SetText('Loading....'); }" />
                        </dx:ASPxLoadingPanel>
                        <asp:LinqDataSource ID="ClientDataSource" runat="server" OnSelecting="ClientDataSource_Selecting">
                        </asp:LinqDataSource>
                        <asp:LinqDataSource ID="LocationDataSource" runat="server" OnSelecting="LocationDataSource_Selecting">
                        </asp:LinqDataSource>
                        <asp:LinqDataSource ID="EmployeeDataSource" runat="server" OnSelecting="EmployeeDataSource_Selecting">
                        </asp:LinqDataSource>
                        <asp:LinqDataSource ID="JobTypeDataSource" runat="server" OnSelecting="JobTypeDataSource_Selecting">
                        </asp:LinqDataSource>
                        <asp:LinqDataSource ID="JobStatusDataSource" runat="server" OnSelecting="JobStatusDataSource_Selecting">
                        </asp:LinqDataSource>
                        <dx:ASPxCallback ID="SaveAction" runat="server" 
                            ClientInstanceName="saveAction" OnCallback="SaveAction_Callback" >
                            <ClientSideEvents EndCallback="function(s,e) { 
                                                    if (s.cpHasErrors) {
                                                        validation.SetContentHtml(s.cpErrorMessage);
                                                        validation.Show();
                                                    }
                                                    else
                                                    { 
                                                        validation.Hide();
                                                    } }"  />
                        </dx:ASPxCallback>
                        <dx:ASPxPopupControl ID="pcValidation" runat="server" ClientInstanceName="validation"
                                Modal="false" ShowFooter="false" HeaderText="Validation Errrors" CloseAction="CloseButton" 
                                AllowDragging="true" AllowResize="true" AutoUpdatePosition="true" 
                                PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter">
                            <ContentCollection>
                                <dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
                                </dx:PopupControlContentControl>
                            </ContentCollection>
                        </dx:ASPxPopupControl>
                        <dx:ASPxPopupControl ID="PDFPopup" runat="server" 
                            ClientInstanceName="pdfPopper" EnableClientSideAPI="True" 
                            PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" 
                            AllowDragging="True" AllowResize="true" ShowPageScrollbarWhenModal="True" 
                            CloseAction="CloseButton" AutoUpdatePosition="True" Modal="False" HeaderText="Valve Test Reports (....may take several moments to load.)" 
                            ShowSizeGrip="True" Width="600px" Height="500px" ShowLoadingPanel="false" RenderIFrameForPopupElements="False" >
                            <ClientSideEvents Closing="function (s,e) { s.SetContentUrl(''); }" />
                            <ContentStyle VerticalAlign="Top"></ContentStyle>
                            <ContentCollection>
                                <dx:PopupControlContentControl ID="PopupControlContentControl3" runat="server"  >
                                    <asp:Image ImageUrl="~/images/ajax-loader.gif" runat="server" />
                                </dx:PopupControlContentControl>
                            </ContentCollection>
                        </dx:ASPxPopupControl>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>

