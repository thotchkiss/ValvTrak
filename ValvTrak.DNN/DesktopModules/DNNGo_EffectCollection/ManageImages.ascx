<%@ Control Language="C#" Inherits="DNNSmart.EffectCollection.ManageImages"
    AutoEventWireup="true" Codebehind="ManageImages.ascx.cs" %>
<table width="100%">
    <tr>
        <td>
            <asp:LinkButton ID="lbAddNew" runat="server" OnClick="lbAddNew_Click">
                <asp:Image ID="imgAddNew" runat="server" ImageUrl="~/images/add.gif" /><asp:Label
                    ID="lblAddNew" runat="server" resourcekey="lblAddNew" CssClass="SubHead" Style="padding-left: 2px"></asp:Label></asp:LinkButton>
            &nbsp;
            <asp:LinkButton ID="lbBulkUploadImages" runat="server" OnClick="lbBulkUploadImages_Click">
                <asp:Image ID="imgBulkUploadImages" runat="server" ImageUrl="~/images/FileManager/ToolBarUploadEnabled.gif" /><asp:Label
                    ID="lblBulkUploadImages" runat="server" resourcekey="lblBulkUploadImages" CssClass="SubHead"
                    Style="padding-left: 2px"></asp:Label></asp:LinkButton>
            &nbsp;
            <asp:LinkButton ID="lbBackup" runat="server" OnClick="lbBackup_Click">
                <asp:Image ID="imgBackup" runat="server" ImageUrl="~/images/restore.gif" /><asp:Label
                    ID="lblBackup" runat="server" resourcekey="lblBackup" CssClass="SubHead" Style="padding-left: 2px"></asp:Label></asp:LinkButton>
            &nbsp;
            <asp:LinkButton ID="lbBulkEdit" runat="server" OnClick="lbBulkEdit_Click">
                <asp:Image ID="imgBulkEdit" runat="server" ImageUrl="~/images/edit.gif" /><asp:Label
                    ID="lblBulkEdit" runat="server" resourcekey="lblBulkEdit" CssClass="SubHead"
                    Style="padding-left: 2px"></asp:Label></asp:LinkButton>
            &nbsp;
            <asp:LinkButton ID="lbBulkDelete" runat="server" OnClick="lbBulkDelete_Click">
                <asp:Image ID="imgBulkDelete" runat="server" ImageUrl="~/images/delete.gif" /><asp:Label
                    ID="lblBulkDelete" runat="server" resourcekey="lblBulkDelete" CssClass="SubHead"
                    Style="padding-left: 2px"></asp:Label></asp:LinkButton>
        </td>
        <td align="right">
            <span class="Normal" style="cursor: pointer" onclick="CheckAll()">
                <asp:Image ID="imgcheckall" runat="server" ImageUrl="~/images/filemanager/DNNExplorer_OK.gif" />check
                all</span>&nbsp;<span class="Normal" style="cursor: pointer" onclick="UnCheckAll()"><asp:Image
                    ID="Image1" runat="server" ImageUrl="~/images/filemanager/DNNExplorer_Cancel.gif" />uncheck
                    all</span>
        </td>
    </tr>
    <tr>
        <td colspan="2" align="center">
            <asp:Label ID="lblMessage" runat="server" CssClass="SubHead" ForeColor="Red"></asp:Label>
        </td>
    </tr>
</table>

<script type="text/javascript" language="javascript">
    function CheckAll() {
        var list = document.getElementById("<%=gvCategory.ClientID %>").getElementsByTagName("input");
        for (var i = 0; i < list.length; i++) {
            list[i].checked = true;
        }
    }
    function UnCheckAll() {
        var list = document.getElementById("<%=gvCategory.ClientID %>").getElementsByTagName("input");
        for (var i = 0; i < list.length; i++) {
            list[i].checked = false;
        }
    }
</script>

