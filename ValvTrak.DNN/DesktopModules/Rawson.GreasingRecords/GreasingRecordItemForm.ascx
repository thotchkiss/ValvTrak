<%@ Control Language="C#" AutoEventWireup="true" CodeFile="GreasingRecordItemForm.ascx.cs" Inherits="Rawson.GreasingRecords.GreasingRecordItemForm" EnableTheming="true" %>

<%@ Register Assembly="DevExpress.Web.v12.2"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2"
    Namespace="DevExpress.Web.ASPxLoadingPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2"
    Namespace="DevExpress.Web.ASPxCallbackPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2"
    Namespace="DevExpress.Web.ASPxGlobalEvents" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2"
    Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dxrp" %>
<%@ Register Assembly="DevExpress.Web.v12.2"
    Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dxp" %>
<%@ Register Assembly="DevExpress.Web.v12.2"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxSpellChecker.v12.2" 
    Namespace="DevExpress.Web.ASPxSpellChecker" TagPrefix="dxsc" %>
<%@ Register src="~/DesktopModules/Rawson.ServiceItems/ServiceItemForm.ascx" tagname="SvcItemEdit" tagprefix="vt" %>
<%@ Register assembly="DevExpress.Web.v12.2" namespace="DevExpress.Web.ASPxCallback" tagprefix="dx" %>

<dxe:ASPxLabel ID="ASPxLabel3" runat="server" Text="Add/Edit Greasing Record Item" Font-Bold="true">
</dxe:ASPxLabel>
    <dxrp:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" ShowHeader="False" 
    Width="910px" DefaultButton="btnSave">
        <PanelCollection>
            <dxp:PanelContent ID="PanelContent1" runat="server">
                <table style="white-space: nowrap;">
                    <tr>
                        <td style="white-space: nowrap">
                            <dxe:ASPxLabel ID="ASPxLabel1" runat="server" Text="Greasing Item ID :">
                            </dxe:ASPxLabel>
                        </td>
                        <td>
                            <dxe:ASPxLabel ID="GreasingRecordItemIDLabel" runat="server">
                            </dxe:ASPxLabel>
                        </td>
                        <td>
                            <dxe:ASPxImage ID="ASPxImage1" runat="server" ImageUrl="~/spacer.gif" Width="10px">
                            </dxe:ASPxImage>
                        </td>
                        <td>
                            <dxe:ASPxLabel ID="ASPxLabel2" runat="server" Text="Valve :">
                            </dxe:ASPxLabel>
                        </td>
                        <td>
                            <vt:SvcItemEdit ID="siEdit" runat="server" TabIndex="1" ServiceItemCategoryID="2" />
                        </td>
                        <td>
                             <dxe:ASPxImage ID="ASPxImage2" runat="server" ImageUrl="~/spacer.gif" Width="10px">
                            </dxe:ASPxImage>
                        </td>
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
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>
                            <dxe:ASPxLabel ID="ASPxLabel4" runat="server" Text=" Actuator Inspected :">
                            </dxe:ASPxLabel>
                        </td>
                        <td>
                            <dxe:ASPxComboBox ID="ActuatorInspSelect" runat="server" 
                                ValueType="System.Int32" TabIndex="4" EnableIncrementalFiltering="True" 
                                IncrementalFilteringMode="StartsWith" ShowLoadingPanel="False">
                                <ClientSideEvents GotFocus="function(s, e) { s.ShowDropDown(); }" />
<ClientSideEvents GotFocus="function(s, e) { s.ShowDropDown(); }"></ClientSideEvents>
                                <Items>
                                    <dxe:ListEditItem Text="N/A" Value="0" />
                                    <dxe:ListEditItem Text="Yes" Value="1" />
                                    <dxe:ListEditItem Text="No" Value="2" />
                                </Items>
                            </dxe:ASPxComboBox>
                        </td>
                        <td></td>
                        <td>
                            <dxe:ASPxLabel ID="ASPxLabel5" runat="server" Text="Actuator Lubed :">
                            </dxe:ASPxLabel>
                        </td>
                        <td>
                            <dxe:ASPxComboBox ID="ActuatorLubedSelect" runat="server" 
                                ValueType="System.Int32" TabIndex="5" EnableIncrementalFiltering="True" 
                                IncrementalFilteringMode="StartsWith">
                                <ClientSideEvents GotFocus="function(s, e) { s.ShowDropDown(); }" />
