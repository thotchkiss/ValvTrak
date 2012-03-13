<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Login.ascx.cs" Inherits="DataSprings.SkinObject_jQueryLogin.Login" %>
<%@ Register Src="LoginControl.ascx" TagName="LoginControl" TagPrefix="uc1" %>
<%@ Register Src="LoginUser.ascx" TagName="LoginUser" TagPrefix="uc2" %>
<asp:LinkButton ID="cmdLogin" Text="Login" runat="server" CssClass="signin" CausesValidation="false"
    OnClick="cmdLogin_Click"></asp:LinkButton>
<div id="signin_menu">
    <div id="signin">
        <asp:Panel ID="pnlMain" runat="server">
        </asp:Panel>
    </div>
</div>
