<%@ Control Language="C#" Inherits="DNNSmart.EffectCollection.AvailableEffect"
    AutoEventWireup="true" Codebehind="AvailableEffect.ascx.cs" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<table id="tdEffect" runat="server">
    <tr>
        <td>
        </td>
    </tr>
    <tr>
        <td>
            <asp:GridView ID="gvCategory" runat="server" AutoGenerateColumns="False" OnRowDataBound="gvCategory_RowDataBound"
                BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px"
                CellPadding="4" ForeColor="Black" GridLines="Horizontal">
                <RowStyle CssClass="Normal EC_Item" />
                <Columns>
                    <asp:TemplateField HeaderText="Preview" HeaderStyle-ForeColor="White" ItemStyle-Width="200px">
                        <ItemTemplate>
                            <asp:Image ID="imgImage" runat="server" />
                        </ItemTemplate>
                        <HeaderStyle ForeColor="White"></HeaderStyle>
                        <ItemStyle Width="200px"></ItemStyle>
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="Effect Name" DataField="EffectName" HeaderStyle-ForeColor="White" ItemStyle-VerticalAlign="Top">
                        <HeaderStyle ForeColor="White"></HeaderStyle>
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Action" HeaderStyle-ForeColor="White"  ItemStyle-VerticalAlign="Top">
                        <ItemTemplate>
                            <table>
                                <tr style="padding: 5px">
                                    <td>
                                        <asp:LinkButton ID="lbApply" runat="server" OnCommand="lbApply_Command">
                                            <asp:Image ID="imgApply" runat="server" ImageUrl="~/images/save.gif" /><asp:Label
                                                ID="lblApply" runat="server" CssClass="SubHead"></asp:Label></asp:LinkButton>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:LinkButton ID="lbExport" runat="server" OnCommand="lbExport_Command">
                                            <asp:Image ID="imgExport" runat="server" ImageUrl="~/images/action_export.gif" /><asp:Label
                                                ID="lblExport" runat="server" resourcekey="lblExport" CssClass="SubHead"></asp:Label></asp:LinkButton>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:LinkButton ID="lbDelete" runat="server" OnCommand="lbDelete_Command">
                                            <asp:Image ID="imgDelete" runat="server" ImageUrl="~/images/action_delete.gif" /><asp:Label
                                                ID="lblDelete" runat="server" resourcekey="lblDelete" CssClass="SubHead"></asp:Label></asp:LinkButton>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                        <HeaderStyle ForeColor="White"></HeaderStyle>
                    </asp:TemplateField>
                </Columns>
                <PagerSettings Visible="False" />
                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
            </asp:GridView>
            <asp:Label ID="lblEffectMessage" runat="server" CssClass="SubHead" ForeColor="Red"
                resourcekey="lblEffectMessage"></asp:Label>
        </td>
    </tr>
</table>
