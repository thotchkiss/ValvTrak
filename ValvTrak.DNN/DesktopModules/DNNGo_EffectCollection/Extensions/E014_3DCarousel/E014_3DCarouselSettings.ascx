<%@ Control Language="C#" AutoEventWireup="true"
    Inherits="DNNSmart.EffectCollection.E014_3DCarouselSettings" Codebehind="E014_3DCarouselSettings.ascx.cs" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<table>
    <tr>
        <td class="SubHead" style="width: 150px">
            <dnn:Label ID="lblWidth" runat="server" ControlName="lblWidth"></dnn:Label>
        </td>
        <td>
            <asp:TextBox ID="txtWidth" runat="server" CssClass="NormalTextBox" Width="50"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="SubHead">
            <dnn:Label ID="lblHeight" runat="server" ControlName="lblHeight"></dnn:Label>
        </td>
        <td>
            <asp:TextBox ID="txtHeight" runat="server" CssClass="NormalTextBox" Width="50"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="SubHead">
            <dnn:Label ID="lblxPosition" runat="server" ControlName="lblxPosition"></dnn:Label>
        </td>
        <td>
            <asp:TextBox ID="txtxPosition" runat="server" CssClass="NormalTextBox" Width="50"></asp:TextBox>&nbsp;<asp:RegularExpressionValidator
                ID="revWidth" ValidationExpression="^[1-9]\d*|0$" CssClass="SubHead" runat="server"
                ControlToValidate="txtxPosition" resourcekey="PositiveInteger.ErrorMessage" ValidationGroup="Update"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td class="SubHead">
            <dnn:Label ID="lblyPosition" runat="server" ControlName="lblyPosition"></dnn:Label>
        </td>
        <td>
            <asp:TextBox ID="txtyPosition" runat="server" CssClass="NormalTextBox" Width="50"></asp:TextBox>&nbsp;<asp:RegularExpressionValidator
                ID="RegularExpressionValidator1" ValidationExpression="^[1-9]\d*|0$" CssClass="SubHead"
                runat="server" ControlToValidate="txtyPosition" resourcekey="PositiveInteger.ErrorMessage"
                ValidationGroup="Update"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td class="SubHead">
            <dnn:Label ID="lblMinScale" runat="server" ControlName="lblMinScale"></dnn:Label>
        </td>
        <td>
            <asp:TextBox ID="txtMinScale" runat="server" CssClass="NormalTextBox" Width="50"></asp:TextBox>&nbsp;<span class="Normal">You can fill 0 to 1</span>
        </td>
    </tr>
    <tr>
        <td class="SubHead">
            <dnn:Label ID="lblReflectionHeight" runat="server" ControlName="lblReflectionHeight">
            </dnn:Label>
        </td>
        <td>
            <asp:TextBox ID="txtReflectionHeight" runat="server" CssClass="NormalTextBox" Width="50"></asp:TextBox>&nbsp;<asp:RegularExpressionValidator
                ID="RegularExpressionValidator2" ValidationExpression="^[1-9]\d*|0$" CssClass="SubHead"
                runat="server" ControlToValidate="txtReflectionHeight" resourcekey="PositiveInteger.ErrorMessage"
                ValidationGroup="Update"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td class="SubHead">
            <dnn:Label ID="lblReflectionGap" runat="server" ControlName="lblReflectionGap"></dnn:Label>
        </td>
        <td>
            <asp:TextBox ID="txtReflectionGap" runat="server" CssClass="NormalTextBox" Width="50"></asp:TextBox>&nbsp;<asp:RegularExpressionValidator
                ID="RegularExpressionValidator3" ValidationExpression="^[1-9]\d*|0$" CssClass="SubHead"
                runat="server" ControlToValidate="txtReflectionGap" resourcekey="PositiveInteger.ErrorMessage"
                ValidationGroup="Update"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td class="SubHead">
            <dnn:Label ID="lblReflectionOpacity" runat="server" ControlName="lblReflectionOpacity">
            </dnn:Label>
        </td>
        <td>
            <asp:TextBox ID="txtReflectionOpacity" runat="server" CssClass="NormalTextBox" Width="50"></asp:TextBox>&nbsp;<span class="Normal">You can fill 0 to 1</span>
        </td>
    </tr>
    <tr>
        <td class="SubHead">
            <dnn:Label ID="lblxRadius" runat="server" ControlName="lblxRadius"></dnn:Label>
        </td>
        <td>
            <asp:TextBox ID="txtxRadius" runat="server" CssClass="NormalTextBox" Width="50"></asp:TextBox>&nbsp;<span class="Normal">If you fill blank, xRadius value is "width of container" / 2.3</span>
        </td>
    </tr>
    <tr>
        <td class="SubHead">
            <dnn:Label ID="lblyRadius" runat="server" ControlName="lblyRadius"></dnn:Label>
        </td>
        <td>
            <asp:TextBox ID="txtyRadius" runat="server" CssClass="NormalTextBox" Width="50"></asp:TextBox>&nbsp;<span class="Normal">If you fill blank, xRadius value is "height of container" / 6</span>
        </td>
    </tr>
    <tr>
        <td class="SubHead">
            <dnn:Label ID="lblSpeed" runat="server" ControlName="lblSpeed"></dnn:Label>
        </td>
        <td>
            <asp:TextBox ID="txtSpeed" runat="server" CssClass="NormalTextBox" Width="50"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="SubHead">
            <dnn:Label ID="lblAutoRotate" runat="server" ControlName="lblAutoRotate"></dnn:Label>
        </td>
        <td>
            <asp:RadioButtonList ID="rblAutoRotate" runat="server" CssClass="Normal" RepeatDirection="Horizontal">
                <asp:ListItem Value="no">no</asp:ListItem>
                <asp:ListItem Value="left">left</asp:ListItem>
                <asp:ListItem Value="right">right</asp:ListItem>
            </asp:RadioButtonList>
        </td>
    </tr>
    <tr>
        <td class="SubHead">
            <dnn:Label ID="lblAutoRotateDelay" runat="server" ControlName="lblAutoRotateDelay">
            </dnn:Label>
        </td>
        <td>
            <asp:TextBox ID="txtAutoRotateDelay" runat="server" CssClass="NormalTextBox" Width="50"></asp:TextBox><span
                class="Normal">ms</span>
        </td>
    </tr>
    <tr>
        <td class="SubHead">
            <dnn:Label ID="lblMouseWheel" runat="server" ControlName="lblMouseWheel"></dnn:Label>
        </td>
        <td>
            <asp:CheckBox ID="cbMouseWheel" runat="server" />
        </td>
    </tr>
</table>
