<%@ Control Language="C#" AutoEventWireup="true" CodeFile="GreasingRecordForm.ascx.cs" Inherits="Rawson.GreasingRecords.GreasingRecordForm" EnableTheming="true" %>
<%@ Register Assembly="DevExpress.Web.v11.2"
    Namespace="DevExpress.Web.ASPxLoadingPanel" TagPrefix="dx" %>
    <%@ Register Assembly="DevExpress.Web.ASPxGridView.v11.2"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
    <%@ Register Assembly="DevExpress.Web.v11.2"
    Namespace="DevExpress.Web.ASPxGlobalEvents" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v11.2"
    Namespace="DevExpress.Web.ASPxCallback" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v11.2"
    Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dxrp" %>
<%@ Register Assembly="DevExpress.Web.v11.2"
    Namespace="DevExpress.Web.ASPxCallbackPanel" TagPrefix="dxcp" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v11.2"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v11.2"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dxpc" %>
<%@ Register Assembly="DevExpress.Web.v11.2"
    Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dxp" %>
<%@ Register assembly="DevExpress.Web.v11.2" namespace="DevExpress.Web.ASPxPanel" tagprefix="dxp" %>

<style type="text/css">
    .style1
    {
        width: 125px;
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

    function OnConfirmCustomButtonClick(grID) {

        return confirm("Do you wish to delete greasing record item " + grID + "?");
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
            <dxe:ASPxLabel ID="ASPxLabel3" runat="server" Text="Add/Edit Greasing Record" Font-Bold="true">
            </dxe:ASPxLabel>
        </td>
    </tr>
    <tr>
        <td>
            <dxrp:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" ShowHeader="False" 
                Width="100%" DefaultButton="btnSave">
                <PanelCollection>
                    <dxp:PanelContent ID="PanelContent1" runat="server">
                        <table style="white-space: nowrap;">
                            <tr>
                                <td>
                                    <dxe:ASPxLabel ID="ASPxLabel1" runat="server" Text="Greasing Record ID :">
                                    </dxe:ASPxLabel>
                                </td>
                                <td>
                                    <dxe:ASPxLabel ID="GreasingRecordIDLabel" runat="server" Width="170px">
                                    </dxe:ASPxLabel>
                                </td>
                                <td>
                                    <dxe:ASPxImage ID="ASPxImage1" runat="server" ImageUrl="~/spacer.gif" Width="10PX">
                                    </dxe:ASPxImage>
                                </td>
                                <td>
                                    <dxe:ASPxLabel ID="ASPxLabel2" runat="server" Text="Technician :">
                                    </dxe:ASPxLabel>
                                </td>
                                <td>
                                    <dxe:ASPxLabel ID="TechLabel" runat="server">
                                    </dxe:ASPxLabel>
                                </td>
                                <td>
                                    <dxe:ASPxImage ID="ASPxImage2" runat="server" ImageUrl="~/spacer.gif" Width="10PX">
                                    </dxe:ASPxImage>
                                </td>
                                <td>
                                    <dxe:ASPxLabel ID="ASPxLabel4" runat="server" Text="Date :">
                                    </dxe:ASPxLabel>
                                </td>
                                <td class="style1">
                                    <dxe:ASPxLabel ID="CompletionDateLabel" runat="server">
                                    </dxe:ASPxLabel>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dxe:ASPxLabel ID="ASPxLabel5" runat="server" Text="Job # :">
                                    </dxe:ASPxLabel>
                                </td>
                                <td>
                                    <dxe:ASPxLabel ID="JobNumLabel" runat="server">
                                    </dxe:ASPxLabel>
                                </td>
                                <td></td>
                                <td>
                                    <dxe:ASPxLabel ID="ASPxLabel8" runat="server" Text="SO # :">
                                    </dxe:ASPxLabel>
                                </td>
                                <td>
                                    <dxe:ASPxLabel ID="SOLabel" runat="server">
                                    </dxe:ASPxLabel>
                                </td>
                                <td></td>
                                <td>
                                    <dxe:ASPxLabel ID="ASPxLabel11" runat="server" Text="SAP W/O:">
                                    </dxe:ASPxLabel>
                                </td>
                                <td class="style1">
                                    <dxe:ASPxLabel ID="lblSapWoNum" runat="server">
                                    </dxe:ASPxLabel>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dxe:ASPxLabel ID="ASPxLabel13" runat="server" Text="Client :">
                                    </dxe:ASPxLabel>
                                </td>
                                <td>
                                    <dxe:ASPxLabel ID="lblClientName" runat="server">
                                    </dxe:ASPxLabel>
                                </td>
                                <td></td>
                                <td>
                                    <dxe:ASPxLabel ID="ASPxLabel9" runat="server" Text="Loc./Well :">
                                    </dxe:ASPxLabel>
                                </td>
                                <td>
                                    <dxe:ASPxLabel ID="LocationLabel" runat="server">
                                    </dxe:ASPxLabel>
                                </td>
                                <td></td>
                                <td>
                                    <dxe:ASPxLabel ID="ASPxLabel10" runat="server" Text=" FSR# :">
                                    </dxe:ASPxLabel>
                                </td>
                                <td class="style1">
                                    <dxe:ASPxTextBox ID="FSRTextBox" runat="server" Width="170px" TabIndex="1">
                                    </dxe:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dxe:ASPxLabel ID="ASPxLabel7" runat="server" Text="Field :">
                                    </dxe:ASPxLabel>
                                </td>
                                <td>
                                    <dxe:ASPxTextBox ID="FieldTextBox" runat="server" TabIndex="2" Width="170px">
                                    </dxe:ASPxTextBox>
                                </td>
                                <td></td>
                                <td>
                                    <dxe:ASPxLabel ID="ASPxLabel6" runat="server" Text="Pipeline Segment :">
                                    </dxe:ASPxLabel>
                                </td>
                                <td>
                                    <dxe:ASPxTextBox ID="txtPipeLineSegment" runat="server" TabIndex="3" 
                                        Width="170px">
                                    </dxe:ASPxTextBox>
                                </td>
                                <td></td>
                                <td>
                                    <dxe:ASPxLabel ID="ASPxLabel12" runat="server" Text="SAP PSV :">
                                    </dxe:ASPxLabel>
                                </td>
                                <td class="style1">
                                    <dxe:ASPxTextBox ID="txtSapPsv" runat="server" TabIndex="4" Width="170px">
                                    </dxe:ASPxTextBox>
                                </td>
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
                                <td>
                                    &nbsp;</td>
                                <td class="style1">
                                    &nbsp;</td>
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
                                <td>
                                    &nbsp;</td>
                                <td class="style1">
                                    <dxe:ASPxButton ID="btnSave" runat="server" AutoPostBack="False" TabIndex="5" 
                                        Text="Save" Width="170px">
                                        <ClientSideEvents Click="function(s,e){ saveAction.PerformCallback(); }" />
                                    </dxe:ASPxButton>
                                </td>
                            </tr>
                        </table>
                    </dxp:PanelContent>
                </PanelCollection>
            </dxrp:ASPxRoundPanel>
        </td>
    </tr>
    <tr>
        <td>
            <dxe:ASPxImage ID="ASPxImage3" runat="server" ImageUrl="~/spacer.gif" Height="10PX">
            </dxe:ASPxImage>
        </td>
    </tr>
    <tr>
        <td align="right">
            <dxe:ASPxHyperLink ID="lnkNewItem" runat="server" Text="Add New" TabIndex="6" ClientInstanceName="lnkNew">
            </dxe:ASPxHyperLink>
        </td>
    </tr>
    <tr>
        <td>
            <dxwgv:ASPxGridView ID="GreasingItemsGrid" runat="server" 
                AutoGenerateColumns="False" DataSourceID="GreasingRecordItemDataSource" 
                KeyFieldName="GreasingRecordItemID" ClientInstanceName="grid"
                EnableCallbackCompression="False" EnableCallBacks="true"
                oncustombuttoncallback="GreasingItemsGrid_CustomButtonCallback" 
                oncustomcallback="GreasingItemsGrid_CustomCallback" 
                ondatabound="GreasingItemsGrid_DataBound" 
                oncustomcolumndisplaytext="GreasingItemsGrid_CustomColumnDisplayText" 
                Width="100%" TabIndex="7" >
                <Settings ShowHorizontalScrollBar="true" />
                <SettingsLoadingPanel Mode="Disabled" />
                <ClientSideEvents CustomButtonClick="function(s,e) { e.processOnServer = true; if (e.buttonID == 'btnDelete') { e.processOnServer = OnConfirmCustomButtonClick(grid.GetRowKey(e.visibleIndex)); } }" />
                <Columns>
                    <dxwgv:GridViewCommandColumn ButtonType="Image" VisibleIndex="0" Caption=" " Width="24px">
                        <CustomButtons>
                            <dxwgv:GridViewCommandColumnCustomButton ID="btnEdit" Visibility="AllDataRows" Text="Edit">
                                <Image Url="~/images/edit.gif" AlternateText="Edit"  Height="16px" Width="16px" />
                            </dxwgv:GridViewCommandColumnCustomButton>
                        </CustomButtons>
                    </dxwgv:GridViewCommandColumn>
                    <dxwgv:GridViewCommandColumn ButtonType="Image" Caption=" " Width="24px" VisibleIndex="1">
                        <CustomButtons>
                            <dxwgv:GridViewCommandColumnCustomButton ID="btnDelete" Text="Delete" Visibility="AllDataRows">
                                <Image Url="../../images/delete.gif" Height="16px" Width="16px" AlternateText="Delete" />
                            </dxwgv:GridViewCommandColumnCustomButton>
                        </CustomButtons>
                    </dxwgv:GridViewCommandColumn>
                    <dxwgv:GridViewDataTextColumn FieldName="GreasingRecordItemID" ReadOnly="True" VisibleIndex="2">
                        <CellStyle Wrap="False"></CellStyle>
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn FieldName="GreasingRecordID" VisibleIndex="3" 
                        Visible="False">
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn FieldName="ServiceItemID" VisibleIndex="4" 
                        Visible="False">
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn FieldName="ValveLocation" VisibleIndex="5">
                         <CellStyle Wrap="False"></CellStyle>
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn FieldName="ActuatorInspected" VisibleIndex="6" 
                        Caption="Actuator Inspected" UnboundType="String">
                         <CellStyle Wrap="False"></CellStyle>
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn FieldName="ActuatorLubed" VisibleIndex="7" 
                        Caption="Actuator Lubed" UnboundType="String">
                         <CellStyle Wrap="False"></CellStyle>
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn FieldName="PercentCycled" VisibleIndex="8">
                         <CellStyle Wrap="False"></CellStyle>
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn FieldName="ValveSecured" VisibleIndex="9" 
                        Caption="Valve Secured" UnboundType="String">
                         <CellStyle Wrap="False"></CellStyle>
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn FieldName="FlangeOrScrew" VisibleIndex="10">
                         <CellStyle Wrap="False"></CellStyle>
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn FieldName="EaseOfOperation" VisibleIndex="11">
                         <CellStyle Wrap="False"></CellStyle>
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn FieldName="SeatsChecked" VisibleIndex="12" 
                        Caption="Seats Checked" UnboundType="String" Visible="False">
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn FieldName="SeatsLubed" VisibleIndex="13" 
                        Caption="Seats Lubed" UnboundType="String" Visible="False">
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn FieldName="Leaking" VisibleIndex="14" 
                        Caption="Leaking" UnboundType="String" Visible="False">
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn FieldName="LubeTypeID" VisibleIndex="15" 
                        Caption="Lube Type" UnboundType="String">
                         <CellStyle Wrap="False"></CellStyle>
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn FieldName="AmountInjected" VisibleIndex="16" 
                        Visible="False">
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn FieldName="Notes" VisibleIndex="17" 
                        Visible="False">
                    </dxwgv:GridViewDataTextColumn>
                </Columns>
                <SettingsPager PageSize="10" Position="Top">
                </SettingsPager>
            </dxwgv:ASPxGridView>
            <asp:LinqDataSource ID="GreasingRecordItemDataSource" runat="server" onselecting="GreasingRecordItemDataSource_Selecting">
            </asp:LinqDataSource>
        </td>
    </tr>
    <tr>
        <td>
            <dx:ASPxGlobalEvents ID="ASPxGlobalEvents1" runat="server">
                <ClientSideEvents BeginCallback="function(s,e) { lpanel.Show(); }"
                        EndCallback="function(s,e){ lpanel.Hide(); }" />
            </dx:ASPxGlobalEvents>
            <dx:ASPxLoadingPanel ID="ASPxLoadingPanel1" runat="server" ClientInstanceName="lpanel" Modal="true">
                <ClientSideEvents Init="function(s,e){ s.SetText('Loading....'); }" />
            </dx:ASPxLoadingPanel>
            <dx:ASPxCallback ID="SaveAction" runat="server" ClientInstanceName="saveAction" oncallback="SaveAction_Callback">
                <ClientSideEvents EndCallback="function(s,e) { if (s.cpHasErrors) {
                                                                    validation.SetContentHtml(s.cpErrorMessage);
                                                                    validation.Show();
                                                                }
                                                                else {
                                                                    validation.Hide();
                                                                } }"  />
            </dx:ASPxCallback>
            <dxpc:ASPxPopupControl ID="pcValidation" runat="server" ClientInstanceName="validation"
                    Modal="false" ShowFooter="false" HeaderText="Validation Errrors" CloseAction="CloseButton" 
                    AllowDragging="true" AllowResize="true" AutoUpdatePosition="true" 
                    PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter">
                <ContentCollection>
                    <dxpc:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
                    </dxpc:PopupControlContentControl>
                </ContentCollection>
            </dxpc:ASPxPopupControl>
        </td>
    </tr>
</table>

