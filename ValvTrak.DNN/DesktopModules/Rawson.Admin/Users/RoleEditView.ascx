<%@ Control Language="C#" AutoEventWireup="true" CodeFile="RoleEditView.ascx.cs" Inherits="Rawson.Admin.Users.RoleEditView" %>
<%@ Register Assembly="DevExpress.Web.v10.2" Namespace="DevExpress.Web.ASPxTreeView"
    TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v10.2" Namespace="DevExpress.Web.ASPxDataView"
    TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v10.2" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<!--
<table cellpadding="0" cellspacing="0" border="0">
    <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>
            <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Clients">
            </dx:ASPxLabel>  
        </td>
        <td>
            <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="Locations">
            </dx:ASPxLabel>  
        </td>
    </tr>
    <tr>
        <td>
            <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Role Name :">
            </dx:ASPxLabel>
        </td>
        <td>
            <dx:ASPxTextBox ID="txtRoleName" runat="server" Width="170px">
            </dx:ASPxTextBox>
        </td>
        <td>&nbsp;</td>
        <td>
            <dx:ASPxComboBox ID="cmbClients" runat="server">
            </dx:ASPxComboBox>
        </td>
        <td>
            <dx:ASPxComboBox ID="cmbLocations" runat="server">
            </dx:ASPxComboBox>
        </td>
    </tr>
    <tr>
        <td>
            <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Description :">
            </dx:ASPxLabel>
        </td>
        <td>
            <dx:ASPxMemo ID="memoDescription" runat="server" Height="71px" Width="170px">
            </dx:ASPxMemo>
        </td>
        <td>&nbsp;</td>
        <td colspan="2">
            <dx:ASPxTreeView ID="ASPxTreeView1" runat="server">
                <NodeTemplate>
                    <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text='<%# Eval("Name") %>'>
                    </dx:ASPxLabel>
                    <dx:ASPxImage ID="ASPxImage1" runat="server" ImageUrl="~/images/delete.gif">
                    </dx:ASPxImage>
                </NodeTemplate>
            </dx:ASPxTreeView>  
        </td>
    </tr>
    <tr>
        <td align="center">
                    
        </td>
        <td colspan="3">&nbsp;</td>
    </tr>
</table>
<asp:LinqDataSource ID="dsClients" runat="server" 
    onselecting="dsClients_Selecting">
</asp:LinqDataSource>
<asp:LinqDataSource ID="dsLocations" runat="server" 
    onselecting="dsLocations_Selecting">
</asp:LinqDataSource>
<asp:LinqDataSource ID="dsTree" runat="server" onselecting="dsTree_Selecting">
</asp:LinqDataSource>
-->