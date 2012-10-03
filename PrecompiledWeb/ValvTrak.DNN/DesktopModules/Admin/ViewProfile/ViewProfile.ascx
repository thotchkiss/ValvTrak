<%@ control language="vb" autoeventwireup="false" explicit="True" inherits="DotNetNuke.Modules.Admin.Users.ViewProfile, App_Web_ro0i45vf" %>
<%@ Register Assembly="DotNetNuke" Namespace="DotNetNuke.UI.WebControls" TagPrefix="dnn" %>

<asp:literal id="ProfileOutput" runat="server" />
<asp:Label id="lblNoProperties" runat="server" resourcekey="NoProperties" Visible="false" />
<dnn:CommandButton id="cmdEdit" runat="server" resourcekey="Edit" imageurl="~/images/edit.gif" />