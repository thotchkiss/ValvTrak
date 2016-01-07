<%@ Control Language="C#" AutoEventWireup="true"
    Inherits="DNNSmart.EffectCollection.ManagementCenter" Codebehind="ManagementCenter.ascx.cs" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<asp:PlaceHolder ID="phScript" runat="server"></asp:PlaceHolder>
<div id="mo_wrapper">
    <div id="mo_head" class="clearfix">
        <div class="mo_title">
            DNNSmart.EffectCollection
            <asp:Literal ID="litModuleVersion" runat="server"></asp:Literal><asp:Literal ID="litUpdateVersion" runat="server"></asp:Literal></div>
    </div>
    <div id="mo_info">
        <span class="back">
            <asp:LinkButton ID="lbBack" runat="server" OnClick="lbBack_Click">
                <asp:Label ID="lblBack" runat="server" resourcekey="lblBack"></asp:Label></asp:LinkButton></span>
                <asp:Literal ID="litLicenseActive" runat="server" Visible="false"></asp:Literal>
        <ul class="help_link">
            <li class="buyit"><a target="_blank" href="http://www.dnnsmart.net/EffectCollection.aspx">
                <asp:Label ID="lblBuyIt" runat="server">Buy It</asp:Label></a></li>
            <li class="document"><a target="_blank" href="http://www.dnnsmart.net/FreeDownloads.aspx">
                <asp:Label ID="Label2" runat="server">Document</asp:Label></a> </li>
            <li class="contactus"><a target="_blank" href="http://www.DNNSmart.net/Support.aspx">
                <asp:Label ID="Label4" runat="server">Contact Us</asp:Label></a> </li>
        </ul>
    </div>
    <div id="mo_content">
        <div class="crrrent_ef">
            <span class="title">
                <asp:Image ID="imgCurrentEffect" runat="server" ImageUrl="~/images/help.gif" CssClass="LI_Help" />
                <asp:Label ID="lblCurrentEffect" runat="server" resourcekey="lblCurrentEffect"></asp:Label></span>
            <span class="text">
                <asp:Label ID="lblCurrentEffectShow" runat="server"></asp:Label></span>
        </div>
        <div class="crrrent_ef">
            <span class="title">
                <asp:Image ID="imgCurrentSkin" runat="server" ImageUrl="~/images/help.gif" CssClass="LI_Help" />
                <asp:Label ID="lblCurrentSkin" runat="server" resourcekey="lblCurrentSkin"></asp:Label></span>
            <span class="text">
                <asp:Label ID="lblCurrentSkinShow" runat="server"></asp:Label></span>
        </div>
        <div id="tabs" class="ui-tabs ui-widget ui-widget-content ui-corner-all">
            <asp:Label ID="lblMessage" runat="server" CssClass="LI_Message"></asp:Label>
            <ul class="ui-tabs-nav ui-helper-reset ui-helper-clearfix ui-widget-header ui-corner-all">
                <li class="ui-state-default ui-corner-top"><a href="#tabs-1">Manage Image</a></li>
                <li class="ui-state-default ui-corner-top" id="liManageCategory" ><a href="#tabs-8">Manage Category</a></li>                
                <li class="ui-state-default ui-corner-top"><a href="#tabs-2">Effect Settings</a></li>
                <li class="ui-state-default ui-corner-top "><a href="#tabs-3">Available Effects</a></li>
              <li class="ui-state-default ui-corner-top "><a href="#tabs-4">Option Settings</a></li>
                <li class="ui-state-default ui-corner-top "><a href="#tabs-5">Install New Effect</a></li>
                <li class="ui-state-default ui-corner-top "><a href="#tabs-6">Install New Theme</a></li>
                <li class="ui-state-default ui-corner-top "><a href="#tabs-7">License</a></li>
            </ul>
            <div id="tabs-1" class="ui-tabs-panel ui-widget-content ui-corner-bottom ui-tabs-hide">
                <asp:PlaceHolder ID="phManageImage" runat="server"></asp:PlaceHolder>
            </div>
            <div id="tabs-8" class="ui-tabs-panel ui-widget-content ui-corner-bottom ui-tabs-hide">
                <asp:PlaceHolder ID="phManageCategory" runat="server"></asp:PlaceHolder>
            </div>            
            <div id="tabs-2" class="ui-tabs-panel ui-widget-content ui-corner-bottom ui-tabs-hide">
                <asp:PlaceHolder ID="phEffectSettings" runat="server"></asp:PlaceHolder>
            </div>
            <div id="tabs-3" class="ui-tabs-panel ui-widget-content ui-corner-bottom ui-tabs-hide">
                <asp:PlaceHolder ID="phAvailableEffect" runat="server"></asp:PlaceHolder>
            </div>
            <div id="tabs-4" class="ui-tabs-panel ui-widget-content ui-corner-bottom ui-tabs-hide">
                <asp:PlaceHolder ID="phOptionSettings" runat="server"></asp:PlaceHolder>
            </div>
            <div id="tabs-5" class="ui-tabs-panel ui-widget-content ui-corner-bottom ui-tabs-hide">
                <div class="container">
                    <asp:PlaceHolder ID="phInstallNewEffect" runat="server"></asp:PlaceHolder>
                </div>
            </div>
            <div id="tabs-6" class="ui-tabs-panel ui-widget-content ui-corner-bottom ui-tabs-hide">
                <div class="container">
                    <asp:PlaceHolder ID="phInstallNewTheme" runat="server"></asp:PlaceHolder>
                </div>
            </div>
            <div id="tabs-7" class="ui-tabs-panel ui-widget-content ui-corner-bottom ui-tabs-hide">
                <asp:PlaceHolder ID="phLicense" runat="server"></asp:PlaceHolder>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
		jQuery(function($){
				// Tabs
				$('#tabs').tabs();						
			$('#<%=lblMessage.ClientID %>').fadeOut(5000);
			
			if("<%=SettingsEffect %>"=="E028_Portfolio")
			{
			    $("#tabs-8,#liManageCategory").css("display","block");
			}
			else
			{
			    $("#tabs-8,#liManageCategory").css("display","none");			
			}
		});
</script>

