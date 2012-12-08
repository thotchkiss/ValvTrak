<%@ Control Language="C#" AutoEventWireup="true" CodeFile="GreasingRecordsSearch.ascx.cs" Inherits="Rawson.GreasingRecords.GreasingRecordsSearch" EnableTheming="true" %>
<%@ Register Assembly="DevExpress.Web.v12.1" Namespace="DevExpress.Web.ASPxLoadingPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.1" Namespace="DevExpress.Web.ASPxCallbackPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.1" Namespace="DevExpress.Web.ASPxGlobalEvents" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.1" Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v12.1.Export" Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v12.1" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v12.1" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v12.1" Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dxrp" %>
<%@ Register Assembly="DevExpress.Web.v12.1" Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dxp" %>
<%@ Register assembly="DevExpress.Web.v12.1" namespace="DevExpress.Web.ASPxCallback" tagprefix="dx" %>

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

    function OnConfirmCustomButtonClick(grID) {

        return confirm("All related greasing items will also be deleted.\r\n\Do you wish to delete greasing record " + grID + "?");
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
<div style="width: 910px">
    <dxrp:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" ShowHeader="False" Width="100%">
        <PanelCollection>
            <dxp:PanelContent ID="PanelContent1" runat="server">
                <!-- Top Criteria -->
                <table style="white-space: nowrap;">
                    <tr>
                        <td>
                            <dxe:ASPxLabel ID="ASPxLabel1" runat="server" Text="Client :">
                            </dxe:ASPxLabel>
                        </td>
                        <td>
                            <dxe:ASPxComboBox ID="ClientFilter" runat="server" DataSourceID="ClientDataSource"
                                TextField="DisplayMember" ValueField="ValueMember" AutoPostBack="False" 
                                EnableIncrementalFiltering="True" ValueType="System.Int32" Width="170px" 
                                EnableCallbackMode="True" ShowLoadingPanel="False"> 
                                <ClientSideEvents SelectedIndexChanged="function(s,e) { locations.PerformCallback(s.GetValue()); }" />
                            </dxe:ASPxComboBox>
                        </td>
                        <td rowspan="6">
                            <dxe:ASPxImage ID="ASPxImage1" runat="server" ImageUrl="~/spacer.gif" Width="10px">
                            </dxe:ASPxImage>
                        </td>
                        <td>
                            <dxe:ASPxLabel ID="ASPxLabel2" runat="server" Text="Job ID :">
                            </dxe:ASPxLabel>
                        </td>
                        <td>
                            <dxe:ASPxTextBox ID="JobIDFilter" runat="server" Width="170px" MaxLength="7" 
                                NullText="-- Enter Job ID --">
                            </dxe:ASPxTextBox>
                        </td>
                        <td rowspan="6" valign="top">
                            <table>
                                <tr>
                                    <td>
                                        <dxe:ASPxImage ID="ASPxImage2" runat="server" ImageUrl="~/spacer.gif" Width="10px">
                                        </dxe:ASPxImage>
                                    </td>
                                    <td>
                                        <table>
                                            <tr>
                                                <td colspan="2" style="text-align: center">
                                                    <dxe:ASPxLabel ID="ASPxLabel3" runat="server" Text="Date Greased" Font-Bold="true">
                                                    </dxe:ASPxLabel>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <dxe:ASPxLabel ID="ASPxLabel4" runat="server" Text="Start Date :" Width="80px">
                                                    </dxe:ASPxLabel>
                                                </td>
                                                <td>
                                                    <dxe:ASPxDateEdit ID="TestedStartDate" runat="server" Width="150px" 
                                                        NullText="-- Enter Start Date --">
                                                    </dxe:ASPxDateEdit>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <dxe:ASPxLabel ID="ASPxLabel5" runat="server" Text="End Date :">
                                                    </dxe:ASPxLabel>
                                                </td>
                                                <td>
                                                    <dxe:ASPxDateEdit ID="TestedEndDate" runat="server" Width="150px" 
                                                        NullText="-- Enter Ending Date --">
                                                    </dxe:ASPxDateEdit>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <dxe:ASPxLabel ID="ASPxLabel6" runat="server" Text="Location :">
                            </dxe:ASPxLabel>
                        </td>
                        <td>
                            <dxe:ASPxComboBox ID="LocationFilter" runat="server" DataSourceID="LocationDataSource"
                                TextField="DisplayMember" ValueField="ValueMember" ClientInstanceName="locations" 
                                EnableIncrementalFiltering="True" OnCallback="LocationFilter_Callback" 
                                ValueType="System.Int32" Width="170px" EnableCallbackMode="True" 
                                ShowLoadingPanel="False">
                            </dxe:ASPxComboBox>
                        </td>
                        <td>
                            <dxe:ASPxLabel ID="ASPxLabel10" runat="server" Text="Greasing ID :">
                            </dxe:ASPxLabel>
                        </td>
                        <td>
                            <dxe:ASPxTextBox ID="txtGreasingRecordID" runat="server" Width="170px" 
                                NullText="-- Enter Greasing ID --">
                            </dxe:ASPxTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <dxe:ASPxLabel ID="ASPxLabel8" runat="server" Text="SAP WO :">
                            </dxe:ASPxLabel>
                        </td>
                        <td>
                            <dxe:ASPxTextBox ID="SapWoFilter" runat="server" Width="170px" 
                                NullText="-- Enter Customer WO --">
                            </dxe:ASPxTextBox>
                        </td>
                        <td>
                            <dxe:ASPxLabel ID="ASPxLabel9" runat="server" Text="Serial # :">
                            </dxe:ASPxLabel>
                        </td>
                        <td>
                            <dxe:ASPxTextBox ID="SerialNumFilter" runat="server" 
                                NullText="-- Enter Serial No. --" Width="170px">
                            </dxe:ASPxTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <dxe:ASPxLabel ID="ASPxLabel11" runat="server" Text="Pipeline Seg. :">
                            </dxe:ASPxLabel>
                        </td>
                        <td>
                            <dxe:ASPxTextBox ID="PsvFilter" runat="server" Width="170px" 
                                NullText="-- Enter Pipeline / PSV --">
                            </dxe:ASPxTextBox>
                        </td>
                        <td>
                            <dxe:ASPxLabel ID="ASPxLabel7" runat="server" Text="FSR # :">
                            </dxe:ASPxLabel>
                        </td>
                        <td>
                            <dxe:ASPxTextBox ID="FsrNumFilter" runat="server" NullText="- Enter FSR No. --" 
                                Width="170px">
                            </dxe:ASPxTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="6" align="right">
                            <dxe:ASPxButton ID="ASPxButton1" runat="server" Text="Search" AutoPostBack="false" Width="170px">
                                <ClientSideEvents Click="function(s,e){ reportingGrid.PerformCallback(); }" /> 
                            </dxe:ASPxButton>
                        </td>
                    </tr>
                </table>
                <!-- Bottom Criteria -->
                <asp:LinqDataSource ID="ClientDataSource" runat="server" OnSelecting="ClientDataSource_Selecting">
                </asp:LinqDataSource>
                <asp:LinqDataSource ID="LocationDataSource" runat="server" OnSelecting="LocationDataSource_Selecting">
                </asp:LinqDataSource>
                <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server">
                </dx:ASPxGridViewExporter>
            </dxp:PanelContent>
        </PanelCollection>
    </dxrp:ASPxRoundPanel>
    <br />
    <table cellpadding="0" cellspacing="0" border="0" width="100%">
        <tr>
            <td align="right">
                <table cellspacing="5" cellpadding="0" border="0">
                    <tr>
                         <td>
                             <dxe:ASPxButton ID="btnSelectAllOnPage" runat="server" 
                                 Text="Select all on the page" UseSubmitBehavior="False" AutoPostBack="false" 
                                 Wrap="False">
                                 <ClientSideEvents Click="function(s, e) { reportingGrid.SelectAllRowsOnPage(); }"/>
                             </dxe:ASPxButton>
                         </td>
                         <td>
                             <dxe:ASPxButton ID="btnUnselectAllOnPage" runat="server" 
                                 Text="Unselect all on the page" UseSubmitBehavior="False" AutoPostBack="false" 
                                 Wrap="False">
                                 <ClientSideEvents Click="function(s, e) { reportingGrid.UnselectAllRowsOnPage(); }"/>
                             </dxe:ASPxButton>
                         </td>
                        <td>
                            <dxe:ASPxButton ID="printSelectedButton" runat="server" Text="Print Selected" 
                                Wrap="False" AutoPostBack="False">
                                <ClientSideEvents Click="function(s,e){ reportingGrid.GetSelectedFieldValues('GreasingRecordID', OnGridGetSelectedValues ); }" />
                            </dxe:ASPxButton>
                        </td>
                        <td>
                            <dxe:ASPxButton ID="printAllButton" runat="server" Text="Print All" 
                                Wrap="False" AutoPostBack="False">
                                <ClientSideEvents Click="function(s, e) { printAll.PerformCallback(); }" />
                            </dxe:ASPxButton>
                        </td>
                        <td>
                            <dxe:ASPxButton ID="btnExportExcel" runat="server" Text="Export to Excel" 
                                onclick="btnExportExcel_Click" Wrap="False">
                            </dxe:ASPxButton>
                        </td>
                    </tr>
                </table>

            </td>
        </tr>
    </table>
    <dxwgv:ASPxGridView ID="reportingGrid" runat="server" 
        AutoGenerateColumns="False" DataSourceID="gridLinqDataSource" 
        KeyFieldName="GreasingRecordID" EnableRowsCache="false"
        ClientInstanceName="reportingGrid" Width="100%" 
        onbeforecolumnsortinggrouping="reportingGrid_BeforeColumnSortingGrouping" 
        oncustomcallback="reportingGrid_CustomCallback" 
        ondatabound="reportingGrid_DataBound" 
        onpageindexchanged="reportingGrid_PageIndexChanged" 
        oncustombuttoncallback="reportingGrid_CustomButtonCallback">
        <ClientSideEvents CustomButtonClick="function(s,e) { e.processOnServer = true; if (e.buttonID == 'btnDelete') { e.processOnServer = OnConfirmCustomButtonClick(reportingGrid.GetRowKey(e.visibleIndex)); } }"
            BeginCallback="function(s,e) { s.cpShowReport = false;}"  
            EndCallback="function (s,e) { OnPrintSetupEnd(s,e); }" />
        <Columns>
            <dxwgv:GridViewCommandColumn VisibleIndex="0" ShowSelectCheckbox="true" Caption=" " Width="32px">
                <ClearFilterButton Visible="True">
                </ClearFilterButton>
            </dxwgv:GridViewCommandColumn>
             <dxwgv:GridViewCommandColumn ButtonType="Image" VisibleIndex="1" Caption=" " Width="32px" Name="colEdit">
                <CustomButtons>
                    <dxwgv:GridViewCommandColumnCustomButton ID="btnEdit" Visibility="AllDataRows" Text="Edit">
                        <Image Url="~/images/edit.gif" AlternateText="Edit"  Height="16px" Width="16px" />
                    </dxwgv:GridViewCommandColumnCustomButton>
                </CustomButtons>
            </dxwgv:GridViewCommandColumn>
            <dxwgv:GridViewCommandColumn ButtonType="Image" Caption=" " Width="24px" VisibleIndex="2">
                        <CustomButtons>
                            <dxwgv:GridViewCommandColumnCustomButton ID="btnDelete" Text="Delete" Visibility="AllDataRows">
                                <Image Url="../../images/delete.gif" Height="16px" Width="16px" AlternateText="Delete" />
                            </dxwgv:GridViewCommandColumnCustomButton>
                        </CustomButtons>
                    </dxwgv:GridViewCommandColumn>
            <dxwgv:GridViewCommandColumn  ButtonType="Image" VisibleIndex="3" Caption=" " Width="32px">
                <CustomButtons>
                    <dxwgv:GridViewCommandColumnCustomButton ID="btnPrint" Visibility="AllDataRows">
                        <Image Url="~/images/print.gif" AlternateText="Print"  Height="16px" Width="16px" />
                    </dxwgv:GridViewCommandColumnCustomButton>
                </CustomButtons>
            </dxwgv:GridViewCommandColumn>
            <dxwgv:GridViewDataHyperLinkColumn VisibleIndex="4" Name="colJobID" Caption="JobID">
                <DataItemTemplate>
                    <%# CanEdit == true ? "<a href='" + DotNetNuke.Common.Globals.NavigateURL(61, "Job", "mid=393", "JobID=" + Eval("GreasingRecord.JobID")) + "'>" + Eval("GreasingRecord.JobID") + "</a>" : Eval("GreasingRecord.JobID")%>
                </DataItemTemplate>
            </dxwgv:GridViewDataHyperLinkColumn>
            <dxwgv:GridViewDataTextColumn FieldName="GreasingRecord.Job.ClientLocation.Name" VisibleIndex="5"
                Caption="Client Field Office">
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataDateColumn FieldName="GreasingRecord.Job.CompletionDate" VisibleIndex="6"
                Caption="Date">
            </dxwgv:GridViewDataDateColumn>
            <dxwgv:GridViewDataTextColumn FieldName="GreasingRecord.PipelineSegment" VisibleIndex="7"
                Caption="Pipeline Segment">
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="GreasingRecord.Field" VisibleIndex="8"
                Caption="Field">
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="GreasingRecord.Job.ClientLocation.Name" VisibleIndex="9"
                Caption="Location/Well Name">
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="GreasingRecord.Job.SapWoNum" VisibleIndex="10"
                Caption="SAP W/O">
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="GreasingRecord.SapPSV" VisibleIndex="11"
                Caption="Wellhead SAP PSV">
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="GreasingRecord.Job.SalesOrderNum" VisibleIndex="14"
                Caption="S/O Num">
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="GreasingRecord.FSRNum" VisibleIndex="15"
                Caption="FSR Num">
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="ServiceItem.SerialNum" VisibleIndex="16"
                Caption="Serial Num">
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="ServiceItem.SapEquipNum" VisibleIndex="17"
                Caption="SAP Num">
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="ServiceItem.ServiceItemType.Type" VisibleIndex="18"
                Caption="Valve Type">
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="ServiceItem.ManufacturerModel.Manufacturer.Name" VisibleIndex="21"
                Caption="Make">
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="ServiceItem.ManufacturerModel.Model" VisibleIndex="22"
                Caption="Model Num">
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="ServiceItem.InletSize" VisibleIndex="24"
                Caption="Inlet Size">
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="ServiceItem.InletFlangeRating" VisibleIndex="25"
                Caption="Inlet Rating">
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="ServiceItem.OutletSize" VisibleIndex="26"
                Caption="Outlet Size">
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="ServiceItem.OutletFlangeRating" VisibleIndex="27"
                Caption="Outlet Rating">
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="GreasingRecord.Job.ClientLocation.Longitude" VisibleIndex="28"
                Caption="Longitude">
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="GreasingRecord.Job.ClientLocation.Latitude" VisibleIndex="29"
                Caption="Latitude">
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataComboBoxColumn FieldName="ActuatorInspected" VisibleIndex="30" 
                Caption="Actuator Inspected">
                <PropertiesComboBox ValueType="System.Int32">
                    <Items>
                        <dxe:ListEditItem Text="N/A" Value="0" />
                        <dxe:ListEditItem Text="Yes" Value="1" />
                        <dxe:ListEditItem Text="No" Value="2" />
                    </Items>
                </PropertiesComboBox>
                <Settings SortMode="DisplayText" />
                <EditFormSettings Visible="True" />
            </dxwgv:GridViewDataComboBoxColumn>            
            <dxwgv:GridViewDataComboBoxColumn FieldName="ActuatorLubed" VisibleIndex="31" 
                Caption="Actuator Lubed">
                <PropertiesComboBox ValueType="System.Int32">
                    <Items>
                        <dxe:ListEditItem Text="N/A" Value="0" />
                        <dxe:ListEditItem Text="Yes" Value="1" />
                        <dxe:ListEditItem Text="No" Value="2" />
                    </Items>
                </PropertiesComboBox>
                <Settings SortMode="DisplayText" />
                <EditFormSettings Visible="True" />
            </dxwgv:GridViewDataComboBoxColumn>
            <dxwgv:GridViewDataTextColumn FieldName="PercentCycled" VisibleIndex="32">
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataComboBoxColumn FieldName="ValveSecured" VisibleIndex="33" 
                Caption="Valve Secured">
                <PropertiesComboBox ValueType="System.Int32">
                    <Items>
                        <dxe:ListEditItem Text="N/A" Value="0" />
                        <dxe:ListEditItem Text="Yes" Value="1" />
                        <dxe:ListEditItem Text="No" Value="2" />
                    </Items>
                </PropertiesComboBox>
                <Settings SortMode="DisplayText" />
                <EditFormSettings Visible="True" />
            </dxwgv:GridViewDataComboBoxColumn>
            <dxwgv:GridViewDataComboBoxColumn FieldName="FlangeOrScrew" VisibleIndex="34" 
                Caption="Flange Or Screw">
                <PropertiesComboBox ValueType="System.String">
                    <Items>
                        <dxe:ListEditItem Text="N/A" Value="" />
                        <dxe:ListEditItem Text="Flanged" Value="F" />
                        <dxe:ListEditItem Text="Screwed" Value="S" />
                    </Items>
                </PropertiesComboBox>
                <Settings SortMode="DisplayText" />
                <EditFormSettings Visible="True" />
            </dxwgv:GridViewDataComboBoxColumn>
            <dxwgv:GridViewDataComboBoxColumn FieldName="EaseOfOperation" VisibleIndex="35" 
                Caption="Ease Of Operation">
                <PropertiesComboBox ValueType="System.Int32">
                    <Items>
                        <dxe:ListEditItem Text="0" Value="0" />
                        <dxe:ListEditItem Text="1" Value="1" />
                        <dxe:ListEditItem Text="2" Value="2" />
                        <dxe:ListEditItem Text="3" Value="3" />
                        <dxe:ListEditItem Text="4" Value="4" />
                        <dxe:ListEditItem Text="5" Value="5" />
                    </Items>
                </PropertiesComboBox>
                <Settings SortMode="DisplayText" />
                <EditFormSettings Visible="True" />
            </dxwgv:GridViewDataComboBoxColumn>
            <dxwgv:GridViewDataComboBoxColumn FieldName="SeatsChecked" VisibleIndex="36" 
                Caption="Seats Checked">
                <PropertiesComboBox ValueType="System.Int32">
                    <Items>
                        <dxe:ListEditItem Text="N/A" Value="0" />
                        <dxe:ListEditItem Text="Yes" Value="1" />
                        <dxe:ListEditItem Text="No" Value="2" />
                    </Items>
                </PropertiesComboBox>
                <Settings SortMode="DisplayText" />
                <EditFormSettings Visible="True" />
            </dxwgv:GridViewDataComboBoxColumn>
            <dxwgv:GridViewDataComboBoxColumn FieldName="SeatsLubed" VisibleIndex="37" 
                Caption="Seats Lubed">
                <PropertiesComboBox ValueType="System.Int32">
                    <Items>
                        <dxe:ListEditItem Text="N/A" Value="0" />
                        <dxe:ListEditItem Text="Yes" Value="1" />
                        <dxe:ListEditItem Text="No" Value="2" />
                    </Items>
                </PropertiesComboBox>
                <Settings SortMode="DisplayText" />
                <EditFormSettings Visible="True" />
            </dxwgv:GridViewDataComboBoxColumn>
            <dxwgv:GridViewDataComboBoxColumn FieldName="Leaking" VisibleIndex="38" 
                Caption="Leaking">
                <PropertiesComboBox ValueType="System.Int32">
                    <Items>
                        <dxe:ListEditItem Text="N/A" Value="0" />
                        <dxe:ListEditItem Text="Yes" Value="1" />
                        <dxe:ListEditItem Text="No" Value="2" />
                    </Items>
                </PropertiesComboBox>
                <Settings SortMode="DisplayText" />
                <EditFormSettings Visible="True" />
            </dxwgv:GridViewDataComboBoxColumn>
            <dxwgv:GridViewDataComboBoxColumn FieldName="LubeTypeID" VisibleIndex="39" 
                Caption="Lube Type" Width="150px">
                <PropertiesComboBox ValueType="System.Int32" 
                    DataSourceID="LubeTypeDataSource" TextField="DisplayMember" ValueField="ValueMember">
                </PropertiesComboBox>
                <Settings SortMode="DisplayText" />
                <EditFormSettings Visible="True" />
            </dxwgv:GridViewDataComboBoxColumn>
            <dxwgv:GridViewDataTextColumn FieldName="AmountInjected" VisibleIndex="40">
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="Notes" VisibleIndex="41" Width="250px">
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="GreasingRecordID" VisibleIndex="42">
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="ServiceItemID" VisibleIndex="43">
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="GreasingRecordItemID" ReadOnly="True" 
                VisibleIndex="44" Visible="False">
                <EditFormSettings Visible="False" />
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="GreasingRecord.JobID" ReadOnly="True" 
                VisibleIndex="45" Visible="False">
                <EditFormSettings Visible="False" />
            </dxwgv:GridViewDataTextColumn>
        </Columns>
        <SettingsBehavior AllowDragDrop="False" />
        <SettingsPager PageSize="10" Position="Top" AlwaysShowPager="true">
        </SettingsPager>
        <Settings ShowHorizontalScrollBar="True" />
        <SettingsLoadingPanel Mode="Disabled" />
    </dxwgv:ASPxGridView>
    <asp:LinqDataSource ID="gridLinqDataSource" runat="server" onselecting="gridLinqDataSource_Selecting">
    </asp:LinqDataSource>
    <asp:LinqDataSource ID="LubeTypeDataSource" runat="server" onselecting="LubeTypeDataSource_Selecting">
    </asp:LinqDataSource>
    <dx:ASPxLoadingPanel ID="ConstructionPanel" runat="server" Modal="true" ClientInstanceName="lpanel">
        <ClientSideEvents Init="function(s,e){ s.SetText('Loading....'); }" />
    </dx:ASPxLoadingPanel>
    <dx:ASPxGlobalEvents ID="ASPxGlobalEvents1" runat="server">
        <ClientSideEvents BeginCallback="function(s,e){ lpanel.Show(); }"
            EndCallback="function(s,e){ lpanel.Hide(); }" />
    </dx:ASPxGlobalEvents>
    <dx:ASPxCallback ID="PrintSelected" runat="server" ClientInstanceName="printSelected" 
        oncallback="PrintSelected_Callback">
        <ClientSideEvents EndCallback="function (s,e) { OnPrintSetupEnd(s,e); }" />
    </dx:ASPxCallback>
    <dx:ASPxCallback ID="PrintAll" runat="server" ClientInstanceName="printAll" 
        oncallback="PrintAll_Callback" >
        <ClientSideEvents EndCallback="function (s,e) { OnPrintSetupEnd(s,e); }" />
    </dx:ASPxCallback>
    <dx:ASPxPopupControl ID="PDFPopup" runat="server" 
        ClientInstanceName="pdfPopper" EnableClientSideAPI="True" 
        PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" 
        AllowDragging="True" AllowResize="true" ShowPageScrollbarWhenModal="True" 
        CloseAction="CloseButton" AutoUpdatePosition="True" Modal="False" HeaderText="Greasing Reports (....may take several moments to load.)" 
        ShowSizeGrip="True" Width="600px" Height="500px" ShowLoadingPanel="false" >
        <ClientSideEvents Closing="function (s,e) { s.SetContentUrl(''); }" />
        <ContentStyle VerticalAlign="Top"></ContentStyle>
        <ContentCollection>
            <dx:PopupControlContentControl ID="PopupControlContentControl3" runat="server" >
                <asp:Image ID="Image1" ImageUrl="~/images/ajax-loader.gif" runat="server" />
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>
</div>
