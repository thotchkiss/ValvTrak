<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Search.ascx.cs" Inherits="JobsSearch" EnableTheming="true" %>
<%@ Register Assembly="DevExpress.Web.v12.2" Namespace="DevExpress.Web.ASPxCallbackPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2" Namespace="DevExpress.Web.ASPxGlobalEvents" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2" Namespace="DevExpress.Web.ASPxLoadingPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v12.2" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v12.2" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v12.2" Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dxrp" %>
<%@ Register Assembly="DevExpress.Web.v12.2" Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dxp" %>
<%@ Register assembly="DevExpress.Web.v12.2" namespace="DevExpress.Data.Linq" tagprefix="dx" %>

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

    function ConfirmCustomButtonClick(jobID) {

        return confirm("All related valve tests and greasing records will also be deleted.\r\n\Do you wish to delete job " + jobID + "?");
    }

</script>
<script type="text/javascript">
    function pageBarFirstButton_Click() {
        jobsGrid.GotoPage(0);
    }
    function pageBarPrevButton_Click() {
        jobsGrid.PrevPage();
    }
    function pageBarNextButton_Click() {
        jobsGrid.NextPage();
    }
    function pageBarLastButton_Click(s, e) {
        jobsGrid.GotoPage(jobsGrid.cpPageCount - 1);
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
        jobsGrid.GotoPage(pageIndex);
    }
    function pageBarTextBox_ValueChanged(s, e) {
        var pageIndex = (parseInt(s.GetText()) <= 0) ? 0 : parseInt(s.GetText()) - 1;
        jobsGrid.GotoPage(pageIndex);
    }
    function pagerBarComboBox_SelectedIndexChanged(s, e) {
        jobsGrid.PerformCallback(s.GetSelectedItem().text);
    }
</script>

