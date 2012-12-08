<%@ Control Language="C#" AutoEventWireup="true" CodeFile="WellSafteyTestsSearch.ascx.cs" Inherits="Rawson.WellSafetyTests.WellSafteyTestsSearch" EnableTheming="true" %>
<%@ Register Assembly="DevExpress.Web.v12.2"
    Namespace="DevExpress.Web.ASPxCallback" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2"
    Namespace="DevExpress.Web.ASPxLoadingPanel" TagPrefix="dx" %>
    <%@ Register Assembly="DevExpress.Web.v12.2"
    Namespace="DevExpress.Web.ASPxCallbackPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2" Namespace="DevExpress.Web.ASPxPopupControl"
    TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2"
    Namespace="DevExpress.Web.ASPxGlobalEvents" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2" Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v12.2" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v12.2" Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dxrp" %>
<%@ Register Assembly="DevExpress.Web.v12.2" Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dxp" %>

<%@ Register assembly="DevExpress.Web.v12.2" namespace="DevExpress.Web.ASPxLoadingPanel" tagprefix="dx1" %>

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
                            EnableIncrementalFiltering="True" ValueType="System.Int32" 
                            EnableCallbackMode="True" ShowLoadingPanel="False"> 
                            <ClientSideEvents SelectedIndexChanged="function(s,e) { locations.PerformCallback(s.GetValue()); }" />
                        </dxe:ASPxComboBox>
                    </td>
                    <td rowspan="6">
                        <dxe:ASPxImage ID="ASPxImage1" runat="server" ImageUrl="~/spacer.gif" Width="10px">
                        </dxe:ASPxImage>
                    </td>
                    <td>
                        <dxe:ASPxLabel ID="ASPxLabel2" runat="server" Text="Job ID:">
                        </dxe:ASPxLabel>
                    </td>
                    <td>
                        <dxe:ASPxTextBox ID="JobIDFilter" runat="server" Width="14.5em" MaxLength="7" 
                            NullText="-- Enter Job ID --">
                            <MaskSettings IncludeLiterals="None" PromptChar=" " />
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
                                                <dxe:ASPxLabel ID="ASPxLabel3" runat="server" Text="Date Completed" Font-Bold="true">
                                                </dxe:ASPxLabel>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <dxe:ASPxLabel ID="ASPxLabel4" runat="server" Text="Start Date :">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td>
                                                <dxe:ASPxDateEdit ID="TestedStartDate" runat="server" 
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
                                                <dxe:ASPxDateEdit ID="TestedEndDate" runat="server" 
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
                            ValueType="System.Int32" EnableCallbackMode="True" 
                            ShowLoadingPanel="False">
                        </dxe:ASPxComboBox>
                    </td>
                    <td>
                        <dxe:ASPxLabel ID="ASPxLabel7" runat="server" Text="Well Test ID :">
                        </dxe:ASPxLabel>
                    </td>
                    <td>
                        <dxe:ASPxTextBox ID="txtWellSafetyTestID" runat="server" Width="14.5em" 
                            MaxLength="7" NullText="-- Enter Well Test ID --">
                            <MaskSettings IncludeLiterals="None" PromptChar=" " />
                        </dxe:ASPxTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dxe:ASPxLabel ID="ASPxLabel8" runat="server" Text="System Location :">
                        </dxe:ASPxLabel>
                    </td>
                    <td>
                        <dxe:ASPxComboBox ID="SystemLocationFilter" runat="server" EnableIncrementalFiltering="True">
                            <Items>
                                <dxe:ListEditItem Text="-- All --" Value="" />
                                <dxe:ListEditItem Text="Seperator" Value="SEP" />
                                <dxe:ListEditItem Text="Line Heater" Value="LH" />
                                <dxe:ListEditItem Text="Flow Line" Value="FL" />
                                <dxe:ListEditItem Text="Meater Run" Value="MR" />
                            </Items>
                        </dxe:ASPxComboBox>
                    </td>
                    <td>
                        <dxe:ASPxLabel ID="ASPxLabel9" runat="server" Text="Serial # :">
                        </dxe:ASPxLabel>
                    </td>
                    <td>
                        <dxe:ASPxTextBox ID="SerialNumFilter" runat="server" 
                            NullText="-- Enter Serial No. --" Width="14.5em">
                        </dxe:ASPxTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dxe:ASPxLabel ID="ASPxLabel10" runat="server" Text="Test Result :">
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
                                <dxe:ListEditItem Text="Unknown" Value="0" />
                            </Items>
                        </dxe:ASPxComboBox>
                    </td>
                    <td>
                        <dxe:ASPxLabel ID="ASPxLabel11" runat="server" Text="FSR # :">
                        </dxe:ASPxLabel>
                    </td>
                    <td>
                        <dxe:ASPxTextBox ID="txtFSRNum" runat="server" NullText="-- Enter FSR No. --" 
                            Width="14.5em">
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
    <tr align="right">
        <td>
            <table cellspacing="5">
                <tr>
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
                            Wrap="False" AutoPostBack="False">
                            <ClientSideEvents Click="function(s,e){ reportingGrid.GetSelectedFieldValues('WellSafetyTestID', OnGridGetSelectedValues ); }" />
                        </dxe:ASPxButton>
                    </td>
                    <td>
                        <dxe:ASPxButton ID="printAllButton" runat="server" Text="Print All" 
                            Wrap="False" AutoPostBack="False">
                            <ClientSideEvents Click="function(s, e) { printAll.PerformCallback(); }" />
                        </dxe:ASPxButton>
                    </td>
                    <td>
                        <dxe:ASPxButton ID="btnExportExcel" runat="server" Text="Export to Excel" Wrap="False"
                            OnClick="btnExportExcel_Click">
                        </dxe:ASPxButton>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table> 
