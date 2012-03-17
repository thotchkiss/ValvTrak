<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ClientsForm.ascx.cs" Inherits="Rawson.ClientLocations.ClientsForm" EnableTheming="true" %>
<%@ Register Assembly="DevExpress.Web.v10.2" Namespace="DevExpress.Web.ASPxHiddenField" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v10.2" Namespace="DevExpress.Web.ASPxCallbackPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v10.2" Namespace="DevExpress.Web.ASPxCallback" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v10.2" Namespace="DevExpress.Web.ASPxLoadingPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v10.2" Namespace="DevExpress.Web.ASPxGlobalEvents" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v10.2" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v10.2" Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v10.2" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v10.2" Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v10.2" Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dxp" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v10.2.Export" namespace="DevExpress.Web.ASPxGridView.Export" tagprefix="dx" %>

<script type="text/javascript">
    
    function OnClientRowEdit(value) {

        selectedClient.Set("ClientID", value);
        selectedClient.Set("Action", "Edit");
        clientDetailsPanel.PerformCallback(value);
    }

    function OnLocationRowEdit(value) {

        selectedLocation.Set("ClientLocationID", value);
        selectedLocation.Set("Action", "Edit");
        locationDetailsPanel.PerformCallback(value);    
    }

</script>

<table cellpadding="0" cellspacing="5px" border="0" width="910px">
    <tr>
        <td align="right">
            <table>
                <tr>
                    <td>
                        <dx:ASPxButton ID="btnNewClient" runat="server" Text="New Client" 
                            AutoPostBack="False">
                            <ClientSideEvents Click="function(s,e){ 
                                selectedClient.Set('Action', 'New');
                                clientDetailsPanel.PerformCallback(); }" />
                        </dx:ASPxButton> 
                    </td>
                    <td>
                        <dx:ASPxButton ID="btnExport" runat="server" Text="Export To Excel" 
                            onclick="btnExport_Click">
                        </dx:ASPxButton> 
                    </td>
                </tr>
            </table>
            
        </td>
        <td>
        </td>
    </tr>
    <tr>
        <td>
            <dx:ASPxGridView ID="ClientsGrid" runat="server" AutoGenerateColumns="False" 
            DataSourceID="ClientsGridSource" KeyFieldName="ClientID" 
            ClientInstanceName="clients" Width="100%" 
                oncustomcallback="ClientsGrid_CustomCallback" >
                <ClientSideEvents CustomButtonClick="function(s,e) {
                    e.processOnServer = false;
                    clients.GetRowValues(clients.GetFocusedRowIndex(), 'ClientID', OnClientRowEdit); }"
                 />
                <Columns>
                    <dx:GridViewCommandColumn ButtonType="Image" Caption=" " VisibleIndex="0">
                        <CustomButtons>
                            <dx:GridViewCommandColumnCustomButton ID="btnClientEdit" Visibility="AllDataRows" Text="Edit">
                                <Image Url="~/images/edit.gif" AlternateText="Edit"  Height="16px" Width="16px" />
                            </dx:GridViewCommandColumnCustomButton>
                        </CustomButtons>
                    </dx:GridViewCommandColumn>
                    <dx:GridViewDataTextColumn Caption="Name" FieldName="Name" Name="colName" 
                        ReadOnly="True" VisibleIndex="1">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Address" FieldName="Address" 
                        Name="colAddress" ReadOnly="True" VisibleIndex="2">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="City" FieldName="City" Name="colCity" 
                        ReadOnly="True" VisibleIndex="3">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="State" FieldName="State" Name="colState" 
                        VisibleIndex="4">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Zipcode" FieldName="ZipCode" 
                        Name="colZipcode" ReadOnly="True" VisibleIndex="5">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Phone" FieldName="Phone" Name="colPhone" 
                        ReadOnly="True" VisibleIndex="6">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataCheckColumn Caption="Active" FieldName="Active" 
                        Name="colActive" ReadOnly="True" VisibleIndex="7">
                    </dx:GridViewDataCheckColumn>
                    <dx:GridViewDataTextColumn Caption=" " FieldName="ClientID" Name="colClientID" Visible="false">
                    </dx:GridViewDataTextColumn>
                </Columns>
                <SettingsBehavior AllowFocusedRow="True" AllowGroup="False" />
                <Settings ShowFilterBar="Visible" ShowFilterRow="True" ShowFilterRowMenu="True" 
                    ShowGroupButtons="False" />
                <SettingsLoadingPanel Mode="Disabled" />
            </dx:ASPxGridView>
        </td>
    </tr>
