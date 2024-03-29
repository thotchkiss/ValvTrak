﻿<%@ control language="C#" autoeventwireup="true" inherits="Rawson.ManufacturerModels.ManufacturerForm, App_Web_n0vd323z" enabletheming="true" %>

<%@ Register Assembly="DevExpress.Web.v15.2" Namespace="DevExpress.Web" TagPrefix="dx" %>









<script type="text/javascript">

    function OnGetManufacturerRowID(value) {

        manufacturerGridLocalData.Set("ManufacturerID", value);
        modelGridLocalData.Set("ManufacturerID", value);

        modelGridPanel.PerformCallback();
    }

    function OnGetManufacturerRowIdWithEdit(value) {

        manufacturerGridLocalData.Set("ManufacturerID", value);
        modelGridLocalData.Set("ManufacturerID", value);

        modelGridPanel.PerformCallback();
        manufacturerPanel.PerformCallback(); 
    }

    function OnGetModelRowID(value) {
        modelGridLocalData.Set("ManufacturerModelID", value);
    }

    function OnGetModelRowIdWithEdit(value) {
        modelGridLocalData.Set("ManufacturerModelID", value);
        modelPanel.PerformCallback(); 
    }

</script>
<table cellpadding="0" cellspacing="0" border="0">
    <tr valign="top">
        <td>
            <dx:ASPxCallbackPanel ID="ManufacturerGridPanel" runat="server" Width="100%" 
                oncallback="ManufacturerGridPanel_Callback" RenderMode="Table" ClientInstanceName="manufacturerGridPanel">
                <PanelCollection>
                    <dx:PanelContent>
                        <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Manufacturers">
                        </dx:ASPxLabel>
                        <dx:ASPxGridView ID="ManufacturerGrid" runat="server" AutoGenerateColumns="False" 
                            DataSourceID="ManufacturerDataSource" 
                            ClientInstanceName="manufacturerGrid" KeyFieldName="ManufacturerID">
                            <ClientSideEvents Init="function(s,e){ s.SetFocusedRowIndex(0); }"
                                FocusedRowChanged="function(s,e){
                                    manufacturerGrid.GetRowValues(manufacturerGrid.GetFocusedRowIndex(), 'ManufacturerID', OnGetManufacturerRowID);
                                }" 
                                CustomButtonClick="function(s,e) {
                                    e.processOnServer = false;
                                    
                                    manufacturerGrid.SetFocusedRowIndex(e.visibleIndex);
                                    manufacturerGrid.GetRowValues(e.visibleIndex, 'ManufacturerID', OnGetManufacturerRowIdWithEdit);

                                }"  />
                            <Columns>
                                <dx:GridViewCommandColumn ButtonType="Image" Caption=" " 
                                    ShowInCustomizationForm="True" VisibleIndex="0" Width="20px">
                                    <CustomButtons>
                                        <dx:GridViewCommandColumnCustomButton ID="btnEdit" Visibility="AllDataRows">
                                            <Image ToolTip="Edit" Url="~/images/edit.gif"></Image>
                                        </dx:GridViewCommandColumnCustomButton>
                                    </CustomButtons>
                                </dx:GridViewCommandColumn>
                                <dx:GridViewDataTextColumn Caption="Manufacturer" FieldName="Name" 
                                    Name="colName" ReadOnly="True" ShowInCustomizationForm="True" 
                                    VisibleIndex="1" Width="150px">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataCheckColumn Caption="Active" FieldName="Active" 
                                    Name="colActive" ReadOnly="True" ShowInCustomizationForm="True" 
                                    VisibleIndex="2" Width="40px">
                                </dx:GridViewDataCheckColumn>
                                <dx:GridViewDataTextColumn Caption=" " FieldName="ManufacturerModelID" Visible="false" Name="colManufactuerModelID">
                                </dx:GridViewDataTextColumn>
                            </Columns>
                            <SettingsBehavior AllowDragDrop="False" AllowFocusedRow="True" AllowGroup="False" />
                            <Settings ShowGroupButtons="False" ShowHeaderFilterBlankItems="False" 
                                ShowFilterBar="Visible" ShowFilterRow="True" ShowFilterRowMenu="True" />
                            <SettingsLoadingPanel Mode="Disabled" />
                        </dx:ASPxGridView>
                        <dx:ASPxHiddenField ID="hfManufacturerGridLocalData" ClientInstanceName="manufacturerGridLocalData" runat="server" SyncWithServer="true">
                        </dx:ASPxHiddenField>
                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxCallbackPanel>
        </td>
        <td>
            <dx:ASPxImage ID="ASPxImage1" runat="server" ImageUrl="~/spacer.gif" Width="20px">
            </dx:ASPxImage>
        </td>
        <td>
            <dx:ASPxImage ID="ASPxImage3" runat="server" ImageUrl="~/spacer.gif" Width="20px">
            </dx:ASPxImage>
            <dx:ASPxButton ID="btnNewManufacturer" runat="server" Text="Add Manufacturer" 
                Width="120px" AutoPostBack="false">
                <ClientSideEvents Click="function(s,e){ 
                    manufacturerGridLocalData.Set('ManufacturerID', -1);
                    manufacturerPanel.PerformCallback(); }" />
            </dx:ASPxButton>
            <dx:ASPxButton ID="btnNewModel" runat="server" Text="Add Model" Width="120px"
                AutoPostBack="false">
                <ClientSideEvents Click="function(s,e){
                    modelGridLocalData.Set('ManufacturerModelID', -1); 
                    modelPanel.PerformCallback(); }" />
            </dx:ASPxButton>
        </td>
        <td>
            <dx:ASPxImage ID="ASPxImage2" runat="server" ImageUrl="~/spacer.gif" Width="20px">
            </dx:ASPxImage>
        </td>
        <td>
            <dx:ASPxCallbackPanel ID="ModelGridPanel" runat="server" Width="100%" 
                ClientInstanceName="modelGridPanel" oncallback="ModelGridPanel_Callback" 
                ShowLoadingPanel="False">
                <PanelCollection>
                    <dx:PanelContent>
                        <dx:ASPxLabel ID="lblModels" runat="server" Text="Models for " ClientInstanceName="modelsLabel">
                        </dx:ASPxLabel>
                        <dx:ASPxGridView ID="ModelGrid" runat="server" AutoGenerateColumns="False" 
                            DataSourceID="ModelDataSource" ClientInstanceName="modelGrid" 
                            KeyFieldName="ManufacturerModelID">
                            <ClientSideEvents 
                                FocusedRowChanged="function(s,e){
                                    modelGrid.GetRowValues(modelGrid.GetFocusedRowIndex(), 'ManufacturerModelID', OnGetModelRowID);
                                }" 
                                CustomButtonClick="function(s,e) {
                                        e.processOnServer = false;

                                        modelGrid.SetFocusedRowIndex(e.visibleIndex);
                                        modelGrid.GetRowValues(e.visibleIndex, 'ManufacturerModelID', OnGetModelRowIdWithEdit);

                                    }" />
                            <Columns>
                                <dx:GridViewCommandColumn ButtonType="Image" Caption=" " 
                                    ShowInCustomizationForm="True" VisibleIndex="0" Width="40px">
                                    <ClearFilterButton Visible="True">
                                    </ClearFilterButton>
                                    <CustomButtons>
                                        <dx:GridViewCommandColumnCustomButton ID="btnModelEdit" 
                                            Visibility="AllDataRows">
                                            <Image Url="~/images/edit.gif">
                                            </Image>
                                        </dx:GridViewCommandColumnCustomButton>
                                    </CustomButtons>
                                </dx:GridViewCommandColumn>
                                <dx:GridViewDataTextColumn Caption="Model" FieldName="Model" 
                                    Name="colModelName" ReadOnly="True" ShowInCustomizationForm="True" 
                                    VisibleIndex="1" Width="150px">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataCheckColumn Caption="Active" FieldName="Active" 
                                    Name="colModelActive" ReadOnly="True" ShowInCustomizationForm="True" 
                                    VisibleIndex="2" Width="40px">
                                </dx:GridViewDataCheckColumn>
                                <dx:GridViewDataTextColumn Caption=" " FieldName="ManufactuerModelID" Name="colManufacturerModelID" Visible="false">
                                </dx:GridViewDataTextColumn>
                            </Columns>
                            <SettingsBehavior AllowDragDrop="False" AllowFocusedRow="True" 
                                AllowGroup="False" ColumnResizeMode="Control" />
                            <Settings ShowGroupButtons="False" ShowHeaderFilterBlankItems="False" 
                                ShowFilterBar="Visible" ShowFilterRow="True" ShowFilterRowMenu="True" />
                            <SettingsLoadingPanel Mode="Disabled" />
                        </dx:ASPxGridView>
                        <dx:ASPxHiddenField ID="hfModelGridLocalData" ClientInstanceName="modelGridLocalData" runat="server" SyncWithServer="true">
                        </dx:ASPxHiddenField>
                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxCallbackPanel>
        </td>
    </tr>