<ClientSideEvents GotFocus="function(s, e) { s.ShowDropDown(); }"></ClientSideEvents>
                                <Items>
                                    <dxe:ListEditItem Text="N/A" Value="0" />
                                    <dxe:ListEditItem Text="Yes" Value="1" />
                                    <dxe:ListEditItem Text="No" Value="2" />
                                </Items>
                            </dxe:ASPxComboBox>
                        </td>
                        <td></td>
                        <td>
                            <dxe:ASPxLabel ID="ASPxLabel6" runat="server" Text="% Cycled :">
                            </dxe:ASPxLabel>
                        </td>
                        <td>
                            <dxe:ASPxSpinEdit ID="sePercentCycled" runat="server" Height="21px" 
                                MaxValue="100" NullText="0" Number="0" Width="80px" TabIndex="6">
                            </dxe:ASPxSpinEdit>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <dxe:ASPxLabel ID="ASPxLabel7" runat="server" Text="Valve Secured :">
                            </dxe:ASPxLabel>
                        </td>
                        <td>
                            <dxe:ASPxComboBox ID="ValveSecuredSelect" runat="server" 
                                ValueType="System.Int32" TabIndex="7" EnableIncrementalFiltering="True" 
                                IncrementalFilteringMode="StartsWith">
                                <ClientSideEvents GotFocus="function(s, e) { s.ShowDropDown(); }" />
<ClientSideEvents GotFocus="function(s, e) { s.ShowDropDown(); }"></ClientSideEvents>
                                <Items>
                                    <dxe:ListEditItem Text="N/A" Value="0" />
                                    <dxe:ListEditItem Text="Yes" Value="1" />
                                    <dxe:ListEditItem Text="No" Value="2" />
                                </Items>
                            </dxe:ASPxComboBox>
                        </td>
                        <td></td>
                        <td>
                            <dxe:ASPxLabel ID="ASPxLabel8" runat="server" Text="Flanged or Screwed :">
                            </dxe:ASPxLabel>
                        </td>
                        <td>
                            <dxe:ASPxComboBox ID="FlangeOrScrewSelect" runat="server" SelectedIndex="0" 
                                ValueType="System.String" TabIndex="8" EnableIncrementalFiltering="True" 
                                IncrementalFilteringMode="StartsWith">
                                <ClientSideEvents GotFocus="function(s, e) { s.ShowDropDown(); }" />
<ClientSideEvents GotFocus="function(s, e) { s.ShowDropDown(); }"></ClientSideEvents>
                                <Items>
                                    <dxe:ListEditItem Text="N/A" Value="" />
                                    <dxe:ListEditItem Text="Flanged" Value="F" />
                                    <dxe:ListEditItem Text="Screwed" Value="S" />
                                </Items>
                            </dxe:ASPxComboBox>
                        </td>
                        <td></td>
                        <td>
                            <dxe:ASPxLabel ID="ASPxLabel9" runat="server" Text="Ease of Operation :">
                            </dxe:ASPxLabel>
                        </td>
                        <td>
                            <dxe:ASPxComboBox ID="EaseOfOpSelect" runat="server" 
                                ValueType="System.Int32" Width="80px" TabIndex="9" 
                                EnableIncrementalFiltering="True" IncrementalFilteringMode="StartsWith">
                                <ClientSideEvents GotFocus="function(s, e) { s.ShowDropDown(); }" />
<ClientSideEvents GotFocus="function(s, e) { s.ShowDropDown(); }"></ClientSideEvents>
                                <Items>
                                    <dxe:ListEditItem Text="0" Value="0" />
                                    <dxe:ListEditItem Text="1" Value="1" />
                                    <dxe:ListEditItem Text="2" Value="2" />
                                    <dxe:ListEditItem Text="3" Value="3" />
                                    <dxe:ListEditItem Text="4" Value="4" />
                                    <dxe:ListEditItem Text="5" Value="5" />
                                </Items>
                            </dxe:ASPxComboBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <dxe:ASPxLabel ID="ASPxLabel10" runat="server" Text="Seats Checked :">
                            </dxe:ASPxLabel>
                        </td>
                        <td>
                            <dxe:ASPxComboBox ID="SeatsCheckedSelect" runat="server" 
                                ValueType="System.Int32" TabIndex="10" EnableIncrementalFiltering="True" 
                                IncrementalFilteringMode="StartsWith">
                                <ClientSideEvents GotFocus="function(s, e) { s.ShowDropDown(); }" />
