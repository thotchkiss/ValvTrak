﻿<%@ control language="C#" autoeventwireup="true" inherits="Rawson.Admin.AdminHome, App_Web_oyowb11b" enabletheming="true" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v12.1"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.1"
    Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dx" %>

<%@ Register assembly="DevExpress.Web.v12.1" namespace="DevExpress.Web.ASPxPanel" tagprefix="dx" %>


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