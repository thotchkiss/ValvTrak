<%@ Control Language="C#" AutoEventWireup="true" CodeFile="WellSafetyTestForm.ascx.cs" Inherits="Rawson.WellSafetyTests.WellSafetyTestForm" EnableTheming="true" %>
<%@ Register Assembly="DevExpress.Web.v11.2"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v11.2"
    Namespace="DevExpress.Web.ASPxCallback" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v11.2"
    Namespace="DevExpress.Web.ASPxGlobalEvents" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v11.2" Namespace="DevExpress.Web.ASPxLoadingPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxSpellChecker.v11.2" Namespace="DevExpress.Web.ASPxSpellChecker" TagPrefix="dxsc" %>
<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.2" namespace="DevExpress.Web.ASPxEditors" tagprefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v11.2" Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dxrp" %>
<%@ Register src="~/DesktopModules/Rawson.ServiceItems/ServiceItemForm.ascx" tagname="SvcItemEdit" tagprefix="vt" %>
<%@ Register Assembly="DevExpress.Web.v11.2" Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>


<style type="text/css">
    .style1
    {
        height: 22px;
    }
</style>

<table cellpadding="0"  cellspacing="0" border="0" width="100%">
    <tr align="center">
        <td>
            <dxrp:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" ShowHeader="False" >
                <PanelCollection>
                    <dx:panelcontent ID="Panelcontent1" runat="server">
                        <table cellpadding="0" cellspacing="3px" border="0" width="100%" >
                            <tr align="left">
                                <td style="white-space: nowrap;">
                                    <dxe:ASPxLabel ID="ASPxLabel1" runat="server" Text="Well Safety Test ID :">
                                    </dxe:ASPxLabel>
                                </td>
                                <td>
                                    <dxe:ASPxLabel ID="WellSafetyTestIdLabel" runat="server">
                                    </dxe:ASPxLabel>
                                </td>
                                <td>
                                    <dxe:ASPxImage ID="ASPxImage1" runat="server" ImageUrl="~/spacer.gif" Width="10px">
                                    </dxe:ASPxImage>
                                </td>
                                <td>
                                    <dxe:ASPxLabel ID="ASPxLabel2" runat="server" Text="Job # :">
                                    </dxe:ASPxLabel>
                                </td>
                                <td>
                                    <dxe:ASPxLabel ID="JobIDLabel" runat="server">
                                    </dxe:ASPxLabel>
                                </td>
                            </tr>
                            <tr align="left">
                                <td class="style1">
                                    <dxe:ASPxLabel ID="ASPxLabel6" runat="server" Text=" Location / Well Name :">
                                    </dxe:ASPxLabel>
                                </td>
                                <td class="style1">
                                    <dxe:ASPxLabel ID="ClientLocationIdLabel" runat="server">
                                    </dxe:ASPxLabel>
                                </td>
                                <td class="style1"></td>
                                <td class="style1">
                                    <dxe:ASPxLabel ID="ASPxLabel3" runat="server" Text="SO# :">
                                    </dxe:ASPxLabel>
                                </td>
                                <td class="style1">
                                    <dxe:ASPxLabel ID="SalesOrderNumLabel" runat="server">
                                    </dxe:ASPxLabel>
                                </td>
                            </tr>
                            <tr align="left">
                                <td class="style1">
                                    &nbsp;
                                </td>
                                <td class="style1">
                                    <table cellpadding="0" cellspacing="3px" border="0" width="100%" >
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    </table>
                                </td>
                                <td class="style1">
                                    &nbsp;</td>
                                <td class="style1">
                                    &nbsp;</td>
                                <td class="style1">
                                    &nbsp;</td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <dxe:ASPxLabel ID="ASPxLabel4" runat="server" Text="FSR# :">
                                    </dxe:ASPxLabel>
                                </td>
                                <td>
                                    <dxe:ASPxTextBox ID="FSR_NumTextBox" runat="server" Width="170px" TabIndex="3">
                                    </dxe:ASPxTextBox>
                                </td>
                                <td></td>
                                <td>
                                    <dxe:ASPxLabel ID="ASPxLabel5" runat="server" Text="Comp. Date :">
                                    </dxe:ASPxLabel>
                                </td>
                                <td>
                                    <dxe:ASPxLabel ID="CompletionDateLabel" runat="server">
                                    </dxe:ASPxLabel>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <dxe:ASPxLabel ID="ASPxLabel7" runat="server" Text="SSV SAP # :">
                                    </dxe:ASPxLabel>
                                </td>
                                <td>
                                    <dxe:ASPxTextBox ID="SSV_SAP_TextBox" runat="server" Width="170px" TabIndex="4">
                                    </dxe:ASPxTextBox>
                                </td>
                                <td></td>
                                <td>
                                    <dxe:ASPxLabel ID="ASPxLabel9" runat="server" Text="Date :">
                                    </dxe:ASPxLabel>
                                </td>
                                <td>
                                    <dxe:ASPxDateEdit ID="FormDateEdit" runat="server" Width="100px" TabIndex="5">
                                    </dxe:ASPxDateEdit>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                                <td></td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <dxe:ASPxLabel ID="ASPxLabel11" runat="server" Text="Valve :">
                                    </dxe:ASPxLabel>
                                </td>
                                <td>
                                    <vt:SvcItemEdit ID="ServiceItemSelect" runat="server" TabIndex="4"></vt:SvcItemEdit>
                                </td>
                                <td></td>
                                <td>
                                    <dxe:ASPxLabel ID="ASPxLabel16" runat="server" Text="Actuator Type :">
                                    </dxe:ASPxLabel>
                                </td>
                                <td>
                                    <dxe:ASPxComboBox ID="ActuatorTypeSelect" runat="server" SelectedIndex="0" 
                                        ValueType="System.String" TabIndex="7">
                                        <ClientSideEvents GotFocus="function(s, e) {
	s.ShowDropDown();
}" />
<ClientSideEvents GotFocus="function(s, e) {
	s.ShowDropDown();
}"></ClientSideEvents>
                                        <Items>
                                            <dxe:ListEditItem Selected="True" Text="-- Select Actuator Type --" Value="" />
                                            <dxe:ListEditItem Text="Diaphragm" Value="DP" />
                                            <dxe:ListEditItem Text="Canister" Value="CA" />
                                            <dxe:ListEditItem Text="Rack and Pinion" Value="RP" />
                                            <dxe:ListEditItem Text="Scotch Yoke" Value="SY" />
                                        </Items>
                                    </dxe:ASPxComboBox>
                                </td>
                            </tr>
                            <tr align="left">
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <dxe:ASPxLabel ID="ASPxLabel15" runat="server" Text="Body Mat :">
                                    </dxe:ASPxLabel>
                                </td>
                                <td>
                                    <dxe:ASPxComboBox ID="BodyMaterialSelect" runat="server" 
                                        ValueType="System.String" Width="170px" TabIndex="8" 
                                        EnableIncrementalFiltering="True" IncrementalFilteringMode="StartsWith">
                                        <ClientSideEvents GotFocus="function(s, e) {
	s.ShowDropDown();
}" />
<ClientSideEvents GotFocus="function(s, e) {
	s.ShowDropDown();
}"></ClientSideEvents>
                                        <Items>
                                            <dxe:ListEditItem Text="-- Select Body Material --" Value="" />
                                            <dxe:ListEditItem Text="Stainless Steel" Value="SS" />
                                            <dxe:ListEditItem Text="Carbon Steel" Value="CS" />
                                        </Items>
                                    </dxe:ASPxComboBox>
                                </td>
                                <td></td>
                                <td>
                                    <dxe:ASPxLabel ID="ASPxLabel18" runat="server" Text="Model or Part # :">
                                    </dxe:ASPxLabel>
                                </td>
                                <td>
                                    <dxe:ASPxTextBox ID="ActuatorModelTextBox" runat="server" Width="170px" 
                                        TabIndex="14">
                                    </dxe:ASPxTextBox>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <dxe:ASPxLabel ID="ASPxLabel17" runat="server" Text="Plug Mat :">
                                    </dxe:ASPxLabel>
                                </td>
                                <td>
                                    <dxe:ASPxComboBox ID="PlugMaterialSelect" runat="server" 
                                        ValueType="System.String" Width="170px" TabIndex="9" 
                                        EnableIncrementalFiltering="True" IncrementalFilteringMode="StartsWith">
                                        <ClientSideEvents GotFocus="function(s, e) {
	s.ShowDropDown();
}" />
<ClientSideEvents GotFocus="function(s, e) {
	s.ShowDropDown();
}"></ClientSideEvents>
                                        <Items>
                                            <dxe:ListEditItem Text="-- Select Plug Material --" Value="" />
                                            <dxe:ListEditItem Text="Stainless Steel" Value="SS" />
                                            <dxe:ListEditItem Text="Carbon Steel" Value="CS" />
                                            <dxe:ListEditItem Text="Carbide" Value="CB" />
                                        </Items>
                                    </dxe:ASPxComboBox>
                                </td>
                                <td></td>
                                <td>
                                    <dxe:ASPxLabel ID="ASPxLabel20" runat="server" Text="Serial # :">
                                    </dxe:ASPxLabel>
                                </td>
                                <td>
                                    <dxe:ASPxTextBox ID="ActuatorSerialNumTextBox" runat="server" Width="170px" 
                                        TabIndex="15">
                                    </dxe:ASPxTextBox>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <dxe:ASPxLabel ID="ASPxLabel19" runat="server" Text="Steam Mat :">
                                    </dxe:ASPxLabel>
                                </td>
                                <td>
                                    <dxe:ASPxComboBox ID="SteamMaterialSelect" runat="server" 
                                        ValueType="System.String" Width="170px" TabIndex="10" 
                                        EnableIncrementalFiltering="True" IncrementalFilteringMode="StartsWith">
                                        <ClientSideEvents GotFocus="function(s, e) {
	s.ShowDropDown();
}" />
<ClientSideEvents GotFocus="function(s, e) {
	s.ShowDropDown();
}"></ClientSideEvents>
                                        <Items>
                                            <dxe:ListEditItem Text="-- Select Steam Material --" Value="" />
                                            <dxe:ListEditItem Text="Stainless Steel" Value="SS" />
                                            <dxe:ListEditItem Text="Carbon Steel" Value="CS" />
                                        </Items>
                                    </dxe:ASPxComboBox>
                                </td>
                                <td></td>
                                <td>
                                    <dxe:ASPxLabel ID="ASPxLabel22" runat="server" Text="Air Sup Ma :">
                                    </dxe:ASPxLabel>
                                </td>
                                <td>
                                    <dxe:ASPxComboBox ID="AirSupplyMediumSelect" runat="server" SelectedIndex="0" 
                                        ValueType="System.String" Width="170px" TabIndex="16" 
                                        EnableIncrementalFiltering="True" IncrementalFilteringMode="StartsWith">
                                        <ClientSideEvents GotFocus="function(s, e) {
	s.ShowDropDown();
}" />
<ClientSideEvents GotFocus="function(s, e) {
	s.ShowDropDown();
}"></ClientSideEvents>
                                        <Items>
                                            <dxe:ListEditItem Selected="True" Text="-- Select Air Supply Medium --" 
                                                Value="" />
                                            <dxe:ListEditItem Text="Gas" Value="G" />
                                            <dxe:ListEditItem Text="Air" Value="A" />
                                        </Items>
                                    </dxe:ASPxComboBox>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <dxe:ASPxLabel ID="ASPxLabel21" runat="server" Text="Gate Mat :">
                                    </dxe:ASPxLabel>
                                </td>
                                <td>
                                    <dxe:ASPxComboBox ID="GateMaterialSelect" runat="server" 
                                        ValueType="System.String" Width="170px" TabIndex="11" 
                                        EnableIncrementalFiltering="True" IncrementalFilteringMode="StartsWith">
                                        <ClientSideEvents GotFocus="function(s, e) {
	s.ShowDropDown();
}" />
<ClientSideEvents GotFocus="function(s, e) {
	s.ShowDropDown();
}"></ClientSideEvents>
                                        <Items>
                                            <dxe:ListEditItem Text="-- Select Gate Material --" Value="" />
                                            <dxe:ListEditItem Text="Stainless Steel" Value="SS" />
                                            <dxe:ListEditItem Text="Carbon Steel" Value="CS" />
                                        </Items>
                                    </dxe:ASPxComboBox>
                                </td>
                                <td></td>
                                <td>
                                    <dxe:ASPxLabel ID="ASPxLabel24" runat="server" Text="Condition :">
                                    </dxe:ASPxLabel>
                                </td>
                                <td>
                                    <dxe:ASPxTextBox ID="ConditionTextBox" runat="server" Width="170px" 
                                        TabIndex="17">
                                    </dxe:ASPxTextBox>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <dxe:ASPxLabel ID="ASPxLabel23" runat="server" Text="Port Size :">
                                    </dxe:ASPxLabel>
                                </td>
                                <td>
                                    <dxe:ASPxTextBox ID="PortSizeTextBox" runat="server" Width="170px" 
                                        TabIndex="12"></dxe:ASPxTextBox>
                                </td>
                                <td></td>
                                <td>
                                    <dxe:ASPxLabel ID="ASPxLabel26" runat="server" Text="Date Manufactured :">
                                    </dxe:ASPxLabel>
                                </td>
                                <td>
                                    <dxe:ASPxDateEdit ID="DateManufacturedEdit" runat="server" Width="100px" 
                                        TabIndex="18">
                                    </dxe:ASPxDateEdit>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <dxe:ASPxLabel ID="ASPxLabel25" runat="server" Text="Press Class :">
                                    </dxe:ASPxLabel>
                                </td>
                                <td>
                                    <dxe:ASPxTextBox ID="PressClassTextBox" runat="server" Width="170px" 
                                        TabIndex="13"></dxe:ASPxTextBox>
                                </td>
                                <td></td>
                                <td>
                                    <dxe:ASPxLabel ID="ASPxLabel27" runat="server" Text="System Location :">
                                    </dxe:ASPxLabel>
                                </td>
                                <td>
                                    <dxe:ASPxComboBox ID="SystemLocationSelect" runat="server" SelectedIndex="0" 
                                        ValueType="System.String" Width="170px" TabIndex="19" 
                                        EnableIncrementalFiltering="True" IncrementalFilteringMode="StartsWith">
                                        <ClientSideEvents GotFocus="function(s, e) {
	s.ShowDropDown();
}" />
<ClientSideEvents GotFocus="function(s, e) {
	s.ShowDropDown();
}"></ClientSideEvents>
                                        <Items>
                                            <dxe:ListEditItem Selected="True" Text="-- Select System Location --" 
                                                Value="" />
                                            <dxe:ListEditItem Text="Seperator" Value="SEP" />
                                            <dxe:ListEditItem Text="Line Heater" Value="LH" />
                                            <dxe:ListEditItem Text="Flow Line" Value="FL" />
                                            <dxe:ListEditItem Text="Meater Run" Value="MR" />
                                        </Items>
                                    </dxe:ASPxComboBox>
                                </td>
                            </tr>
                            <tr align="left">
                                <td colspan="5" align="center"></td>
                            </tr>
                            <tr align="left">
                                <td colspan="5" align="center">
                                    <dxe:ASPxLabel ID="ASPxLabel28" runat="server" Text="Hi Lo System" Font-Bold="true">
                                    </dxe:ASPxLabel>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <dxe:ASPxLabel ID="ASPxLabel29" runat="server" Text="Type :">
                                    </dxe:ASPxLabel>
                                </td>
                                <td>
                                    <dxe:ASPxTextBox ID="ControllerTypeTextBox" runat="server" Width="170px" 
                                        TabIndex="20"></dxe:ASPxTextBox>
                                </td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <dxe:ASPxLabel ID="ASPxLabel30" runat="server" Text="HI :">
                                    </dxe:ASPxLabel>
                                </td>
                                <td>
                                    <dxe:ASPxTextBox ID="HiTextBox" runat="server" Width="170px" TabIndex="21" >
                                    </dxe:ASPxTextBox>
                                </td>
                                <td></td>
                                <td>
                                    <dxe:ASPxLabel ID="ASPxLabel31" runat="server" Text="LO :">
                                    </dxe:ASPxLabel>
                                </td>
                                <td>
                                    <dxe:ASPxTextBox ID="LoTextBox" runat="server" Width="170px" TabIndex="22">
                                    </dxe:ASPxTextBox>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <dxe:ASPxLabel ID="ASPxLabel32" runat="server" Text="Remarks :">
                                    </dxe:ASPxLabel>
                                </td>
                                <td colspan="4">
                                    <dxe:ASPxTextBox ID="NotesTextBox" runat="server" Height="50px" 
                                        TextMode="MultiLine" Width="100%" TabIndex="23"></dxe:ASPxTextBox>
                                </td>
                            </tr>
                            <tr align="left">
                                <td></td>
                                <td>
                                    <dxe:ASPxButton ID="checkButton" runat="server" AutoPostBack="False" 
                                        ClientInstanceName="checkButton" Text="Check Spelling ..." Width="170px">
                                        <ClientSideEvents Click="function(s, e) { spellChecker.Check(); }" />