<ClientSideEvents GotFocus="function(s, e) { s.ShowDropDown(); }"></ClientSideEvents>
                                <Items>
                                    <dxe:ListEditItem Text="N/A" Value="0" />
                                    <dxe:ListEditItem Text="Yes" Value="1" />
                                    <dxe:ListEditItem Text="No" Value="2" />
                                </Items>
                            </dxe:ASPxComboBox>
                        </td>
                        <td></td>
                        <td>
                            <dxe:ASPxLabel ID="ASPxLabel11" runat="server" Text="Seats Lubed :">
                            </dxe:ASPxLabel>
                        </td>
                        <td>
                            <dxe:ASPxComboBox ID="SeatsLubedSelect" runat="server" 
                                ValueType="System.Int32" TabIndex="11" EnableIncrementalFiltering="True" 
                                IncrementalFilteringMode="StartsWith">
                                <ClientSideEvents GotFocus="function(s, e) { s.ShowDropDown(); }" />
<ClientSideEvents GotFocus="function(s, e) { s.ShowDropDown(); }"></ClientSideEvents>
                                <Items>
                                    <dxe:ListEditItem Text="N/A" Value="0" />
                                    <dxe:ListEditItem Text="Yes" Value="1" />
                                    <dxe:ListEditItem Text="No" Value="2" />
                                </Items>
                            </dxe:ASPxComboBox>
                        </td>
                        <td></td>
                        <td>
                            <dxe:ASPxLabel ID="ASPxLabel12" runat="server" Text="Leaking :">
                            </dxe:ASPxLabel>
                        </td>
                        <td>
                            <dxe:ASPxComboBox ID="LeakingSelect" runat="server" ValueType="System.Int32" 
                                Width="80px" TabIndex="12" EnableIncrementalFiltering="True" 
                                IncrementalFilteringMode="StartsWith">
                                <ClientSideEvents GotFocus="function(s, e) { s.ShowDropDown(); }" />
<ClientSideEvents GotFocus="function(s, e) { s.ShowDropDown(); }"></ClientSideEvents>
                                <Items>
                                    <dxe:ListEditItem Text="N/A" Value="0" />
                                    <dxe:ListEditItem Text="Yes" Value="1" />
                                    <dxe:ListEditItem Text="No" Value="2" />
                                </Items>
                            </dxe:ASPxComboBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <dxe:ASPxLabel ID="ASPxLabel13" runat="server" Text="Lube Type :">
                            </dxe:ASPxLabel>
                        </td>
                        <td>
                            <asp:LinqDataSource ID="LubeTypeDataSource" runat="server" 
                                OnSelecting="LubeTypeDataSource_Selecting1">
                            </asp:LinqDataSource>
                            <dxe:ASPxComboBox ID="LubeTypeSelect" runat="server" ValueType="System.Int32" 
                                DataSourceID="LubeTypeDataSource" TextField="DisplayMember" 
                                ValueField="ValueMember" TabIndex="13" EnableIncrementalFiltering="True" 
                                IncrementalFilteringMode="StartsWith">
                                <ClientSideEvents Init="function(s, e) {DevExComboUnboundItem(s, e, '-- None --', -1)}" 
                                    Gotfocus="function(s, e) { s.ShowDropDown(); }" />
