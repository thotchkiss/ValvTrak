<%@ Control language="vb" AutoEventWireup="false" Explicit="True" Inherits="DotNetNuke.UI.Skins.Skin" %>
<%@ Register TagPrefix="dnn" TagName="LOGO" Src="~/Admin/Skins/Logo.ascx" %>
<%@ Register TagPrefix="dnn" TagName="CURRENTDATE" Src="~/Admin/Skins/CurrentDate.ascx" %>
<%@ Register TagPrefix="dnn" TagName="SEARCH" Src="~/Admin/Skins/Search.ascx" %>
<%@ Register TagPrefix="dnn" TagName="LANGUAGE" Src="~/Admin/Skins/Language.ascx" %>
<%@ Register TagPrefix="dnn" TagName="BREADCRUMB" Src="~/Admin/Skins/BreadCrumb.ascx" %>
<%@ Register TagPrefix="dnn" TagName="LOGIN" Src="~/Admin/Skins/Login.ascx" %>
<%@ Register TagPrefix="dnn" TagName="USER" Src="~/Admin/Skins/User.ascx" %>
<%@ Register TagPrefix="dnn" TagName="NAV" Src="~/Admin/Skins/Nav.ascx" %>
<%@ Register TagPrefix="dnn" TagName="COPYRIGHT" Src="~/Admin/Skins/Copyright.ascx" %>
<%@ Register TagPrefix="dnn" TagName="TERMS" Src="~/Admin/Skins/Terms.ascx" %>
<%@ Register TagPrefix="dnn" TagName="PRIVACY" Src="~/Admin/Skins/Privacy.ascx" %>
<script type="text/javascript" src="<%= SkinPath %>swfobject.js"></script>
<script type="text/javascript">
var params = { wmode: "transparent", FlashVars: "XMLpath=<%= SkinPath %>Template-Flash-900x212-01.images.xml" };
swfobject.embedSWF("<%= SkinPath %>flash/flex-900x212.swf", "FlashBannerContainer", "900", "212", "9.0.0", false, false, params);
</script>

<script type="text/javascript" src='<%= SkinPath %>drnuke-height.js'></script>
<!--[if lte ie 6]>
<script type="text/javascript">
if (typeof blankImg == 'undefined') var blankImg = '<%= SkinPath %>images/spacer.gif';
</script>
<style type="text/css">
.trans-png, #Body, .flex-container-visibility a img { behavior: url(<%= SkinPath %>drnuke-png.htc) }
</style>
<![endif]-->
<!--[if gte IE 5]>
<link rel="stylesheet" type="text/css" media="all" href="<%= SkinPath %>css/ie.css">
<![endif]-->  
<!--[if ie 6]>
<link rel="stylesheet" type="text/css" media="all" href="<%= SkinPath %>css/ie6.css">
<![endif]-->

<div id="OuterContainer" class="EMWidth">   

<table class="EMSkinTable fullwidth" border="0" cellspacing="0" cellpadding="0">
<tr id="EMOffset1"><td class="EMSkinTL trans-png"><img src="<%= SkinPath %>images/spacer.gif" alt="" /></td>
<td style="vertical-align:bottom;">
	<table class="fullwidth" border="0" cellspacing="0" cellpadding="0">
	<tr>
    <td class="EMSkinTL2 trans-png"><img src="<%= SkinPath %>images/spacer.gif" alt="" /></td>
    <td class="EMSkinT trans-png"><img src="<%= SkinPath %>images/spacer.gif" alt="" /></td>
	<td class="EMSkinTR2 trans-png"><img src="<%= SkinPath %>images/spacer.gif" alt="" /></td>
    </tr>
    </table>