<dxwgv:ASPxGridView ID="reportingGrid" runat="server" 
    AutoGenerateColumns="False" DataSourceID="LinqGridDatasource" 
    KeyFieldName="WellSafetyTestID" EnableRowsCache="false"
    ClientInstanceName="reportingGrid" Width="100%" 
    onbeforecolumnsortinggrouping="reportingGrid_BeforeColumnSortingGrouping" 
    oncustomcallback="reportingGrid_CustomCallback" 
    ondatabound="reportingGrid_DataBound" 
    onpageindexchanged="reportingGrid_PageIndexChanged" 
    oncustombuttoncallback="reportingGrid_CustomButtonCallback">
    <ClientSideEvents BeginCallback="function(s,e) { s.cpShowReport = false;}" 
        EndCallback="function (s,e) { OnPrintSetupEnd(s,e); }" />
    <Columns>
        <dxwgv:GridViewCommandColumn showselectcheckbox="True" visibleindex="0" Caption=" " Width="32px">
            <clearfilterbutton visible="True"></clearfilterbutton>
        </dxwgv:GridViewCommandColumn>
        <dxwgv:GridViewCommandColumn ButtonType="Image" VisibleIndex="0" Caption=" " Width="32px" Name="colEdit">
            <CustomButtons>
                <dxwgv:GridViewCommandColumnCustomButton ID="btnEdit" Visibility="AllDataRows" Text="Edit">
                    <Image Url="~/images/edit.gif" AlternateText="Edit"  Height="16px" Width="16px" />
                </dxwgv:GridViewCommandColumnCustomButton>
            </CustomButtons>
        </dxwgv:GridViewCommandColumn>
        <dxwgv:GridViewCommandColumn  ButtonType="Image" VisibleIndex="0" Caption=" " Width="32px">
            <CustomButtons>
                <dxwgv:GridViewCommandColumnCustomButton ID="btnPrint" Visibility="AllDataRows">
                    <Image Url="~/images/print.gif" AlternateText="Print"  Height="16px" Width="16px" />
                </dxwgv:GridViewCommandColumnCustomButton>
            </CustomButtons>
        </dxwgv:GridViewCommandColumn>
        <dxwgv:gridviewdatatextcolumn fieldname="WellSafetyTestID" 
            readonly="True" visibleindex="2">
            <editformsettings visible="False"></editformsettings>
        </dxwgv:gridviewdatatextcolumn>
        <dxwgv:gridviewdatatextcolumn fieldname="JobID" 
            readonly="True" visibleindex="2">
            <editformsettings visible="False"></editformsettings>
        </dxwgv:gridviewdatatextcolumn>
         <dxwgv:GridViewDataHyperLinkColumn VisibleIndex="2" Name="colJobID" Caption="JobID">
            <DataItemTemplate>
                <%# CanEdit == true ? "<a href='" + DotNetNuke.Common.Globals.NavigateURL(61, "Job", "mid=393", "JobID=" + Eval("JobID")) + "'>" + Eval("JobID") + "</a>" : Eval("JobID")%>
            </DataItemTemplate>
        </dxwgv:GridViewDataHyperLinkColumn>
        <dxwgv:gridviewdatatextcolumn fieldname="ServiceItemID" 
            visibleindex="3"></dxwgv:gridviewdatatextcolumn>
        <dxwgv:gridviewdatatextcolumn caption="Sales Order Num" 
            fieldname="Job.SalesOrderNum" visibleindex="5"></dxwgv:gridviewdatatextcolumn>
        <dxwgv:gridviewdatatextcolumn caption="FSR Num" 
            fieldname="FSR_Num" visibleindex="35"></dxwgv:gridviewdatatextcolumn>
        <dxwgv:gridviewdatadatecolumn caption="Completion Date" 
            fieldname="Job.CompletionDate" visibleindex="36"></dxwgv:gridviewdatadatecolumn>
        <dxwgv:gridviewdatatextcolumn caption="Location/Well Name" 
            fieldname="Job.ClientLocation.Name" visibleindex="37"></dxwgv:gridviewdatatextcolumn>
        <dxwgv:gridviewdatatextcolumn caption="SSV SAP Num" 
            fieldname="SSV_SAP_Num" visibleindex="34"></dxwgv:gridviewdatatextcolumn>
        <dxwgv:gridviewdatatextcolumn caption="PSV Num" 
            fieldname="ServiceItem.PSVID" visibleindex="33"></dxwgv:gridviewdatatextcolumn>
        <dxwgv:gridviewdatadatecolumn fieldname="FormDate" 
            visibleindex="6"></dxwgv:gridviewdatadatecolumn>
        <dxwgv:gridviewdatatextcolumn caption="Manufacturer" 
            fieldname="ServiceItem.ManufacturerModel.Manufacturer.ManufacturerName" 
            visibleindex="38"></dxwgv:gridviewdatatextcolumn>
        <dxwgv:gridviewdatatextcolumn caption="Type of Valve" 
            fieldname="ServiceItem.ServiceItemType.Type" visibleindex="39"></dxwgv:gridviewdatatextcolumn>
        <dxwgv:gridviewdatatextcolumn caption="Model/Part Num" 
            fieldname="ServiceItem.ManufacturerModel.Model" visibleindex="7"></dxwgv:gridviewdatatextcolumn>
        <dxwgv:gridviewdatatextcolumn caption="Size &amp; Flange Connection" 
            fieldname="ServiceItem.ModelSize" visibleindex="32"></dxwgv:gridviewdatatextcolumn>
        <dxwgv:gridviewdatatextcolumn caption="Serial Num" 
            fieldname="ServiceItem.SerialNum" visibleindex="8"></dxwgv:gridviewdatatextcolumn>
        <dxwgv:gridviewdatacomboboxcolumn caption="Body Material" 
            fieldname="BodyMaterial" visibleindex="9">
