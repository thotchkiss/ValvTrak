<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ValveTestsSearch.ascx.cs" Inherits="ValveTestsSearch" EnableTheming="true" %>

<%@ Register Assembly="DevExpress.Web.v12.2" Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2" Namespace="DevExpress.Web.ASPxCallbackPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2" Namespace="DevExpress.Web.ASPxLoadingPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2" Namespace="DevExpress.Web.ASPxGlobalEvents" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2" Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v12.2" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v12.2" Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dxrp" %>
<%@ Register Assembly="DevExpress.Web.v12.2" Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dxp" %>
<%@ Register assembly="DevExpress.Web.v12.2" namespace="DevExpress.Web.ASPxCallback" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2" namespace="DevExpress.Web.ASPxGridView.Export" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2" namespace="DevExpress.Web.ASPxPanel" tagprefix="dx" %>

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
            <dxrp:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" ShowHeader="False" Width="100%">
                <PanelCollection>
                    <dxp:PanelContent ID="PanelContent1" runat="server">
                        <!-- Top Criteria -->
                        <table style="white-space: nowrap;">
                            <tr>
                                <td>
                                    <dxe:ASPxLabel ID="ASPxLabel1" runat="server" Text="Client :" 
                                        AssociatedControlID="ClientFilter">
                                    </dxe:ASPxLabel>
                                </td>
                                <td>
                                    <dxe:ASPxComboBox ID="ClientFilter" runat="server" DataSourceID="ClientDataSource"
                                        TextField="DisplayMember" ValueField="ValueMember" AutoPostBack="False"
                                        EnableIncrementalFiltering="True" ValueType="System.Int32" 
                                        EnableCallbackMode="True" ShowLoadingPanel="False" >
                                        <ClientSideEvents SelectedIndexChanged="function(s,e){ locations.PerformCallback(); }" />
                                    </dxe:ASPxComboBox>
                                </td>
                                <td rowspan="4" style="width: 40px">&nbsp;</td>
                                <td>
                                    <dxe:ASPxLabel ID="ASPxLabel2" runat="server" Text="Job ID :">
                                    </dxe:ASPxLabel>
                                </td>
                                <td>
                                    <dxe:ASPxTextBox ID="txtJobID" runat="server" Width="14.5em" MaxLength="7" 
                                        NullText="-- Enter Job ID --">
                                        <MaskSettings IncludeLiterals="None" PromptChar=" " />
                                    </dxe:ASPxTextBox>
                                </td>
                                <td style="width: 40px" rowspan="4"></td>
                                <td rowspan="3" valign="top">
                                    <table>
                                        <tr>
                                
                                            <td>
                                                <table>
                                                    <tr><td colspan="2" style="text-align: center"><b>Date Tested</b></td></tr>
                                                    <tr><td>
                                                        <dxe:ASPxLabel ID="ASPxLabel9" runat="server" Text="Start Date :">
                                                        </dxe:ASPxLabel>
                                                        </td><td><dxe:ASPxDateEdit ID="TestedStartDate" runat="server" 
                                                                NullText="-- Enter Start Date --">
                                                        </dxe:ASPxDateEdit></td></tr>
                                                    <tr><td>
                                                        <dxe:ASPxLabel ID="ASPxLabel10" runat="server" Text="End Date :">
                                                        </dxe:ASPxLabel>
                                                        </td><td><dxe:ASPxDateEdit ID="TestedEndDate" runat="server" 
                                                                NullText="-- Enter Ending Date --">
                                                        </dxe:ASPxDateEdit></td></tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dxe:ASPxLabel ID="ASPxLabel3" runat="server" Text="Location :">
                                    </dxe:ASPxLabel>
                                </td>
                                <td>
                                    <dxe:ASPxComboBox ID="LocationFilter" runat="server" DataSourceID="LocationDataSource"
                                        TextField="DisplayMember" ValueField="ValueMember" ClientInstanceName="locations" 
                                        EnableIncrementalFiltering="true" OnCallback="LocationFilter_Callback" 
                                        ValueType="System.Int32" EnableCallbackMode="True" ShowLoadingPanel="False">
                                    </dxe:ASPxComboBox>
                                </td>
                                <td>
                                    <dxe:ASPxLabel ID="ASPxLabel6" runat="server" Text="Valve Test ID :">
                                    </dxe:ASPxLabel>
                                </td>
                                <td>
                                    <dxe:ASPxTextBox ID="txtValveTestID" runat="server" Width="14.5em" 
                                        MaxLength="7" NullText="-- Enter Valve Test ID --">
                                        <MaskSettings IncludeLiterals="None" PromptChar=" " />
                                    </dxe:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dxe:ASPxLabel ID="ASPxLabel4" runat="server" Text="Job Status :">
                                    </dxe:ASPxLabel>
                                </td>
                                <td>
                                    <dxe:ASPxComboBox ID="JobStatusFilter" runat="server" DataSourceID="JobStatusDataSource"
                                        TextField="DisplayMember" ValueField="ValueMember" 
                                        EnableIncrementalFiltering="True" ValueType="System.Int32">
                                        <ClientSideEvents Init="function(s, e) {DevExComboUnboundItem(s, e, '-- All --', -1)}" />
                                    </dxe:ASPxComboBox>
                                </td>
                                <td>
                                    <dxe:ASPxLabel ID="ASPxLabel7" runat="server" Text="Serial # :">
                                    </dxe:ASPxLabel>
                                </td>
                                <td>
                                    <dxe:ASPxTextBox ID="txtSerialNum" runat="server" Width="14.5em" 
                                        NullText="-- Enter Serial No. --"></dxe:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dxe:ASPxLabel ID="ASPxLabel5" runat="server" Text="Test Result :">
                                    </dxe:ASPxLabel>
                                </td>
                                <td>
                                    <dxe:ASPxComboBox ID="TestResultFilter" runat="server" 
                                        EnableIncrementalFiltering="True" ValueType="System.Int32">
                                        <Items>
                                            <dxe:ListEditItem Text="-- All --" Value="-1" />
                                            <dxe:ListEditItem Text="Tested Good" Value="5" />
                                            <dxe:ListEditItem Text="Needs Repair" Value="6" />
                                            <dxe:ListEditItem Text="Needs Replacement" Value="7" />
                                            <dxe:ListEditItem Text="Repaired" Value="8" />
                                            <dxe:ListEditItem Text="Replaced" Value="9" />
                                            <dxe:ListEditItem Text="Unknown" Value="0" />
                                        </Items>
                                    </dxe:ASPxComboBox>
                                </td>
                                <td>
                                    <dxe:ASPxLabel ID="ASPxLabel8" runat="server" Text="FSR # :">
                                    </dxe:ASPxLabel>
                                </td>
                                <td>
                                    <dxe:ASPxTextBox ID="txtFSR" runat="server" Width="14.5em" 
                                        NullText="-- Enter FSR No. --"></dxe:ASPxTextBox>
                                </td>
                                <td align="right" style="padding-right: 5px;">
                                    <dxe:ASPxButton ID="ASPxButton1" runat="server" AutoPostBack="false" Text="Search" Width="170px">
                                        <ClientSideEvents Click="function(s,e){ reportingGrid.PerformCallback(); }" />
                                    </dxe:ASPxButton>
                                </td>
                            </tr>
                        </table>
                        <!-- Bottom Criteria -->
                        <asp:LinqDataSource ID="JobStatusDataSource" runat="server" 
                            OnSelecting="JobStatusDataSource_Selecting">
                        </asp:LinqDataSource>
                        <asp:LinqDataSource ID="ClientDataSource" runat="server" OnSelecting="ClientDataSource_Selecting">
                        </asp:LinqDataSource>
                        <asp:LinqDataSource ID="LocationDataSource" runat="server" OnSelecting="LocationDataSource_Selecting">
                        </asp:LinqDataSource>
                        <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server">
                        </dx:ASPxGridViewExporter>
                    </dxp:PanelContent>
                </PanelCollection>
            </dxrp:ASPxRoundPanel>
        </td>
    </tr>
    <tr>
        <td style="padding-top: 20px" align="right">
             <table cellspacing="5">
                <tr>
                     <td>
                         <dxe:ASPxButton ID="btnSelectAll" runat="server" Text="Select All" 
                             UseSubmitBehavior="False" AutoPostBack="false" Visible="False" Wrap="False">
                             <ClientSideEvents Click="function(s, e) { reportingGrid.SelectRows(); }"/>                
                         </dxe:ASPxButton>
                     </td>
                     <td>
                         <dxe:ASPxButton ID="btnUnselectAll" runat="server" Text="Unselect All" 
                             UseSubmitBehavior="False" AutoPostBack="false" Wrap="False" Visible="False">
                             <ClientSideEvents Click="function(s, e) { reportingGrid.UnselectRows(); }"/>
                         </dxe:ASPxButton>
                     </td>
                     <td>
                         <dxe:ASPxButton ID="btnSelectAllOnPage" runat="server" Text="Select all on the page" UseSubmitBehavior="False" AutoPostBack="false" Wrap="False">
                             <ClientSideEvents Click="function(s, e) { reportingGrid.SelectAllRowsOnPage(); }"/>
                         </dxe:ASPxButton>
                     </td>
                     <td>
                         <dxe:ASPxButton ID="btnUnselectAllOnPage" runat="server" Text="Unselect all on the page" UseSubmitBehavior="False" AutoPostBack="false" Wrap="False">
                             <ClientSideEvents Click="function(s, e) { reportingGrid.UnselectAllRowsOnPage(); }"/>
                         </dxe:ASPxButton>
                     </td>
                    <td>
                        <dxe:ASPxButton ID="printSelectedButton" runat="server" Text="Print Selected" 
                            Wrap="false" AutoPostBack="false" UseSubmitBehavior="false">
                            <ClientSideEvents Click="function(s,e){ reportingGrid.GetSelectedFieldValues('ValveTestID', OnGridGetSelectedValues ); }" />
                        </dxe:ASPxButton>
                    </td>
                    <td>
                        <dxe:ASPxButton ID="printAllButton" runat="server" Text="Print All" 
                            Wrap="False" AutoPostBack="False">
                            <ClientSideEvents Click="function(s,e){ printAll.PerformCallback(); }" />
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
    <tr>
        <td>
            <dxwgv:ASPxGridView ID="reportingGrid" runat="server" 
                AutoGenerateColumns="False" DataSourceID="gridLinqDataSource" 
                KeyFieldName="ValveTestID" EnableRowsCache="false"
                ClientInstanceName="reportingGrid" Width="100%" 
                onbeforecolumnsortinggrouping="reportingGrid_BeforeColumnSortingGrouping" 
                onpageindexchanged="reportingGrid_PageIndexChanged" 
                oncustomcallback="reportingGrid_CustomCallback" 
                ondatabound="reportingGrid_DataBound" 
                oncustomunboundcolumndata="reportingGrid_CustomUnboundColumnData" 
                onhtmlrowprepared="reportingGrid_HtmlRowPrepared" 
                oncustombuttoncallback="reportingGrid_CustomButtonCallback"
                EnableCallBacks="true" 
                onfocusedrowchanged="reportingGrid_FocusedRowChanged">
                <SettingsLoadingPanel Mode="Disabled" />
                <SettingsBehavior EnableRowHotTrack="true" AllowFocusedRow="true" AllowSelectByRowClick="true" ProcessFocusedRowChangedOnServer="true" />
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
                            <dxwgv:GridViewCommandColumnCustomButton ID="btnPrint" Visibility="AllDataRows" >
                                <Image Url="~/images/print.gif" AlternateText="Print"  Height="16px" Width="16px" />
                            </dxwgv:GridViewCommandColumnCustomButton>
                        </CustomButtons>
                    </dxwgv:GridViewCommandColumn>
                    <dxwgv:GridViewDataTextColumn FieldName="ValveTestID" ReadOnly="True" 
                            Caption="Test ID" VisibleIndex="4" Visible="True">
                        <EditFormSettings Visible="False" />
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn FieldName="JobID" ReadOnly="True" 
                            Caption=" " VisibleIndex="5" Visible="False">
                        <EditFormSettings Visible="False" />
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataHyperLinkColumn VisibleIndex="6" Name="colJobID" Caption="JobID">
                        <DataItemTemplate>
                            <%# CanEdit == true ? "<a href='" + DotNetNuke.Common.Globals.NavigateURL(61, "Job", "mid=393", "JobID=" + Eval("JobID")) + "'>" + Eval("JobID") + "</a>" : Eval("JobID") %>
                        </DataItemTemplate>
                    </dxwgv:GridViewDataHyperLinkColumn>
                    <dxwgv:GridViewDataTextColumn FieldName="ServiceItemID" VisibleIndex="7">
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn FieldName="Job.SalesOrderNum" VisibleIndex="8"
                        Caption="Sales Order Num">
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn FieldName="FSRNum" VisibleIndex="9">
                    </dxwgv:GridViewDataTextColumn> 
                    <dxwgv:GridViewDataTextColumn FieldName="Job.ClientLocation.Client.Name" VisibleIndex="10"
                        Caption="Customer" Width="200px">
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn FieldName="Job.ClientLocation.Name" VisibleIndex="11"
                        Caption="Location" Width="150px">
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataDateColumn FieldName="ValveDate" VisibleIndex="12">
                    </dxwgv:GridViewDataDateColumn>
                    <dxwgv:GridViewDataDateColumn FieldName="DateTested" VisibleIndex="13">
                    </dxwgv:GridViewDataDateColumn>        
                    <dxwgv:GridViewDataTextColumn FieldName="ServiceItem.ManufacturerModel.Manufacturer.Name" VisibleIndex="14"
                        Caption="Manufacturer">
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn FieldName="ServiceItem.ManufacturerModel.Model" VisibleIndex="15"
                        Caption="Model" Width="75px">
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn FieldName="PsvApplication" VisibleIndex="16"
                        Caption="PSV Application" Width="250px">
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn FieldName="SapPsv" VisibleIndex="17"
                        Caption="SAP PSV" Width="250px">
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn FieldName="ServiceItem.SerialNum" VisibleIndex="18"
                        Caption="Serial Num" Width="200px">
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn FieldName="Capacity" VisibleIndex="19">
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataComboBoxColumn FieldName="CapacityTypeID" VisibleIndex="20" 
                        Caption="Capacity Type ID">
                        <PropertiesComboBox ValueType="System.Int32" 
                            DataSourceID="CapacityTypeDataSource" TextField="Display1" ValueField="ListID">
                        </PropertiesComboBox>
                        <Settings SortMode="DisplayText" />
                        <EditFormSettings Visible="True" />
                    </dxwgv:GridViewDataComboBoxColumn>
                    <dxwgv:GridViewDataTextColumn FieldName="SealNum" VisibleIndex="21">
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn FieldName="GaugeNum" VisibleIndex="22">
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataDateColumn FieldName="CalibrationDue" VisibleIndex="23">
                    </dxwgv:GridViewDataDateColumn>
                    <dxwgv:GridViewDataCheckColumn FieldName="Coded" VisibleIndex="24">
                    </dxwgv:GridViewDataCheckColumn>
                    <dxwgv:GridViewDataTextColumn FieldName="TempCorr" VisibleIndex="25">
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn FieldName="ColdDiffPressure" VisibleIndex="26">
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn FieldName="BackPressure" VisibleIndex="27">
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn FieldName="SetPressure" VisibleIndex="28">
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn FieldName="SetPressureFound" VisibleIndex="29">
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn FieldName="SetPressureLeft" VisibleIndex="30">
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Deviation" FieldName="Tolerance" 
                        Name="colTolerance" ReadOnly="True" UnboundType="Decimal" VisibleIndex="31">
                        <PropertiesTextEdit DisplayFormatString="f2"></PropertiesTextEdit>
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataComboBoxColumn FieldName="TestResultID" VisibleIndex="32" 
                        Caption="Test Result ID">
                        <PropertiesComboBox ValueType="System.Int32">
                            <Items>
                                <dxe:ListEditItem Text="Tested Good" Value="5" />
                                <dxe:ListEditItem Text="Needs Repair" Value="6" />
                                <dxe:ListEditItem Text="Needs Replacement" Value="7" />
                                <dxe:ListEditItem Text="Repaired" Value="8" />
                                <dxe:ListEditItem Text="Replaced" Value="9" />
                                <dxe:ListEditItem Text="Unknown" Value="0" />
                            </Items>
                        </PropertiesComboBox>
                        <Settings SortMode="DisplayText" />
                        <EditFormSettings Visible="True" />
                    </dxwgv:GridViewDataComboBoxColumn>
                    <dxwgv:GridViewDataTextColumn FieldName="Notes" VisibleIndex="33" Width="250px">
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn FieldName="Employee.FirstName" VisibleIndex="34"
                        Caption="Tech First Name">  
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn FieldName="Employee.LastName" VisibleIndex="35"
                        Caption="Tech Last Name">  
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn FieldName="CustomerWitness" VisibleIndex="36">
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn FieldName="CreatedBy" VisibleIndex="37">
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataDateColumn FieldName="CreatedDate" VisibleIndex="38">
                    </dxwgv:GridViewDataDateColumn>
                </Columns>
                <SettingsBehavior AllowDragDrop="False" AllowGroup="False" />
                <SettingsPager PageSize="15" Position="Top" AlwaysShowPager="true" ></SettingsPager>
                <Settings ShowHorizontalScrollBar="True" />
                <SettingsCustomizationWindow Enabled="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" />
            </dxwgv:ASPxGridView>

            <asp:LinqDataSource ID="gridLinqDataSource" runat="server" OnSelecting="gridLinqDataSource_Selecting">
            </asp:LinqDataSource>
            <asp:LinqDataSource ID="CapacityTypeDataSource" runat="server" ContextTypeName="Rawson.Data.ValvTrakDBDataContext"
                OrderBy="SortOrder" TableName="Lists" Where="ListKey == @ListKey">
                <WhereParameters>
                    <asp:Parameter DefaultValue="ValveTestCapacity" Name="ListKey" Type="String" />
                </WhereParameters>
            </asp:LinqDataSource>
            <dx:ASPxGlobalEvents ID="ASPxGlobalEvents1" runat="server">
                <ClientSideEvents BeginCallback="function(s,e){ lpanel.Show(); }"  
                     EndCallback="function(s,e){ lpanel.Hide(); }"  />
            </dx:ASPxGlobalEvents>
            <dx:ASPxLoadingPanel ID="ASPxLoadingPanel1" runat="server"  ClientInstanceName="lpanel" Modal="true">
                <ClientSideEvents Init="function(s,e){ s.SetText('Loading....'); }" />
            </dx:ASPxLoadingPanel>
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
                CloseAction="CloseButton" AutoUpdatePosition="True" Modal="False" HeaderText="Valve Test Reports (....may take several moments to load.)" 
                ShowSizeGrip="True" Width="600px" Height="500px" ShowLoadingPanel="false" >
                <ClientSideEvents Closing="function (s,e) { s.SetContentUrl(''); }" />
                <ContentStyle VerticalAlign="Top"></ContentStyle>
                <ContentCollection>
                    <dx:PopupControlContentControl ID="PopupControlContentControl3" runat="server" >
                        <asp:Image ImageUrl="~/images/ajax-loader.gif" runat="server" />
                    </dx:PopupControlContentControl>
                </ContentCollection>
            </dx:ASPxPopupControl>
        </td>
    </tr>
</table>
<br />
<br />
