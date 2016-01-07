<%@ Control Language="C#" Inherits="DNNSmart.EffectCollection.License" AutoEventWireup="true" Codebehind="License.ascx.cs" %>
<table style="background-color: #FFFFFF" width="500px" class="dnnFormItem">
    <tr>
        <td colspan="2">
            <span class="Normal"><strong>Note: </strong>
                <br />
                You can send an e-mail to <a style="color: Red" href="mailto:dnnsmart@gmail.com">dnnsmart@gmail.com</a>
                and tell us your invoice number. Then enter your Invoice Number in following Textbox
                and click "Activate" button. After that, module will become activated within 24 hours
                automatically.<br />
            </span>
        </td>
    </tr>
    <tr>
        <td style="width: 120px">
            <asp:Label ID="lblInvoiceNumber" runat="server" CssClass="SubHead" Text="Invoice Number:"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtInvoiceNumber" runat="server" CssClass="NormalTextBox" Width="200px"></asp:TextBox>
            <asp:Button ID="lbActive" runat="server" CssClass="CommandButton" OnClick="lbActive_Click">
            </asp:Button>
             <asp:Button ID="lbClear" runat="server" CssClass="CommandButton" Text="Clear" OnClick="lbClear_Click">
            </asp:Button>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="lblCurrentStatus" runat="server" CssClass="SubHead" Text="Current Status:"></asp:Label>
        </td>
        <td>
            <asp:Literal ID="lblCurrentStatusShow" runat="server"></asp:Literal>
        </td>
    </tr>
</table>
