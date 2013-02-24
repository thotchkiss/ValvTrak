<%@ Control Language="C#" AutoEventWireup="True" CodeBehind="LoginControl.ascx.cs"
    Inherits="DataSprings.SkinObject_jQueryLogin.LoginControl" %>
<%@ Register TagPrefix="dnn" Assembly="DotNetNuke" Namespace="DotNetNuke.UI.WebControls" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<div style="white-space: nowrap">
    <p>
        <dnn:Label ID="plUsername" ControlName="txtUsername" Text="User Name" runat="server"
            ResourceKey="plUsername" />
        <asp:TextBox ID="txtUsername" CssClass="loginText" Columns="9" Width="150" runat="server" />
    </p>
    <p>
        <dnn:Label ID="plPassword" ControlName="txtPassword" runat="server" Text="Password"
            ResourceKey="plPassword" />
        <asp:TextBox ID="txtPassword" Columns="9" CssClass="loginText"  Width="150" TextMode="Password" runat="server" />
    </p>
    <p id="rowVerification1" runat="server" visible="false">
        <dnn:Label ID="plVerification" ControlName="txtVerification" runat="server" />
        <asp:TextBox ID="txtVerification" Columns="9" CssClass="loginText" Width="150" runat="server" />
    </p>
    <p id="trCaptcha1" runat="server">
        &nbsp;<dnn:Label ID="plCaptcha" ControlName="ctlCaptcha" runat="server" ResourceKey="Captcha" />
        <dnn:CaptchaControl ID="ctlCaptcha" TextBoxStyle-Width="150" CaptchaWidth="130" CaptchaHeight="40"
            CssClass="Normal" runat="server" ErrorStyle-CssClass="NormalRed" TextBoxStyle-CssClass="NormalTextBox" />
    </p>
    <p class="remember">
        <asp:Button ID="cmdLogin" resourcekey="cmdLogin" CssClass="signin_submit" OnClick="cmdLogin_Click" runat="server" />
    </p>
</div>
