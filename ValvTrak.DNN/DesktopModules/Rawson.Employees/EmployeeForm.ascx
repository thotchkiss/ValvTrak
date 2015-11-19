<%@ Control Language="C#" AutoEventWireup="true" CodeFile="EmployeeForm.ascx.cs" Inherits="Rawson.Employees.EmployeeForm" EnableTheming="true" %>
<%@ Register Assembly="DevExpress.Web.v15.1"
    Namespace="DevExpress.Web" TagPrefix="dx" %>










<script type="text/javascript">

    function OnGetRowValues(value) { detailsPanel.PerformCallback(value); }

</script>
<table cellpadding="0" cellspacing="3px" border="0" width="910px">
    <tr>
        <td align="right">
            <table>
                <tr>
                    <td>
                        <dx:ASPxButton ID="btnNew" runat="server" Text="New Employee" 
                            AutoPostBack="False" CausesValidation="False">
                            <ClientSideEvents Click="function(s,e){ detailsPanel.PerformCallback(); }" />
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
    </tr>
    <tr>
        <td>
            <dx:ASPxGridView ID="EmployeesGrid" runat="server" KeyFieldName="EmployeeID"
                ClientInstanceName="employeesGrid" AutoGenerateColumns="False" 
                Width="100%" DataSourceID="EmployeesDataSource">
                <ClientSideEvents 
                    CustomButtonClick="function(s,e){
                        e.processOnServer = false;
                        employeesGrid.GetRowValues(e.visibleIndex, 'EmployeeID', OnGetRowValues);
                    }" />
                <Columns>
                    <dx:GridViewCommandColumn ButtonType="Image" Caption=" " VisibleIndex="0" Width="40px">
                        <CustomButtons>
                            <dx:GridViewCommandColumnCustomButton ID="btnEdit" Visibility="AllDataRows">
                                <Image Url="~/images/edit.gif" Width="16px">
                                </Image>
                            </dx:GridViewCommandColumnCustomButton>
                        </CustomButtons>
                    </dx:GridViewCommandColumn>
                    <dx:GridViewDataTextColumn Caption="First Name" FieldName="FirstName" 
                        Name="colFirstName" ReadOnly="True" VisibleIndex="1">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Last Name" FieldName="LastName" 
                        Name="colLastName" ReadOnly="True" VisibleIndex="2">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Work Phone" FieldName="WorkPhone" 
                        Name="colWorkPhone" ReadOnly="True" VisibleIndex="3">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Cell Phone" FieldName="CellPhone" 
                        Name="colCellPhone" ReadOnly="True" VisibleIndex="4">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Email" FieldName="Email" Name="colEmail" 
                        ReadOnly="True" VisibleIndex="5">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataComboBoxColumn Caption="Location" FieldName="EFC_LocationID" 
                        Name="colLocation" ReadOnly="True" VisibleIndex="6">
                        <PropertiesComboBox DataSourceID="LocationsDataSource" 
                            EnableIncrementalFiltering="True" IncrementalFilteringMode="StartsWith" 
                            TextField="DisplayMember" ValueField="ValueMember" ValueType="System.Int32">
                        </PropertiesComboBox>
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataComboBoxColumn Caption="Login" FieldName="UserID" 
                        Name="colLogin" ReadOnly="True" VisibleIndex="7">
                        <PropertiesComboBox DataSourceID="UsersDataSource" TextField="DisplayMember" 
                            ValueField="ValueMember" ValueType="System.Int32">
                        </PropertiesComboBox>
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataCheckColumn Caption="Active" FieldName="Active" 
                        Name="colActive" ReadOnly="True" VisibleIndex="8">
                    </dx:GridViewDataCheckColumn>
                    <dx:GridViewDataTextColumn Caption=" " FieldName="EmployeeID" 
                        Name="colEmployeeID" ReadOnly="True" Visible="False" VisibleIndex="9">
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
<asp:LinqDataSource ID="EmployeesDataSource" runat="server" 
    onselecting="EmployeesDataSource_Selecting">
</asp:LinqDataSource>
<asp:LinqDataSource ID="UsersDataSource" runat="server" 
    onselecting="UsersDataSource_Selecting">
</asp:LinqDataSource>
<asp:LinqDataSource ID="LocationsDataSource" runat="server" 
    onselecting="LocationsDataSource_Selecting">
</asp:LinqDataSource>
<dx:ASPxGlobalEvents ID="ASPxGlobalEvents1" runat="server">
    <ClientSideEvents BeginCallback="function(s,e){ lpanel.Show(); }" 
            EndCallback="function(s,e){ lpanel.Hide(); }" />