<asp:GridView ID="gvCategory" runat="server" AutoGenerateColumns="False" OnRowDataBound="gvCategory_RowDataBound"
    BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px"
    CellPadding="3" ForeColor="Black" GridLines="Vertical">
    <RowStyle CssClass="Normal EC_Item" />
    <Columns>
        <asp:TemplateField HeaderText="Image" HeaderStyle-ForeColor="White">
            <ItemStyle VerticalAlign="Top" />
            <ItemTemplate>
                <asp:Image ID="imgImage" runat="server" />
            </ItemTemplate>
            <HeaderStyle HorizontalAlign="Left" ForeColor="White"></HeaderStyle>
        </asp:TemplateField>
        <asp:BoundField HeaderText="Title" DataField="Title" HeaderStyle-ForeColor="White">
            <HeaderStyle HorizontalAlign="Left" ForeColor="White"></HeaderStyle>
            <ItemStyle Width="70px" VerticalAlign="Top"></ItemStyle>
        </asp:BoundField>
        <asp:TemplateField HeaderText="Desc" HeaderStyle-ForeColor="White">
            <ItemStyle VerticalAlign="Top" Width="200px" />
            <ItemTemplate>
                <asp:Label ID="lblDescription" runat="server" CssClass="Normal"></asp:Label>
            </ItemTemplate>
            <HeaderStyle HorizontalAlign="Left" ForeColor="White"></HeaderStyle>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Order" HeaderStyle-ForeColor="White">
            <ItemStyle VerticalAlign="Top" />
            <ItemTemplate>
                <asp:Label ID="lblOrder" runat="server" CssClass="Normal"></asp:Label>
            </ItemTemplate>
            <HeaderStyle HorizontalAlign="Left" ForeColor="White"></HeaderStyle>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Type" HeaderStyle-ForeColor="White">
            <ItemStyle VerticalAlign="Top" />
            <ItemTemplate>
                <asp:Label ID="lblType" runat="server" CssClass="Normal"></asp:Label>
            </ItemTemplate>
            <HeaderStyle HorizontalAlign="Left" ForeColor="White"></HeaderStyle>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="NewWin" HeaderStyle-ForeColor="White">
            <ItemStyle VerticalAlign="Top" />
            <ItemTemplate>
                <asp:Label ID="lblIsNewWindows" runat="server" CssClass="Normal"></asp:Label>
            </ItemTemplate>
            <HeaderStyle HorizontalAlign="Left" ForeColor="White"></HeaderStyle>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="LinkURL" HeaderStyle-ForeColor="White">
            <ItemStyle VerticalAlign="Top" />
            <ItemTemplate>
                <asp:Label ID="lblLinkUrl" runat="server" CssClass="Normal"></asp:Label>
            </ItemTemplate>
            <HeaderStyle HorizontalAlign="Left" ForeColor="White"></HeaderStyle>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Url" HeaderStyle-ForeColor="White">
            <ItemStyle VerticalAlign="Top" />
            <ItemTemplate>
                <asp:Label ID="lblUrl" runat="server" CssClass="Normal"></asp:Label>
            </ItemTemplate>
            <HeaderStyle HorizontalAlign="Left" ForeColor="White"></HeaderStyle>
        </asp:TemplateField>
        <asp:BoundField HeaderText="DisplayType" DataField="DisplayType" HeaderStyle-ForeColor="White"
            ItemStyle-Width="80px">
            <HeaderStyle HorizontalAlign="Left" ForeColor="White"></HeaderStyle>
            <ItemStyle Width="80px" VerticalAlign="Top"></ItemStyle>
        </asp:BoundField>
        <asp:TemplateField HeaderText="ModuleTitle" HeaderStyle-ForeColor="White">
            <ItemStyle Width="80px" />
            <ItemStyle VerticalAlign="Top" />
            <ItemTemplate>
                <asp:Label ID="lblModuleTitle" runat="server" CssClass="Normal"></asp:Label>
            </ItemTemplate>
            <HeaderStyle HorizontalAlign="Left" ForeColor="White"></HeaderStyle>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Start" HeaderStyle-ForeColor="White">
            <ItemStyle />
            <ItemStyle VerticalAlign="Top" />
            <ItemTemplate>
                <asp:Label ID="lblStartTime" runat="server" CssClass="Normal"></asp:Label>
            </ItemTemplate>
            <HeaderStyle HorizontalAlign="Left" ForeColor="White"></HeaderStyle>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Expired" HeaderStyle-ForeColor="White">
            <ItemStyle />
            <ItemStyle VerticalAlign="Top" />
            <ItemTemplate>
                <asp:Label ID="lblExpiredTime" runat="server" CssClass="Normal"></asp:Label>
            </ItemTemplate>
            <HeaderStyle HorizontalAlign="Left" ForeColor="White"></HeaderStyle>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Active" HeaderStyle-ForeColor="White">
            <ItemStyle Width="55px" />
            <ItemStyle VerticalAlign="Top" />
            <ItemTemplate>
                <asp:Label ID="lblIsActive" runat="server" CssClass="Normal"></asp:Label>
            </ItemTemplate>
            <HeaderStyle HorizontalAlign="Left" ForeColor="White"></HeaderStyle>
        </asp:TemplateField>
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
    <FooterStyle BackColor="#CCCCCC" />
    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
    <HeaderStyle HorizontalAlign="Left" BackColor="Black" Font-Bold="True" 
        ForeColor="White" />
    <AlternatingRowStyle BackColor="#CCCCCC" />
</asp:GridView>
