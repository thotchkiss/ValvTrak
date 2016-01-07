<%@ Control Language="C#" Inherits="DNNSmart.EffectCollection.EditCategory"
    AutoEventWireup="true" Codebehind="EditCategory.ascx.cs" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="TextEditor" Src="~/controls/TextEditor.ascx" %>
<%@ Register TagPrefix="dnn" TagName="URL" Src="~/controls/URLControl.ascx" %>
<table cellspacing="0" cellpadding="2" border="0"  class="dnnFormItem">
    <tr>
        <td class="SubHead" width="130px">
            <dnn:Label ID="lblCategoryName" runat="server" ResourceKey="lblCategoryName"></dnn:Label>
        </td>
        <td>
            <asp:TextBox ID="txtCategoryName" runat="server" CssClass="NormalTextBox" Width="200px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvCategoryName" resourcekey="rfvCategoryName.ErrorMessage" ControlToValidate="txtCategoryName"
                CssClass="NormalRed" Display="Dynamic" runat="server" />
        </td>
    </tr>   
    <tr>
        <td class="SubHead">
            <dnn:Label ID="lblOrder" runat="server" ResourceKey="lblOrder"></dnn:Label>
        </td>
        <td>
            <asp:TextBox ID="txtOrder" runat="server" CssClass="NormalTextBox" Width="30px"></asp:TextBox>
        </td>
    </tr>
</table>
<p>
    <asp:LinkButton CssClass="CommandButton" ID="cmdUpdate" OnClick="cmdUpdate_Click"
        resourcekey="cmdUpdate" runat="server" BorderStyle="none" Text="Update"></asp:LinkButton>&nbsp;
    <asp:LinkButton CssClass="CommandButton" ID="cmdCancel" OnClick="cmdCancel_Click"
        resourcekey="cmdCancel" runat="server" BorderStyle="none" Text="Cancel" CausesValidation="False"></asp:LinkButton>&nbsp;
    <asp:LinkButton CssClass="CommandButton" ID="cmdDelete" OnClick="cmdDelete_Click"
        resourcekey="cmdDelete" runat="server" BorderStyle="none" Text="Delete" CausesValidation="False"></asp:LinkButton>&nbsp;
</p>
