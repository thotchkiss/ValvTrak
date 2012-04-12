<%@ Control Language="C#" CodeFile="~/DesktopModules/Rawson.ValveTests/ValveTestForm.ascx.cs" Inherits="Rawson.ValveTests.ValveTestForm" AutoEventWireup="true" EnableTheming="true" %>
<%@ Register Assembly="DevExpress.Web.v11.2" Namespace="DevExpress.Web.ASPxLoadingPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v11.2" Namespace="DevExpress.Web.ASPxGlobalEvents" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v11.2" Namespace="DevExpress.Web.ASPxCallback" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v11.2" Namespace="DevExpress.Web.ASPxMenu" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v11.2" Namespace="DevExpress.Web.ASPxHeadline" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v11.2" Namespace="DevExpress.Web.ASPxNavBar" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxSpellChecker.v11.2" Namespace="DevExpress.Web.ASPxSpellChecker" TagPrefix="dxsc" %>
<%@ Register Assembly="DevExpress.Web.v11.2" Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dxrp" %>
<%@ Register Assembly="DevExpress.Web.v11.2" Namespace="DevExpress.Web.ASPxCallbackPanel" TagPrefix="dxcp" %>
<%@ Register Assembly="DevExpress.Web.v11.2" Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dxpc" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v11.2" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v11.2" Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dxp" %>

<%@ Register src="~/DesktopModules/Rawson.ServiceItems/ServiceItemForm.ascx" tagname="SvcItemEdit" tagprefix="vt" %>