<ClientSideEvents GotFocus="function(s, e) { s.ShowDropDown(); }" Init="function(s, e) {DevExComboUnboundItem(s, e, &#39;-- None --&#39;, -1)}"></ClientSideEvents>
                            </dxe:ASPxComboBox>
                        </td>
                        <td></td>
                        <td>
                            <dxe:ASPxLabel ID="ASPxLabel14" runat="server" Text="Amt Injected per Seat :">
                            </dxe:ASPxLabel>
                        </td>
                        <td>
                            <dxe:ASPxSpinEdit ID="seAmountInjected" runat="server" DecimalPlaces="2" 
                                Height="21px" Increment="0.5" LargeIncrement="1" Number="0" Width="80px" 
                                TabIndex="14">
                            </dxe:ASPxSpinEdit>
                        </td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
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
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>
                            <dxe:ASPxLabel ID="ASPxLabel15" runat="server" Text="Remarks :">
                            </dxe:ASPxLabel>
                        </td>
                        <td colspan="4">
                            <dxe:ASPxTextBox ID="RemarksTextBox" runat="server" Rows="4" TextMode="MultiLine" 
                                Width="100%" AutoResizeWithContainer="True" Height="50px" TabIndex="15"></dxe:ASPxTextBox>
                        </td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <dxe:ASPxButton ID="checkButton" runat="server" 
                                ClientInstanceName="checkButton" Text="Check Spelling ..." AutoPostBack="False" 
                                Width="170px" CausesValidation="False" UseSubmitBehavior="False" 
                                TabIndex="16">
                                    <ClientSideEvents Click="function(s, e) { spellChecker.Check(); }"></ClientSideEvents>
                             </dxe:ASPxButton>
                            <dxsc:ASPxSpellChecker ID="NotesSpellChecker" runat="server" ClientInstanceName="spellChecker" 
                                CheckedElementID="RemarksTextBox" OnCheckedElementResolve="ASPxSpellChecker1_CheckedElementResolve" 
                                Culture="English (United States)" ShowLoadingPanel="false">
                                <ClientSideEvents BeforeCheck="function(s, e) {    checkButton.SetEnabled(false); }" AfterCheck="function(s, e) { checkButton.SetEnabled(true); }"></ClientSideEvents>
                                 <Dictionaries>
                                     <dxsc:ASPxSpellCheckerOpenOfficeDictionary Culture="English (United States)" 
                                         DictionaryPath="~/Dictionaries/en_US/en_US.dic" 
                                         GrammarPath="~/Dictionaries/en_US/en_US.aff" />
                                 </Dictionaries>
                             </dxsc:ASPxSpellChecker>
                        </td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td colspan="2">
                            <dxe:ASPxButton ID="btnSave" runat="server" Text="Save" AutoPostBack="false" 
                                Width="170px" CausesValidation="False" UseSubmitBehavior="False" 
                                TabIndex="17">
                                <ClientSideEvents Click="function(s,e) { saveAction.PerformCallback(); }"></ClientSideEvents>
                            </dxe:ASPxButton>
                        </td>
                    </tr>
                </table>
                <dx:ASPxCallback ID="SaveAction" runat="server" ClientInstanceName="saveAction" OnCallback="SaveAction_Callback">
                    <ClientSideEvents EndCallback="function(s,e) { if (s.cpHasErrors) {
                                                                        validation.SetContentHtml(s.cpErrorMessage);
                                                                        validation.Show();
                                                                    }
                                                                    else 
                                                                        validation.Hide(); }">
                    </ClientSideEvents>
                </dx:ASPxCallback>
                <dx:ASPxPopupControl ID="pcValidation" runat="server" ClientInstanceName="validation"
                        Modal="false" ShowFooter="false" HeaderText="Validation Errrors" 
                        AllowDragging="true" AllowResize="true" AutoUpdatePosition="true" 
                        PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter">
                    <ContentCollection>
                        <dx:PopupControlContentControl runat="server">
                        </dx:PopupControlContentControl>
                    </ContentCollection>
                </dx:ASPxPopupControl>
                <dx:ASPxGlobalEvents ID="ASPxGlobalEvents1" runat="server">
                    <ClientSideEvents EndCallback="function(s,e){ lpanel.Hide(); }" 
                        BeginCallback="function(s,e){ lpanel.Show(); }">
                    </ClientSideEvents>
                </dx:ASPxGlobalEvents>
                <dx:ASPxLoadingPanel ID="ASPxLoadingPanel1" runat="server"  ClientInstanceName="lpanel" Modal="true">
                    <ClientSideEvents Init="function(s,e){ s.SetText('Loading....'); }" />
<ClientSideEvents Init="function(s,e){ s.SetText(&#39;Loading....&#39;); }"></ClientSideEvents>
                </dx:ASPxLoadingPanel>
            </dxp:PanelContent>
        </PanelCollection>
    </dxrp:ASPxRoundPanel>
