<%@ Control Language="C#" Inherits="DNNSmart.EffectCollection.OptionSettings"
    AutoEventWireup="true" Codebehind="OptionSettings.ascx.cs" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<span class="Normal"><strong>Note:</strong> Resize width & height of the image when
    you upload images in bulk. 0 is "not resize". </span>
<table>
    <tr>
        <td class="SubHead" style="width: 140px" valign="top">
            <dnn:Label ID="lblResizeWidth" runat="server" ResourceKey="lblResizeWidth" />
        </td>
        <td valign="top">
            <asp:TextBox ID="txtResizeWidth" runat="server" CssClass="NormalTextBox" Width="50px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="SubHead" style="width: 140px" valign="top">
            <dnn:Label ID="lblResizeHeight" runat="server" ResourceKey="lblResizeHeight" />
        </td>
        <td valign="top">
            <asp:TextBox ID="txtResizeHeight" runat="server" CssClass="NormalTextBox" Width="50px"></asp:TextBox>
        </td>
    </tr>
</table>
<hr />
<span class="SubHead">Note:</span> <span class="Normal">If you enter one flickr rss
    here, it will display flickr content and image in front-end. If you fill in nothing,
    module will still read items from Manage Image page. </span>
<table>
    <tr>
        <td class="SubHead" style="width: 140px" valign="top">
            <dnn:Label ID="lblFlickrRSS" runat="server" ResourceKey="lblFlickrRSS" />
        </td>
        <td valign="top">
            <asp:TextBox ID="txtFlickrRSS" runat="server" CssClass="NormalTextBox" Width="500px"></asp:TextBox>
        </td>
    </tr>
</table>
<p>
    <asp:LinkButton ID="lbSave" runat="server" OnClick="lbSave_Click">
        <asp:Image ID="imgSave" runat="server" ImageUrl="~/images/save.gif" /><asp:Label
            ID="lblSave" runat="server" resourcekey="lblSave" CssClass="SubHead"></asp:Label></asp:LinkButton>
</p>