<style type="text/css">
	.style1
	{
		height: 18px;
	}
	.style2
	{
		height: 22px;
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
</script>
<script type="text/javascript"">

	function showPopup( iWindow )
	{
		var win = popups.GetWindow( iWindow )
		popups.ShowWindow(win);
	}
	
</script>
<table cellpadding="0" cellspacing="0" width="900px">
	<tr>
		<td>
			<dxrp:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" ShowHeader="False" Width="100%">
				<PanelCollection>
					<dxp:PanelContent ID="PanelContent1" runat="server">
						<table style="white-space: nowrap;">
							<tr>
								<td>
									<dxe:ASPxLabel ID="ASPxLabel1" runat="server" Text="Test ID :">
									</dxe:ASPxLabel>
								</td>
								<td>
									<dxe:ASPxLabel ID="ValveTestIDLabel" runat="server">
									</dxe:ASPxLabel>
								</td>
								<td>
									<dxe:ASPxImage ID="ASPxImage1" runat="server" ImageUrl="~/spacer.gif" Width="10px">
									</dxe:ASPxImage>
								</td>
								<td>
									<dxe:ASPxLabel ID="ASPxLabel2" runat="server" Text="FSR # :">
									</dxe:ASPxLabel>
								</td>
								<td>
									<dxe:ASPxTextBox ID="FSRNumTextBox" runat="server" Width="170px" TabIndex="1"></dxe:ASPxTextBox>
								</td>
								<td>
									<dxe:ASPxImage ID="ASPxImage2" runat="server" ImageUrl="~/spacer.gif" Width="10px">
									</dxe:ASPxImage>
								</td>
								<td>
									<dxe:ASPxLabel ID="ASPxLabel3" runat="server" Text="SO # :">
									</dxe:ASPxLabel>
								</td>
								<td>
									<dxe:ASPxLabel ID="SalesOrderLabel" runat="server">
									</dxe:ASPxLabel>
								</td>
							</tr>
							<tr>
								<td>
									<dxe:ASPxLabel ID="ASPxLabel4" runat="server" Text="Customer :">
									</dxe:ASPxLabel>
								</td>
								<td>
									<dxe:ASPxLabel ID="CustomerLabel" runat="server">
									</dxe:ASPxLabel>
								</td>
								<td>&nbsp;</td>
								<td>
									<dxe:ASPxLabel ID="ASPxLabel5" runat="server" Text="Location :">
									</dxe:ASPxLabel>
								</td>
								<td>
									<dxe:ASPxLabel ID="LocationLabel" runat="server">
									</dxe:ASPxLabel>
								</td>
								<td>&nbsp;</td>
								<td>
									<dxe:ASPxLabel ID="ASPxLabel6" runat="server" Text="Cost Ctr. :">
									</dxe:ASPxLabel>
								</td>
								<td>
									<dxe:ASPxTextBox ID="CostCenterTextBox" runat="server" Width="170px" 
										TabIndex="2"></dxe:ASPxTextBox>
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
										</td>
										<td>
										</td>
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
							<tr>
								<td>
									<dxe:ASPxLabel ID="ASPxLabel7" runat="server" Text="Valve :">
									</dxe:ASPxLabel>
								</td>
								<td colspan="4">
									<vt:SvcItemEdit ID="siEdit" runat="server" TabIndex="3" ServiceItemCategoryID="2"  />
								</td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td class="style1"><dxe:ASPxImage ID="ASPxImage3" runat="server" ImageUrl="~/spacer.gif" Height="10px">
									</dxe:ASPxImage>
								</td>
								<td class="style1"></td>
								<td class="style1"></td>
								<td class="style1"></td>
								<td class="style1"></td>
								<td class="style1"></td>
								<td class="style1"></td>
								<td class="style1"></td>
							</tr>
							<tr>
								<td nowrap="nowrap">
									<dxe:ASPxLabel ID="ASPxLabel9" runat="server" Text="Date Tested :">
									</dxe:ASPxLabel>
								</td>
								<td>
									<dxe:ASPxDateEdit ID="DateTestedEdit" runat="server" Width="100px" TabIndex="4">
										<ClientSideEvents GotFocus="function(s, e) { s.ShowDropDown(); }" />
									</dxe:ASPxDateEdit>
								</td>
								<td>&nbsp;</td>
								<td>
									<dxe:ASPxLabel ID="ASPxLabel36" runat="server" Text="SAP PSV :">
									</dxe:ASPxLabel>
								</td>
								<td>
									<dxe:ASPxTextBox ID="SapPsvTextBox" runat="server" Width="150px" 
										TabIndex="5">
									</dxe:ASPxTextBox>
								</td>
								<td>&nbsp;</td>
								<td nowrap="nowrap">
									<dxe:ASPxLabel ID="ASPxLabel8" runat="server" Text="PSV Appl. :">
									</dxe:ASPxLabel>
								</td>
								<td>
									<dxe:ASPxTextBox ID="PsvApplicationTextBox" runat="server" Width="170px" 
										TabIndex="5">
									</dxe:ASPxTextBox>
								</td>
							</tr>
							<tr>
								<td class="style2">
									<asp:Label ID="Label1" runat="server" Text="Latitude :"></asp:Label>
								</td>
								<td class="style2">

									<dxe:ASPxTextBox ID="txtLatitude" runat="server" Height="21px" Width="100px" 
										NullText="Add Latitude" TabIndex="6">
										<MaskSettings PromptChar=" " />
										<NullTextStyle ForeColor="Silver">
										</NullTextStyle>
									</dxe:ASPxTextBox>

								</td>
								<td class="style2"></td>
								<td class="style2">
									<asp:Label ID="Label2" runat="server" Text="Longitude :"></asp:Label>
								</td>
								<td class="style2">
									<dxe:ASPxTextBox ID="txtLongitude" runat="server" Height="21px" Width="100px" 
										NullText="Add Longitude" TabIndex="6">
										<MaskSettings PromptChar=" " />
										<NullTextStyle ForeColor="Silver">
										</NullTextStyle>
									</dxe:ASPxTextBox>
								</td>
								<td class="style2"></td>
								<td class="style2"></td>
								<td class="style2"></td>
							</tr>
							<tr>
								<td>
									<dxe:ASPxLabel ID="ASPxLabel10" runat="server" Text="Set Presure :">
									</dxe:ASPxLabel>
								</td>
								<td>
									<dxe:ASPxSpinEdit ID="seSetPressure" runat="server" 
										ClientInstanceName="setPressure" Height="21px" Number="0" Width="100px" 
										TabIndex="6" MaxValue="15000" DecimalPlaces="2" EnableClientSideAPI="True">
										<ClientSideEvents NumberChanged="function(s,e){ 
																			var sp = s.GetValue();
																			var bp = backPressure.GetValue();
																						
																			coldDiffPressure.SetText(String(sp - bp)); }" />
									</dxe:ASPxSpinEdit>
								</td>
								<td>
									&nbsp;
								</td>
								<td nowrap="nowrap">
									<dxe:ASPxLabel ID="ASPxLabel11" runat="server" Text="Back Pressure :">
									</dxe:ASPxLabel>
								</td>
								<td>
									<dxe:ASPxSpinEdit ID="seBackPressure" runat="server" 
										ClientInstanceName="backPressure" Height="21px" Number="0" Width="100px" 
										TabIndex="7" MaxValue="10000" DecimalPlaces="2">
										<ClientSideEvents NumberChanged="function(s,e){ 
																			var sp = setPressure.GetValue();
																			var bp = s.GetValue();
																						
																			coldDiffPressure.SetText(String(sp - bp)); }" />
									</dxe:ASPxSpinEdit>
								</td>
								<td></td>
								<td>
									<dxe:ASPxLabel ID="ASPxLabel12" runat="server" Text="Cold Diff. Pressure :" >
									</dxe:ASPxLabel>
								</td>
								<td>
									<dxe:ASPxTextBox ID="ColdDiffPressureTextBox" runat="server" ClientInstanceName="coldDiffPressure" Width="100px" 
										TabIndex="8" ReadOnly="True" Enabled="false">
									</dxe:ASPxTextBox>
								</td>
							</tr>
							<tr>
								<td nowrap="nowrap">
									<dxe:ASPxLabel ID="ASPxLabel13" runat="server" Text="Temp. Corr. :">
									</dxe:ASPxLabel>
								</td>
								<td>
									<dxe:ASPxTextBox ID="TempCorrTextBox" runat="server" Width="100px" TabIndex="9">
									</dxe:ASPxTextBox>
								</td>
								<td>
									&nbsp;
								</td>
								<td>
									<dxe:ASPxLabel ID="ASPxLabel14" runat="server" Text="Capacity :">
									</dxe:ASPxLabel>
								</td>
								<td>
									<dxe:ASPxTextBox ID="CapacityTextBox" runat="server" Width="100px" 
										TabIndex="10">
									</dxe:ASPxTextBox>
									<dxe:ASPxComboBox ID="CapacityTypeSelect" runat="server" 
										DataSourceID="CapacityTypeDataSource" TextField="DisplayMember" 
										ValueField="ValueMember" ValueType="System.Int32" Width="135px" 
										TabIndex="11" EnableIncrementalFiltering="True" 
										IncrementalFilteringMode="StartsWith">
										<ClientSideEvents GotFocus="function(s, e) { s.ShowDropDown(); }" />
									</dxe:ASPxComboBox>
								</td>
								<td></td>
								<td>
									<dxe:ASPxLabel ID="ASPxLabel15" runat="server" Text="Seal # :">
									</dxe:ASPxLabel>
								</td>
								<td>
									<dxe:ASPxTextBox ID="SealNumTextBox" runat="server" Width="170px" TabIndex="12">
									</dxe:ASPxTextBox>
								</td>
							</tr>
							<tr>
								<td>
									<dxe:ASPxImage ID="ASPxImage4" runat="server" ImageUrl="~/spacer.gif" Height="10px">
									</dxe:ASPxImage>
								</td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td>
									<dxe:ASPxLabel ID="ASPxLabel16" runat="server" Text="Guage # :">
									</dxe:ASPxLabel>
								</td>
								<td>
									<dxe:ASPxTextBox ID="GuageNumTextBox" runat="server" Width="170px" 
										TabIndex="13"></dxe:ASPxTextBox>
								</td>
								<td>
									&nbsp;
								</td>
								<td>
									<dxe:ASPxLabel ID="ASPxLabel17" runat="server" Text="Calibr. Due :">
									</dxe:ASPxLabel>
								</td>
								<td>
									<dxe:ASPxDateEdit ID="CalibrationDueDateEdit" runat="server" Width="100px" TabIndex="14">
										<ClientSideEvents GotFocus="function(s, e) { s.ShowDropDown(); }" />
									</dxe:ASPxDateEdit>
								</td>
								<td>&nbsp;</td>
								<td>
									<dxe:ASPxLabel ID="ASPxLabel18" runat="server" Text="Coded :">
									</dxe:ASPxLabel>
								</td>
								<td>
									<dxe:ASPxComboBox ID="CodedSelect" runat="server" Width="100px" 
										ValueType="System.Int32" TabIndex="15" EnableIncrementalFiltering="True" 
										IncrementalFilteringMode="StartsWith">
										<ClientSideEvents GotFocus="function(s, e) { s.ShowDropDown(); }" />
										<Items>
											<dxe:ListEditItem Text="-- Select --" Value="-1" />
											<dxe:ListEditItem Text="Yes" Value="1" />
											<dxe:ListEditItem Text="No" Value="0" />
										</Items>
									</dxe:ASPxComboBox>
								</td>
							</tr>
							<tr>
								<td>
									<dxe:ASPxLabel ID="ASPxLabel19" runat="server" Text="Valve Date :">
									</dxe:ASPxLabel>
								</td>
								<td>
									<dxe:ASPxDateEdit ID="ValveDateEdit" runat="server" Width="100px" TabIndex="16">
										<ClientSideEvents GotFocus="function(s, e) { s.ShowDropDown(); }" />
									</dxe:ASPxDateEdit>
								</td>
								<td>
									&nbsp;
								</td>
								<td>
									<dxe:ASPxLabel ID="ASPxLabel20" runat="server" Text="Isol. Valve :">
									</dxe:ASPxLabel>
								</td>
								<td>
									<dxe:ASPxComboBox ID="IsolationValveSelect" runat="server" Width="100px" 
										ValueType="System.Int32" TabIndex="17" EnableIncrementalFiltering="True" 
										IncrementalFilteringMode="StartsWith">
										<ClientSideEvents SelectedIndexChanged="function(s,e){ if (s.GetValue() == 0) showPopup(0); }" 
											Gotfocus="function(s, e) { s.ShowDropDown(); }" />
										<Items>
											<dxe:ListEditItem Text="-- Select --" Value="-1" />
											<dxe:ListEditItem Text="Yes" Value="1" />
											<dxe:ListEditItem Text="No" Value="0" />
										</Items>
									</dxe:ASPxComboBox>
								</td>
								<td></td>
								<td>
									<dxe:ASPxLabel ID="ASPxLabel21" runat="server" Text="Rel. Valve Support :">
									</dxe:ASPxLabel>
								</td>
								<td>
									<dxe:ASPxComboBox ID="ReliefValveSupportSelect" runat="server" Width="100px"
										ValueType="System.Int32" TabIndex="18" EnableIncrementalFiltering="True" 
										IncrementalFilteringMode="StartsWith">
										<ClientSideEvents GotFocus="function(s, e) { s.ShowDropDown(); }" />
										<Items>
											<dxe:ListEditItem Text="-- Select --" Value="-1" />
											<dxe:ListEditItem Text="Yes" Value="1" />
											<dxe:ListEditItem Text="No" Value="0" />
											<dxe:ListEditItem Text="Needs Reviewed" Value="2" />
										</Items>
									</dxe:ASPxComboBox>
								</td>
							</tr>
							<tr>
								<td>
									<dxe:ASPxLabel ID="ASPxLabel22" runat="server" Text="Test Port :">
									</dxe:ASPxLabel>
								</td>
								<td>
									<dxe:ASPxComboBox ID="TestPortSelect" runat="server" Width="100px" 
										ValueType="System.Int32" TabIndex="19" EnableIncrementalFiltering="True" 
										IncrementalFilteringMode="StartsWith">
										<ClientSideEvents SelectedIndexChanged="function(s,e){ if (s.GetValue() == 0) showPopup(1); }" 
											gotfocus="function(s, e) { s.ShowDropDown(); }" />
										<Items>
											<dxe:ListEditItem Text="-- Select --" Value="-1" />
											<dxe:ListEditItem Text="Yes" Value="1" />
											<dxe:ListEditItem Text="No" Value="0" />
										</Items>
									</dxe:ASPxComboBox>
								</td>
								<td></td>
								<td>
									<dxe:ASPxLabel ID="ASPxLabel23" runat="server" Text="Weather Cap :">
									</dxe:ASPxLabel>
								</td>
								<td>
									<dxe:ASPxComboBox ID="WeatherCapSelect" runat="server" Width="100px" 
										ValueType="System.Int32" TabIndex="20" EnableIncrementalFiltering="True" 
										IncrementalFilteringMode="StartsWith">
										<ClientSideEvents GotFocus="function(s, e) { s.ShowDropDown(); }" />
										<Items>
											<dxe:ListEditItem Text="-- Select --" Value="-1" />
											<dxe:ListEditItem Text="Yes" Value="1" />
											<dxe:ListEditItem Text="No" Value="0" />
											<dxe:ListEditItem Text="Needs Reviewed" Value="2" />
										</Items>
									</dxe:ASPxComboBox>
								</td>
								<td>&nbsp;</td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td>
									<dxe:ASPxImage ID="ASPxImage5" runat="server" ImageUrl="~/spacer.gif" Height="10px">
									</dxe:ASPxImage>
								</td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td>
									<dxe:ASPxLabel ID="ASPxLabel24" runat="server" Text="DOT Loc. :">
									</dxe:ASPxLabel>
								</td>
								<td>
									<dxe:ASPxComboBox ID="DOTLocationSelect" runat="server" Width="100px" 
										ValueType="System.Int32" TabIndex="21" EnableIncrementalFiltering="True" 
										IncrementalFilteringMode="StartsWith">
										<ClientSideEvents GotFocus="function(s, e) { s.ShowDropDown(); }" />
										<Items>
											<dxe:ListEditItem Text="-- Select --" Value="-1" />
											<dxe:ListEditItem Text="Yes" Value="1" />
											<dxe:ListEditItem Text="No" Value="0" />
										</Items>
									</dxe:ASPxComboBox>
								</td>
								<td>
									&nbsp;</td>
								<td nowrap="nowrap">
									<dxe:ASPxLabel ID="ASPxLabel25" runat="server" Text="JSA Complete :">
									</dxe:ASPxLabel>
								</td>
								<td>
									<dxe:ASPxCheckBox ID="JSACompleteCheckBox" runat="server" Text="" TabIndex="22">
									</dxe:ASPxCheckBox>
								</td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td>
									<dxe:ASPxImage ID="ASPxImage6" runat="server" ImageUrl="~/spacer.gif" Height="10px">
									</dxe:ASPxImage>
								</td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td colspan="5">
									<dxe:ASPxLabel ID="ASPxLabel26" runat="server" Text="FINAL TEST RESULTS" Font-Bold="true">
									</dxe:ASPxLabel>
								</td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td>
									<dxe:ASPxImage ID="ASPxImage7" runat="server" ImageUrl="~/spacer.gif" Height="10px">
									</dxe:ASPxImage>
								</td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td colspan="3">
									<table>
										<tr>
											<td>
												<dxe:ASPxLabel ID="ASPxLabel27" runat="server" Text="Set Pres. Found :">
												</dxe:ASPxLabel>
											</td>
											<td>
												 <dxe:ASPxTextBox ID="SetPressureFoundTextBox" runat="server" TabIndex="23" 
													 Width="100px"></dxe:ASPxTextBox>
											</td>
											<td align="left">
												<dxe:ASPxLabel ID="ASPxLabel34" runat="server" Text="(psig)">
												</dxe:ASPxLabel>
											</td>
										</tr>
									</table>
								</td>
								<td colspan="3">
									<table>
										<tr>
											<td>
												<dxe:ASPxLabel ID="ASPxLabel28" runat="server" Text="Set Pres. Left :">
												</dxe:ASPxLabel>
											</td>
											<td>
												<dxe:ASPxTextBox ID="SetPressureLeftTextBox" runat="server" TabIndex="24" 
													Width="100px"></dxe:ASPxTextBox>
											</td>
											<td align="left">
												<dxe:ASPxLabel ID="ASPxLabel35" runat="server" Text="(psig)">
												</dxe:ASPxLabel>
											</td>
										</tr>
									</table>
								</td>
								<td nowrap="nowrap">
									<dxe:ASPxLabel ID="ASPxLabel29" runat="server" Text="Test Result :">
									</dxe:ASPxLabel>
								</td>
								<td>
									<dxe:ASPxComboBox ID="TestResultIDSelect" runat="server" Width="170px" 
										ValueType="System.Int32" TabIndex="25" IncrementalFilteringMode="StartsWith">
										<ClientSideEvents GotFocus="function(s, e) { s.ShowDropDown(); }" />
										<Items>
											<dxe:ListEditItem Text="-- Select Test Result ID --" Value="-1" />
											<dxe:ListEditItem Text="Tested Good" Value="5" />
											<dxe:ListEditItem Text="Needs Replacement" Value="7" />
											<dxe:ListEditItem Text="Repaired" Value="8" />
											<dxe:ListEditItem Text="Replaced" Value="9" />
										</Items>
									</dxe:ASPxComboBox>
								</td>
							</tr>
							<tr>
							   <td colspan="8">
									<dxe:ASPxImage ID="ASPxImage8" runat="server" ImageUrl="~/spacer.gif" Height="10px">
									</dxe:ASPxImage>
							   </td>
							</tr>
							<tr>
								<td>
									<dxe:ASPxLabel ID="ASPxLabel30" runat="server" Text="Remarks :">
									</dxe:ASPxLabel>
								</td>
								<td colspan="7">
									<dxe:ASPxTextBox ID="RemarksTextBox" runat="server" Height="50px" TextMode="MultiLine"
										Width="100%" TabIndex="26"></dxe:ASPxTextBox>
								</td>
							</tr>
							<tr>
								<td></td>
								<td>
									<dxe:ASPxButton ID="RemarksCheckButton" runat="server" 
										ClientInstanceName="RemarksCheckButton" Text="Check Spelling ..." 
										AutoPostBack="False" TabIndex="27" Width="150px">
										 <ClientSideEvents Click="function(s, e) { NotesSpellChecker.Check(); }" />
									 </dxe:ASPxButton>
									<dxsc:ASPxSpellChecker ID="NotesSpellChecker" runat="server" ClientInstanceName="NotesSpellChecker" 
										CheckedElementID="RemarksTextBox" OnCheckedElementResolve="ASPxSpellChecker1_CheckedElementResolve" 
										Culture="English (United States)" ShowLoadingPanel="false">
										<ClientSideEvents BeforeCheck="function(s, e) {    RemarksCheckButton.SetEnabled(false); }" AfterCheck="function(s, e) { RemarksCheckButton.SetEnabled(true); }"></ClientSideEvents>
										<Dictionaries>
											 <dxsc:ASPxSpellCheckerOpenOfficeDictionary Culture="English (United States)" 
												 DictionaryPath="~/Dictionaries/en_US/en_US.dic" 
												 GrammarPath="~/Dictionaries/en_US/en_US.aff" />
										 </Dictionaries>
										 <ClientSideEvents BeforeCheck="function(s, e) {    RemarksCheckButton.SetEnabled(false); }"
														   AfterCheck="function(s, e) { RemarksCheckButton.SetEnabled(true); }" />
									 </dxsc:ASPxSpellChecker>

								</td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td>
									<dxe:ASPxLabel ID="ASPxLabel31" runat="server" Text="Immediate Review :">
									</dxe:ASPxLabel>
								</td>
								<td colspan="7">
									<dxe:ASPxTextBox ID="ItemsForImmediateReviewTextBox" runat="server" 
										Height="50px" TextMode="MultiLine"
										Width="100%" TabIndex="28"></dxe:ASPxTextBox>
								</td>
							</tr>
							<tr>
								<td></td>
								<td>
									<dxe:ASPxButton ID="ItemsCheckButton" runat="server" 
										ClientInstanceName="ItemsCheckButton" Text="Check Spelling ..." 
										AutoPostBack="False" TabIndex="29" Width="150px">
										 <ClientSideEvents Click="function(s, e) { ReviewItemsSpellChecker.Check(); }" />
									 </dxe:ASPxButton>
									<dxsc:ASPxSpellChecker ID="ReviewItemsSpellChecker" runat="server" ClientInstanceName="ReviewItemsSpellChecker" 
										CheckedElementID="ItemsForImmediateReviewTextBox" OnCheckedElementResolve="ASPxSpellChecker2_CheckedElementResolve" 
										Culture="English (United States)" ShowLoadingPanel="false">
										<ClientSideEvents BeforeCheck="function(s, e) {    ItemsCheckButton.SetEnabled(false); }" AfterCheck="function(s, e) { ItemsCheckButton.SetEnabled(true); }"></ClientSideEvents>
										 <Dictionaries>
											 <dxsc:ASPxSpellCheckerOpenOfficeDictionary Culture="English (United States)" 
												 DictionaryPath="~/Dictionaries/en_US/en_US.dic" 
												 GrammarPath="~/Dictionaries/en_US/en_US.aff" />
										 </Dictionaries>
										 <ClientSideEvents BeforeCheck="function(s, e) {    ItemsCheckButton.SetEnabled(false); }"
														   AfterCheck="function(s, e) { ItemsCheckButton.SetEnabled(true); }" />
									 </dxsc:ASPxSpellChecker>
								</td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td>
									<dxe:ASPxImage ID="ASPxImage9" runat="server" ImageUrl="~/spacer.gif" Height="10px">
									</dxe:ASPxImage>
								</td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td>
									<dxe:ASPxLabel ID="ASPxLabel32" runat="server" Text="Valve Tech. :">
									</dxe:ASPxLabel>
								</td>
								<td>
									<dxe:ASPxComboBox ID="TechIDSelect" runat="server" 
										DataSourceID="EmployeeDataSource" TextField="DisplayMember" 
										ValueField="ValueMember" ValueType="System.Int32" TabIndex="30" 
										EnableIncrementalFiltering="True" EnableSynchronization="True" 
										IncrementalFilteringMode="StartsWith">
										<ClientSideEvents Init="function(s, e) {DevExComboUnboundItem(s, e, '-- None --', -1)}"
											 GotFocus="function(s, e) { s.SelectAll(); s.ShowDropDown(); }" />
									</dxe:ASPxComboBox>
								</td>
								<td></td>
								<td nowrap="nowrap">
									<dxe:ASPxLabel ID="ASPxLabel33" runat="server" Text="Customer Witness :">
									</dxe:ASPxLabel>
								</td>
								<td>
									<dxe:ASPxTextBox ID="CustomerWitnessTextBox" runat="server" Width="170px" 
										TabIndex="31">
									</dxe:ASPxTextBox>
								</td>
								<td></td>
								<td></td>
								<td align="right">
									<dxe:ASPxButton ID="btnSave" runat="server" Text="Save" Width="170px" 
										AutoPostBack="false" TabIndex="32" >
										<ClientSideEvents Click="function(s,e){ saveAction.PerformCallback(); }" />
									</dxe:ASPxButton>
								</td>
							</tr>
						</table>
						<asp:LinqDataSource ID="CapacityTypeDataSource" runat="server" OnSelecting="CapacityTypeDataSource_Selecting">
						</asp:LinqDataSource>
						<asp:LinqDataSource ID="EmployeeDataSource" runat="server" OnSelecting="EmployeeDataSource_Selecting">
						</asp:LinqDataSource>
					</dxp:PanelContent>
				</PanelCollection>
			</dxrp:ASPxRoundPanel>
			<dxpc:ASPxPopupControl ID="pcGrid" runat="server" ClientInstanceName="popups" PopupHorizontalAlign="WindowCenter"
				 PopupVerticalAlign="WindowCenter" Modal="false">
				<Windows>
					<dxpc:PopupWindow AutoUpdatePosition="True" Name="isolationValveRequired" 
						ShowFooter="False" Text="Isolation valve is required!" HeaderText=" " >
						<ContentCollection>
							<dxpc:PopupControlContentControl runat="server">
							</dxpc:PopupControlContentControl>
						</ContentCollection>
					</dxpc:PopupWindow>
					<dxpc:PopupWindow AutoUpdatePosition="True" Name="testPortRequired" HeaderText=" "
						ShowFooter="False" Text="Test port is required!">
						<ContentCollection>
							<dxpc:PopupControlContentControl runat="server">
							</dxpc:PopupControlContentControl>
						</ContentCollection>
					</dxpc:PopupWindow>
				</Windows>
			</dxpc:ASPxPopupControl>
			<dxpc:ASPxPopupControl ID="pcValidation" runat="server" ClientInstanceName="validation"
					Modal="false" ShowFooter="false" HeaderText="Validation Errrors" CloseAction="CloseButton" 
					AllowDragging="true" AllowResize="true" AutoUpdatePosition="true" 
					PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter">
				<ContentCollection>
					<dxpc:PopupControlContentControl runat="server">
					</dxpc:PopupControlContentControl>
				</ContentCollection>
			</dxpc:ASPxPopupControl>
			<dx:ASPxCallback ID="SaveAction" runat="server" ClientInstanceName="saveAction" 
				oncallback="SaveAction_Callback">
				<ClientSideEvents EndCallback="function(s,e) { if (s.cpHasErrors) {
																	validation.SetContentHtml(s.cpErrorMessage);
																	validation.Show();
																}
																else {
																	validation.Hide(); 
																	history.go(-1);
																} }"  />
			</dx:ASPxCallback>
			<dx:ASPxGlobalEvents ID="ASPxGlobalEvents1" runat="server">
				<ClientSideEvents BeginCallback="function(s,e){ lpanel.Show(); }" 
					 EndCallback="function(s,e){ lpanel.Hide(); }" />
			</dx:ASPxGlobalEvents>
			<dx:ASPxLoadingPanel ID="ASPxLoadingPanel1" runat="server"  ClientInstanceName="lpanel" Modal="true">
				<ClientSideEvents Init="function(s,e){ s.SetText('Loading....'); }" />
			</dx:ASPxLoadingPanel>
		</td>
	</tr>
</table>
