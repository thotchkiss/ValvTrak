<%@ Control Language="C#" Inherits="DNNSmart.EffectCollection.ManageCategory"
    AutoEventWireup="true" Codebehind="ManageCategory.ascx.cs" %>
<table>
    <tr>
        <td>
            <asp:LinkButton ID="lbAddNew" runat="server" OnClick="lbAddNew_Click">
                <asp:Image ID="imgAddNew" runat="server" ImageUrl="~/images/add.gif" /><asp:Label
                    ID="lblAddNew" runat="server" resourcekey="lblAddNew" CssClass="SubHead" Style="padding-left: 2px"></asp:Label></asp:LinkButton>
            <asp:LinkButton ID="lbBulkDelete" runat="server" OnClick="lbBulkDelete_Click">
                <asp:Image ID="imgBulkDelete" runat="server" ImageUrl="~/images/delete.gif" /><asp:Label
                    ID="lblBulkDelete" runat="server" resourcekey="lblBulkDelete" CssClass="SubHead"
                    Style="padding-left: 2px"></asp:Label></asp:LinkButton>
        </td>
    </tr>
    <tr>
        <td colspan="2" align="center">
            <asp:Label ID="lblMessage" runat="server" CssClass="SubHead" ForeColor="Red"></asp:Label>
        </td>
    </tr>
</table>
<asp:GridView ID="gvCategory" runat="server" AutoGenerateColumns="False" OnRowDataBound="gvCategory_RowDataBound"
    BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px"
    CellPadding="4" ForeColor="Black" GridLines="Horizontal">
    <RowStyle CssClass="Normal EC_Item" />
    <Columns>
        <asp:BoundField HeaderText="CategoryName" DataField="Name" HeaderStyle-ForeColor="White"
            ItemStyle-Width="100px">
            <HeaderStyle HorizontalAlign="Left" ForeColor="White"></HeaderStyle>
            <ItemStyle Width="100px" VerticalAlign="Top"></ItemStyle>
        </asp:BoundField>
        <asp:BoundField HeaderText="Order" DataField="Order" HeaderStyle-ForeColor="White"
            ItemStyle-Width="100px">
            <HeaderStyle HorizontalAlign="Left" ForeColor="White"></HeaderStyle>
            <ItemStyle Width="100px" VerticalAlign="Top"></ItemStyle>
        </asp:BoundField>
        <asp:TemplateField HeaderText="Action" HeaderStyle-ForeColor="White">
            <ItemStyle Wrap="false" VerticalAlign="Top" />
            <ItemTemplate>
                <table>
                    <tr>
                        <td style="width: 17px">
                            <asp:ImageButton ID="imbDown" runat="server" ImageUrl="~/images/action_down.gif"
                                OnClick="imbDown_Click" />
                        </td>
                        <td style="width: 17px">
                            <asp:ImageButton ID="imbUp" runat="server" ImageUrl="~/images/action_up.gif" OnClick="imbUp_Click" />
                        </td>
                        <td style="width: 17px">
                            <asp:ImageButton ID="imbEdit" runat="server" ToolTip="Edit" OnCommand="imbEdit_Command"
                                ImageUrl="~/images/edit.gif" />
                        </td>
                        <td style="width: 17px">
                            <asp:ImageButton ID="imbDelete" runat="server" ToolTip="Delete" OnCommand="imbDelete_Command"
                                ImageUrl="~/images/delete.gif" />
                        </td>
                        <td style="width: 17px">
                            <asp:CheckBox ID="cbSelect" runat="server" />
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
            <HeaderStyle HorizontalAlign="Left" ForeColor="White"></HeaderStyle>
        </asp:TemplateField>
    </Columns>
    <PagerSettings Visible="False" />
    <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
    <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
    <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
    <HeaderStyle HorizontalAlign="Left" BackColor="#333333" Font-Bold="True" ForeColor="White" />
</asp:GridView>
