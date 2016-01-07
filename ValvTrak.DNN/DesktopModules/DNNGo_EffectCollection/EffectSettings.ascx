<%@ Control Language="C#" Inherits="DNNSmart.EffectCollection.EffectSettings"
    AutoEventWireup="true" Codebehind="EffectSettings.ascx.cs" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="SectionHeadControl" Src="~/controls/SectionHeadControl.ascx" %>
<dnn:SectionHeadControl ID="shcCurrentEffectSettings" runat="server" ResourceKey="shcCurrentEffectSettings"
    Section="tdCurrentEffectSettings" CssClass="Head" />
<hr />
<table id="tdCurrentEffectSettings" runat="server">
    <tr>
        <td colspan="2">
            <asp:PlaceHolder ID="phCurrentEffectSettings" runat="server"></asp:PlaceHolder>
        </td>
    </tr>
</table>
<dnn:SectionHeadControl ID="shcCurrentSkinSettings" runat="server" ResourceKey="shcCurrentSkinSettings"
    Section="tdCurrentSkinSettings" CssClass="Head" />
<hr />
<table id="tdCurrentSkinSettings" runat="server">
    <tr>
        <td class="SubHead" style="width: 150px">
            <dnn:Label ID="lblStyleList" runat="server" ResourceKey="lblStyleList" />
        </td>
        <td>
            <asp:DropDownList ID="drpStyleList" runat="server" OnSelectedIndexChanged="drpStyleList_SelectedIndexChanged"
                AutoPostBack="true">
            </asp:DropDownList>  <asp:LinkButton ID="lbExportSkin" runat="server" OnClick="lbExportSkin_Click">
                <asp:Image ID="imgExportSkin" runat="server" ImageUrl="~/images/action_export.gif" /><asp:Label
                    ID="lblExportSkin" runat="server" resourcekey="lblExportSkin" CssClass="SubHead"></asp:Label></asp:LinkButton>
            <asp:LinkButton ID="lbDeleteSkin" runat="server" OnClick="lbDeleteSkin_Click">
                <asp:Image ID="imgDeleteSkin" runat="server" ImageUrl="~/images/delete.gif" /><asp:Label
                    ID="lblDeleteSkin" runat="server" resourcekey="lblDeleteSkin" CssClass="SubHead"></asp:Label></asp:LinkButton>
      
        </td>
    </tr>
    <tr>
        <td class="SubHead" valign="top">
            <dnn:Label ID="lblStylePreview" runat="server" ResourceKey="lblStylePreview" />
        </td>
        <td>
            <asp:Image ID="imgStylePreview" runat="server" />
        </td>
    </tr>
    <tr>
        <td class="SubHead" valign="top">
            <dnn:Label ID="lblThemeStyleSheet" runat="server" ResourceKey="lblThemeStyleSheet" />
        </td>
        <td>
            <asp:TextBox ID="txtThemeStyleSheet" runat="server" Width="500px" Height="300px"
                TextMode="MultiLine" CssClass="NormalTextBox"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:Label ID="lblSkinMessage" runat="server" CssClass="SubHead" ForeColor="Red"
                resourcekey="lblSkinMessage"></asp:Label>
        </td>
    </tr>
</table>
<asp:Label ID="lblEffectMessage" runat="server" CssClass="SubHead" ForeColor="Red"
    resourcekey="lblEffectMessage"></asp:Label>
<p>
    <asp:LinkButton ID="lbUpdate" runat="server" OnClick="lbUpdate_Click" ValidationGroup="Update">
        <asp:Image ID="imgUpdate" runat="server" ImageUrl="~/images/save.gif" /><asp:Label
            ID="lblUpdate" runat="server" resourcekey="lblUpdate" CssClass="SubHead"></asp:Label></asp:LinkButton>
</p>
