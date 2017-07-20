<%@ Control Language="C#" AutoEventWireup="true" CodeFile="RateValvesForm.ascx.cs" Inherits="RateValvesForm" %>

<%@ Register Assembly="DevExpress.Web.v17.1" Namespace="DevExpress.Web" TagPrefix="dx" %>






<%@ Register Assembly="DevExpress.Web.ASPxSpellChecker.v17.1" Namespace="DevExpress.Web.ASPxSpellChecker" TagPrefix="dxsc" %>
<%@ Register Assembly="DevExpress.Web.v17.1" Namespace="DevExpress.Web" TagPrefix="dxrp" %>
<%@ Register Assembly="DevExpress.Web.v17.1" Namespace="DevExpress.Web" TagPrefix="dxcp" %>
<%@ Register Assembly="DevExpress.Web.v17.1" Namespace="DevExpress.Web" TagPrefix="dxpc" %>
<%@ Register Assembly="DevExpress.Web.v17.1" Namespace="DevExpress.Web" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v17.1" Namespace="DevExpress.Web" TagPrefix="dxp" %>

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

	function showPopup(iWindow) {
		var win = popups.GetWindow(iWindow)
		popups.ShowWindow(win);
	}

	function hotKeyHandler(source, e) {

		if (e.htmlEvent.altKey) {

			if (e.htmlEvent.keyCode == 77) {

				techIDSelect.Focus();
				techIDSelect.SetText("");
			}
		}

        e.htmlEvent.cancelBubble = true;
        
	} 

</script>