<ClientSideEvents Click="function(s, e) { spellChecker.Check(); }"></ClientSideEvents>
                                    </dxe:ASPxButton>
                                    <dxsc:ASPxSpellChecker ID="NotesSpellChecker" runat="server" 
                                        CheckedElementID="NotesTextBox" ClientInstanceName="spellChecker" 
                                        Culture="en-US" 
                                        OnCheckedElementResolve="ASPxSpellChecker1_CheckedElementResolve" 
                                        ShowLoadingPanel="False">
                                        <ClientSideEvents AfterCheck="function(s, e) { checkButton.SetEnabled(true); }" 
                                            BeforeCheck="function(s, e) {    checkButton.SetEnabled(false); }" />
<ClientSideEvents BeforeCheck="function(s, e) {    checkButton.SetEnabled(false); }" AfterCheck="function(s, e) { checkButton.SetEnabled(true); }"></ClientSideEvents>
                                        <Dictionaries>
                                            <dxsc:ASPxSpellCheckerOpenOfficeDictionary Culture="en-US" 
                                                DictionaryPath="~/Dictionaries/en_US/en_US.dic" 
                                                GrammarPath="~/Dictionaries/en_US/en_US.aff" />
                                        </Dictionaries>
                                    </dxsc:ASPxSpellChecker>
                                </td>
                                <td></td>
                                <td colspan="2">
                                    <dxe:ASPxLabel ID="ASPxLabel35" runat="server" 
                                        Text="*NOTE: Set pressure verification only using Nitrogen.">
                                    </dxe:ASPxLabel>
                                </td>
                            </tr>
                            <tr align="left">
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <dxe:ASPxLabel ID="ASPxLabel33" runat="server" Text="Valve Technician :">
                                    </dxe:ASPxLabel>
                                </td>
                                <td>
                                    <dxe:ASPxLabel ID="AssignedToIDLabel" runat="server">
                                    </dxe:ASPxLabel>
                                </td>
                                <td></td>
                                <td>
                                    <dxe:ASPxLabel ID="ASPxLabel34" runat="server" Text="Manual Override :">
                                    </dxe:ASPxLabel>
                                </td>
                                <td>
                                    <dxe:ASPxComboBox ID="ManualOverrideSelect" runat="server" SelectedIndex="0" 
                                        ValueType="System.String" Width="170px" TabIndex="25" 
                                        EnableIncrementalFiltering="True" IncrementalFilteringMode="StartsWith">
                                        <ClientSideEvents GotFocus="function(s, e) {
	s.ShowDropDown();
}" />
<ClientSideEvents GotFocus="function(s, e) {
	s.ShowDropDown();
}"></ClientSideEvents>
                                        <Items>
                                            <dxe:ListEditItem Text="-- Select Manual Override --" Value="" />
                                            <dxe:ListEditItem Text="Engaged" Value="ENG" />
                                            <dxe:ListEditItem Text="Disengaged" Value="DIS" />
                                        </Items>
                                    </dxe:ASPxComboBox>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <dxe:ASPxLabel ID="ASPxLabel37" runat="server" Text="Customer Witness :">
                                    </dxe:ASPxLabel>
                                </td>
                                <td>
                                    <dxe:ASPxTextBox ID="CustomerWitnessTextBox" runat="server" Width="170px" 
                                        TabIndex="24">
                                    </dxe:ASPxTextBox>
                                </td>
                                <td></td>
                                <td>
                                    <dxe:ASPxLabel ID="ASPxLabel36" runat="server" Text="Test Result :">
                                    </dxe:ASPxLabel>
                                </td>
                                <td>
                                    <dxe:ASPxComboBox ID="TestResultIDSelect" runat="server" 
                                        ValueType="System.Int32" Width="170px" TabIndex="26" 
                                        EnableIncrementalFiltering="True" IncrementalFilteringMode="StartsWith">
                                        <ClientSideEvents GotFocus="function(s, e) {
	s.ShowDropDown();
}" />
<ClientSideEvents GotFocus="function(s, e) {
	s.ShowDropDown();
}"></ClientSideEvents>
                                        <Items>
                                            <dxe:ListEditItem Text="-- Select Test Result ID --" Value="-1" />
                                            <dxe:ListEditItem Text="Tested Good" Value="5" />
                                            <dxe:ListEditItem Text="Needs Repair" Value="6" />
                                            <dxe:ListEditItem Text="Needs Replacement" Value="7" />
                                        </Items>
                                    </dxe:ASPxComboBox>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr align="left">
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td>
                                    <dxe:ASPxButton ID="btnSave" runat="server" AutoPostBack="False" Text="Save" 
                                        Width="170px" TabIndex="27">
                                        <ClientSideEvents Click="function(s,e){ saveAction.PerformCallback(); }" />