<propertiescombobox valuetype="System.String"><Items>
<dxe:listedititem text="Unknown" value=""></dxe:listedititem>
<dxe:listedititem text="Stainless Steel" value="SS"></dxe:listedititem>
<dxe:listedititem text="Carbon Steel" value="CS"></dxe:listedititem>
</Items>
</propertiescombobox>

<settings sortmode="DisplayText"></settings>

<editformsettings visible="True"></editformsettings>
</dxwgv:gridviewdatacomboboxcolumn>
        <dxwgv:gridviewdatacomboboxcolumn caption="Plug Material" 
            fieldname="PlugMaterial" visibleindex="31">
<propertiescombobox valuetype="System.String"><Items>
<dxe:listedititem text="Unknown" value=""></dxe:listedititem>
<dxe:listedititem text="Stainless Steel" value="SS"></dxe:listedititem>
<dxe:listedititem text="Carbon Steel" value="CS"></dxe:listedititem>
<dxe:listedititem text="Carbide" value="CB"></dxe:listedititem>
</Items>
</propertiescombobox>

<settings sortmode="DisplayText"></settings>

<editformsettings visible="True"></editformsettings>
</dxwgv:gridviewdatacomboboxcolumn>
        <dxwgv:gridviewdatacomboboxcolumn caption="Steam Material" 
            fieldname="SteamMaterial" visibleindex="10">
