<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UserAdminView.ascx.cs" Inherits="Rawson.Admin.Users.UserAdminView" EnableViewState="true" %>
<%@ Register Assembly="DevExpress.Web.v10.2, Version=10.2.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxHiddenField" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v10.2" Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v10.2" Namespace="DevExpress.Web.ASPxDataView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxTreeList.v10.2" Namespace="DevExpress.Web.ASPxTreeList" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxEditors.v10.2" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<table border="0" cellpadding="0" cellspacing="0" width="910px">
    <tr>
        <td>
            <table border="0" cellpadding="0" cellspacing="0">
                <tr valign="top" style="height: 30px">
                    <td colspan="3" align="char">
                        <h3>Users</h3>
                    </td>
                </tr>
                <tr valign="top">
                    <td>
                        <dx:ASPxTextBox ID="txtUserSearchFilter" runat="server" MinWidth="175px" 
                            NullText="Find Username" Font-Size="Small" Width="200px">
                        </dx:ASPxTextBox>
                    </td>
                    <td>
                        <dx:ASPxButton ID="btnUserSearch" runat="server" Text="" Width="16px" 
                            Height="16px" onclick="btnUserSearch_Click">
                            <Image AlternateText="Search" Url="../../../images/icon_search_16px.gif" Height="12px" Width="12px"></Image>
                        </dx:ASPxButton>
                    </td>
                    <td style="padding-left: 3px">
                        <dx:ASPxHyperLink ID="lnkNewUser" runat="server" Text="New User">
                        </dx:ASPxHyperLink>
                    </td>
                </tr>
                <tr>
                    <td colspan="3" style="white-space: nowrap" >
                        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="ldsUserphabet" EnableTheming="true">
                            <ItemTemplate>
                                <dx:ASPxHyperLink ID="ASPxHyperLink1" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem") %>' Cursor="pointer"
                                    NavigateUrl='<%# LetterFilterUrl((string)DataBinder.Eval(Container, "DataItem")) %>'>                              
                                </dx:ASPxHyperLink>
                            </ItemTemplate>
                        </asp:Repeater>
                    </td>
                </tr>
            </table>
        </td>
        <td>
            <table border="0" cellpadding="0" cellspacing="0">
               <tr valign="top" style="height: 30px">
                    <td colspan="3" align="char">
                        <h3>Roles</h3>
                    </td>
                </tr>
                <tr valign="top">
                    <td>
                        <dx:ASPxComboBox ID="cmbRoles" runat="server" DataSourceID="ldsListRoles" 
                            TextField="RoleName" ValueField="RoleID" ValueType="System.Int32" 
                            Height="20px">
                        </dx:ASPxComboBox>
                    </td>
                    <td>
                        <dx:ASPxButton ID="btnUsersInRole" runat="server" Height="16px" Width="16px" 
                            onclick="btnUsersInRole_Click">
                            <Image Url="../../../images/icon_users_16px.gif" AlternateText="Users In Role" Width="12px" Height="12px"></Image>
                        </dx:ASPxButton>
                    </td>
                    <td style="padding-left: 3px">
                        <dx:ASPxHyperLink ID="lnkNewRole" runat="server" Text="New Role">
                        </dx:ASPxHyperLink>
                    </td>
                </tr>
            </table>
        </td>
        <td>
            <table border="0" cellpadding="0" cellspacing="0">
                <tr valign="top" style="height: 30px">
                    <td colspan="3" align="char">
                        <h3>Clients / Locations</h3>
                    </td>
                </tr>
                <tr valign="top">
                    <td>
                        <dx:ASPxComboBox ID="cmbClients" runat="server" DataSourceID="ldsListClients" 
                            ValueType="System.Int32" Font-Size="Small" TextField="DisplayMember" 
                            ValueField="ValueMember">
                        </dx:ASPxComboBox>
                        <dx:ASPxComboBox ID="cmbLocations" runat="server" Font-Size="Small" 
                            DataSourceID="ldsListLocations" oncallback="cmbLocations_Callback" 
                            TextField="DisplayMember" ValueField="ValueMember" ValueType="System.Int32">
                        </dx:ASPxComboBox>
                    </td>
                    <td>
                        <dx:ASPxButton ID="btnRolesForClient" runat="server" Width="16px" Height="39px" 
                            onclick="btnRolesForClient_Click">
                            <Image Url="../../../images/icon_authentication_16px.gif" AlternateText="Roles For Client" Width="12px" Height="12px"></Image>
                        </dx:ASPxButton>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr valign="top">
        <td>
            <dx:ASPxDataView ID="dvUserGrid" runat="server" ColumnCount="1" ClientInstanceName="userGrid"
                RowPerPage="10" ShowLoadingPanel="False" ShowLoadingPanelImage="False" 
                EnableDefaultAppearance="False">
                <ItemTemplate>
                    <table>
                        <tr>
                            <td>
                                <dx:ASPxImage ID="ASPxImage1" runat="server" ImageUrl="~/images/edit_pen.gif" Cursor="pointer" AlternateText='<%# DataBinder.Eval(Container.DataItem, "UserID").ToString() %>'>
                                    <ClientSideEvents Click="function(s,e){ userGrid.PerformCallback(); }" />
                                </dx:ASPxImage> 
                            </td>
                            <td>
                                <dx:ASPxHyperLink ID="ASPxHyperLink3" runat="server" Text='<%# Eval("UserName") %>'
                                    NavigateUrl='<%# UserFilterUrl(DataBinder.Eval(Container.DataItem, "UserID").ToString()) %>'>
                                </dx:ASPxHyperLink>
                            </td>
                            <td></td>
                        </tr>
                    </table>
                </ItemTemplate>
            </dx:ASPxDataView>
        </td>
        <td>
            <dx:ASPxDataView ID="dvRoleGrid" runat="server" ColumnCount="1" 
                RowPerPage="30" ShowLoadingPanel="False" ShowLoadingPanelImage="False" 
                EnableDefaultAppearance="False">
                <ItemTemplate>
                    <table>
                        <tr>
                            <td>
                                <dx:ASPxImage ID="ASPxImage1" runat="server" ImageUrl="~/images/edit_pen.gif" AlternateText='<%# Eval("RoleName") %>' Cursor="pointer" >
                                    <ClientSideEvents Click="function(s,e){ popRoles.PerformCallback(e.htmlElement.alt); }" />
                                </dx:ASPxImage> 
                            </td>
                            <td>
                                <dx:ASPxHyperLink ID="ASPxHyperLink3" runat="server" Text='<%# Eval("RoleName") %>'
                                    NavigateUrl='<%# RoleFilterUrl(DataBinder.Eval(Container.DataItem, "RoleID").ToString()) %>'>
                                </dx:ASPxHyperLink>
                            </td>
                            <td></td>
                        </tr>
                    </table>
                </ItemTemplate>
            </dx:ASPxDataView>
        </td>
        <td>
            <dx:ASPxTreeList ID="tvAuthorizations" runat="server" 
                AutoGenerateColumns="False" KeyFieldName="ID" 
                ParentFieldName="ParentID">
                <Columns>
                    <dx:TreeListHyperLinkColumn FieldName="Name" VisibleIndex="0">
                    </dx:TreeListHyperLinkColumn>
                </Columns>
                <Settings ShowColumnHeaders="False" />
            </dx:ASPxTreeList>
        </td>
    </tr>
</table>
<asp:LinqDataSource ID="ldsUserphabet" runat="server" 
    onselecting="ldsUserphabet_Selecting">
</asp:LinqDataSource>
<asp:LinqDataSource ID="ldsClientLocations" runat="server" 
    ContextTypeName="Rawson.Data.ValvTrakDBDataContext" TableName="ClientLocations">
</asp:LinqDataSource>
<asp:LinqDataSource ID="ldsListRoles" runat="server" 
    ContextTypeName="DotNetNuke.Security.Roles.RoleInfo" 
    onselecting="ldsListRoles_Selecting">
</asp:LinqDataSource>
<asp:LinqDataSource ID="ldsListClients" runat="server" 
    onselecting="ldsListClients_Selecting" 
    ContextTypeName="Rawson.Data.ValvTrakDBDataContext" TableName="Clients">
</asp:LinqDataSource>
<asp:LinqDataSource ID="ldsListLocations" runat="server"
    ContextTypeName="Rawson.Data.ValvTrakDBDataContext" 
    TableName="ClientLocations" onselecting="ldsListLocations_Selecting">
</asp:LinqDataSource>
<asp:HiddenField ID="hdnState" runat="server" EnableViewState="true" />
