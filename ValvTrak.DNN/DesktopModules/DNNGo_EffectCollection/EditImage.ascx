<%@ Control Language="C#" Inherits="DNNSmart.EffectCollection.EditImage"
    AutoEventWireup="true" Codebehind="EditImage.ascx.cs" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="TextEditor" Src="~/controls/TextEditor.ascx" %>
<%@ Register TagPrefix="dnn" TagName="URL" Src="~/controls/URLControl.ascx" %>
<table cellspacing="0" cellpadding="2" border="0"  class="dnnFormItem">
    <tr>
        <td class="SubHead" width="130px">
            <dnn:Label ID="lblTitle" runat="server" ResourceKey="lblTitle"></dnn:Label>
        </td>
        <td>
            <asp:TextBox ID="txtTitle" runat="server" CssClass="NormalTextBox" Width="500px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvTitle" resourcekey="rfvTitle.ErrorMessage" ControlToValidate="txtTitle"
                CssClass="NormalRed" Display="Dynamic" runat="server" />
        </td>
    </tr>
    <tr id="trCategorys" runat="server" visible="false">
        <td class="SubHead" valign="top">
            <dnn:Label ID="lblCategorys" runat="server" ResourceKey="lblCategorys"></dnn:Label>
        </td>
        <td>
            <asp:CheckBoxList ID="cblCategorys" runat="server" CssClass="Normal" RepeatColumns="5"
                RepeatDirection="Horizontal">
            </asp:CheckBoxList>
        </td>
    </tr>
    <tr id="trButton" runat="server" visible="false">
        <td class="SubHead">
            <dnn:Label ID="lblButtonLink" runat="server" ResourceKey="lblButtonLink"></dnn:Label>
        </td>
        <td>
            <asp:TextBox ID="txtButtonLink" runat="server" CssClass="NormalTextBox" Width="350px"></asp:TextBox>
            <asp:CheckBox ID="cbButtonLink" runat="server" CssClass="Normal" Text="Is New Window" />
        </td>
    </tr>
    <asp:Panel ID="plDisplayType" runat="server">
        <tr>
            <td class="SubHead">
                <dnn:Label ID="lblDisplayType" runat="server" ResourceKey="lblDisplayType"></dnn:Label>
            </td>
            <td>
                <asp:RadioButtonList ID="rblDisplayType" runat="server" CssClass="Normal" RepeatDirection="Horizontal"
                    AutoPostBack="true" OnSelectedIndexChanged="rblDisplayType_SelectedIndexChanged">
                    <asp:ListItem Value="none">none</asp:ListItem>
                    <asp:ListItem Value="html">html</asp:ListItem>
                    <asp:ListItem Value="module">module</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
    </asp:Panel>
    <asp:Panel ID="plModule" runat="server">
        <tr valign="top">
            <td class="SubHead">
                <dnn:Label ID="lblTabName" runat="server" ResourceKey="lblTabName"></dnn:Label>
            </td>
            <td>
                <asp:DropDownList ID="drpTabName" runat="server" CssClass="Normal" RepeatDirection="Horizontal"
                    AutoPostBack="true" OnSelectedIndexChanged="drpTabName_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
        </tr>
        <tr valign="top">
            <td class="SubHead">
                <dnn:Label ID="lblModuleName" runat="server" ResourceKey="lblModuleName"></dnn:Label>
            </td>
            <td>
                <asp:DropDownList ID="drpModuleName" runat="server" CssClass="Normal" RepeatDirection="Horizontal">
                </asp:DropDownList>
            </td>
        </tr>
    </asp:Panel>
    <asp:Panel ID="plType" runat="server">
        <tr valign="top">
            <td class="SubHead">
                <dnn:Label ID="lblType" runat="server" ResourceKey="lblType"></dnn:Label>
            </td>
            <td>
                <asp:RadioButtonList ID="rblType" runat="server" CssClass="Normal" RepeatDirection="Horizontal"
                    AutoPostBack="true" OnSelectedIndexChanged="rblType_SelectedIndexChanged">
                    <asp:ListItem Value="link">Link</asp:ListItem>
                    <asp:ListItem Value="lightbox">Lightbox</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
    </asp:Panel>
    <asp:Panel ID="plIsNewWindows" runat="server">
        <tr valign="top">
            <td class="SubHead">
                <dnn:Label ID="lblLinkUrl" runat="server"></dnn:Label>
            </td>
            <td>
                <asp:TextBox ID="txtLinkUrl" runat="server" CssClass="NormalTextBox" Width="500px"></asp:TextBox>
            </td>
        </tr>
        <tr valign="top" id="trIsNewWindows" runat="server">
            <td class="SubHead">
                <dnn:Label ID="lblIsNewWindows" runat="server" ResourceKey="lblIsNewWindows"></dnn:Label>
            </td>
            <td>
                <asp:CheckBox ID="cbIsNewWindows" runat="server" />
            </td>
        </tr>
    </asp:Panel>
    <asp:Panel ID="plDescription" runat="server">
        <tr valign="top">
            <td class="SubHead">
                <dnn:Label ID="lblDescription" runat="server" ResourceKey="lblDescription"></dnn:Label>
            </td>
            <td>
                <dnn:TextEditor ID="rtxtDescription" runat="server" Width="500px" Height="300px" />
            </td>
        </tr>
    </asp:Panel>
    <asp:Panel ID="plUrl" runat="server">
        <tr valign="top">
            <td class="SubHead">
                <dnn:Label ID="lblUrl" runat="server"></dnn:Label>
            </td>
            <td>
                <dnn:URL ID="ucUrl" runat="server" ShowTabs="false" UrlType="T" ShowNewWindow="false"
                    ShowNone="true" FileFilter="jpg,jpeg,jpe,gif,bmp,png" Visible="true" ShowSecure="false"
                    ShowDatabase="false" ShowLog="false" ShowTrack="false" ShowUrls="true" ShowFiles="true" />
            </td>
        </tr>
        <tr id="trUrlNote" runat="server">
            <td>
            </td>
            <td class="Normal">
                <table>
                    <tr>
                        <td>
                            <strong>Example:</strong>
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <strong>inline Html</strong>:
                        </td>
                        <td>
                            Select None
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <strong>Image</strong>:
                        </td>
                        <td>
                            http://www.DNNSmart.net/logo.jpg or upload a image
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <strong>Flash</strong>:
                        </td>
                        <td>
                            http://www.DNNSmart.net/logo.swf?width=792&height=294
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <strong>iFrame</strong>:
                        </td>
                        <td>
                            http://www.DNNSmart.net?iframe=true&width=792&height=294
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <strong>Youtube</strong>:
                        </td>
                        <td>
                            http://www.youtube.com/watch?v=qqXi8WmQ_WM
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <strong>Quick Time</strong>:
                        </td>
                        <td>
                            http://www.DNNSmart.net/logo.mov?width=792&height=294
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </asp:Panel>
    <asp:Panel ID="plImage" runat="server">
        <tr valign="top">
            <td class="SubHead">
                <dnn:Label ID="lblImage" runat="server" ResourceKey="lblImage"></dnn:Label>
            </td>
            <td>
                <dnn:URL ID="ucImage" runat="server" ShowTabs="false" UrlType="T" ShowNewWindow="false"
                    ShowNone="true" FileFilter="jpg,jpeg,jpe,gif,bmp,png" Visible="true" ShowSecure="false"
                    ShowDatabase="false" ShowLog="false" ShowTrack="false" ShowUrls="true" ShowFiles="true" />
            </td>
        </tr>
        <tr valign="top">
            <td class="SubHead">
            </td>
            <td>
                <asp:Image ID="imgImage" runat="server" />
            </td>
        </tr>
    </asp:Panel>
    <tr>
        <td class="SubHead">
            <dnn:Label ID="lblStartTime" runat="server" ResourceKey="lblStartTime"></dnn:Label>
        </td>
        <td>
            <asp:TextBox ID="txtStartTime" runat="server" Width="100px"></asp:TextBox><asp:HyperLink
                ID="hyStartTime" runat="server">
                <asp:Image ID="imgBeginDate" runat="server" ImageUrl="~/images/calendar.png" /></asp:HyperLink>
            <asp:DropDownList ID="drpStartTime" runat="server">
                <asp:ListItem Value="00">00:00</asp:ListItem>
                <asp:ListItem Value="01">01:00</asp:ListItem>
                <asp:ListItem Value="02">02:00</asp:ListItem>
                <asp:ListItem Value="03">03:00</asp:ListItem>
                <asp:ListItem Value="04">04:00</asp:ListItem>
                <asp:ListItem Value="05">05:00</asp:ListItem>
                <asp:ListItem Value="06">06:00</asp:ListItem>
                <asp:ListItem Value="07">07:00</asp:ListItem>
                <asp:ListItem Value="08">08:00</asp:ListItem>
                <asp:ListItem Value="09">09:00</asp:ListItem>
                <asp:ListItem Value="10">10:00</asp:ListItem>
                <asp:ListItem Value="11">11:00</asp:ListItem>
                <asp:ListItem Value="12">12:00</asp:ListItem>
                <asp:ListItem Value="13">13:00</asp:ListItem>
                <asp:ListItem Value="14">14:00</asp:ListItem>
                <asp:ListItem Value="15">15:00</asp:ListItem>
                <asp:ListItem Value="16">16:00</asp:ListItem>
                <asp:ListItem Value="17">17:00</asp:ListItem>
                <asp:ListItem Value="18">18:00</asp:ListItem>
                <asp:ListItem Value="19">19:00</asp:ListItem>
                <asp:ListItem Value="20">20:00</asp:ListItem>
                <asp:ListItem Value="21">21:00</asp:ListItem>
                <asp:ListItem Value="22">22:00</asp:ListItem>
                <asp:ListItem Value="23">23:00</asp:ListItem>
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td class="SubHead">
            <dnn:Label ID="lblExpiredTime" runat="server" ResourceKey="lblExpiredTime"></dnn:Label>
        </td>
        <td>
            <asp:TextBox ID="txtExpiredTime" runat="server" Width="100px"></asp:TextBox><asp:HyperLink
                ID="hyExpiredTime" runat="server">
                <asp:Image ID="Image1" runat="server" ImageUrl="~/images/calendar.png" /></asp:HyperLink>
            <asp:DropDownList ID="drpExpiredTime" runat="server">
                <asp:ListItem Value="00">00:00</asp:ListItem>
                <asp:ListItem Value="01">01:00</asp:ListItem>
                <asp:ListItem Value="02">02:00</asp:ListItem>
                <asp:ListItem Value="03">03:00</asp:ListItem>
                <asp:ListItem Value="04">04:00</asp:ListItem>
                <asp:ListItem Value="05">05:00</asp:ListItem>
                <asp:ListItem Value="06">06:00</asp:ListItem>
                <asp:ListItem Value="07">07:00</asp:ListItem>
                <asp:ListItem Value="08">08:00</asp:ListItem>
                <asp:ListItem Value="09">09:00</asp:ListItem>
                <asp:ListItem Value="10">10:00</asp:ListItem>
                <asp:ListItem Value="11">11:00</asp:ListItem>
                <asp:ListItem Value="12">12:00</asp:ListItem>
                <asp:ListItem Value="13">13:00</asp:ListItem>
                <asp:ListItem Value="14">14:00</asp:ListItem>
                <asp:ListItem Value="15">15:00</asp:ListItem>
                <asp:ListItem Value="16">16:00</asp:ListItem>
                <asp:ListItem Value="17">17:00</asp:ListItem>
                <asp:ListItem Value="18">18:00</asp:ListItem>
                <asp:ListItem Value="19">19:00</asp:ListItem>
                <asp:ListItem Value="20">20:00</asp:ListItem>
                <asp:ListItem Value="21">21:00</asp:ListItem>
                <asp:ListItem Value="22">22:00</asp:ListItem>
                <asp:ListItem Value="23">23:00</asp:ListItem>
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td class="SubHead">
            <dnn:Label ID="lblIsActive" runat="server" ResourceKey="lblIsActive"></dnn:Label>
        </td>
        <td>
            <asp:CheckBox ID="cbIsActive" runat="server" />
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

<script language="javascript" type="text/javascript">
    <!--
    var objImg = document.getElementById("<%=imgImage.ClientID %>");
    if (objImg != null) {
        objImg.onerror = function() {
            this.style.display = "none";
        }
    }
    //-->
</script>