<ClientSideEvents Click="function(s,e){ saveAction.PerformCallback(); }"></ClientSideEvents>
                                    </dxe:ASPxButton>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                                <td></td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr align="left">
                                <td colspan="5" align="center">
                                    <dxe:ASPxLabel ID="ASPxLabel38" runat="server" Text="**OFFICE USE ONLY**">
                                    </dxe:ASPxLabel>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <dxe:ASPxLabel ID="ASPxLabel39" runat="server" Text="Entered in Valvtrak By :">
                                    </dxe:ASPxLabel>
                                </td>
                                <td>
                                    <dxe:ASPxLabel ID="CreatedByLabel" runat="server">
                                    </dxe:ASPxLabel>
                                </td>
                                <td></td>
                                <td>
                                    <dxe:ASPxLabel ID="ASPxLabel40" runat="server" Text="Entered Date :">
                                    </dxe:ASPxLabel>
                                </td>
                                <td>
                                    <dxe:ASPxLabel ID="CreatedDateLabel" runat="server">
                                    </dxe:ASPxLabel>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <dxe:ASPxLabel ID="ASPxLabel41" runat="server" Text="Modified By :">
                                    </dxe:ASPxLabel>
                                </td>
                                <td>
                                    <dxe:ASPxLabel ID="ModifiedByLabel" runat="server">
                                    </dxe:ASPxLabel>
                                </td>
                                <td></td>
                                <td>
                                    <dxe:ASPxLabel ID="ASPxLabel42" runat="server" Text="Modified Date :">
                                    </dxe:ASPxLabel>
                                </td>
                                <td>
                                    <dxe:ASPxLabel ID="ModifiedDateLabel" runat="server">
                                    </dxe:ASPxLabel>
                                </td>
                            </tr>
                            </table>
                    </dx:panelcontent>
                </PanelCollection>
            </dxrp:ASPxRoundPanel>

        </td>
    </tr>
