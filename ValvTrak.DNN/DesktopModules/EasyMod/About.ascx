<%@ Control language="vb" Inherits="DrNuke.EasyMod.EMAbout" AutoEventWireup="false" Explicit="True" Codebehind="About.ascx.vb" %>
<div id="EMContainerMain">
<fieldset>
<legend><span class="legend">DrNuke EasyMod 1.00.05</span></legend>
<div id="EMContainerAbout">
    <br />
    <div class="note"><asp:Label ID="phCopyright" runat="server" CssClass="SubHead">&copy; Copyright 2009 DrNuke Ltd. All rights reserved.</asp:Label></div>
    <div class="clear"></div>
    <div class="note"><asp:Label ID="phLicensedto" runat="server" CssClass="SubHead">This product is licensed to</asp:Label></div>
    <div class="clear"></div>
    <div class="note"><asp:Label ID="phEmail" runat="server" CssClass="SubHead">Email: </asp:Label></div><div class="floatleft"><asp:Label ID="lblEmail" runat="server" Text=""></asp:Label></div>
    <div class="clear"></div>
    <div class="note"><asp:Label ID="phLicensed" runat="server" CssClass="SubHead">Licensed For: </asp:Label></div><div class="floatleft"><asp:Label ID="lblLicensed" runat="server" Text=""></asp:Label></div>
    <div class="clear"></div>
    <p><strong>Warning:</strong> This computer program is protected by copyright law and international treaties. Unauthorized reproduction or distribution of this program, or any portion of it, may result in severe civil and criminal penalties, and will be prosecuted under the maximum extent possible under law.</p>
    <asp:ImageButton ID="btnContinue" runat="server" AlternateText="Continue" CssClass="btn-continue" />
</div>
</fieldset>
</div>