</table>
<dx:ASPxPopupControl ID="ClientDetailsWindow" runat="server" ClientInstanceName="clientDetailsWindow" 
    AllowDragging="True" CloseAction="CloseButton" HeaderText="Client Details" 
    Modal="True" PopupHorizontalAlign="WindowCenter" 
    PopupVerticalAlign="WindowCenter" Width="750px">
    <ContentCollection>
        <dx:PopupControlContentControl>
            <dx:ASPxCallbackPanel ID="ClientDetailsPanel" runat="server" Width="100%" 
                ClientInstanceName="clientDetailsPanel" 
                OnCallback="ClientDetailsPanel_Callback">
                <ClientSideEvents EndCallback="function(s,e){ clientDetailsWindow.Show(); }" />
                <PanelCollection>
                    <dxp:PanelContent>
                        <table cellpadding="0" cellspacing="3px" border="0">
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Name :">
                                    </dx:ASPxLabel>
                                </td>
                                <td>
                                    <dx:ASPxTextBox ID="txtClientName" runat="server" Width="170px" 
                                        ClientInstanceName="clientName" EnableClientSideAPI="True">
                                    </dx:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Address :">
                                    </dx:ASPxLabel>
                                </td>
                                <td>
                                    <dx:ASPxTextBox ID="txtClientAddress" runat="server" Width="170px" 
                                        ClientInstanceName="clientAddress" EnableClientSideAPI="True">
                                    </dx:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="City :">
                                    </dx:ASPxLabel>
                                </td>
                                <td>
                                    <dx:ASPxTextBox ID="txtClientCity" runat="server" Width="170px" 
                                        ClientInstanceName="clientCity" EnableClientSideAPI="True">
                                    </dx:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="State :">
                                    </dx:ASPxLabel>
                                </td>
                                <td>
                                    <dx:ASPxComboBox ID="cmbClientState" runat="server" 
                                        ClientInstanceName="clientState" EnableClientSideAPI="True" 
                                        DataSourceID="StatesDataSource" EnableIncrementalFiltering="True" 
                                        IncrementalFilteringMode="StartsWith" TextField="DisplayMember" 
                                        ValueField="ValueMember" Width="70px">
                                    </dx:ASPxComboBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="Zip code :">
                                    </dx:ASPxLabel>
                                </td>
                                <td>
                                    <dx:ASPxTextBox ID="txtClientZipcode" runat="server" Width="80px" 
                                        ClientInstanceName="clientZipcode" EnableClientSideAPI="True">
                                        <MaskSettings Mask="00000" PromptChar=" " />
                                    </dx:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="Phone :">
                                    </dx:ASPxLabel>
                                </td>
                                <td>
                                    <dx:ASPxTextBox ID="txtClientPhone" runat="server" Width="100px" 
                                        ClientInstanceName="clientPhone" EnableClientSideAPI="True" MaxLength="18">
                                        <MaskSettings Mask="(999) 000-0000" PromptChar=" " />
                                    </dx:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel15" runat="server" Text="Active :">
                                    </dx:ASPxLabel>
                                </td>
                                <td>
                                    <dx:ASPxCheckBox ID="chkClientActive" runat="server">
                                    </dx:ASPxCheckBox>
                                </td>
                            </tr>
                            <tr>
                                <td>     
                                </td>
                                <td align="right">
                                    <dx:ASPxButton ID="btnClientSave" runat="server" Text="Save" 
                                        AutoPostBack="False">
                                        <ClientSideEvents Click="function(s,e){ clientSaveAction.PerformCallback(); }" />
                                    </dx:ASPxButton>
                                </td>
                            </tr>
                        </table>
                        <table cellpadding="0" cellspacing="5px" border="0"  width="100%">
                            <tr>
                                <td align="right">
                                    <table>
                                        <tr>
                                            <td>
                                                <dx:ASPxButton ID="btnNewLocation" runat="server" Text="New Location" 
                                                    AutoPostBack="False">
                                                    <ClientSideEvents Click="function(s,e) { 
                                                        selectedLocation.Set('Action', 'New');
                                                        locationDetailsPanel.PerformCallback(); }" />
                                                </dx:ASPxButton>
                                            </td>
                                            <td>
                                                <dx:ASPxButton ID="btnExportLocations" runat="server" Text="Export To Excel" 
                                                    OnClick="btnExportLocations_Click" >
                                                </dx:ASPxButton>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dx:ASPxGridView ID="LocationsGrid" runat="server" 
                                        ClientInstanceName="locations" AutoGenerateColumns="False" 
                                        DataSourceID="LocationsGridSource" KeyFieldName="ClientLocationID" Width="100%">
                                        <ClientSideEvents CustomButtonClick="function(s,e) {
                                                e.processOnServer = false;
                                                locations.GetRowValues(locations.GetFocusedRowIndex(), 'ClientLocationID', OnLocationRowEdit); }"
                                        />
                                        <Columns>
                                            <dx:GridViewCommandColumn ButtonType="Image" Caption=" " VisibleIndex="0">
                                                <CustomButtons>
                                                    <dx:GridViewCommandColumnCustomButton ID="btnLocationEdit" Visibility="AllDataRows" Text="Edit">
                                                        <Image Url="~/images/edit.gif" AlternateText="Edit"  Height="16px" Width="16px" />
                                                    </dx:GridViewCommandColumnCustomButton>
                                                </CustomButtons>
                                            </dx:GridViewCommandColumn>
                                            <dx:GridViewDataTextColumn Caption="Name" FieldName="Name" Name="colLocName" 
                                                ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Property Number" FieldName="PropertyNumber" 
                                                Name="colPropertyNumber" ReadOnly="True" ShowInCustomizationForm="True" 
                                                VisibleIndex="2">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Adress" FieldName="Address" 
                                                Name="colLocAddress" ReadOnly="True" ShowInCustomizationForm="True" 
                                                VisibleIndex="3">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="City" FieldName="City" Name="colLocCity" 
                                                ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="4">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="State" FieldName="State" Name="colLocState" 
                                                ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="5">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Zipcode" FieldName="ZipCode" 
                                                Name="colLocZipcode" ReadOnly="True" ShowInCustomizationForm="True" 
                                                VisibleIndex="6">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Latitude" FieldName="Latitude" 
                                                Name="colLatitude" ReadOnly="True" ShowInCustomizationForm="True" 
                                                VisibleIndex="7">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Longitude" FieldName="Longitude" 
                                                Name="colLongitude" ReadOnly="True" ShowInCustomizationForm="True" 
                                                VisibleIndex="8">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataCheckColumn Caption="Active" FieldName="Active" 
                                                Name="colLocActive" ReadOnly="True" ShowInCustomizationForm="True" 
                                                VisibleIndex="9">
                                            </dx:GridViewDataCheckColumn>
                                            <dx:GridViewDataTextColumn Caption=" " FieldName="ClientLocationID" Name="colClientLocationID" Visible="false">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption=" " FieldName="ClientID" Name="colClientID" Visible="false">
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                        <SettingsBehavior AllowFocusedRow="True" AllowGroup="False" />
                                        <SettingsPager PageSize="5">
                                        </SettingsPager>
                                        <Settings ShowFilterBar="Visible" ShowFilterRow="True" ShowFilterRowMenu="True" 
                                            ShowGroupButtons="False" />
                                        <SettingsLoadingPanel Mode="Disabled" />
                                    </dx:ASPxGridView>
                                    <dx:ASPxHiddenField ID="hfSelectedClient" runat="server" ClientInstanceName="selectedClient">
                                    </dx:ASPxHiddenField>
                                </td>
                            </tr>
                        </table>
                    </dxp:PanelContent>
                </PanelCollection>
            </dx:ASPxCallbackPanel>
        </dx:PopupControlContentControl>
    </ContentCollection>
