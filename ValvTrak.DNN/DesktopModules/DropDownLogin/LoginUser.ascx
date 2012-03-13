<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LoginUser.ascx.cs" Inherits="DataSprings.SkinObject_jQueryLogin.LoginUser" %>
<%@ Register Assembly="DotNetNuke.WebControls" Namespace="DotNetNuke.UI.WebControls"
    TagPrefix="DNN" %>
<%@ Register TagPrefix="dnn" Assembly="DotNetNuke" Namespace="DotNetNuke.UI.WebControls" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register Src="SendPassword.ascx" TagName="SendPassword" TagPrefix="uc1" %>
<asp:Panel ID="pnlLogin" runat="server" Visible="false">
    <table cellspacing="0" cellpadding="0" border="0" summary="SignIn Design Table" width="160">
        <tr id="rowError" runat="server" visible="false">
            <td>
                <asp:Label ID="lblError" runat="server" CssClass="loginError" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2" class="SubHead" align="center">
                <dnn:DNNTabStrip ID="tsLogin" runat="server" TabRenderMode="All" CssTabContainer="LoginTabGroup"
                    CssContentContainer="LoginContainerGroup" DefaultContainerCssClass="" DefaultLabel-CssClass=""
                    DefaultLabel-CssClassHover="" DefaultLabel-CssClassSelected="" visible="false" />
                <asp:Panel ID="pnlLoginContainer" runat="server" Style="text-align: left" CssClass="LoginPanel"
                    Visible="false" />
            </td>
        </tr>
        <tr>
            <td colspan="2" align="left">
                <asp:CheckBox ID="chkCookie" class="Normal" resourcekey="Remember" Text="Remember Login"
                    runat="server" />
            </td>
        </tr>
        <tr style="height: 5px;">
            <td colspan="2">
            </td>
        </tr>
        <tr>
            <td id="tdRegister" runat="server" colspan="2" align="left">
                <asp:LinkButton ID="cmdRegister" resourcekey="cmdRegister" CssClass="CommandButton"
                    Text="Register" runat="server" OnClick="cmdRegister_Click" />
            </td>
        </tr>
        <tr>
            <td id="tdPassword" runat="server" colspan="2" align="left">
                <asp:LinkButton ID="cmdPassword" resourcekey="cmdForgotPassword" CssClass="CommandButton"
                    Text="Forgot Password?" runat="server" OnClick="cmdPassword_Click" />
            </td>
        </tr>
        <tr>
            <td colspan="2" align="left">
                <asp:Label ID="lblLogin" CssClass="Normal" runat="server" />
            </td>
        </tr>
    </table>
</asp:Panel>
<asp:Panel ID="pnlPassword" runat="server" Visible="false">
    <uc1:SendPassword ID="SendPassword1" runat="server" />
</asp:Panel>