<table cellpadding="0" cellspacing="0" width="910px">
    <tr>
        <td>
            <dxrp:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" ShowHeader="False" Width="100%" DefaultButton="QueryBtn">
                <PanelCollection>
                    <dxp:PanelContent ID="PanelContent1" runat="server">
                        <!-- Top Criteria -->
                        <table style="white-space: nowrap;">
                            <tr>
                                <td>
                                    <dxe:ASPxLabel ID="ASPxLabel1" runat="server" Text="Job ID :">
                                    </dxe:ASPxLabel>
                                </td>
                                <td>
                                    <dxe:ASPxTextBox ID="JobIDFilter" runat="server" Width="170px" 
                                        NullText="-- Enter Job ID --"></dxe:ASPxTextBox>
                                </td>
                                <td>
                                    <dxe:ASPxImage ID="ASPxImage1" runat="server" ImageUrl="~/spacer.gif" AlternateText=" " Width="10px">
                                    </dxe:ASPxImage>
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                                <td rowspan="5" valign="top">
                                    <table>
                                        <tr>
                                            <td rowspan="4">
                                                <dxe:ASPxImage ID="ASPxImage2" runat="server" ImageUrl="~/spacer.gif" AlternateText=" " Width="30px">
                                                </dxe:ASPxImage>
                                            </td>
                                            <td></td>
                                            <td>
                                                <dxe:ASPxLabel ID="ASPxLabel22" runat="server" Text="Begin Date">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td>
                                                <dxe:ASPxLabel ID="ASPxLabel23" runat="server" Text="End Date">
                                                </dxe:ASPxLabel>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <dxe:ASPxLabel ID="ASPxLabel21" runat="server" Text="Call In Date :" Font-Bold="true">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td>
                                                <dxe:ASPxDateEdit ID="CallInStartDate" runat="server"  Width="100px">
                                                </dxe:ASPxDateEdit>
                                            </td>
                                            <td>
                                                <dxe:ASPxDateEdit ID="CallInEndDate" runat="server"  Width="100px">
                                                </dxe:ASPxDateEdit>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <dxe:ASPxLabel ID="ASPxLabel6" runat="server" Text="Service Date :" Font-Bold="true">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td>
                                                <dxe:ASPxDateEdit ID="ServiceStartDate" runat="server" Width="100px">
                                                </dxe:ASPxDateEdit>
                                            </td>
                                            <td>
                                                <dxe:ASPxDateEdit ID="ServiceEndDate" runat="server" Width="100px">
                                                </dxe:ASPxDateEdit>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <dxe:ASPxLabel ID="ASPxLabel9" runat="server" Text="Compl. Date :" Font-Bold="true">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td>
                                                <dxe:ASPxDateEdit ID="CompletionStartDate" runat="server" Width="100px">
                                                </dxe:ASPxDateEdit>
                                            </td>
                                            <td>
                                                <dxe:ASPxDateEdit ID="CompletionEndDate" runat="server" Width="100px">
                                                </dxe:ASPxDateEdit>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dxe:ASPxLabel ID="ASPxLabel14" runat="server" Text="Job Type :">
                                    </dxe:ASPxLabel>
                                </td>
                                <td>
                                    <dxe:ASPxComboBox ID="JobTypeFilter" runat="server" 
                                        DataSourceID="JobTypeDataSource" EnableIncrementalFiltering="True" 
                                        IncrementalFilteringMode="StartsWith" SelectedIndex="0" 
                                        TextField="DisplayMember" ValueField="ValueMember" ValueType="System.Int32" 
                                        Width="170px">
                                    </dxe:ASPxComboBox>
                                </td>
                                <td></td>
                                <td>
                                    <dxe:ASPxLabel ID="ASPxLabel15" runat="server" Text="Assigned To :">
                                    </dxe:ASPxLabel>
                                </td>
                                <td>
                                    <dxe:ASPxComboBox ID="AssignedToFilter" runat="server" 
                                        DataSourceID="EmployeeDataSource" EnableIncrementalFiltering="True" 
                                        IncrementalFilteringMode="StartsWith" TextField="DisplayMember" 
                                        ValueField="ValueMember" ValueType="System.Int32" Width="170px">
                                    </dxe:ASPxComboBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dxe:ASPxLabel ID="ASPxLabel16" runat="server" Text="Client :">
                                    </dxe:ASPxLabel>
                                </td>
                                <td>
                                    <dxe:ASPxComboBox ID="ClientFilter" runat="server" 
                                        DataSourceID="ClientDataSource" EnableCallbackMode="True" 
                                        EnableIncrementalFiltering="True" IncrementalFilteringMode="StartsWith" 
                                        ShowLoadingPanel="False" TextField="DisplayMember" ValueField="ValueMember" 
                                        ValueType="System.Int32" Width="170px">
                                        <ClientSideEvents SelectedIndexChanged="function(s,e){ locations.PerformCallback(); }" />
                                    </dxe:ASPxComboBox>
                                </td>
                                <td></td>
                                <td>
                                    <dxe:ASPxLabel ID="ASPxLabel17" runat="server" Text="Job Status :">
                                    </dxe:ASPxLabel>
                                </td>
                                <td>
                                    <dxe:ASPxComboBox ID="JobStatusFilter" runat="server" 
                                        DataSourceID="JobStatusDataSource" EnableIncrementalFiltering="True" 
                                        IncrementalFilteringMode="StartsWith" SelectedIndex="0" 
                                        TextField="DisplayMember" ValueField="ValueMember" ValueType="System.Int32" 
                                        Width="170px">
                                    </dxe:ASPxComboBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dxe:ASPxLabel ID="ASPxLabel18" runat="server" Text="Location">
                                    </dxe:ASPxLabel>
                                </td>
                                <td>
                                    <dxe:ASPxComboBox ID="LocationFilter" runat="server" 
                                        ClientInstanceName="locations" DataSourceID="LocationDataSource" 
                                        EnableCallbackMode="True" EnableClientSideAPI="True" 
                                        EnableIncrementalFiltering="True" IncrementalFilteringMode="StartsWith" 
                                        OnCallback="LocationFilter_Callback" ShowLoadingPanel="False" 
                                        TextField="DisplayMember" ValueField="ValueMember" ValueType="System.Int32" 
                                        Width="170px">
                                    </dxe:ASPxComboBox>
                                </td>
                                <td></td>
                                <td>
                                    <dxe:ASPxLabel ID="ASPxLabel12" runat="server" Text="SO # :">
                                    </dxe:ASPxLabel>
                                </td>
                                <td>
                                    <dxe:ASPxTextBox ID="SalesOrderFilter" runat="server" 
                                        NullText="-- Enter Sales Order No. --" Width="170px">
                                    </dxe:ASPxTextBox>
                                </td>
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
                            </tr>
                            <tr valign="top">
                                <td>
                                </td>
                                <td>
                                    
                                </td>
                                <td></td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                                <td align="right">
                                    <dxe:ASPxButton ID="QueryBtn" runat="server" AutoPostBack="False" Text="Search" 
                                        Width="170px" CausesValidation="False" UseSubmitBehavior="False">
                                        <ClientSideEvents Click="function(s,e){ jobsGrid.PerformCallback(); }" />
                                    </dxe:ASPxButton>
                                </td>
                            </tr>
                        </table>
                        <!-- Bottom Criteria -->
                        <asp:LinqDataSource ID="JobStatusDataSource" runat="server" OnSelecting="JobStatusDataSource_Selecting">
                        </asp:LinqDataSource>
                        <asp:LinqDataSource ID="EmployeeDataSource" runat="server" ContextTypeName="Rawson.Data.ValvTrakDBDataContext"
                            OnSelecting="EmployeeDataSource_Selecting" TableName="Employees">
                        </asp:LinqDataSource>
                        <asp:LinqDataSource ID="JobTypeDataSource" runat="server" OnSelecting="JobTypeDataSource_Selecting">
                        </asp:LinqDataSource>
                        <asp:LinqDataSource ID="ClientDataSource" runat="server" ContextTypeName="Rawson.Data.ValvTrakDBDataContext"
                            OnSelecting="ClientDataSource_Selecting">
                        </asp:LinqDataSource>
                        <asp:LinqDataSource ID="LocationDataSource" runat="server" ContextTypeName="Rawson.Data.ValvTrakDBDataContext"
                            OnSelecting="LocationDataSource_Selecting">
                        </asp:LinqDataSource>
                    </dxp:PanelContent>
                </PanelCollection>
            </dxrp:ASPxRoundPanel>
        </td>
    </tr>
    <tr>
        <td>
            <dxe:ASPxImage ID="ASPxImage3" runat="server" ImageUrl="~/spacer.gif" AlternateText=" " Height="10px">
            </dxe:ASPxImage>
        </td>
    </tr>
    <tr>
        <td align="right">
            <dxe:ASPxHyperLink ID="lnkNewJob" runat="server" Text="Add New Job" ForeColor="#3da0ff" Font-Bold="true" >
            </dxe:ASPxHyperLink>
        </td>
    </tr>
    <tr>
        <td>
            <dxwgv:ASPxGridView ID="JobsGrid" runat="server" AutoGenerateColumns="False" DataSourceID="JobGridDataSource"
                KeyFieldName="JobID" Width="100%" 
                onbeforecolumnsortinggrouping="JobsGrid_BeforeColumnSortingGrouping" 
                onpageindexchanged="JobsGrid_PageIndexChanged" 
                ClientInstanceName="jobsGrid" oncustomcallback="JobsGrid_CustomCallback" 
                ondatabound="JobsGrid_DataBound" 
                oncustombuttoncallback="JobsGrid_CustomButtonCallback" 
                EnableCallbackCompression="False" EnableCallBacks="true" 
                onfocusedrowchanged="JobsGrid_FocusedRowChanged" >
                <SettingsLoadingPanel Mode="Disabled" />
                <SettingsBehavior EnableRowHotTrack="true" AllowFocusedRow="true" AllowSelectByRowClick="true" ProcessFocusedRowChangedOnServer="true" />
                <SettingsPager PageSize="15" Position="Top" AlwaysShowPager="true" />
                <ClientSideEvents CustomButtonClick="function(s,e) { e.processOnServer = true; if (e.buttonID == 'btnDelete') { e.processOnServer = ConfirmCustomButtonClick(jobsGrid.GetRowKey(e.visibleIndex)); } }" />
                <Columns>
                    <dxwgv:GridViewCommandColumn ButtonType="Image" Caption=" " Width="24px" VisibleIndex="0">
                        <CustomButtons>
                            <dxwgv:GridViewCommandColumnCustomButton ID="btnEdit" Text="Edit" Visibility="AllDataRows">
                                <Image Url="~/images/edit.gif" Height="16px" Width="16px" AlternateText="Edit" />
                            </dxwgv:GridViewCommandColumnCustomButton>
                        </CustomButtons>
                    </dxwgv:GridViewCommandColumn>
                    <dxwgv:GridViewCommandColumn ButtonType="Image" Caption=" " Width="24px" VisibleIndex="0">
                        <CustomButtons>
                            <dxwgv:GridViewCommandColumnCustomButton ID="btnDelete" Text="Delete" Visibility="AllDataRows">
                                <Image Url="../../images/delete.gif" Height="16px" Width="16px" AlternateText="Delete" />
                            </dxwgv:GridViewCommandColumnCustomButton>
                        </CustomButtons>
                    </dxwgv:GridViewCommandColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Job ID" FieldName="JobID" ReadOnly="True" VisibleIndex="1">
                        <EditFormSettings Visible="False" />
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Sales Order #" FieldName="SalesOrderNum" VisibleIndex="2">
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Job Type" FieldName="JobType.Type" VisibleIndex="3">
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Client" FieldName="ClientLocation.Client.Name"
                        VisibleIndex="4" Width="150px">
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Location" FieldName="ClientLocation.Name"
                        VisibleIndex="5" Width="150px">
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Status" FieldName="JobStatus.Status" VisibleIndex="6">
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataDateColumn Caption="Call In Date" FieldName="CallDate" VisibleIndex="7">
                    </dxwgv:GridViewDataDateColumn>
                    <dxwgv:GridViewDataDateColumn Caption="Service Date" FieldName="ServiceDate" VisibleIndex="8">
                    </dxwgv:GridViewDataDateColumn>
                    <dxwgv:GridViewDataDateColumn Caption="Completed" FieldName="CompletionDate" VisibleIndex="9">
                    </dxwgv:GridViewDataDateColumn>
                    <dxwgv:GridViewDataCheckColumn FieldName="Active" VisibleIndex="10">
                    </dxwgv:GridViewDataCheckColumn>
                </Columns>
            </dxwgv:ASPxGridView>
            <asp:LinqDataSource ID="JobGridDataSource" runat="server" ContextTypeName="Rawson.Data.ValvTrakDBDataContext"
                TableName="Jobs" OnSelecting="JobGridDataSource_Selecting">
            </asp:LinqDataSource>
            <dx:ASPxLoadingPanel ID="ASPxLoadingPanel1" runat="server"  ClientInstanceName="lpanel" Modal="true">
                <ClientSideEvents Init="function(s,e){ s.SetText('Loading....'); }" />
            </dx:ASPxLoadingPanel>
            <dx:ASPxGlobalEvents ID="ASPxGlobalEvents1" runat="server">
                <ClientSideEvents BeginCallback="function(s,e){ lpanel.Show(); }"
                    EndCallback="function(s,e){ lpanel.Hide(); }"  />
            </dx:ASPxGlobalEvents>
        </td>
    </tr>
</table>