</dx:ASPxPopupControl>
<dx:ASPxPopupControl ID="LocationDetailsWindow" runat="server" 
    CloseAction="CloseButton" HeaderText="Location Details" ClientInstanceName="locationDetailsWindow"
    Modal="true" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" AllowDragging="true"
    AllowResize="true" Width="350px">
    <ContentCollection>
        <dx:PopupControlContentControl>
            <dx:ASPxCallbackPanel ID="LocationDetailsPanel" runat="server" Width="100%" 
                ClientInstanceName="locationDetailsPanel" 
                OnCallback="LocationDetailsPanel_Callback">
                <ClientSideEvents EndCallback="function(s,e){ locationDetailsWindow.Show(); }" />
                <PanelCollection>
                    <dxp:PanelContent>
                        <table cellpadding="0" cellspacing="3px" border="0">
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="Name :">
                                    </dx:ASPxLabel>
                                </td>
                                <td>
                                    <dx:ASPxTextBox ID="txtLocationName" runat="server" Width="170px">
                                    </dx:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel8" runat="server" Text="Address :">
                                    </dx:ASPxLabel>
                                </td>
                                <td>
                                    <dx:ASPxTextBox ID="txtLocationAddress" runat="server" Width="170px">
                                    </dx:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel9" runat="server" Text="City :">
                                    </dx:ASPxLabel>
                                </td>
                                <td>
                                    <dx:ASPxTextBox ID="txtLocationCity" runat="server" Width="170px">
                                    </dx:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel10" runat="server" Text="State :">
                                    </dx:ASPxLabel>
                                </td>
                                <td>
                                    <dx:ASPxComboBox ID="cmbLocationState" runat="server" 
                                        DataSourceID="StatesDataSource" EnableIncrementalFiltering="True" 
                                        IncrementalFilteringMode="StartsWith" ShowLoadingPanel="False" 
                                        TextField="DisplayMember" ValueField="ValueMember" Width="70px">
                                    </dx:ASPxComboBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel11" runat="server" Text="Zip code :">
                                    </dx:ASPxLabel>
                                </td>
                                <td>
                                    <dx:ASPxTextBox ID="txtLocationZipcode" runat="server" Width="80px">
                                        <MaskSettings Mask="00000" PromptChar=" " />
                                    </dx:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel12" runat="server" Text="Phone :">
                                    </dx:ASPxLabel>
                                </td>
                                <td>
                                    <dx:ASPxTextBox ID="txtLocationPhone" runat="server" Width="100px">
                                        <MaskSettings Mask="(999) 000-0000" PromptChar=" " />
                                    </dx:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel17" runat="server" Text="Property Number :">
                                    </dx:ASPxLabel>
                                </td>
                                <td>
                                    <dx:ASPxTextBox ID="txtPropertyNumber" runat="server" Width="170px">
                                    </dx:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel13" runat="server" Text="Latitude :">
                                    </dx:ASPxLabel>
                                </td>
                                <td>
                                    <dx:ASPxSpinEdit ID="seLocationLatitude" runat="server" DecimalPlaces="6" 
                                        Height="21px" Number="0" Width="170px">
                                    </dx:ASPxSpinEdit>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel14" runat="server" Text="Longitude :">
                                    </dx:ASPxLabel>
                                </td>
                                <td>
                                    <dx:ASPxSpinEdit ID="seLocationLongitude" runat="server" DecimalPlaces="6" 
                                        Height="21px" Number="0" Width="170px">
                                    </dx:ASPxSpinEdit>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel16" runat="server" Text="Active :">
                                    </dx:ASPxLabel>
                                </td>
                                <td>
                                    <dx:ASPxCheckBox ID="chkLocationActive" runat="server">
                                    </dx:ASPxCheckBox>
                                </td>
                            </tr>
                            <tr align="right">
                                <td>
                                    &nbsp;</td>
                                <td>
                                    <dx:ASPxButton ID="btnLocationSave" runat="server" Text="Save" 
                                        AutoPostBack="False">
                                        <ClientSideEvents Click="function(s,e){ locationSaveAction.PerformCallback(); }" />
                                    </dx:ASPxButton>
                                </td>
                            </tr>
                        </table> 
                        <dx:ASPxHiddenField ID="hfSelectedLocation" runat="server" 
                            ClientInstanceName="selectedLocation">
                        </dx:ASPxHiddenField>
                    </dxp:PanelContent>
                </PanelCollection>
            </dx:ASPxCallbackPanel>
        </dx:PopupControlContentControl>
    </ContentCollection>
