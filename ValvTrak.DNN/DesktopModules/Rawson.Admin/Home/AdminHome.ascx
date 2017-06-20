<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AdminHome.ascx.cs" Inherits="Rawson.Admin.AdminHome" EnableTheming="true" %>
<%@ Register Assembly="DevExpress.Web.v15.2"
    Namespace="DevExpress.Web" TagPrefix="dx" %>





<dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" Width="100%" HorizontalAlign="Center" HeaderText="Configuration" >
    <PanelCollection>
        <dx:PanelContent runat="server" SupportsDisabledAttribute="True">
            <table>
                <tr>
                    <td>
                        <dx:ASPxImage ID="ASPxImage1" runat="server" ImageUrl="~/images/icon_wizard_32px.gif" >
                        </dx:ASPxImage>
                        <dx:ASPxHyperLink ID="ASPxHyperLink1" runat="server" Text="Clients"
                            NavigateUrl="~/Configuration/Clients.aspx" >
                        </dx:ASPxHyperLink>
                    </td>
                    <td>
                        <dx:ASPxImage ID="ASPxImage2" runat="server" ImageUrl="~/images/icon_wizard_32px.gif" >
                        </dx:ASPxImage>
                        <dx:ASPxHyperLink ID="ASPxHyperLink2" runat="server" Text="Manufacturers"
                            NavigateUrl="~/Configuration/Manufacturers.aspx" >
                        </dx:ASPxHyperLink>
                    </td>
                    <td>
                        <dx:ASPxImage ID="ASPxImage3" runat="server" ImageUrl="~/images/icon_wizard_32px.gif" >
                        </dx:ASPxImage>
                        <dx:ASPxHyperLink ID="ASPxHyperLink3" runat="server" Text="Employees"
                            NavigateUrl="~/Configuration/Employees.aspx" >
                        </dx:ASPxHyperLink>
                    </td>
                </tr>
            </table>
        </dx:PanelContent>
    </PanelCollection>
</dx:ASPxRoundPanel>
