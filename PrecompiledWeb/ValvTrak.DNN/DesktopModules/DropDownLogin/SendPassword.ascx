<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SendPassword.ascx.cs"
    Inherits="DataSprings.SkinObject_jQueryLogin.SendPassword" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnn" Assembly="DotNetNuke" Namespace="DotNetNuke.UI.WebControls" %>
<div style="text-align: left;">
    <asp:Label ID="lblHelp" runat="Server" class="normal" />
</div>
<br />
<table id="tblSendPassword" runat="server" cellspacing="0" cellpadding="3" border="0"
    summary="SignIn Design Table">
    <tr>
        <td width="160" class="SubHead">
            <asp:Label ID="lblMessage" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td width="160" class="SubHead">
            <dnn:Label ID="plUsername" ControlName="txtUsername" runat="server" Text="UserName:">
            </dnn:Label>
        </td>
    </tr>
    <tr>
        <td width="160">
            <asp:TextBox ID="txtUsername" Columns="9" Width="130" CssClass="NormalTextBox" runat="server" />
        </td>
    </tr>
    <tr id="rowEmailLabel" runat="Server">
        <td width="160" class="SubHead">
            <dnn:Label ID="plEmail" ControlName="txtEmail" runat="server" Text="Email Address:">
            </dnn:Label>
        </td>
    </tr>
    <tr id="rowEmailText" runat="Server">
        <td width="160">
            <asp:TextBox ID="txtEmail" Columns="9" Width="130" CssClass="NormalTextBox" runat="server" />
        </td>
    </tr>
    <tr id="trCaptcha1" runat="server">
        <td colspan="2" class="SubHead">
            <dnn:Label ID="plCaptcha" ControlName="ctlCaptcha" runat="server" Text="Security Code:">
            </dnn:Label>
        </td>
    </tr>
    <tr id="trCaptcha2" runat="server">
        <td colspan="2">
            <dnn:CaptchaControl ID="ctlCaptcha" CaptchaWidth="130" TextBoxStyle-Width="130" CaptchaHeight="40"
                CssClass="Normal" runat="server" ErrorStyle-CssClass="NormalRed" />
        </td>
    </tr>
    <tr>
        <td>
            <table id="tblQA" runat="server" visible="false">
                <tr height="25">
                    <td class="SubHead">
                        <dnn:Label ID="plQuestion" runat="server" ControlName="lblQuestion" Text="Password Question:">
                        </dnn:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblQuestion" runat="server" CssClass="Normal"></asp:Label>
                    </td>
                </tr>
                <tr height="25">
                    <td class="SubHead" width="175">
                        <dnn:Label ID="plAnswer" runat="server" ControlName="txtAnswer" Text="Password Answer:">
                        </dnn:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="txtAnswer" runat="server" CssClass="NormalTextBox" size="25" MaxLength="20"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td nowrap="nowrap">
            <asp:LinkButton ID="cmdSendPassword" OnClick="cmdSendPassword_Click" CssClass="CommandButton"
                runat="server" />
            &nbsp;
            <asp:LinkButton ID="cmdLogin" OnClick="cmdLogin_Click" runat="server" ResourceKey="cmdLogin"
                ImageUrl="~/images/rt.gif" CausesValidation="False" CssClass="CommandButton"
                Visible="false" />
        </td>
    </tr>
</table>