</td>
<td class="EMSkinTR trans-png"><img src="<%= SkinPath %>images/spacer.gif" alt="" /></td></tr>
<tr>
<td class="EMSkinL trans-png"><img src="<%= SkinPath %>images/spacer.gif" alt="" /></td>
<td class="EMSkinM">
	<div id="ContentHeightContainer">
	<div id="InnerContainer">
    	<div style="float:left;"> 
            <div id="LogoContainer" class="EMLogoContainer">
                <dnn:LOGO runat="server" id="dnnLOGO" />
            </div>
        </div>
        <div style="float:right;">
            <div id="LogoRightContainer">
                <div id="DateContainer" class="EMDateContainer">
                <dnn:CURRENTDATE runat="server" id="dnnCURRENTDATE" CssClass="DateToken EMFontFamily" DateFormat="dddd, MMMM dd, yyyy" />
                </div>
                <div id="SearchContainer" class="EMSearchContainer">
                    <div class="SearchBoxL">
                        <div class="SearchBox EMBaseColour3">
                        <dnn:SEARCH runat="server" id="dnnSEARCH" showWeb="False" showSite="False" Submit="&lt;img src=&quot;images/search-button.png&quot; hspace=&quot;0&quot; alt=&quot;Search&quot; class=&quot;trans-png&quot; /&gt;" />
                        </div>
                    </div>         
                </div>
                <div id="LanguageContainer" class="EMLanguageContainer">
                <dnn:LANGUAGE runat="server" id="dnnLANGUAGE" showMenu="False" showLinks="True" />
                </div>            
            </div>
        </div>
        <div class="clear"></div>
        
        <div id="MenuBottomContainer">
        <table cellpadding="0" cellspacing="0" border="0" class="fullwidth">
        <tr><td id="MenuBarL" class="EMBaseColour6"><img src="<%= SkinPath %>images/em-menu-bl.png" alt="" class="trans-png" /></td><td id="MenuBarM" class="EMBaseColour6"></td><td id="MenuBarR" class="EMBaseColour6"><img src="<%= SkinPath %>images/em-menu-br.png" alt="" class="trans-png" /></td></tr>
        </table>
        </div>
          
        <div id="BannerOuterContainer">
            <div id="FlashBannerContainer">
            <p><a href="http://www.adobe.com/go/getflashplayer"><img src="http://www.adobe.com/images/shared/download_buttons/get_flash_player.gif" alt="Get Adobe Flash player" /></a></p>
            </div> 
        </div>
          
        <div id="UnderBannerContainer">
        <table cellpadding="0" cellspacing="0" class="fullwidth">
        <tr>
        <td><img src="<%= SkinPath %>images/login-l.gif" width="9" height="31" alt="" /></td>
        <td class="fullwidth">
            <div id="BreadcrumbContainer" class="EMBreadcrumbContainer">
                <span class="EMBaseColour4 BreadcrumbSpan"><img src="<%= SkinPath %>images/breadcrumb.png" alt="" class="trans-png" /></span><dnn:BREADCRUMB runat="server" id="dnnBREADCRUMB" CssClass="BreadcrumbToken EMFontFamily" Separator="&lt;span class=&quot;EMBaseColour4 BreadcrumbSpan&quot;&gt;&lt;img src=&quot;images/breadcrumb.png&quot; alt=&quot;&quot; class=&quot;trans-png&quot; /&gt;&lt;/span&gt;" RootLevel="0" />
            </div>
            <div id="LoginContainer">
                <table border="0" cellpadding="0" cellspacing="0">
                <tr><td class="EMBaseColour5 trans-png"><div><dnn:LOGIN runat="server" id="dnnLOGIN" CssClass="LoginToken EMFontFamily trans-png" /></div></td></tr>
                </table> 
            </div>
            <div id="UserContainer">
                <table border="0" cellpadding="0" cellspacing="0">
                <tr><td class="EMBaseColour5 trans-png"><div><dnn:USER runat="server" id="dnnUSER" CssClass="UserToken EMFontFamily trans-png" /></div></td></tr>
                </table> 
            </div>
            <img src="<%= SkinPath %>images/loginbuttonon-l.png" width="23" height="22" alt="" class="hidden" />
            <img src="<%= SkinPath %>images/userbuttonon-l.png" width="23" height="22" alt="" class="hidden" />
		</td>
        <td><img src="<%= SkinPath %>images/login-r.gif" width="9" height="31" alt="" /></td>
        </tr>
        </table>
        </div>

		<div id="ContentContainer">
        <table border="0" cellpadding="0" cellspacing="0" class="fullwidth">
        <tr>
        <td id="MenuContainerCell">
            <div id="MenuContainer">
            	<table class="fullwidth menu-container EMBaseColour1">
				<tr>
				<td class="menu-container-tl trans-png"><img src="<%= SkinPath %>images/spacer.gif" height="10" width="10" alt="" /></td>
				<td class="menu-container-t trans-png"></td>
				<td class="menu-container-tr trans-png"><img src="<%= SkinPath %>images/spacer.gif" height="10" width="10" alt="" /></td>
				</tr>
                <tr>
  				<td colspan="3" class="menu-container-m"><dnn:NAV runat="server" id="dnnNAV" ProviderName="DNNMenuNavigationProvider" ControlOrientation="vertical" IndicateChildren="true" IndicateChildImageRoot="[SKINPATH]images/spacer.gif" IndicateChildImageSub="[SKINPATH]images/menu-arrow.png" CSSNodeRoot="mainmenu-idle EMMainMenuItemOff EMBaseColour1 EMMainMenuFont" CSSNodeSelectedRoot="mainmenu-selected EMBaseColour2 EMMainMenuItemOn EMMainMenuFont" CSSNodeHoverRoot="mainmenu-selected EMBaseColour2 EMMainMenuItemOn EMMainMenuFont" CSSBreadCrumbRoot="mainmenu-breadcrumbactive EMBaseColour2 EMMainMenuItemOn EMMainMenuFont" CSSNode="mainmenu-menuitem EMSubMenuItemOff EMMainMenuFont" CSSContainerSub="mainmenu-submenu EMSubMenuItemBGOff EMMainMenuFont EMSubMenuOpacity" CSSNodeHoverSub="submenu-menuitemsel EMSubMenuItemBGOn EMSubMenuItemOn EMMainMenuFont" NodeRightHTMLRoot="&lt;span class=&quot;item-arrow&quot;&gt;&lt;img src=&quot;images/menu-arrow.png&quot; class=&quot;trans-png&quot;&gt;&lt;/span&gt;" /></td>
				</tr>
				<tr><td class="menu-container-bl trans-png"><img src="<%= SkinPath %>images/spacer.gif" height="10" width="10" alt="" /></td>
                <td class="menu-container-b trans-png"></td>
                <td class="menu-container-br trans-png"><img src="<%= SkinPath %>images/spacer.gif" height="10" width="10" alt="" /></td>
                </tr>
				</table>
            </div>
            <table align="center" cellpadding="0" cellspacing="0" class="fullwidth">
            <tr>
            <td id="MenuPane" class="MenuPane" valign="top" runat="server"></td>
            </tr>
            </table>
        </td>
        <td id="ContentContainerCell">
            <table align="center" cellpadding="0" cellspacing="0" class="fullwidth">
            <tr>
            <td id="TopPane" colspan="2" class="TopPane" runat="server"></td>
            </tr>
            <tr>
            <td id="LeftPane" class="LeftPane" runat="server"></td>
            <td id="RightPane" class="RightPane" runat="server"></td>
            </tr>
            </table>
            <table align="center" cellpadding="0" cellspacing="0" class="fullwidth">
            <tr>
            <td id="TopPane2" colspan="3" class="TopPane2" runat="server"></td>
            </tr>
            <tr>
            <td id="LeftPane2" class="LeftPane2" runat="server"></td>
            <td id="ContentPane1" class="ContentPane1" runat="server"></td>
            <td id="RightPane2" class="RightPane2" runat="server"></td>
            </tr>
            </table>
            <table align="center" cellpadding="0" cellspacing="0" class="fullwidth">
            <tr>
            <td id="ContentPane" colspan="2" class="ContentPane" runat="server"></td>
            </tr>                
            <tr>
            <td class="ContentPane2" id="ContentPane2" runat="server"></td>
            <td id="RightPane3" class="RightPane3" runat="server"></td>
            </tr> 
            </table>
            <table align="center" cellpadding="0" cellspacing="0" class="fullwidth">        
            <tr>
            <td id="MiddlePane" colspan="3" class="MiddlePane" runat="server"></td>
            </tr>
            <tr>
            <td class="LeftPane3" id="LeftPane3" runat="server"></td>
            <td id="ContentPane3" class="ContentPane3" runat="server"></td>
            </tr> 
            </table>  
            <table align="center" cellpadding="0" cellspacing="0" class="fullwidth">
            <tr>
            <td colspan="3" class="BottomPane" id="BottomPane" runat="server"></td>
            </tr>              
            <tr>
            <td id="LeftPane4" class="LeftPane4" runat="server"></td>
            <td id="ContentPane4" class="ContentPane4" runat="server"></td>
            <td id="RightPane4" class="RightPane4" runat="server"></td>
            </tr>
            </table>
            <table align="center" cellpadding="0" cellspacing="0" class="fullwidth">
            <tr>
            <td id="BottomPane2" class="BottomPane2" runat="server"></td>
            </tr>
            </table>
        </td></tr>
        </table>
        </div>
      </div>
      </div>        