</table>
<dx:ASPxGlobalEvents ID="ASPxGlobalEvents1" runat="server">
    <ClientSideEvents BeginCallback="function(s,e){ lpanel.Show(); }" 
            EndCallback="function(s,e){ lpanel.Hide(); }" />
</dx:ASPxGlobalEvents>
<dx:ASPxLoadingPanel ID="ASPxLoadingPanel1" runat="server"  ClientInstanceName="lpanel" Modal="true">
    <ClientSideEvents Init="function(s,e){ s.SetText('Loading....'); }" />
</dx:ASPxLoadingPanel>
<dx:ASPxCallback ID="ManufacturerSaveAction" runat="server" 
    ClientInstanceName="manufacturerSaveAction" 
    oncallback="ManufacturerSaveAction_Callback">
    <ClientSideEvents EndCallback="function(s,e){ manufacturerWindow.Hide();
        if (s.cpHasErrors == false)
        {
            validation.Hide();
            manufacturerGridPanel.PerformCallback(s.cpManufacturerID);
        }
        else
        {
            validation.SetContentHtml(s.cpErrorMessage);
            validation.Show();
        } }" />
</dx:ASPxCallback>
<dx:ASPxCallback ID="ModelSaveAction" runat="server" 
    ClientInstanceName="modelSaveAction" oncallback="ModelSaveAction_Callback">
    <ClientSideEvents EndCallback="function(s,e){ modelWindow.Hide();
        if (s.cpHasErrors == false)
        {
            validation.Hide();
            modelGridPanel.PerformCallback(s.cpManufacturerModelID);
        }
        else
        {
            validation.SetContentHtml(s.cpErrorMessage);
            validation.Show();
                                                                        
        } }" />