</dx:ASPxPopupControl>
<asp:LinqDataSource ID="ClientsGridSource" runat="server" 
    onselecting="ClientsGridSource_Selecting">
</asp:LinqDataSource>
<asp:LinqDataSource ID="LocationsGridSource" runat="server" 
    onselecting="LocationsGridSource_Selecting">
</asp:LinqDataSource>
<asp:LinqDataSource ID="StatesDataSource" runat="server" 
    onselecting="StatesDataSource_Selecting">
</asp:LinqDataSource>
<dx:ASPxGlobalEvents ID="ASPxGlobalEvents1" runat="server">
    <ClientSideEvents BeginCallback="function(s,e){ lpanel.Show(); }" 
            EndCallback="function(s,e){ lpanel.Hide(); }" />
</dx:ASPxGlobalEvents>
<dx:ASPxLoadingPanel ID="ASPxLoadingPanel1" runat="server"  ClientInstanceName="lpanel" Modal="true">
    <ClientSideEvents Init="function(s,e){ s.SetText('Loading....'); }" />
</dx:ASPxLoadingPanel>
<dx:ASPxCallback ID="ClientSaveAction" runat="server" ClientInstanceName="clientSaveAction" 
    oncallback="ClientSaveAction_Callback">
    <ClientSideEvents EndCallback="function(s,e){
        if (s.cpHasErrors == true)
        {
            validation.SetContentHtml(s.cpErrorMessage);
            validation.Show();
        }
        else
        {
			selectedClient.Set(&quot;ClientID&quot;, s.cpClientID);
			selectedClient.Set(&quot;Action&quot;, &quot;Edit&quot;);

            clients.PerformCallback();
            clientDetailsPanel.PerformCallback(s.cpClientID)
        }
 }" />