</td>        
<td class="EMSkinR trans-png"><img src="<%= SkinPath %>images/spacer.gif" alt="" /></td>
</tr>
<tr id="EMOffset2">
<td class="EMSkinL trans-png"><img src="<%= SkinPath %>images/spacer.gif" alt="" /></td>
<td class="EMSkinM">
    <div id="FooterContainer">
    <table align="center" cellpadding="0" cellspacing="0" class="fullwidth">
    <tr>
    <td id="FooterPane" class="FooterPane" valign="top" runat="server"></td>
    </tr>
    </table>
    </div>
</td>
<td class="EMSkinR trans-png"><img src="<%= SkinPath %>images/spacer.gif" alt="" /></td>
</tr>
<tr id="EMOffset3">
<td class="EMSkinBL trans-png"><img src="<%= SkinPath %>images/spacer.gif" alt="" /></td>
<td>
	<table class="fullwidth" border="0" cellspacing="0" cellpadding="0">
	<tr>
    <td class="EMSkinBL2 trans-png"><img src="<%= SkinPath %>images/spacer.gif" alt="" /></td>
    <td class="EMSkinB trans-png"><img src="<%= SkinPath %>images/spacer.gif" alt="" /></td>
	<td class="EMSkinBR2 trans-png"><img src="<%= SkinPath %>images/spacer.gif" alt="" /></td>
    </tr>
    </table>
</td>
<td class="EMSkinBR trans-png"><img src="<%= SkinPath %>images/spacer.gif" alt="" /></td>
</tr>
<tr id="EMOffset4">
<td class="EMSkinBL3 trans-png"><img src="<%= SkinPath %>images/spacer.gif" alt="" /></td>
<td id="FooterCell" class="EMSkinB3">
    <div id="CopyrightContainer" class="EMCopyrightContainer"><dnn:COPYRIGHT runat="server" id="dnnCOPYRIGHT" CssClass="FooterToken EMFooterFont" /></div>
    <div id="TermsContainer" class="EMTermsContainer"><dnn:TERMS runat="server" id="dnnTERMS" CssClass="FooterToken EMFooterFont" /></div>
    <div id="PrivacyContainer" class="EMPrivacyContainer"><dnn:PRIVACY runat="server" id="dnnPRIVACY" CssClass="FooterToken EMFooterFont" /></div> 
</td>
<td class="EMSkinBR3 trans-png"><img src="<%= SkinPath %>images/spacer.gif" alt="" /></td>
</tr>
</table>

</div>