</dx:ASPxCallback>
<dx:ASPxPopupControl ID="ManufacturerWindow" runat="server" Width="350px" 
    AllowDragging="True" ClientInstanceName="manufacturerWindow" 
    CloseAction="CloseButton" HeaderText="Add/Edit Manufacturer" Modal="True" 
    PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter">
    <ContentCollection>
        <dx:PopupControlContentControl>
            <dx:ASPxCallbackPanel ID="ManufacturerPanel" 
                ClientInstanceName="manufacturerPanel" runat="server" Width="100%" 
                OnCallback="ManufacturerPanel_Callback">
                <ClientSideEvents EndCallback="function(s,e){ 
                        manufacturerWindow.Show(); 
                        manufName.Focus();
                }" />
                <PanelCollection>
                    <dx:PanelContent>
                        <table cellpadding="0" cellspacing="3px" border="0" width="100%">
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Manufacturer : ">
                                    </dx:ASPxLabel>
                                </td>
                                <td>
                                    <dx:ASPxTextBox ID="txtManufacturerName" runat="server" Width="170px" ClientInstanceName="manufName">
                                    </dx:ASPxTextBox>
                                </td>
                                <td>
                                    <dx:ASPxCheckBox ID="chkManufacturerActive" runat="server" Text="Active">
                                    </dx:ASPxCheckBox>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3" align="right">
                                    <dx:ASPxButton ID="btnManufacturerSave" runat="server" Text="Save" AutoPostBack="false">
                                        <ClientSideEvents Click="function(s,e){ manufacturerSaveAction.PerformCallback(); }" />
                                    </dx:ASPxButton>
                                </td>
                            </tr>
                        </table>
                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxCallbackPanel>
        </dx:PopupControlContentControl>
    </ContentCollection>
</dx:ASPxPopupControl>
<dx:ASPxPopupControl ID="ModelWindow" runat="server" AllowDragging="True" Width="350px" 
    ClientInstanceName="modelWindow" CloseAction="CloseButton" 
    HeaderText="Add/Edit Model" Modal="True" PopupHorizontalAlign="WindowCenter" 
    PopupVerticalAlign="WindowCenter">
    <ContentCollection>
        <dx:PopupControlContentControl>
            <dx:ASPxCallbackPanel ID="ModelPanel" ClientInstanceName="modelPanel" 
                runat="server" Width="100%" OnCallback="ModelPanel_Callback">
                <ClientSideEvents EndCallback="function(s,e){ 
                        modelWindow.Show(); 
                        modelName.Focus();
                }" />
                <PanelCollection>
                    <dx:PanelContent>
                        <table cellpadding="0" cellspacing="3px" border="0" width="100%">
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Model : ">
                                    </dx:ASPxLabel>
                                </td>
                                <td>
                                    <dx:ASPxTextBox ID="txtModelName" ClientInstanceName="modelName" runat="server" Width="170px">
                                    </dx:ASPxTextBox>
                                </td>
                                <td>
                                    <dx:ASPxCheckBox ID="chkModelActive" runat="server" Text="Active">
                                    </dx:ASPxCheckBox>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3" align="right">
                                    <dx:ASPxButton ID="btnModelSave" runat="server" Text="Save" AutoPostBack="false">
                                        <ClientSideEvents Click="function(s,e){ modelSaveAction.PerformCallback(); }" />
                                    </dx:ASPxButton>
                                </td>
                            </tr>
                        </table>
                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxCallbackPanel>
        </dx:PopupControlContentControl>
    </ContentCollection>
</dx:ASPxPopupControl>
<dx:ASPxPopupControl ID="pcValidation" runat="server" ClientInstanceName="validation"
        Modal="false" ShowFooter="false" HeaderText="Validation Errrors" 
        AllowDragging="true" AllowResize="true" AutoUpdatePosition="true" 
        PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter">
    <ContentCollection>
        <dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
        </dx:PopupControlContentControl>
    </ContentCollection>
</dx:ASPxPopupControl>
<asp:LinqDataSource ID="ManufacturerDataSource" runat="server" 
    onselecting="ManufacturerDataSource_Selecting">
</asp:LinqDataSource>
<asp:LinqDataSource ID="ModelDataSource" runat="server" 
    onselecting="ModelDataSource_Selecting">
</asp:LinqDataSource>

