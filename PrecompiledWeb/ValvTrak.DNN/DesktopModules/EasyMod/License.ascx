<%@ Control language="vb" Inherits="DrNuke.EasyMod.EMLicense" AutoEventWireup="false" Explicit="True" Codebehind="License.ascx.vb" %>

<div id="EMContainerMain"> 

<asp:Panel ID="pnlMessage" runat="server">
<div id="EMMessage">
    <table cellpadding="0" cellspacing="0" border="0">
    <tr><td><asp:Image ID="imgMessage" runat="server" /></td><td><asp:Label ID="lblMessage" runat="server" Text="" CssClass="normal"></asp:Label></td></tr>
    </table>
</div>
</asp:Panel>
<div id="EMContainerLicense">
    <p>Please enter your license key below. If you wish to obtain a license key or have any questions about licensing, please email <a href="mailto:license@drnuke.co.uk">license@drnuke.co.uk</a>.</p>    
    <div class="note"><asp:Label ID="phLicensed" runat="server" CssClass="SubHead">Licensed For</asp:Label></div><div class="floatleft"><asp:Label ID="lblLicensed" runat="server" Text=""></asp:Label></div>
    <div class="clear"></div>
    <div class="note"><asp:label id="plServer" runat="server" CssClass="SubHead">Server Name</asp:label></div><div class="floatleft"><asp:Label ID="lblServer" runat="server" Text="Label"></asp:Label></div>
    <div class="clear"></div> 
    <div class="note"><asp:label id="plPortal" runat="server" CssClass="SubHead">Portal Name</asp:label></div><div class="floatleft"><asp:Label ID="lblPortal" runat="server" Text="Label"></asp:Label></div>
    <div class="clear"></div> 
    <div class="note"><asp:label id="plKey" runat="server" CssClass="SubHead">License Key</asp:label></div><div class="floatleft"><asp:TextBox id="txtKey" runat="server" TextMode="MultiLine" style="height:150px;width:350px;" CssClass="Normal"></asp:TextBox><br /><asp:Label ID="lblKeyResponse" runat="server"></asp:Label></div>
    <div class="clear"></div> 
    <div style="float:left;"><asp:ImageButton id="btnCancel" AlternateText="Cancel" runat="server" CausesValidation="false" OnClick="btnCancel_Click" CssClass="btn-cancel"></asp:ImageButton></div>
    <div style="float:right;"><asp:ImageButton id="btnContinue" AlternateText="Continue" runat="server" OnClick="btnContinue_Click" CssClass="btn-continue"></asp:ImageButton></div>
    <div style="float:right;"><asp:ImageButton id="btnUpdate" AlternateText="Update" runat="server" OnClick="btnUpdate_Click" CssClass="btn-update"></asp:ImageButton></div>
</div>
</div>
