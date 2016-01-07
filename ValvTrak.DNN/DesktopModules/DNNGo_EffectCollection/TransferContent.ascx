<%@ Control Language="C#" Inherits="DNNSmart.EffectCollection.TransferContent" AutoEventWireup="true" Codebehind="TransferContent.ascx.cs" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="Url" Src="~/controls/urlcontrol.ascx" %>
<table>
    <tr>
        <td class="SubHead">
            <dnn:Label ID="lblTransferType" runat="server" ResourceKey="lblTransferType" />
        </td>
        <td>
            <asp:RadioButtonList ID="rblTransferType" runat="server" CssClass="Normal" AutoPostBack="true"
                RepeatDirection="Horizontal" OnSelectedIndexChanged="rblTransferType_SelectedIndexChanged">
                <asp:ListItem Value="1" resourcekey="ExportToXmlFile"></asp:ListItem>
                <asp:ListItem Value="2" resourcekey="ImportFromXmlFile"></asp:ListItem>
            </asp:RadioButtonList>
        </td>
    </tr>
    <asp:Panel ID="plValue1" runat="server">
        <tr>
            <td colspan="2">
                <table>
                    <tr>
                        <td class="SubHead" valign="top">
                            <asp:Label ID="lblExportNote" runat="server" CssClass="Normal" resourcekey="lblExportNote" ForeColor="Red"></asp:Label><br />
                            <br />
                            <asp:Button ID="btnClickToExport" runat="server" CssClass="CommandButton" resourcekey="btnClickToExport"
                                OnClick="btnClickToExport_Click" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </asp:Panel>
    <asp:Panel ID="plValue2" runat="server">
        <tr>
            <td colspan="2">
                <table>
                    <tr>
                        <td class="SubHead" valign="top">
                            <asp:Label ID="lblImportNote" runat="server" CssClass="Normal" resourcekey="lblImportNote" ForeColor="Red"></asp:Label><br />
                            <br />
                            <asp:FileUpload ID="fuImport" runat="server" />
                            <asp:Button ID="btnImport" runat="server" CssClass="CommandButton" resourcekey="btnImport"
                                 OnClick="btnImport_Click" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </asp:Panel>
</table>
<p>
    <asp:Button ID="btnReturn" runat="server" CssClass="CommandButton" resourcekey="btnReturn"
        OnClick="btnReturn_Click" />
    <br />
    <asp:Label ID="lblMessage" runat="server" CssClass="SubHead" resourcekey="lblMessage"
        ForeColor="Red"></asp:Label>
</p>