<propertiescombobox valuetype="System.String"><Items>
<dxe:listedititem text="Unknown" value=""></dxe:listedititem>
<dxe:listedititem text="Stainless Steel" value="SS"></dxe:listedititem>
<dxe:listedititem text="Carbon Steel" value="CS"></dxe:listedititem>
</Items>
</propertiescombobox>

<settings sortmode="DisplayText"></settings>

<editformsettings visible="True"></editformsettings>
</dxwgv:gridviewdatacomboboxcolumn>
        <dxwgv:gridviewdatacomboboxcolumn caption="Gate Material" 
            fieldname="GateMaterial" visibleindex="11">
<propertiescombobox valuetype="System.String"><Items>
<dxe:listedititem text="Unknown" value=""></dxe:listedititem>
<dxe:listedititem text="Stainless Steel" value="SS"></dxe:listedititem>
<dxe:listedititem text="Carbon Steel" value="CS"></dxe:listedititem>
</Items>
</propertiescombobox>

<settings sortmode="DisplayText"></settings>

<editformsettings visible="True"></editformsettings>
</dxwgv:gridviewdatacomboboxcolumn>
        <dxwgv:gridviewdatatextcolumn fieldname="PortSize" 
            visibleindex="12"></dxwgv:gridviewdatatextcolumn>
        <dxwgv:gridviewdatatextcolumn fieldname="PressClass" 
            visibleindex="13"></dxwgv:gridviewdatatextcolumn>
        <dxwgv:gridviewdatacomboboxcolumn caption="Actuator Type" 
            fieldname="ActuatorType" visibleindex="14">
<propertiescombobox valuetype="System.String"><Items>
<dxe:listedititem text="Unknown" value=""></dxe:listedititem>
<dxe:listedititem text="Diaphragm" value="DP"></dxe:listedititem>
<dxe:listedititem text="Canister" value="CA"></dxe:listedititem>
<dxe:listedititem text="Rack and Pinion" value="RP"></dxe:listedititem>
<dxe:listedititem text="Scotch Yoke" value="SY"></dxe:listedititem>
</Items>
</propertiescombobox>

<settings sortmode="DisplayText"></settings>

<editformsettings visible="True"></editformsettings>
</dxwgv:gridviewdatacomboboxcolumn>
        <dxwgv:gridviewdatatextcolumn caption="Model or Part Num" 
            fieldname="ActuatorModel" visibleindex="15"></dxwgv:gridviewdatatextcolumn>
        <dxwgv:gridviewdatatextcolumn fieldname="ActuatorSerialNum" 
            visibleindex="16"></dxwgv:gridviewdatatextcolumn>
        <dxwgv:gridviewdatacomboboxcolumn caption="AirSupply Medium" 
            fieldname="AirSupplyMedium" visibleindex="17">
<propertiescombobox valuetype="System.String"><Items>
<dxe:listedititem text="Unknown" value=""></dxe:listedititem>
<dxe:listedititem text="Gas" value="G"></dxe:listedititem>
<dxe:listedititem text="Air" value="A"></dxe:listedititem>
</Items>
</propertiescombobox>

<settings sortmode="DisplayText"></settings>

<editformsettings visible="True"></editformsettings>
</dxwgv:gridviewdatacomboboxcolumn>
        <dxwgv:gridviewdatatextcolumn fieldname="Condition" 
            visibleindex="18"></dxwgv:gridviewdatatextcolumn>
        <dxwgv:gridviewdatadatecolumn fieldname="DateManufactured" 
            visibleindex="19"></dxwgv:gridviewdatadatecolumn>
        <dxwgv:gridviewdatacomboboxcolumn caption="System Location" 
            fieldname="SystemLocation" visibleindex="20">
<propertiescombobox valuetype="System.String"><Items>
<dxe:listedititem text="Unknown" value=""></dxe:listedititem>
<dxe:listedititem text="Seperator" value="SEP"></dxe:listedititem>
<dxe:listedititem text="Line Heater" value="LH"></dxe:listedititem>
<dxe:listedititem text="Flow Line" value="FL"></dxe:listedititem>
<dxe:listedititem text="Meater Run" value="MR"></dxe:listedititem>
</Items>
</propertiescombobox>

<settings sortmode="DisplayText"></settings>

