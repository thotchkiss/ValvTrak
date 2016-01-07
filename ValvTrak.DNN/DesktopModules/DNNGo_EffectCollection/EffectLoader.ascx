<%@ Control Language="C#" Inherits="DNNSmart.EffectCollection.EffectLoader"
    AutoEventWireup="true" Codebehind="EffectLoader.ascx.cs" %>
<asp:Panel ID="plLicense" runat="server">
    <asp:PlaceHolder ID="phEffectLoader" runat="server"></asp:PlaceHolder>
    <asp:Label ID="lblMessage" runat="server" CssClass="SubHead" resourcekey="lblMessage"
        Visible="false" ForeColor="Red"></asp:Label>
</asp:Panel>
<asp:Literal ID="litLicense" runat="server"></asp:Literal>