</dx:ASPxCallback>
<dx:ASPxCallback ID="LocationSaveAction" runat="server" ClientInstanceName="locationSaveAction" 
    oncallback="LocationSaveAction_Callback">
    <ClientSideEvents EndCallback="function(s,e){
        if (s.cpHasErrors == true)
        {
            validation.SetContentHtml(s.cpErrorMessage);
            validation.Show();
        }
        else
        {
            validation.Hide();
            locationDetailsWindow.Hide();

            clientDetailsPanel.PerformCallback(s.cpClientID)
        }
}" />
</dx:ASPxCallback>

<dx:ASPxGridViewExporter ID="ClientsGridViewExporter" runat="server" 
    GridViewID="ClientsGrid">
</dx:ASPxGridViewExporter>
<dx:ASPxGridViewExporter ID="LocationsGridViewExporter" runat="server" 
    GridViewID="LocationsGrid">
</dx:ASPxGridViewExporter>
<dx:ASPxPopupControl ID="pcValidation" runat="server" ClientInstanceName="validation"
        Modal="false" ShowFooter="false" HeaderText="Validation Errrors" 
        AllowDragging="true" AllowResize="true" AutoUpdatePosition="true" 
        PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter">
    <ContentCollection>
        <dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
        </dx:PopupControlContentControl>
    </ContentCollection>
</dx:ASPxPopupControl>


