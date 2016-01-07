<%@ Control Language="C#" Inherits="DNNSmart.EffectCollection.InstallTheme"
    AutoEventWireup="true" Codebehind="InstallTheme.ascx.cs" %>
<table>
    <tr>
        <td>
            <span class="Normal"><strong>Note: </strong> If you want to upload new theme, you can't drag in the file into exported zip file
                directly. You need to unzip the exported zip file, then repack it and upload.</span>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="lblExplanation" runat="server" CssClass="SubHead"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            <asp:FileUpload ID="fuInstallSkin" runat="server" />
            &nbsp;
            <asp:LinkButton ID="lbUpload" runat="server" OnClick="lbUpload_Click">
                <asp:Image ID="imgExportSkin" runat="server" ImageUrl="~/images/FileManager/ToolBarUploadEnabled.gif" /><asp:Label
                    ID="lblExportSkin" runat="server" resourcekey="lbllInstallEffect" CssClass="SubHead"></asp:Label></asp:LinkButton>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="lblMessage" runat="server" CssClass="Normal" ForeColor="red"></asp:Label>
        </td>
    </tr>
</table>