<table cellpadding="0" cellspacing="0">
	<tr>
		<td>
			<dxrp:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" ShowHeader="False">
				<PanelCollection>
					<dxp:PanelContent ID="PanelContent1" runat="server">
						<table style="white-space: nowrap;">
							<tr>
								<td>
									<dxe:ASPxLabel ID="ASPxLabel1" runat="server" Text="Test ID :">
									</dxe:ASPxLabel>
								</td>
								<td>
									<dxe:ASPxLabel ID="RateValveTestIDLabel" runat="server">
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
									<dxe:ASPxTextBox ID="FSRNumTextBox" runat="server" Width="120px" TabIndex="1"></dxe:ASPxTextBox>
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
                                <td colspan="8">&nbsp;</td>
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
									&nbsp;</td>
								<td>
									&nbsp;</td>
							</tr>
							<tr align="left">
								<td class="style1">
									&nbsp;
								</td>
								<td class="style1">
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
								<td colspan="7">
									<vt:SvcItemEdit ID="siEdit" runat="server" TabIndex="3" ServiceItemCategoryID="2"  />
								</td>
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
									</dxe:ASPxDateEdit>
								</td>
								<td>&nbsp;</td>
								<td>
									<asp:Label ID="Label1" runat="server" Text="Latitude :"></asp:Label>
								</td>
								<td>
									<dxe:ASPxTextBox ID="txtLatitude" runat="server" Height="21px" 
										NullText="Add Latitude" TabIndex="7" Width="100px">
										<MaskSettings PromptChar=" " />
										<NullTextStyle ForeColor="Silver">
										</NullTextStyle>
									</dxe:ASPxTextBox>
								</td>
								<td>&nbsp;</td>
								<td nowrap="nowrap">
									<asp:Label ID="Label2" runat="server" Text="Longitude :"></asp:Label>
								</td>
								<td>
									<dxe:ASPxTextBox ID="txtLongitude" runat="server" Height="21px" 
										NullText="Add Longitude" TabIndex="8" Width="100px">
										<MaskSettings PromptChar=" " />
										<NullTextStyle ForeColor="Silver">
										</NullTextStyle>
									</dxe:ASPxTextBox>
								</td>
							</tr>
							<tr>
								<td class="style2">
									&nbsp;</td>
								<td class="style2">

									&nbsp;</td>
								<td class="style2"></td>
								<td class="style2">
									&nbsp;</td>
								<td class="style2">
									&nbsp;</td>
								<td class="style2"></td>
								<td class="style2"></td>
								<td class="style2"></td>
							</tr>
							<tr>
								<td>
									<dxe:ASPxLabel ID="ASPxLabel10" runat="server" Text="Cond. Wear Sleeve :">
									</dxe:ASPxLabel>
								</td>
								<td>
									<!-- TODO : Synchronize with values from TestResults table -->
									<dxe:ASPxComboBox ID="cmbWearSleeve" runat="server" Width="120px" 
										ValueType="System.Int32" TabIndex="9" IncrementalFilteringMode="StartsWith">
										<Items>
											<dxe:ListEditItem Text="Good" Value="0" />
											<dxe:ListEditItem Text="Needs Replaced" Value="1" />
											<dxe:ListEditItem Text="Replaced" Value="2" />
										</Items>
									</dxe:ASPxComboBox>
								</td>
								<td>
									&nbsp;
								</td>
								<td nowrap="nowrap">
									<dxe:ASPxLabel ID="ASPxLabel11" runat="server" Text="Cond. Disc :">
									</dxe:ASPxLabel>
								</td>
								<td>
									<dxe:ASPxComboBox ID="cmbCondDisc" runat="server" Width="120px" 
										ValueType="System.Int32" TabIndex="10" IncrementalFilteringMode="StartsWith">
										<Items>
											<dxe:ListEditItem Text="Good" Value="0" />
											<dxe:ListEditItem Text="Needs Replaced" Value="1" />
											<dxe:ListEditItem Text="Replaced" Value="2" />
										</Items>
									</dxe:ASPxComboBox>
								</td>
								<td></td>
								<td>
									<dxe:ASPxLabel ID="ASPxLabel14" runat="server" Text="% Disc Wear :">
									</dxe:ASPxLabel>
								</td>
								<td>
									<dxe:ASPxComboBox ID="cmbPercDiscWear" runat="server" TabIndex="11" 
										ValueType="System.Int32" Width="120px" IncrementalFilteringMode="StartsWith">
										<Items>
											<dxe:ListEditItem Text="30 %" Value="30" />
											<dxe:ListEditItem Text="40 %" Value="40" />
											<dxe:ListEditItem Text="50 %" Value="50" />
											<dxe:ListEditItem Text="60 %" Value="60" />
										</Items>
									</dxe:ASPxComboBox>
								</td>
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
							<tr valign="top">
								<td>
									<dxe:ASPxLabel ID="ASPxLabel12" runat="server" Text="External Cond. :">
									</dxe:ASPxLabel>
							   </td>
								<td>
									<dxe:ASPxComboBox ID="cmbExternalCond" runat="server" TabIndex="12" 
										ValueType="System.Int32" Width="120px" IncrementalFilteringMode="StartsWith">
										<Items>
											<dxe:ListEditItem Text="Good" Value="0" />
											<dxe:ListEditItem Text="Needs Replaced" Value="1" />
											<dxe:ListEditItem Text="Replaced" Value="2" />
										</Items>
									</dxe:ASPxComboBox>
								</td>
								<td></td>
								<td>
									<dxe:ASPxLabel ID="ASPxLabel30" runat="server" Text="Remarks :">
									</dxe:ASPxLabel>
								</td>
								<td colspan="4">
									<dxe:ASPxTextBox ID="RemarksTextBox" runat="server" Height="50px" TabIndex="13" 
										TextMode="MultiLine" Width="100%">
									</dxe:ASPxTextBox>
								</td>
							</tr>
							<tr>
								<td>
									<dxe:ASPxImage ID="ASPxImage5" runat="server" ImageUrl="~/spacer.gif" Height="10px">
									</dxe:ASPxImage>
								</td>
								<td></td>
								<td></td>
								<td></td>
								<td>
									<dxe:ASPxButton ID="RemarksCheckButton" runat="server" AutoPostBack="False" 
										ClientInstanceName="RemarksCheckButton" TabIndex="14" Text="Check Spelling ..." 
										Width="150px">
										<ClientSideEvents Click="function(s, e) { NotesSpellChecker.Check(); }" />
									</dxe:ASPxButton>
								</td>
								<td></td>
								<td></td>
								<td>
									<dxsc:ASPxSpellChecker ID="NotesSpellChecker" runat="server" 
										CheckedElementID="RemarksTextBox" ClientInstanceName="NotesSpellChecker" 
										Culture="en-US" 
										OnCheckedElementResolve="ASPxSpellChecker1_CheckedElementResolve" 
										ShowLoadingPanel="False">
										<ClientSideEvents AfterCheck="function(s, e) { RemarksCheckButton.SetEnabled(true); }" 
											BeforeCheck="function(s, e) {    RemarksCheckButton.SetEnabled(false); }" />
										<Dictionaries>
											<dxsc:ASPxSpellCheckerOpenOfficeDictionary Culture="en-US" 
												DictionaryPath="~/Dictionaries/en_US/en_US.dic" 
												GrammarPath="~/Dictionaries/en_US/en_US.aff" />
										</Dictionaries>
									</dxsc:ASPxSpellChecker>
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
								<td colspan="5">
									<dxe:ASPxLabel ID="ASPxLabel26" runat="server" Text="PARTS USED" 
										Font-Bold="true">
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
								<td colspan="4" valign="top">
									<table width="100%" cellpadding="0" cellspacing="0">
										<thead style="padding-bottom: 5px">
											<tr>
												<th>Qty.</th>
												<th align="left">Part #</th>
												<th align="left">Description</th>
											</tr>
										</thead>
										<tr>
											<td align="center">
												<dxe:ASPxSpinEdit ID="seCD1" runat="server" Height="21px" Number="0" EnableClientSideAPI="true" 
													Width="50px" NumberType="Integer" TabIndex="15" ToolTip="Alt+M to exit Parts.">
													<ClientSideEvents KeyDown="function(s,e){ hotKeyHandler(s,e); }" />
												</dxe:ASPxSpinEdit>
											</td>
											<td align="left">
												<dxe:ASPxLabel ID="ASPxLabel8" runat="server" Text="CD1">
												</dxe:ASPxLabel>
											</td>
											<td align="justify">
												<dxe:ASPxLabel ID="ASPxLabel13" runat="server" Text="Disc">
												</dxe:ASPxLabel>
											</td>
										</tr>
										<tr>
											<td align="center">
												<dxe:ASPxSpinEdit ID="seCD2" runat="server" Height="21px" Number="0" 
													Width="50px" NumberType="Integer" TabIndex="16" ToolTip="Alt+M to exit Parts.">
													<ClientSideEvents KeyDown="function(s,e){ hotKeyHandler(s,e); }" />
												</dxe:ASPxSpinEdit>
											</td>
											<td align="left">
												CD2</td>
											<td align="justify">
												<dxe:ASPxLabel ID="ASPxLabel15" runat="server" Text="Disc">
												</dxe:ASPxLabel>
											</td>
										</tr>
										<tr>
											<td align="center">
												<dxe:ASPxSpinEdit ID="seCSKSFDAL2015" runat="server" Height="21px" Number="0" 
													Width="50px" NumberType="Integer" TabIndex="17" ToolTip="Alt+M to exit Parts.">
													<ClientSideEvents KeyDown="function(s,e){ hotKeyHandler(s,e); }" />
												</dxe:ASPxSpinEdit>
											</td>
											<td align="left">
												<dxe:ASPxLabel ID="ASPxLabel16" runat="server" Text="CSK-SFDAL2015">
												</dxe:ASPxLabel>
											</td>
											<td align="justify">
												<dxe:ASPxLabel ID="ASPxLabel17" runat="server" Text="Seal Kit">
												</dxe:ASPxLabel>
											</td>
										</tr>
										<tr>
											<td align="center">
												<dxe:ASPxSpinEdit ID="seWSXA0066" runat="server" Height="21px" Number="0" 
													Width="50px" NumberType="Integer" TabIndex="18" ToolTip="Alt+M to exit Parts.">
													<ClientSideEvents KeyDown="function(s,e){ hotKeyHandler(s,e); }" />
												</dxe:ASPxSpinEdit>
											</td>
											<td align="left">
												<dxe:ASPxLabel ID="ASPxLabel100" runat="server" Text="WSXA0066">
												</dxe:ASPxLabel>
											</td>
											<td align="justify">
												<dxe:ASPxLabel ID="ASPxLabel19" runat="server" Text="Wear Slv. Assm.">
												</dxe:ASPxLabel>
											</td>
										</tr>
										<tr>
											<td align="center">
												<dxe:ASPxSpinEdit ID="seCST00022" runat="server" Height="21px" Number="0" 
													Width="50px" NumberType="Integer" TabIndex="19" ToolTip="Alt+M to exit Parts.">
													<ClientSideEvents KeyDown="function(s,e){ hotKeyHandler(s,e); }" />
												</dxe:ASPxSpinEdit>
											</td>
											<td align="left">
												<dxe:ASPxLabel ID="ASPxLabel20" runat="server" Text="CST00022">
												</dxe:ASPxLabel>
											</td>
											<td align="justify">
												<dxe:ASPxLabel ID="ASPxLabel21" runat="server" Text="Stem">
												</dxe:ASPxLabel>
											</td>
										</tr>
										<tr>
											<td align="center">
												<dxe:ASPxSpinEdit ID="seDRV38" runat="server" Height="21px" Number="0" 
													Width="50px" NumberType="Integer" TabIndex="20" ToolTip="Alt+M to exit Parts.">
													<ClientSideEvents KeyDown="function(s,e){ hotKeyHandler(s,e); }" />
												</dxe:ASPxSpinEdit>
											</td>
											<td align="left">
												<dxe:ASPxLabel ID="ASPxLabel22" runat="server" Text="DRV38">
												</dxe:ASPxLabel>
											</td>
											<td align="justify">
												<dxe:ASPxLabel ID="ASPxLabel23" runat="server" Text="Driver">
												</dxe:ASPxLabel>
											</td>
										</tr>
										<tr>
											<td align="center">
												<dxe:ASPxSpinEdit ID="seFT000024" runat="server" Height="21px" Number="0" 
													Width="50px" NumberType="Integer" TabIndex="21" ToolTip="Alt+M to exit Parts.">
													<ClientSideEvents KeyDown="function(s,e){ hotKeyHandler(s,e); }" />
												</dxe:ASPxSpinEdit>
											</td>
											<td align="left">
												<dxe:ASPxLabel ID="ASPxLabel24" runat="server" Text="FT000024">
												</dxe:ASPxLabel>
											</td>
											<td align="justify">
												<dxe:ASPxLabel ID="ASPxLabel25" runat="server" Text="Flo Tube">
												</dxe:ASPxLabel>
											</td>
										</tr>
										<tr>
											<td align="center">
												<dxe:ASPxSpinEdit ID="seCSKSFDAL2050D2" runat="server" Height="21px" Number="0" 
													Width="50px" NumberType="Integer" TabIndex="22" ToolTip="Alt+M to exit Parts.">
													<ClientSideEvents KeyDown="function(s,e){ hotKeyHandler(s,e); }" />
												</dxe:ASPxSpinEdit>
											</td>
											<td align="left">
												<dxe:ASPxLabel ID="ASPxLabel27" runat="server" Text="CSK-SFDAL2050-D2">
												</dxe:ASPxLabel>
											</td>
											<td align="justify">
												<dxe:ASPxLabel ID="ASPxLabel28" runat="server" Text="Seal Kit">
												</dxe:ASPxLabel>
											</td>
										</tr>
										<tr>
											<td align="center">
												<dxe:ASPxSpinEdit ID="seCST00051" runat="server" Height="21px" Number="0" 
													Width="50px" NumberType="Integer" TabIndex="23" ToolTip="Alt+M to exit Parts.">
													<ClientSideEvents KeyDown="function(s,e){ hotKeyHandler(s,e); }" />
												</dxe:ASPxSpinEdit>
											</td>
											<td align="left">
												<dxe:ASPxLabel ID="ASPxLabel29" runat="server" Text="CST00051">
												</dxe:ASPxLabel>
											</td>
											<td align="justify">
												<dxe:ASPxLabel ID="ASPxLabel31" runat="server" Text="Stem">
												</dxe:ASPxLabel>
											</td>
										</tr>
										<tr>
											<td align="center">
												<dxe:ASPxSpinEdit ID="seCRKFBA2006" runat="server" Height="21px" Number="0" 
													Width="50px" NumberType="Integer" TabIndex="24" ToolTip="Alt+M to exit Parts.">
													<ClientSideEvents KeyDown="function(s,e){ hotKeyHandler(s,e); }" />
												</dxe:ASPxSpinEdit>
											</td>
											<td align="left">
												<dxe:ASPxLabel ID="ASPxLabel34" runat="server" Text="CRK-FBA2006">
												</dxe:ASPxLabel>
											</td>
											<td align="justify">
												<dxe:ASPxLabel ID="ASPxLabel35" runat="server" Text="Rebuild Kit">
												</dxe:ASPxLabel>
											</td>
										</tr>
									</table>
								</td>
								<td colspan="4" valign="top">
									<table width="100%" cellpadding="0" cellspacing="0">
										<thead style="padding-bottom: 5px">
											<tr>
												<th>Qty.</th>
												<th align="left">Part #</th>
												<th align="left">Description</th>
											</tr>
										</thead>
										<tr>
											<td align="center">
												<dxe:ASPxSpinEdit ID="seBSE00001" runat="server" Height="21px" Number="0" 
													Width="50px" NumberType="Integer" TabIndex="25" ToolTip="Alt+M to exit Parts.">
													<ClientSideEvents KeyDown="function(s,e){ hotKeyHandler(s,e); }" />
												</dxe:ASPxSpinEdit>
											</td>
											<td align="left">
												<dxe:ASPxLabel ID="ASPxLabel36" runat="server" Text="BSE00001">
												</dxe:ASPxLabel>
											</td>
											<td align="justify">
												<dxe:ASPxLabel ID="ASPxLabel37" runat="server" Text="Seat">
												</dxe:ASPxLabel>
											</td>
										</tr>
										<tr>
											<td align="center">
												<dxe:ASPxSpinEdit ID="seBBL00025" runat="server" Height="21px" Number="0" 
													Width="50px" NumberType="Integer" TabIndex="26" ToolTip="Alt+M to exit Parts.">
													<ClientSideEvents KeyDown="function(s,e){ hotKeyHandler(s,e); }" />
												</dxe:ASPxSpinEdit>
											</td>
											<td align="left">
												<dxe:ASPxLabel ID="ASPxLabel38" runat="server" Text="BBL00025">
												</dxe:ASPxLabel>
											</td>
											<td align="justify">
												<dxe:ASPxLabel ID="ASPxLabel39" runat="server" Text="Ball">
												</dxe:ASPxLabel>
											</td>
										</tr>
										<tr>
											<td align="center">
												<dxe:ASPxSpinEdit ID="seBST00008" runat="server" Height="21px" Number="0" 
													Width="50px" NumberType="Integer" TabIndex="27" ToolTip="Alt+M to exit Parts.">
													<ClientSideEvents KeyDown="function(s,e){ hotKeyHandler(s,e); }" />
												</dxe:ASPxSpinEdit>
											</td>
											<td align="left">
												<dxe:ASPxLabel ID="ASPxLabel40" runat="server" Text="BST00008">
												</dxe:ASPxLabel>
											</td>
											<td align="justify">
												<dxe:ASPxLabel ID="ASPxLabel41" runat="server" Text="Stem">
												</dxe:ASPxLabel>
											</td>
										</tr>
										<tr>
											<td align="center">
												<dxe:ASPxSpinEdit ID="seSB140125" runat="server" Height="21px" Number="0" 
													Width="50px" NumberType="Integer" TabIndex="28" ToolTip="Alt+M to exit Parts.">
													<ClientSideEvents KeyDown="function(s,e){ hotKeyHandler(s,e); }" />
												</dxe:ASPxSpinEdit>
											</td>
											<td align="left">
												<dxe:ASPxLabel ID="ASPxLabel42" runat="server" Text="SB140125">
												</dxe:ASPxLabel>
											</td>
											<td align="justify">
												<dxe:ASPxLabel ID="ASPxLabel43" runat="server" Text="Sleeve Bearing">
												</dxe:ASPxLabel>
											</td>
										</tr>
										<tr>
											<td align="center">
												<dxe:ASPxSpinEdit ID="se51974200" runat="server" Height="21px" Number="0" 
													Width="50px" NumberType="Integer" TabIndex="29" ToolTip="Alt+M to exit Parts.">
													<ClientSideEvents KeyDown="function(s,e){ hotKeyHandler(s,e); }" />
												</dxe:ASPxSpinEdit>
											</td>
											<td align="left">
												<dxe:ASPxLabel ID="ASPxLabel44" runat="server" Text="51974200">
												</dxe:ASPxLabel>
											</td>
											<td align="justify">
												<dxe:ASPxLabel ID="ASPxLabel45" runat="server" Text="Baker O-Ring Kit">
												</dxe:ASPxLabel>
											</td>
										</tr>
										<tr>
											<td align="center">
												<dxe:ASPxSpinEdit ID="se52070434" runat="server" Height="21px" Number="0" 
													Width="50px" NumberType="Integer" TabIndex="30" ToolTip="Alt+M to exit Parts.">
													<ClientSideEvents KeyDown="function(s,e){ hotKeyHandler(s,e); }" />
												</dxe:ASPxSpinEdit>
											</td>
											<td align="left">
												<dxe:ASPxLabel ID="ASPxLabel46" runat="server" Text="52070434">
												</dxe:ASPxLabel>
											</td>
											<td align="justify">
												<dxe:ASPxLabel ID="ASPxLabel47" runat="server" Text="Baker L.W. Sleeve">
												</dxe:ASPxLabel>
											</td>
										</tr>
										<tr>
											<td align="center">
												<dxe:ASPxSpinEdit ID="se51961525" runat="server" Height="21px" Number="0" 
													Width="50px" NumberType="Integer" TabIndex="31" ToolTip="Alt+M to exit Parts.">
													<ClientSideEvents KeyDown="function(s,e){ hotKeyHandler(s,e); }" />
												</dxe:ASPxSpinEdit>
											</td>
											<td align="left">
												<dxe:ASPxLabel ID="ASPxLabel48" runat="server" Text="51961525">
												</dxe:ASPxLabel>
											</td>
											<td align="justify">
												<dxe:ASPxLabel ID="ASPxLabel49" runat="server" Text="Baker Fork Standard">
												</dxe:ASPxLabel>
											</td>
										</tr>
										<tr>
											<td align="center">
												<dxe:ASPxSpinEdit ID="se52119435" runat="server" Height="21px" Number="0" 
													Width="50px" NumberType="Integer" TabIndex="32" ToolTip="Alt+M to exit Parts.">
													<ClientSideEvents KeyDown="function(s,e){ hotKeyHandler(s,e); }" />
												</dxe:ASPxSpinEdit>
											</td>
											<td align="left">
												<dxe:ASPxLabel ID="ASPxLabel50" runat="server" Text="52119435">
												</dxe:ASPxLabel>
											</td>
											<td align="justify">
												<dxe:ASPxLabel ID="ASPxLabel51" runat="server" Text="Baker Fork MaxFlow">
												</dxe:ASPxLabel>
											</td>
										</tr>
										<tr>
											<td align="center">
												<dxe:ASPxSpinEdit ID="se51960230" runat="server" Height="21px" Number="0" 
													Width="50px" NumberType="Integer" TabIndex="33" ToolTip="Alt+M to exit Parts.">
													<ClientSideEvents KeyDown="function(s,e){ hotKeyHandler(s,e); }" />
												</dxe:ASPxSpinEdit>
											</td>
											<td align="left">
												<dxe:ASPxLabel ID="ASPxLabel52" runat="server" Text="51960230">
												</dxe:ASPxLabel>
											</td>
											<td align="justify">
												<dxe:ASPxLabel ID="ASPxLabel53" runat="server" Text="Baker Bonnet">
												</dxe:ASPxLabel>
											</td>
										</tr>
									</table>                                    
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
									&nbsp;</td>
								<td colspan="7">
									&nbsp;</td>
							</tr>
							<tr>
								<td></td>
								<td>
									&nbsp;</td>
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
									<dxe:ASPxComboBox ID="TechIDSelect" runat="server" ClientInstanceName="techIDSelect" 
										DataSourceID="EmployeeDataSource" TextField="DisplayMember" 
										ValueField="ValueMember" ValueType="System.Int32" TabIndex="34" 
										EnableIncrementalFiltering="True" EnableSynchronization="True" 
										IncrementalFilteringMode="StartsWith">
										<ClientSideEvents Init="function(s, e) {DevExComboUnboundItem(s, e, '-- None --', -1)}" />
									</dxe:ASPxComboBox>
								</td>
								<td></td>
								<td nowrap="nowrap">
									<dxe:ASPxLabel ID="ASPxLabel33" runat="server" Text="Customer Witness :">
									</dxe:ASPxLabel>
								</td>
								<td>
									<dxe:ASPxTextBox ID="CustomerWitnessTextBox" runat="server" Width="170px" 
										TabIndex="35">
									</dxe:ASPxTextBox>
								</td>
								<td></td>
								<td></td>
								<td align="right">
									<dxe:ASPxButton ID="btnSave" runat="server" Text="Save" Width="170px" 
										AutoPostBack="false" TabIndex="36" >
										<ClientSideEvents Click="function(s,e){ saveAction.PerformCallback(); }" />
									</dxe:ASPxButton>
								</td>
							</tr>
						</table>
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
							<dxpc:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
							</dxpc:PopupControlContentControl>
						</ContentCollection>
					</dxpc:PopupWindow>
					<dxpc:PopupWindow AutoUpdatePosition="True" Name="testPortRequired" HeaderText=" "
						ShowFooter="False" Text="Test port is required!">
						<ContentCollection>
							<dxpc:PopupControlContentControl ID="PopupControlContentControl2" runat="server">
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
					<dxpc:PopupControlContentControl ID="PopupControlContentControl3" runat="server">
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
																	window.location.href = document.referrer;
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