<editformsettings visible="True"></editformsettings>
</dxwgv:gridviewdatacomboboxcolumn>
        <dxwgv:gridviewdatatextcolumn fieldname="ControllerType" 
            visibleindex="21"></dxwgv:gridviewdatatextcolumn>
        <dxwgv:gridviewdatatextcolumn fieldname="HI" 
            visibleindex="22"></dxwgv:gridviewdatatextcolumn>
        <dxwgv:gridviewdatatextcolumn fieldname="LO" 
            visibleindex="23"></dxwgv:gridviewdatatextcolumn>
        <dxwgv:gridviewdatatextcolumn fieldname="Notes" 
            visibleindex="30" width="250px"></dxwgv:gridviewdatatextcolumn>
        <dxwgv:gridviewdatatextcolumn caption="Tech First Name" 
            fieldname="Jobs.AssignedToID.FirstName" visibleindex="24"></dxwgv:gridviewdatatextcolumn>
        <dxwgv:gridviewdatatextcolumn caption="Tech Last Name" 
            fieldname="Jobs.AssignedToID.LastName" visibleindex="25"></dxwgv:gridviewdatatextcolumn>
        <dxwgv:gridviewdatacomboboxcolumn caption="Manual Override" 
            fieldname="ManualOverride" visibleindex="26">
<propertiescombobox valuetype="System.String"><Items>
<dxe:listedititem text="Unknown" value=""></dxe:listedititem>
<dxe:listedititem text="Engaged" value="ENG"></dxe:listedititem>
<dxe:listedititem text="Disengaged" value="DIS"></dxe:listedititem>
</Items>
</propertiescombobox>

<settings sortmode="DisplayText"></settings>

<editformsettings visible="True"></editformsettings>
</dxwgv:gridviewdatacomboboxcolumn>
        <dxwgv:gridviewdatatextcolumn fieldname="CustomerWitness" 
            visibleindex="27"></dxwgv:gridviewdatatextcolumn>
        <dxwgv:gridviewdatacomboboxcolumn caption="Test Result" 
            fieldname="TestResultID" visibleindex="40" width="75px">
<propertiescombobox valuetype="System.Int32"><Items>
<dxe:listedititem text="Unknown" value="-1"></dxe:listedititem>
<dxe:listedititem text="Tested Good" value="5"></dxe:listedititem>
<dxe:listedititem text="Needs Repair" value="6"></dxe:listedititem>
<dxe:listedititem text="Needs Replacement" value="7"></dxe:listedititem>
</Items>
</propertiescombobox>

<settings sortmode="DisplayText"></settings>

<editformsettings visible="True"></editformsettings>
</dxwgv:gridviewdatacomboboxcolumn>
        <dxwgv:gridviewdatatextcolumn fieldname="CreatedBy" 
            visibleindex="28"></dxwgv:gridviewdatatextcolumn>
        <dxwgv:gridviewdatatextcolumn caption="Created By First Name" 
            fieldname="Employee.FirstName" visible="False" visibleindex="28"></dxwgv:gridviewdatatextcolumn>
        <dxwgv:gridviewdatatextcolumn caption="Created By Last Name" 
            fieldname="Employee.LastFirstName" visible="False" visibleindex="28"></dxwgv:gridviewdatatextcolumn>
        <dxwgv:gridviewdatadatecolumn fieldname="CreatedDate" 
            visibleindex="29"></dxwgv:gridviewdatadatecolumn>
    </Columns>
    <SettingsBehavior AllowDragDrop="False" AllowGroup="False" />
    <SettingsPager PageSize="20" Position="Top" AlwaysShowPager="true">
    </SettingsPager>
    <Settings ShowHorizontalScrollBar="True" />
    <SettingsLoadingPanel Mode="Disabled" />
</dxwgv:ASPxGridView>    
<asp:LinqDataSource ID="LinqGridDatasource" runat="server" onselecting="LinqGridDatasource_Selecting">
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
    CloseAction="CloseButton" AutoUpdatePosition="True" Modal="False" HeaderText="Well Safety Reports (....may take several moments to load.)" 
    ShowSizeGrip="True" Width="600px" Height="500px" ShowLoadingPanel="false" >
    <ClientSideEvents Closing="function (s,e) { s.SetContentUrl(''); }" />
    <ContentStyle VerticalAlign="Top"></ContentStyle>
    <ContentCollection>
        <dx:PopupControlContentControl ID="PopupControlContentControl3" runat="server" >
            <asp:Image ID="Image1" ImageUrl="~/images/ajax-loader.gif" runat="server" />
        </dx:PopupControlContentControl>
    </ContentCollection>
</dx:ASPxPopupControl>