</dx:ASPxGlobalEvents>
<dx:ASPxLoadingPanel ID="ASPxLoadingPanel1" runat="server"  ClientInstanceName="lpanel" Modal="true">
    <ClientSideEvents Init="function(s,e){ s.SetText('Loading....'); }" />
</dx:ASPxLoadingPanel>
<dx:ASPxPopupControl ID="EmployeeDetailsWindow" runat="server" 
    ClientInstanceName="detailsWindow" AllowDragging="True" 
    CloseAction="CloseButton" HeaderText="Add / Edit Employee" Modal="True" 
    PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" 
    Width="300px">
    <ContentCollection>
        <dx:PopupControlContentControl>
            <dx:ASPxCallbackPanel ID="DetailsPanel" runat="server" Width="100%" 
                ClientInstanceName="detailsPanel" OnCallback="DetailsPanel_Callback">
                <ClientSideEvents EndCallback="function(s,e){ 
                        detailsWindow.Show();
                        empFirstName.Focus(); 
                    }" />
                <PanelCollection>
                    <dx:PanelContent>
                        <table cellpadding="0" cellspacing="3px" border="0">
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="First Name : ">
                                    </dx:ASPxLabel>
                                </td>
                                <td>
                                    <dx:ASPxTextBox ID="txtFirstName" runat="server" Width="170px" ClientInstanceName="empFirstName">
                                    </dx:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Last Name : ">
                                    </dx:ASPxLabel>
                                </td>
                                <td>
                                    <dx:ASPxTextBox ID="txtLastName" runat="server" Width="170px">
                                    </dx:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Work Phone : ">
                                    </dx:ASPxLabel>
                                </td>
                                <td>
                                    <dx:ASPxTextBox ID="txtWorkPhone" runat="server" Width="170px" MaxLength="18">
                                        <MaskSettings Mask="(999) 000-0000" PromptChar=" " ShowHints="True" />
                                    </dx:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Cell Phone : ">
                                    </dx:ASPxLabel>
                                </td>
                                <td>
                                    <dx:ASPxTextBox ID="txtCellPhone" runat="server" Width="170px">
                                    </dx:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="Email : ">
                                    </dx:ASPxLabel>
                                </td>
                                <td>
                                    <dx:ASPxTextBox ID="txtEmail" runat="server" Width="170px">
                                    </dx:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="Location : ">
                                    </dx:ASPxLabel>
                                </td>
                                <td>
                                    <dx:ASPxComboBox ID="cmbLocation" runat="server" AutoPostBack="false" 
                                        DataSourceID="LocationsDataSource" EnableIncrementalFiltering="True" 
                                        IncrementalFilteringMode="StartsWith" ShowLoadingPanel="False" 
                                        TextField="DisplayMember" ValueField="ValueMember" ValueType="System.Int32">
                                    </dx:ASPxComboBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="Login : ">
                                    </dx:ASPxLabel>
                                </td>
                                <td>
                                    <dx:ASPxComboBox ID="cmbUser" runat="server" AutoPostBack="false" 
                                        DataSourceID="UsersDataSource" ShowLoadingPanel="False" 
                                        TextField="DisplayMember" ValueField="ValueMember" ValueType="System.Int32">
                                    </dx:ASPxComboBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel8" runat="server" Text="Active : ">
                                    </dx:ASPxLabel>
                                </td>
                                <td>
                                    <dx:ASPxCheckBox ID="chkActive" runat="server">
                                    </dx:ASPxCheckBox>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" align="right">
                                    <dx:ASPxButton ID="btnSave" runat="server" Text="Save" Width="80px" AutoPostBack="false">
                                        <ClientSideEvents Click="function(s,e){ employeeSaveAction.PerformCallback(); }" />
                                    </dx:ASPxButton>
                                </td>
                            </tr>
                        </table>
                        <dx:ASPxHiddenField ID="EmployeeLocalData" runat="server" ClientInstanceName="localData">
                        </dx:ASPxHiddenField>
                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxCallbackPanel>
        </dx:PopupControlContentControl>
    </ContentCollection>
</dx:ASPxPopupControl>
<dx:ASPxCallback ID="EmployeeSaveAction" runat="server" 
    ClientInstanceName="employeeSaveAction" 
    oncallback="EmployeeSaveAction_Callback">
    <ClientSideEvents CallbackComplete="function(s,e) { detailsWindow.Hide();
        if (s.cpHasErrors == true)
        {
            alert(s.cpErrorMessage);
        }
        else
        {
            employeesGrid.ApplyFilter('EmployeeID = ' + s.cpEmployeeID);
            employeesGrid.Refresh(); 
        }
    }" />
</dx:ASPxCallback>
<dx:ASPxGridViewExporter ID="EmployeesExporter" runat="server">
</dx:ASPxGridViewExporter>