</table>
<dx:ASPxPopupControl ID="pcValidation" runat="server" ClientInstanceName="validation"
        Modal="false" ShowFooter="false" HeaderText="Validation Errrors" CloseAction="CloseButton" 
        AllowDragging="true" AllowResize="true" AutoUpdatePosition="true" 
        PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter">
    <ContentCollection>
        <dx:PopupControlContentControl runat="server">
        </dx:PopupControlContentControl>
    </ContentCollection>
</dx:ASPxPopupControl>
<dx:ASPxCallback ID="SaveAction" runat="server" ClientInstanceName="saveAction" 
    oncallback="SaveAction_Callback" >
    <ClientSideEvents EndCallback="function(s,e) { if (s.cpHasErrors) {
                                                        validation.SetContentHtml(s.cpErrorMessage);
                                                        validation.Show();
                                                    }
                                                    else {
                                                        validation.Hide();
                                                        history.go(-1);
                                                    }
                                                    }"  />
</dx:ASPxCallback>
<dx:ASPxGlobalEvents ID="ASPxGlobalEvents1" runat="server">
    <ClientSideEvents BeginCallback="function(s,e){ lpanel.Show(); }" 
            EndCallback="function(s,e){ lpanel.Hide(); }" />
</dx:ASPxGlobalEvents>
<dx:ASPxLoadingPanel ID="ASPxLoadingPanel1" runat="server"  ClientInstanceName="lpanel" Modal="true">
    <ClientSideEvents Init="function(s,e){ s.SetText('Loading....'); }" />
</dx:ASPxLoadingPanel>
