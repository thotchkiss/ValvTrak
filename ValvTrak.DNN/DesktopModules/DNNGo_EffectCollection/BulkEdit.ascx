<%@ Control Language="C#" Inherits="DNNSmart.EffectCollection.BulkEdit"
    AutoEventWireup="true" Codebehind="BulkEdit.ascx.cs" %>
<div class="dnnFormItem">
    <asp:DataList ID="dlBulkEdit" runat="server" OnItemDataBound="dlBulkEdit_ItemDataBound"
        Width="620px" RepeatDirection="Horizontal" RepeatColumns="3" CellPadding="5"
        CellSpacing="2">
        <ItemStyle BorderWidth="1" BorderColor="Gray" />
        <ItemTemplate>
            <asp:TextBox ID="litID" runat="server" Visible="false"></asp:TextBox>
            <table width="200px">
                <tr>
                    <td>
                        <asp:Label ID="lblTitle" runat="server" CssClass="SubHead" resourcekey="lblTitle"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="txtTitle" runat="server" CssClass="NormalTextBox" Width="100%"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td valign="top">
                        <asp:Label ID="lblDescription" runat="server" CssClass="SubHead" resourcekey="lblDescription"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="txtDescription" runat="server" CssClass="NormalTextBox" Width="100%"
                            TextMode="MultiLine" Height="100px"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:DataList>
    <center>
        <asp:LinkButton ID="lbSave" runat="server" OnClick="lbSave_Click">
            <asp:Image ID="Image1" runat="server" ImageUrl="~/images/save.gif" /><asp:Label ID="lblSave"
                runat="server" resourcekey="lblSave" CssClass="SubHead"></asp:Label></asp:LinkButton>
        &nbsp;
        <asp:LinkButton ID="lbCancel" runat="server" OnClick="lbCancel_Click">
            <asp:Image ID="Image2" runat="server" ImageUrl="~/images/action_export.gif" /><asp:Label
                ID="Label1" runat="server" resourcekey="lblCancel" CssClass="SubHead"></asp:Label></asp:LinkButton>
    </center>
</div>
