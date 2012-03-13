<%@ Control language="vb" Inherits="DrNuke.EasyMod.ViewEasyMod" AutoEventWireup="false" Explicit="True" Codebehind="ViewEasyMod.ascx.vb" %>

<div class="EMLoadingMask"></div> 
<div class="EMLoadingBox"><img src="<%= TemplateSourceDirectory %>/images/loadpanel.png" alt="Loading EasyMod" /></div> 
 
<div id="EMContainerMain">

    <table cellpadding="0" cellspacing="0" border="0" style="width:100%;">
    <tr>
    <td class="header-l"><img src="<%= TemplateSourceDirectory %>/images/spacer.gif" alt="" /></td>
    <td class="header-logo"><asp:Image ID="imgLogo" runat="server" AlternateText="DrNuke" /></td>
    <td class="header-sep"><img src="<%= TemplateSourceDirectory %>/images/spacer.gif" alt="" /></td>
    <td class="header-logo2"><asp:Image ID="imgLogo2" runat="server" AlternateText="EasyMod" /></td>
    <td class="header-buttons">
        <asp:ImageButton ID="btnStep1" runat="server" AlternateText="Load" CssClass="btn-step1" />
        <asp:ImageButton ID="btnStep2" runat="server" AlternateText="Mod" CssClass="btn-step2" />
        <asp:ImageButton ID="btnStep3" runat="server" AlternateText="Save" CssClass="btn-step3" />
    </td>
    <td class="header-r"><img src="<%= TemplateSourceDirectory %>/images/spacer.gif" alt="" /></td>
    </tr>
    </table>
    
    <div class="clear"></div>

    <asp:Panel ID="pnlMessage" runat="server">
    <div id="EMMessage">
        <table cellpadding="0" cellspacing="0" border="0">
        <tr><td><asp:Image ID="imgMessage" runat="server" /></td><td><asp:Label ID="lblMessage" runat="server" Text="" CssClass="normal"></asp:Label></td></tr>
        </table>
    </div>
    </asp:Panel>
    
    <div id="EMStep">
        <h1><asp:Label ID="lblStep" runat="server" Text=""></asp:Label></h1>
    </div>
    
    <div class="clear"></div>
    
    <asp:Panel ID="pnlStep1" runat="server">
        <div id="EMContainerStep1">
            <p>
            Skin Pack: <strong><asp:Label ID="lblCurrentSkinPack" runat="server" CssClass="EMBodyText"></asp:Label></strong>&nbsp;&nbsp;Skin Template: <strong><asp:Label ID="lblCurrentSkinTemplate" runat="server" CssClass="EMBodyText"></asp:Label></strong>
            </p>
            <p>You can load the settings from <strong>any</strong> template in the pack applied to this page. You can save the results to this template or any other in this pack.</p>
            <p>Alternatively you can load one of the pre-defined themes.</p>
            
            <fieldset>
            <legend><span class="legend">Load settings from <asp:Literal ID="litLoadSkinName" runat="server"></asp:Literal></span></legend>
            <div id="EMContainerLoad">
                <table cellpadding="3" cellspacing="0" border="0">
                <tr><td><asp:RadioButton ID="radSkin" runat="server" Checked="True" GroupName="loadfrom" CssClass="inptLoadSkinsRad" /></td><td><strong>This Skin Pack</strong></td><td><asp:DropDownList ID="ddlLoadSkins" CssClass="inptLoadSkinsDdl" runat="server"></asp:DropDownList></td></tr>
                <tr><td></td><td>or</td><td></td></tr>
                <tr><td><asp:RadioButton ID="radTemplate" runat="server" GroupName="loadfrom" CssClass="inptLoadThemesRad" /></td><td><strong>EasyMod Theme</strong></td><td><asp:DropDownList ID="ddlTemplates" CssClass="inptLoadThemesDdl" runat="server"></asp:DropDownList></td></tr>
                <tr><td></td><td><asp:ImageButton ID="btnLoadXML" runat="server" AlternateText="Load Settings" CssClass="btn-loadsettings" /></td></tr>
                </table>
            </div>
            </fieldset>
        </div>
    </asp:Panel>

    <asp:Panel ID="pnlStep2" runat="server">
        <div id="EMContainerStep2">
            <p>Modify the skin exactly how you want it. You'll see all your changes pre-viewed on this page.</p>
            <div id="EMTabs1">
                <ul>
                    <li><a href="#tab-1"><span>Layout</span></a></li>
                    <li><a href="#tab-2"><span>Menu</span></a></li>
                    <li><a href="#tab-3"><span>Banner</span></a></li>
                    <li><a href="#tab-4"><span>Text</span></a></li>
                    <li><a href="#tab-5"><span>Containers</span></a></li>
                </ul>
     
                <div id="tab-1">                
                    <fieldset>
                    <legend><span class="legend">Base Colours</span></legend>
                    <div id="EMContainerBaseColour">
                        <asp:Panel ID="pnlEMBaseColour1" runat="server"><div class="note"><asp:Label ID="lblEMBaseColour1" runat="server" CssClass="normal"></asp:Label></div><div id="EMBaseColour1"><div></div></div></asp:Panel>
                        <asp:Panel ID="pnlEMBaseColour2" runat="server"><div class="note"><asp:Label ID="lblEMBaseColour2" runat="server" CssClass="normal"></asp:Label></div><div id="EMBaseColour2"><div></div></div></asp:Panel>
                        <asp:Panel ID="pnlEMBaseColour3" runat="server"><div class="note"><asp:Label ID="lblEMBaseColour3" runat="server" CssClass="normal"></asp:Label></div><div id="EMBaseColour3"><div></div></div></asp:Panel>
                        <asp:Panel ID="pnlEMBaseColour4" runat="server"><div class="note"><asp:Label ID="lblEMBaseColour4" runat="server" CssClass="normal"></asp:Label></div><div id="EMBaseColour4"><div></div></div></asp:Panel>
                        <asp:Panel ID="pnlEMBaseColour5" runat="server"><div class="note"><asp:Label ID="lblEMBaseColour5" runat="server" CssClass="normal"></asp:Label></div><div id="EMBaseColour5"><div></div></div></asp:Panel>
                        <asp:Panel ID="pnlEMBaseColour6" runat="server"><div class="note"><asp:Label ID="lblEMBaseColour6" runat="server" CssClass="normal"></asp:Label></div><div id="EMBaseColour6"><div></div></div></asp:Panel>
                        <asp:Panel ID="pnlEMBaseColour7" runat="server"><div class="note"><asp:Label ID="lblEMBaseColour7" runat="server" CssClass="normal"></asp:Label></div><div id="EMBaseColour7"><div></div></div></asp:Panel>
                        <asp:Panel ID="pnlEMBaseColour8" runat="server"><div class="note"><asp:Label ID="lblEMBaseColour8" runat="server" CssClass="normal"></asp:Label></div><div id="EMBaseColour8"><div></div></div></asp:Panel>
                    </div>
                    </fieldset>
                                    
                    <fieldset>
                    <legend><span class="legend">Background</span></legend>
                    <div id="EMContainerBackground">
                        <asp:Panel ID="pnlEMBackgroundImage" runat="server">
                            <div class="floatleft">
                            <ul id="EMBackgroundImageCarousel" class="jcarousel-skin-background">
                            <asp:Literal ID="litEMBackgroundImageCarousel" runat="server"></asp:Literal>
                            </ul>
                            </div>
                            <div class="clear"></div>
                        </asp:Panel>
                        
                        <asp:Panel ID="pnlEMBackgroundColour" runat="server"><div class="note"><asp:Label ID="lblEMBackgroundColour" runat="server" CssClass="normal"></asp:Label></div><div id="EMBackgroundColour"><div></div></div></asp:Panel>
                        <asp:Panel ID="pnlEMBackgroundImageRepeat" runat="server"><div class="note"><asp:Label ID="lblEMBackgroundImageRepeat" runat="server" CssClass="normal"></asp:Label></div><div class="floatleft"><asp:DropDownList ID="ddlEMBackgroundImageRepeat" runat="server" CssClass="inptEMBackgroundImageRepeat"></asp:DropDownList></div></asp:Panel>
                        <asp:Panel ID="pnlEMBackgroundImagePosition" runat="server"><div class="note"><asp:Label ID="lblEMBackgroundImagePosition" runat="server" CssClass="normal"></asp:Label></div><div class="floatleft"><asp:DropDownList ID="ddlEMBackgroundImagePositionV" runat="server" CssClass="inptEMBackgroundImagePositionV"></asp:DropDownList><asp:DropDownList ID="ddlEMBackgroundImagePositionH" runat="server" CssClass="inptEMBackgroundImagePositionH"></asp:DropDownList></div></asp:Panel>
                        <asp:Panel ID="pnlEMBackgroundImageAttachment" runat="server"><div class="note"><asp:Label ID="lblEMBackgroundImageAttachment" runat="server" CssClass="normal"></asp:Label></div><div class="floatleft"><input id="chkEMBackgroundImageAttachment" type="checkbox" class="inptEMBackgroundImageAttachment" /></div></asp:Panel>
                        <img src="<%= TemplateSourceDirectory %>/images/spacer.gif" class="btn-auto-background" alt="Auto" />
                    </div>
                    </fieldset>
                    
                    <fieldset>
                    <legend><span class="legend">Border</span></legend>
                    <div id="EMContainerBorder"> 
                        <asp:Panel ID="pnlEMBorderStyle" runat="server">   
                            <ul id="EMBorderStyleCarousel" class="jcarousel-skin-borderstyle">
                                <asp:Literal ID="litEMBorderStyleCarousel" runat="server"></asp:Literal>
                            </ul>
                        </asp:Panel>
                        
                        <asp:Panel ID="pnlEMFullHeight" runat="server">
                            <div class="note"><asp:Label ID="lblEMFullHeight" runat="server" CssClass="normal"></asp:Label></div><div class="floatleft"><input id="chkEMFullHeight" type="checkbox" class="inptEMFullHeight" /></div>
                        </asp:Panel> 
                    </div>
                    </fieldset>
                     
                    <fieldset>
                    <legend><span class="legend">Width</span></legend>
                    <div id="EMContainerSkinWidth">
                        <asp:Panel ID="pnlEMWidth" runat="server">
                            <div id="EMWidthSlider"><div class="ui-slider-handle"></div></div>
                            <input id="EMWidth" type="text" maxlength="4" size="3" value="0" class="inptEMWidth" />
                        </asp:Panel>
                        <asp:Panel ID="pnlEMWidthUnits" runat="server">
                            <div id="EMWidthUnits"><asp:DropDownList ID="ddlEMWidthUnits" runat="server" CssClass="inptEMWidthUnits"></asp:DropDownList></div>
                        </asp:Panel>
                    </div>
                    </fieldset>
                                        
                    <fieldset>
                    <legend><span class="legend">Tokens</span></legend>
                    <div id="EMContainerTokens">   
                        <div>
                            <asp:Panel ID="pnlEMLogo" runat="server"><div class="note"><asp:Label ID="lblEMLogo" runat="server" CssClass="normal"></asp:Label></div><input id="chkEMLogo" type="checkbox" class="inptEMLogo" /></asp:Panel><br />
                            <asp:Panel ID="pnlEMLanguage" runat="server"><div class="note"><asp:Label ID="lblEMLanguage" runat="server" CssClass="normal"></asp:Label></div><input id="chkEMLanguage" type="checkbox" class="inptEMLanguage" /></asp:Panel><br />
                            <asp:Panel ID="pnlEMSearch" runat="server"><div class="note"><asp:Label ID="lblEMSearch" runat="server" CssClass="normal"></asp:Label></div><input id="chkEMSearch" type="checkbox" class="inptEMSearch" /></asp:Panel><br /> 
                        </div>
                        <div>
                            <asp:Panel ID="pnlEMDate" runat="server"><div class="note"><asp:Label ID="lblEMDate" runat="server" CssClass="normal"></asp:Label></div><input id="chkEMDate" type="checkbox" class="inptEMDate" /></asp:Panel><br />
                            <asp:Panel ID="pnlEMBreadcrumb" runat="server"><div class="note"><asp:Label ID="lblEMBreadcrumb" runat="server" CssClass="normal"></asp:Label></div><input id="chkEMBreadcrumb" type="checkbox" class="inptEMBreadcrumb" /></asp:Panel><br />
                            <asp:Panel ID="pnlEMCopyright" runat="server"><div class="note"><asp:Label ID="lblEMCopyright" runat="server" CssClass="normal"></asp:Label></div><input id="chkEMCopyright" type="checkbox" class="inptEMCopyright" /></asp:Panel><br /> 
                        </div>
                        <div>
                            <asp:Panel ID="pnlEMTerms" runat="server"><div class="note"><asp:Label ID="lblEMTerms" runat="server" CssClass="normal"></asp:Label></div><input id="chkEMTerms" type="checkbox" class="inptEMTerms" /></asp:Panel><br />
                            <asp:Panel ID="pnlEMPrivacy" runat="server"><div class="note"><asp:Label ID="lblEMPrivacy" runat="server" CssClass="normal"></asp:Label></div><input id="chkEMPrivacy" type="checkbox" class="inptEMPrivacy" /></asp:Panel><br />
                        </div>
                     </div>
                     </fieldset>
                </div>
         
                <div id="tab-2">
                    <fieldset>
                    <legend><span class="legend">MainMenu</span></legend>                    
                    <div id="EMContainerMainMenu">
                        <asp:Panel ID="pnlEMMainMenuItemOn" runat="server"><div class="note"><asp:Label ID="lblEMMainMenuItemOn" runat="server" CssClass="normal"></asp:Label></div><div id="EMMainMenuItemOn"><div></div></div></asp:Panel>
                        <asp:Panel ID="pnlEMMainMenuItemOff" runat="server"><div class="note"><asp:Label ID="lblEMMainMenuItemOff" runat="server" CssClass="normal"></asp:Label></div><div id="EMMainMenuItemOff"><div></div></div></asp:Panel>
                        <div class="clear"></div>
                        <asp:Panel ID="pnlEMMainMenuFont" runat="server"><div class="note"><asp:Label ID="lblEMMainMenuFont" runat="server" CssClass="normal"></asp:Label></div>
                            <asp:DropDownList ID="ddlEMMainMenuFont" CssClass="inptEMMainMenuFont" runat="server">
                            </asp:DropDownList>
                        </asp:Panel>
                    </div>
                    </fieldset>
                    
                    <fieldset>
                    <legend><span class="legend">SubMenu</span></legend>                    
                    <div id="EMContainerSubMenu">
                        <asp:Panel ID="pnlEMSubMenuItemOn" runat="server"><div class="note"><asp:Label ID="lblEMSubMenuItemOn" runat="server" CssClass="normal"></asp:Label></div><div id="EMSubMenuItemOn"><div></div></div></asp:Panel>
                        <asp:Panel ID="pnlEMSubMenuItemOff" runat="server"><div class="note"><asp:Label ID="lblEMSubMenuItemOff" runat="server" CssClass="normal"></asp:Label></div><div id="EMSubMenuItemOff"><div></div></div></asp:Panel>
                        <asp:Panel ID="pnlEMSubMenuItemBGOn" runat="server"><div class="note"><asp:Label ID="lblEMSubMenuItemBGOn" runat="server" CssClass="normal"></asp:Label></div><div id="EMSubMenuItemBGOn"><div></div></div></asp:Panel>
                        <asp:Panel ID="pnlEMSubMenuItemBGOff" runat="server"><div class="note"><asp:Label ID="lblEMSubMenuItemBGOff" runat="server" CssClass="normal"></asp:Label></div><div id="EMSubMenuItemBGOff"><div></div></div></asp:Panel>
                        <div class="clear"></div>
                        
                        <asp:Panel ID="pnlEMMenuArrow" runat="server"><div class="note"><asp:Label ID="lblEMMenuArrow" runat="server" CssClass="normal"></asp:Label></div><input id="chkEMMenuArrow" type="checkbox" class="inptEMMenuArrow" /></asp:Panel>
                        <div class="clear"></div>
                        
                        <asp:Panel ID="pnlEMSubMenuOpacity" runat="server">
                            <div class="note"><asp:Label ID="lblEMSubMenuOpacity" runat="server" CssClass="normal"></asp:Label></div>
                            <div id="EMSubMenuOpacitySlider" class="floatleft"><div class="ui-slider-handle"></div></div>
                            <input id="EMSubMenuOpacity" type="text" maxlength="3" size="2" value="0" class="inptEMSubMenuOpacity" /><span class="normal">&nbsp;%</span>
                            <div class="clear"></div>
                        </asp:Panel>
                    </div>
                    </fieldset>                    
                </div>
                                
                <div id="tab-3">
                    <fieldset>
                    <legend><span class="legend">Banner</span></legend>
                    <div id="EMContainerBanner"> 
                        <asp:Panel ID="pnlEMBannerImage" runat="server">   
                            <ul id="EMBannerImageCarousel" class="jcarousel-skin-banner">
                            <asp:Literal ID="litEMBannerImageCarousel" runat="server"></asp:Literal>
                            </ul>
                            <div class="clear"></div>
                        </asp:Panel>
                        
                        <asp:Panel ID="pnlEMBannerHeight" runat="server">
                            <div class="note"><asp:Label ID="lblEMBannerHeight" runat="server" CssClass="normal"></asp:Label></div>
                            <div id="EMBannerHeightSlider" class="floatleft"><div class="ui-slider-handle"></div></div>
                            <input id="EMBannerHeight" type="text" maxlength="3" size="2" value="0" class="inptEMBannerHeight" /><span class="normal">&nbsp;px</span>
                            <img src="<%= TemplateSourceDirectory %>/images/spacer.gif" class="btn-auto-banner" alt="Auto" />
                            <div class="clear"></div>
                        </asp:Panel>
                        
                        <asp:Panel ID="pnlEMBannerPanePositionTop" runat="server">
                            <div class="note"><asp:Label ID="lblEMBannerPanePositionTop" runat="server" CssClass="normal"></asp:Label></div>
                            <div id="EMBannerPanePositionTopSlider" class="floatleft"><div class="ui-slider-handle"></div></div>
                            <input id="EMBannerPanePositionTop" type="text" maxlength="3" size="2" value="0" class="inptEMBannerPanePositionTop" /><span class="normal">&nbsp;px</span>
                            <div class="clear"></div>
                        </asp:Panel>

                        <asp:Panel ID="pnlEMBannerPanePositionLeft" runat="server">
                            <div class="note"><asp:Label ID="lblEMBannerPanePositionLeft" runat="server" CssClass="normal"></asp:Label></div>
                            <div id="EMBannerPanePositionLeftSlider" class="floatleft"><div class="ui-slider-handle"></div></div>
                            <input id="EMBannerPanePositionLeft" type="text" maxlength="3" size="2" value="0" class="inptEMBannerPanePositionLeft" /><span class="normal">&nbsp;px</span>
                            <div class="clear"></div> 
                        </asp:Panel>
                    
                        <asp:Panel ID="pnlEMBannerPaneWidth" runat="server">
                            <div class="note"><asp:Label ID="lblEMBannerPaneWidth" runat="server" CssClass="normal"></asp:Label></div>
                            <div id="EMBannerPaneWidthSlider" class="floatleft"><div class="ui-slider-handle"></div></div>
                            <input id="EMBannerPaneWidth" type="text" maxlength="3" size="2" value="0" class="inptEMBannerPaneWidth" /><span class="normal">&nbsp;px</span>
                        </asp:Panel>
                    </div>
                    </fieldset>          
                </div>
                    
                <div id="tab-4">                                    
                    <fieldset>
                    <legend><span class="legend">General Text</span></legend>
                    <div id="EMContainerGeneralText">
                        <asp:Panel ID="pnlEMFontColour" runat="server"><div class="note"><asp:Label ID="lblEMFontColour" runat="server" CssClass="normal"></asp:Label></div><div id="EMFontColour"><div></div></div></asp:Panel>
                        <asp:Panel ID="pnlEMLinkColour" runat="server"><div class="note"><asp:Label ID="lblEMLinkColour" runat="server" CssClass="normal"></asp:Label></div><div id="EMLinkColour"><div></div></div></asp:Panel>
                        <asp:Panel ID="pnlEMLinkHoverColour" runat="server"><div class="note"><asp:Label ID="lblEMLinkHoverColour" runat="server" CssClass="normal"></asp:Label></div><div id="EMLinkHoverColour"><div></div></div></asp:Panel>
                        <div class="clear"></div>
                        
                        <asp:Panel ID="pnlEMFontFamily" runat="server"><div class="note"><asp:Label ID="lblEMFontFamily" runat="server" CssClass="normal"></asp:Label></div><asp:DropDownList ID="ddlEMFontFamily" CssClass="inptEMFontFamily" runat="server"></asp:DropDownList></asp:Panel>
                        <div class="clear"></div>
                        
                        <asp:Panel ID="pnlEMFontSize" runat="server">
                            <div class="note"><asp:Label ID="lblEMFontSize" runat="server" CssClass="normal"></asp:Label></div>
                            <div id="EMFontSizeSlider"><div class="ui-slider-handle"></div></div>
                            <input id="EMFontSize" type="text" maxlength="2" size="2" value="0" class="inptEMFontSize" />&nbsp;<span class="normal">px</span>
                        </asp:Panel>
                    </div>
                    </fieldset>
                    
                    <fieldset>
                    <legend><span class="legend">Footer Text</span></legend>
                    <div id="EMContainerFooterText">
                        <asp:Panel ID="pnlEMFooterFontColour" runat="server"><div class="note"><asp:Label ID="lblEMFooterFontColour" runat="server" CssClass="normal"></asp:Label></div><div id="EMFooterFontColour"><div></div></div></asp:Panel>
                        <asp:Panel ID="pnlEMFooterLinkColour" runat="server"><div class="note"><asp:Label ID="lblEMFooterLinkColour" runat="server" CssClass="normal"></asp:Label></div><div id="EMFooterLinkColour"><div></div></div></asp:Panel>
                        <asp:Panel ID="pnlEMFooterLinkHoverColour" runat="server"><div class="note"><asp:Label ID="lblEMFooterLinkHoverColour" runat="server" CssClass="normal"></asp:Label></div><div id="EMFooterLinkHoverColour"><div></div></div></asp:Panel>
                        <div class="clear"></div>

                        <asp:Panel ID="pnlEMFooterFontFamily" runat="server"><div class="note"><asp:Label ID="lblEMFooterFontFamily" runat="server" CssClass="normal"></asp:Label></div><asp:DropDownList ID="ddlEMFooterFontFamily" CssClass="inptEMFooterFontFamily" runat="server"></asp:DropDownList></asp:Panel>
                        <div class="clear"></div>

                        <asp:Panel ID="pnlEMFooterFontSize" runat="server">
                            <div class="note"><asp:Label ID="lblEMFooterFontSize" runat="server" CssClass="normal"></asp:Label></div>
                            <div id="EMFooterFontSizeSlider"><div class="ui-slider-handle"></div></div>
                            <input id="EMFooterFontSize" type="text" maxlength="2" size="2" value="0" class="inptEMFooterFontSize" />&nbsp;<span class="normal">px</span>
                        </asp:Panel>
                    </div>
                    </fieldset>                    
                    
                    <fieldset>
                    <legend><span class="legend">Heading 1 (h1)</span></legend>
                    <div id="EMContainerHText1">
                        <asp:Panel ID="pnlEMHFontColour1" runat="server"><div class="note"><asp:Label ID="lblEMHFontColour1" runat="server" CssClass="normal"></asp:Label></div><div id="EMHFontColour1"><div></div></div></asp:Panel>                        
                        <div class="clear"></div>
                        <asp:Panel ID="pnlEMHFontFamily1" runat="server"><div class="note"><asp:Label ID="lblEMHFontFamily1" runat="server" CssClass="normal"></asp:Label></div><asp:DropDownList ID="ddlEMHFontFamily1" CssClass="inptEMHFontFamily1" runat="server"></asp:DropDownList></asp:Panel>                                            
                        <div class="clear"></div>
                        <asp:Panel ID="pnlEMHFontSize1" runat="server">
                            <div class="note"><asp:Label ID="lblEMHFontSize1" runat="server" CssClass="normal"></asp:Label></div>
                            <div id="EMHFontSize1Slider"><div class="ui-slider-handle"></div></div>
                            <input id="EMHFontSize1" type="text" maxlength="2" size="2" value="0" class="inptEMHFontSize1" />&nbsp;<span class="normal">px</span>
                        </asp:Panel> 
                    </div>
                    </fieldset>  
                    
                    <fieldset>
                    <legend><span class="legend">Heading 2 (h2)</span></legend>
                    <div id="EMContainerHText2">
                        <asp:Panel ID="pnlEMHFontColour2" runat="server"><div class="note"><asp:Label ID="lblEMHFontColour2" runat="server" CssClass="normal"></asp:Label></div><div id="EMHFontColour2"><div></div></div></asp:Panel>                        
                        <div class="clear"></div>
                        <asp:Panel ID="pnlEMHFontFamily2" runat="server"><div class="note"><asp:Label ID="lblEMHFontFamily2" runat="server" CssClass="normal"></asp:Label></div><asp:DropDownList ID="ddlEMHFontFamily2" CssClass="inptEMHFontFamily2" runat="server"></asp:DropDownList></asp:Panel>                                            
                        <div class="clear"></div>
                        <asp:Panel ID="pnlEMHFontSize2" runat="server">
                            <div class="note"><asp:Label ID="lblEMHFontSize2" runat="server" CssClass="normal"></asp:Label></div>
                            <div id="EMHFontSize2Slider"><div class="ui-slider-handle"></div></div>
                            <input id="EMHFontSize2" type="text" maxlength="2" size="2" value="0" class="inptEMHFontSize2" />&nbsp;<span class="normal">px</span>
                        </asp:Panel> 
                    </div>
                    </fieldset> 
                    
                    <fieldset>
                    <legend><span class="legend">Heading 3 (h3)</span></legend>
                    <div id="EMContainerHText3">
                        <asp:Panel ID="pnlEMHFontColour3" runat="server"><div class="note"><asp:Label ID="lblEMHFontColour3" runat="server" CssClass="normal"></asp:Label></div><div id="EMHFontColour3"><div></div></div></asp:Panel>                        
                        <div class="clear"></div>
                        <asp:Panel ID="pnlEMHFontFamily3" runat="server"><div class="note"><asp:Label ID="lblEMHFontFamily3" runat="server" CssClass="normal"></asp:Label></div><asp:DropDownList ID="ddlEMHFontFamily3" CssClass="inptEMHFontFamily3" runat="server"></asp:DropDownList></asp:Panel>                                            
                        <div class="clear"></div>
                        <asp:Panel ID="pnlEMHFontSize3" runat="server">
                            <div class="note"><asp:Label ID="lblEMHFontSize3" runat="server" CssClass="normal"></asp:Label></div>
                            <div id="EMHFontSize3Slider"><div class="ui-slider-handle"></div></div>
                            <input id="EMHFontSize3" type="text" maxlength="2" size="2" value="0" class="inptEMHFontSize3" />&nbsp;<span class="normal">px</span>
                        </asp:Panel> 
                    </div>
                    </fieldset> 
                    
                    <fieldset>
                    <legend><span class="legend">Heading 4 (h4)</span></legend>
                    <div id="EMContainerHText4">
                        <asp:Panel ID="pnlEMHFontColour4" runat="server"><div class="note"><asp:Label ID="lblEMHFontColour4" runat="server" CssClass="normal"></asp:Label></div><div id="EMHFontColour4"><div></div></div></asp:Panel>                        
                        <div class="clear"></div>
                        <asp:Panel ID="pnlEMHFontFamily4" runat="server"><div class="note"><asp:Label ID="lblEMHFontFamily4" runat="server" CssClass="normal"></asp:Label></div><asp:DropDownList ID="ddlEMHFontFamily4" CssClass="inptEMHFontFamily4" runat="server"></asp:DropDownList></asp:Panel>                                            
                        <div class="clear"></div>
                        <asp:Panel ID="pnlEMHFontSize4" runat="server">
                            <div class="note"><asp:Label ID="lblEMHFontSize4" runat="server" CssClass="normal"></asp:Label></div>
                            <div id="EMHFontSize4Slider"><div class="ui-slider-handle"></div></div>
                            <input id="EMHFontSize4" type="text" maxlength="2" size="2" value="0" class="inptEMHFontSize4" />&nbsp;<span class="normal">px</span>
                        </asp:Panel> 
                    </div>
                    </fieldset> 
                    
                    <fieldset>
                    <legend><span class="legend">Heading 5 (h5)</span></legend>
                    <div id="EMContainerHText5">
                        <asp:Panel ID="pnlEMHFontColour5" runat="server"><div class="note"><asp:Label ID="lblEMHFontColour5" runat="server" CssClass="normal"></asp:Label></div><div id="EMHFontColour5"><div></div></div></asp:Panel>                        
                        <div class="clear"></div>
                        <asp:Panel ID="pnlEMHFontFamily5" runat="server"><div class="note"><asp:Label ID="lblEMHFontFamily5" runat="server" CssClass="normal"></asp:Label></div><asp:DropDownList ID="ddlEMHFontFamily5" CssClass="inptEMHFontFamily5" runat="server"></asp:DropDownList></asp:Panel>                                            
                        <div class="clear"></div>
                        <asp:Panel ID="pnlEMHFontSize5" runat="server">
                            <div class="note"><asp:Label ID="lblEMHFontSize5" runat="server" CssClass="normal"></asp:Label></div>
                            <div id="EMHFontSize5Slider"><div class="ui-slider-handle"></div></div>
                            <input id="EMHFontSize5" type="text" maxlength="2" size="2" value="0" class="inptEMHFontSize5" />&nbsp;<span class="normal">px</span>
                        </asp:Panel> 
                    </div>
                    </fieldset> 
                    
                    <fieldset>
                    <legend><span class="legend">Heading 6 (h6)</span></legend>
                    <div id="EMContainerHText6">
                        <asp:Panel ID="pnlEMHFontColour6" runat="server"><div class="note"><asp:Label ID="lblEMHFontColour6" runat="server" CssClass="normal"></asp:Label></div><div id="EMHFontColour6"><div></div></div></asp:Panel>                        
                        <div class="clear"></div>
                        <asp:Panel ID="pnlEMHFontFamily6" runat="server"><div class="note"><asp:Label ID="lblEMHFontFamily6" runat="server" CssClass="normal"></asp:Label></div><asp:DropDownList ID="ddlEMHFontFamily6" CssClass="inptEMHFontFamily6" runat="server"></asp:DropDownList></asp:Panel>                                            
                        <div class="clear"></div>
                        <asp:Panel ID="pnlEMHFontSize6" runat="server">
                            <div class="note"><asp:Label ID="lblEMHFontSize6" runat="server" CssClass="normal"></asp:Label></div>
                            <div id="EMHFontSize6Slider"><div class="ui-slider-handle"></div></div>
                            <input id="EMHFontSize6" type="text" maxlength="2" size="2" value="0" class="inptEMHFontSize6" />&nbsp;<span class="normal">px</span>
                        </asp:Panel> 
                    </div>
                    </fieldset> 
                    
                    <fieldset>
                    <legend><span class="legend">Head (Admin)</span></legend>
                    <div id="EMContainerHeadText">
                        <asp:Panel ID="pnlEMHeadFontColour" runat="server"><div class="note"><asp:Label ID="lblEMHeadFontColour" runat="server" CssClass="normal"></asp:Label></div><div id="EMHeadFontColour"><div></div></div></asp:Panel>                        
                        <div class="clear"></div>
                        <asp:Panel ID="pnlEMHeadFontFamily" runat="server"><div class="note"><asp:Label ID="lblEMHeadFontFamily" runat="server" CssClass="normal"></asp:Label></div><asp:DropDownList ID="ddlEMHeadFontFamily" CssClass="inptEMHeadFontFamily" runat="server"></asp:DropDownList></asp:Panel>
                        <div class="clear"></div>
                        <asp:Panel ID="pnlEMHeadFontSize" runat="server">
                            <div class="note"><asp:Label ID="lblEMHeadFontSize" runat="server" CssClass="normal"></asp:Label></div>
                            <div id="EMHeadFontSizeSlider"><div class="ui-slider-handle"></div></div>
                            <input id="EMHeadFontSize" type="text" maxlength="2" size="2" value="0" class="inptEMHeadFontSize" />&nbsp;<span class="normal">px</span>
                        </asp:Panel>
                    </div>
                    </fieldset>
                    
                    <fieldset>
                    <legend><span class="legend">SubHead (Admin)</span></legend>  
                    <div id="EMContainerSubHeadText">
                        <asp:Panel ID="pnlEMSubHeadFontColour" runat="server"><div class="note"><asp:Label ID="lblEMSubHeadFontColour" runat="server" CssClass="normal"></asp:Label></div><div id="EMSubHeadFontColour"><div></div></div></asp:Panel>                        
                        <div class="clear"></div>
                        <asp:Panel ID="pnlEMSubHeadFontFamily" runat="server"><div class="note"><asp:Label ID="lblEMSubHeadFontFamily" runat="server" CssClass="normal"></asp:Label></div><asp:DropDownList ID="ddlEMSubHeadFontFamily" CssClass="inptEMSubHeadFontFamily" runat="server"></asp:DropDownList></asp:Panel>
                        <div class="clear"></div>
                        <asp:Panel ID="pnlEMSubHeadFontSize" runat="server">
                            <div class="note"><asp:Label ID="lblEMSubHeadFontSize" runat="server" CssClass="normal"></asp:Label></div>
                            <div id="EMSubHeadFontSizeSlider"><div class="ui-slider-handle"></div></div>
                            <input id="EMSubHeadFontSize" type="text" maxlength="2" size="2" value="0" class="inptEMSubHeadFontSize" />&nbsp;<span class="normal">px</span>
                        </asp:Panel>                    
                    </div>
                    </fieldset>                                                                                                                                              
                </div>
                    
                <div id="tab-5">                              
                    <fieldset>
                    <legend><span class="legend">Container Set 1 (Heading)</span></legend>
                    <div id="EMContainerContainerSet1">
                        <asp:Panel ID="pnlEMContainerColour1" runat="server"><div class="note"><asp:Label ID="lblEMContainerColour1" runat="server" CssClass="normal"></asp:Label></div><div id="EMContainerColour1"><div></div></div></asp:Panel>
                        <asp:Panel ID="pnlEMContainerTitleFontColour1" runat="server"><div class="note"><asp:Label ID="lblEMContainerTitleFontColour1" runat="server" CssClass="normal"></asp:Label></div><div id="EMContainerTitleFontColour1"><div></div></div></asp:Panel>
                        <div class="clear"></div>
                        <asp:Panel ID="pnlEMContainerTitleFontFamily1" runat="server"><div class="note"><asp:Label ID="lblEMContainerTitleFontFamily1" runat="server" CssClass="normal"></asp:Label></div><asp:DropDownList ID="ddlEMContainerTitleFontFamily1" CssClass="inptEMContainerTitleFontFamily1" runat="server"></asp:DropDownList></asp:Panel>
                        <div class="clear"></div>
                        <asp:Panel ID="pnlEMContainerTitleFontSize1" runat="server">
                            <div class="note"><asp:Label ID="lblEMContainerTitleFontSize1" runat="server" CssClass="normal"></asp:Label></div>
                            <div id="EMContainerTitleFontSize1Slider"><div class="ui-slider-handle"></div></div>
                            <input id="EMContainerTitleFontSize1" type="text" maxlength="2" size="2" value="0" class="inptEMContainerTitleFontSize1" />&nbsp;<span class="normal">px</span>
                        </asp:Panel> 
                    </div>
                    </fieldset>

                    <fieldset>
                    <legend><span class="legend">Container Set 2 (Heading)</span></legend>
                    <div id="EMContainerContainerSet2">
                        <asp:Panel ID="pnlEMContainerColour2" runat="server"><div class="note"><asp:Label ID="lblEMContainerColour2" runat="server" CssClass="normal"></asp:Label></div><div id="EMContainerColour2"><div></div></div></asp:Panel>
                        <asp:Panel ID="pnlEMContainerTitleFontColour2" runat="server"><div class="note"><asp:Label ID="lblEMContainerTitleFontColour2" runat="server" CssClass="normal"></asp:Label></div><div id="EMContainerTitleFontColour2"><div></div></div></asp:Panel>                       
                        <div class="clear"></div>
                        <asp:Panel ID="pnlEMContainerTitleFontFamily2" runat="server"><div class="note"><asp:Label ID="lblEMContainerTitleFontFamily2" runat="server" CssClass="normal"></asp:Label></div><asp:DropDownList ID="ddlEMContainerTitleFontFamily2" CssClass="inptEMContainerTitleFontFamily2" runat="server"></asp:DropDownList></asp:Panel>
                        <div class="clear"></div>
                        <asp:Panel ID="pnlEMContainerTitleFontSize2" runat="server">
                            <div class="note"><asp:Label ID="lblEMContainerTitleFontSize2" runat="server" CssClass="normal"></asp:Label></div>
                            <div id="EMContainerTitleFontSize2Slider"><div class="ui-slider-handle"></div></div>
                            <input id="EMContainerTitleFontSize2" type="text" maxlength="2" size="2" value="0" class="inptEMContainerTitleFontSize2" />&nbsp;<span class="normal">px</span>
                        </asp:Panel>
                    </div>
                    </fieldset>
                    
                    <fieldset>
                    <legend><span class="legend">Container Set 3 (Heading)</span></legend>
                    <div id="EMContainerContainerSet3">
                        <asp:Panel ID="pnlEMContainerColour3" runat="server"><div class="note"><asp:Label ID="lblEMContainerColour3" runat="server" CssClass="normal"></asp:Label></div><div id="EMContainerColour3"><div></div></div></asp:Panel>
                        <asp:Panel ID="pnlEMContainerTitleFontColour3" runat="server"><div class="note"><asp:Label ID="lblEMContainerTitleFontColour3" runat="server" CssClass="normal"></asp:Label></div><div id="EMContainerTitleFontColour3"><div></div></div></asp:Panel>
                        <div class="clear"></div>
                        <asp:Panel ID="pnlEMContainerTitleFontFamily3" runat="server"><div class="note"><asp:Label ID="lblEMContainerTitleFontFamily3" runat="server" CssClass="normal"></asp:Label></div><asp:DropDownList ID="ddlEMContainerTitleFontFamily3" CssClass="inptEMContainerTitleFontFamily3" runat="server"></asp:DropDownList></asp:Panel>
                        <div class="clear"></div>
                        <asp:Panel ID="pnlEMContainerTitleFontSize3" runat="server">
                            <div class="note"><asp:Label ID="lblEMContainerTitleFontSize3" runat="server" CssClass="normal"></asp:Label></div>
                            <div id="EMContainerTitleFontSize3Slider"><div class="ui-slider-handle"></div></div>
                            <input id="EMContainerTitleFontSize3" type="text" maxlength="2" size="2" value="0" class="inptEMContainerTitleFontSize3" />&nbsp;<span class="normal">px</span>
                        </asp:Panel>                            
                    </div>
                    </fieldset>
                    
                    <fieldset>
                    <legend><span class="legend">Container Set 4 (Heading)</span></legend>
                    <div id="EMContainerContainerSet4">
                        <asp:Panel ID="pnlEMContainerColour4" runat="server"><div class="note"><asp:Label ID="lblEMContainerColour4" runat="server" CssClass="normal"></asp:Label></div><div id="EMContainerColour4"><div></div></div></asp:Panel>
                        <asp:Panel ID="pnlEMContainerTitleFontColour4" runat="server"><div class="note"><asp:Label ID="lblEMContainerTitleFontColour4" runat="server" CssClass="normal"></asp:Label></div><div id="EMContainerTitleFontColour4"><div></div></div></asp:Panel>
                        <div class="clear"></div>
                        <asp:Panel ID="pnlEMContainerTitleFontFamily4" runat="server"><div class="note"><asp:Label ID="lblEMContainerTitleFontFamily4" runat="server" CssClass="normal"></asp:Label></div><asp:DropDownList ID="ddlEMContainerTitleFontFamily4" CssClass="inptEMContainerTitleFontFamily4" runat="server"></asp:DropDownList></asp:Panel>
                        <div class="clear"></div>
                        <asp:Panel ID="pnlEMContainerTitleFontSize4" runat="server">
                            <div class="note"><asp:Label ID="lblEMContainerTitleFontSize4" runat="server" CssClass="normal"></asp:Label></div>
                            <div id="EMContainerTitleFontSize4Slider"><div class="ui-slider-handle"></div></div>
                            <input id="EMContainerTitleFontSize4" type="text" maxlength="2" size="2" value="0" class="inptEMContainerTitleFontSize4" />&nbsp;<span class="normal">px</span>
                        </asp:Panel>                            
                    </div>
                    </fieldset> 
                    
                    <fieldset>
                    <legend><span class="legend">Container Set 5 (Heading)</span></legend>
                    <div id="EMContainerContainerSet5">
                        <asp:Panel ID="pnlEMContainerColour5" runat="server"><div class="note"><asp:Label ID="lblEMContainerColour5" runat="server" CssClass="normal"></asp:Label></div><div id="EMContainerColour5"><div></div></div></asp:Panel>
                        <asp:Panel ID="pnlEMContainerTitleFontColour5" runat="server"><div class="note"><asp:Label ID="lblEMContainerTitleFontColour5" runat="server" CssClass="normal"></asp:Label></div><div id="EMContainerTitleFontColour5"><div></div></div></asp:Panel>
                        <div class="clear"></div>
                        <asp:Panel ID="pnlEMContainerTitleFontFamily5" runat="server"><div class="note"><asp:Label ID="lblEMContainerTitleFontFamily5" runat="server" CssClass="normal"></asp:Label></div><asp:DropDownList ID="ddlEMContainerTitleFontFamily5" CssClass="inptEMContainerTitleFontFamily5" runat="server"></asp:DropDownList></asp:Panel>
                        <div class="clear"></div>
                        <asp:Panel ID="pnlEMContainerTitleFontSize5" runat="server">
                            <div class="note"><asp:Label ID="lblEMContainerTitleFontSize5" runat="server" CssClass="normal"></asp:Label></div>
                            <div id="EMContainerTitleFontSize5Slider"><div class="ui-slider-handle"></div></div>
                            <input id="EMContainerTitleFontSize5" type="text" maxlength="2" size="2" value="0" class="inptEMContainerTitleFontSize5" />&nbsp;<span class="normal">px</span>
                        </asp:Panel>                            
                    </div>
                    </fieldset>

                    <fieldset>
                    <legend><span class="legend">Container Set 6 (Heading)</span></legend>
                    <div id="EMContainerContainerSet6">
                        <asp:Panel ID="pnlEMContainerColour6" runat="server"><div class="note"><asp:Label ID="lblEMContainerColour6" runat="server" CssClass="normal"></asp:Label></div><div id="EMContainerColour6"><div></div></div></asp:Panel>
                        <asp:Panel ID="pnlEMContainerTitleFontColour6" runat="server"><div class="note"><asp:Label ID="lblEMContainerTitleFontColour6" runat="server" CssClass="normal"></asp:Label></div><div id="EMContainerTitleFontColour6"><div></div></div></asp:Panel>
                        <div class="clear"></div>
                        <asp:Panel ID="pnlEMContainerTitleFontFamily6" runat="server"><div class="note"><asp:Label ID="lblEMContainerTitleFontFamily6" runat="server" CssClass="normal"></asp:Label></div><asp:DropDownList ID="ddlEMContainerTitleFontFamily6" CssClass="inptEMContainerTitleFontFamily6" runat="server"></asp:DropDownList></asp:Panel>
                        <div class="clear"></div>
                        <asp:Panel ID="pnlEMContainerTitleFontSize6" runat="server">
                            <div class="note"><asp:Label ID="lblEMContainerTitleFontSize6" runat="server" CssClass="normal"></asp:Label></div>
                            <div id="EMContainerTitleFontSize6Slider"><div class="ui-slider-handle"></div></div>
                            <input id="EMContainerTitleFontSize6" type="text" maxlength="2" size="2" value="0" class="inptEMContainerTitleFontSize6" />&nbsp;<span class="normal">px</span>
                        </asp:Panel>                            
                    </div>
                    </fieldset>
                    
                    <fieldset>
                    <legend><span class="legend">Container Set 7 (Heading)</span></legend>
                    <div id="EMContainerContainerSet7">
                        <asp:Panel ID="pnlEMContainerColour7" runat="server"><div class="note"><asp:Label ID="lblEMContainerColour7" runat="server" CssClass="normal"></asp:Label></div><div id="EMContainerColour7"><div></div></div></asp:Panel>
                        <asp:Panel ID="pnlEMContainerTitleFontColour7" runat="server"><div class="note"><asp:Label ID="lblEMContainerTitleFontColour7" runat="server" CssClass="normal"></asp:Label></div><div id="EMContainerTitleFontColour7"><div></div></div></asp:Panel>
                        <div class="clear"></div>
                        <asp:Panel ID="pnlEMContainerTitleFontFamily7" runat="server"><div class="note"><asp:Label ID="lblEMContainerTitleFontFamily7" runat="server" CssClass="normal"></asp:Label></div><asp:DropDownList ID="ddlEMContainerTitleFontFamily7" CssClass="inptEMContainerTitleFontFamily7" runat="server"></asp:DropDownList></asp:Panel>
                        <div class="clear"></div>
                        <asp:Panel ID="pnlEMContainerTitleFontSize7" runat="server">
                            <div class="note"><asp:Label ID="lblEMContainerTitleFontSize7" runat="server" CssClass="normal"></asp:Label></div>
                            <div id="EMContainerTitleFontSize7Slider"><div class="ui-slider-handle"></div></div>
                            <input id="EMContainerTitleFontSize7" type="text" maxlength="2" size="2" value="0" class="inptEMContainerTitleFontSize7" />&nbsp;<span class="normal">px</span>
                        </asp:Panel>                            
                    </div>
                    </fieldset>
                    
                    <fieldset>
                    <legend><span class="legend">Container Set 8 (Heading)</span></legend>
                    <div id="EMContainerContainerSet8">
                        <asp:Panel ID="pnlEMContainerColour8" runat="server"><div class="note"><asp:Label ID="lblEMContainerColour8" runat="server" CssClass="normal"></asp:Label></div><div id="EMContainerColour8"><div></div></div></asp:Panel>
                        <asp:Panel ID="pnlEMContainerTitleFontColour8" runat="server"><div class="note"><asp:Label ID="lblEMContainerTitleFontColour8" runat="server" CssClass="normal"></asp:Label></div><div id="EMContainerTitleFontColour8"><div></div></div></asp:Panel>
                        <div class="clear"></div>
                        <asp:Panel ID="pnlEMContainerTitleFontFamily8" runat="server"><div class="note"><asp:Label ID="lblEMContainerTitleFontFamily8" runat="server" CssClass="normal"></asp:Label></div><asp:DropDownList ID="ddlEMContainerTitleFontFamily8" CssClass="inptEMContainerTitleFontFamily8" runat="server"></asp:DropDownList></asp:Panel>
                        <div class="clear"></div>
                        <asp:Panel ID="pnlEMContainerTitleFontSize8" runat="server">
                            <div class="note"><asp:Label ID="lblEMContainerTitleFontSize8" runat="server" CssClass="normal"></asp:Label></div>
                            <div id="EMContainerTitleFontSize8Slider"><div class="ui-slider-handle"></div></div>
                            <input id="EMContainerTitleFontSize8" type="text" maxlength="2" size="2" value="0" class="inptEMContainerTitleFontSize8" />&nbsp;<span class="normal">px</span>
                        </asp:Panel>                            
                    </div>
                    </fieldset>                                                                                                                                                   
                </div>
            </div>
        </div>
    </asp:Panel>

    <asp:Panel ID="pnlStep3" runat="server">
        <div id="EMContainerStep3">
            <p>Select which template to apply these settings to.</p>
            <p>
            <strong>Save</strong> - to store the settings without publishing them.<br />
            <strong>Publish</strong> - to make the settings <strong>live</strong> on the selected template.
            </p>
            
            <fieldset>
            <legend><span class="legend">Save EasyMod settings to <asp:Literal ID="litSaveSkinName" runat="server"></asp:Literal></span></legend>                                 
            <div id="EMContainerSave">
                <table cellpadding="3" cellspacing="0" border="0">
                <tr>
                <td><asp:DropDownList ID="ddlSaveSkins" runat="server"></asp:DropDownList></td>
                <td><asp:ImageButton ID="btnStore" runat="server" AlternateText="Save Settings" CssClass="btn-store" /></td>
                <td><asp:ImageButton ID="btnPublish" runat="server" AlternateText="Publish Skin" CssClass="btn-publish" OnClientClick="return confirm('Please confirm you wish to make any changes live?')" /></td>
                </tr>
                </table>
            </div>
            </fieldset>
        </div>
    </asp:Panel>

    <div class="clear"></div>

    <table cellpadding="0" cellspacing="0" border="0" style="width:100%;">
    <tr>
    <td class="footer-l"><img src="<%= TemplateSourceDirectory %>/images/spacer.gif" alt="" /></td>
    <td class="footer-copyright"><asp:Label ID="lblCopyright" runat="server" CssClass="normal"></asp:Label></td>
    <td class="footer-r"><img src="<%= TemplateSourceDirectory %>/images/spacer.gif" alt="" /></td>
    <td class="footer-buttons"><asp:ImageButton ID="imgBack" runat="server" Enabled="False" CssClass="btn-back" /><asp:ImageButton ID="imgNext" runat="server" Enabled="False" CssClass="btn-next" /></td>
    </tr>
    </table>
        
    <asp:TextBox ID="txtEMSkinName" runat="server" CssClass="hidEMSkinName EMHidField"></asp:TextBox>
    <asp:TextBox ID="txtEMSkinAuthor" runat="server" CssClass="hidEMSkinAuthor EMHidField"></asp:TextBox>
    <asp:TextBox ID="txtEMSkinVersion" runat="server" CssClass="hidEMSkinVersion EMHidField"></asp:TextBox>
    <asp:TextBox ID="txtEMSkinPath" runat="server" CssClass="hidEMSkinPath EMHidField"></asp:TextBox>
    <asp:TextBox ID="txtEMBaseColour1" runat="server" CssClass="hidEMBaseColour1 EMHidField"></asp:TextBox>
    <asp:TextBox ID="txtEMBaseColour2" runat="server" CssClass="hidEMBaseColour2 EMHidField"></asp:TextBox>
    <asp:TextBox ID="txtEMBaseColour3" runat="server" CssClass="hidEMBaseColour3 EMHidField"></asp:TextBox>
    <asp:TextBox ID="txtEMBaseColour4" runat="server" CssClass="hidEMBaseColour4 EMHidField"></asp:TextBox>
    <asp:TextBox ID="txtEMBaseColour5" runat="server" CssClass="hidEMBaseColour5 EMHidField"></asp:TextBox>
    <asp:TextBox ID="txtEMBaseColour6" runat="server" CssClass="hidEMBaseColour6 EMHidField"></asp:TextBox>
    <asp:TextBox ID="txtEMBaseColour7" runat="server" CssClass="hidEMBaseColour7 EMHidField"></asp:TextBox>
    <asp:TextBox ID="txtEMBaseColour8" runat="server" CssClass="hidEMBaseColour8 EMHidField"></asp:TextBox>    
    <asp:TextBox ID="txtEMBackgroundColour" runat="server" CssClass="hidEMBackgroundColour EMHidField"></asp:TextBox>
    <asp:TextBox ID="txtEMBackgroundImage" runat="server" CssClass="hidEMBackgroundImage EMHidField"></asp:TextBox>
    <asp:TextBox ID="txtEMBackgroundImageRepeat" runat="server" CssClass="hidEMBackgroundImageRepeat EMHidField"></asp:TextBox>
    <asp:TextBox ID="txtEMBackgroundImageAttachment" runat="server" CssClass="hidEMBackgroundImageAttachment EMHidField"></asp:TextBox>
    <asp:TextBox ID="txtEMBackgroundImagePositionH" runat="server" CssClass="hidEMBackgroundImagePositionH EMHidField"></asp:TextBox>
    <asp:TextBox ID="txtEMBackgroundImagePositionV" runat="server" CssClass="hidEMBackgroundImagePositionV EMHidField"></asp:TextBox>
    <asp:TextBox ID="txtEMBorderStyle" runat="server" CssClass="hidEMBorderStyle EMHidField"></asp:TextBox>
    <asp:TextBox ID="txtEMMainMenuItemOn" runat="server" CssClass="hidEMMainMenuItemOn EMHidField"></asp:TextBox>
    <asp:TextBox ID="txtEMMainMenuItemOff" runat="server" CssClass="hidEMMainMenuItemOff EMHidField"></asp:TextBox>
    <asp:TextBox ID="txtEMSubMenuItemOn" runat="server" CssClass="hidEMSubMenuItemOn EMHidField"></asp:TextBox>
    <asp:TextBox ID="txtEMSubMenuItemOff" runat="server" CssClass="hidEMSubMenuItemOff EMHidField"></asp:TextBox>
    <asp:TextBox ID="txtEMSubMenuItemBGOn" runat="server" CssClass="hidEMSubMenuItemBGOn EMHidField"></asp:TextBox>
    <asp:TextBox ID="txtEMSubMenuItemBGOff" runat="server" CssClass="hidEMSubMenuItemBGOff EMHidField"></asp:TextBox>
    <asp:TextBox ID="txtEMBannerImage" runat="server" CssClass="hidEMBannerImage EMHidField"></asp:TextBox>
    <asp:TextBox ID="txtEMBannerImageBG" runat="server" CssClass="hidEMBannerImageBG EMHidField"></asp:TextBox>
    <asp:TextBox ID="txtEMBannerHeight" runat="server" CssClass="hidEMBannerHeight EMHidField"></asp:TextBox>
    <asp:TextBox ID="txtEMBannerPanePositionTop" runat="server" CssClass="hidEMBannerPanePositionTop EMHidField"></asp:TextBox>
    <asp:TextBox ID="txtEMBannerPanePositionLeft" runat="server" CssClass="hidEMBannerPanePositionLeft EMHidField"></asp:TextBox>
    <asp:TextBox ID="txtEMBannerPaneWidth" runat="server" CssClass="hidEMBannerPaneWidth EMHidField"></asp:TextBox>
    <asp:TextBox ID="txtEMWidth" runat="server" CssClass="hidEMWidth EMHidField"></asp:TextBox>
    <asp:TextBox ID="txtEMWidthUnits" runat="server" CssClass="hidEMWidthUnits EMHidField"></asp:TextBox>
    <asp:TextBox ID="txtEMFullHeight" runat="server" CssClass="hidEMFullHeight EMHidField"></asp:TextBox>
    <asp:TextBox ID="txtEMMenuArrow" runat="server" CssClass="hidEMMenuArrow EMHidField"></asp:TextBox>
    <asp:TextBox ID="txtEMSubMenuOpacity" runat="server" CssClass="hidEMSubMenuOpacity EMHidField"></asp:TextBox>
    <asp:TextBox ID="txtEMLogo" runat="server" CssClass="hidEMLogo EMHidField"></asp:TextBox>
    <asp:TextBox ID="txtEMLanguage" runat="server" CssClass="hidEMLanguage EMHidField"></asp:TextBox>
    <asp:TextBox ID="txtEMSearch" runat="server" CssClass="hidEMSearch EMHidField"></asp:TextBox>
    <asp:TextBox ID="txtEMDate" runat="server" CssClass="hidEMDate EMHidField"></asp:TextBox>
    <asp:TextBox ID="txtEMBreadcrumb" runat="server" CssClass="hidEMBreadcrumb EMHidField"></asp:TextBox>
    <asp:TextBox ID="txtEMCopyright" runat="server" CssClass="hidEMCopyright EMHidField"></asp:TextBox>
    <asp:TextBox ID="txtEMTerms" runat="server" CssClass="hidEMTerms EMHidField"></asp:TextBox>
    <asp:TextBox ID="txtEMPrivacy" runat="server" CssClass="hidEMPrivacy EMHidField"></asp:TextBox>
    <asp:TextBox ID="txtEMMainMenuFont" runat="server" CssClass="hidEMMainMenuFont EMHidField"></asp:TextBox>
    <asp:TextBox ID="txtEMHeadFontFamily" runat="server" CssClass="hidEMHeadFontFamily EMHidField"></asp:TextBox>
    <asp:TextBox ID="txtEMHeadFontColour" runat="server" CssClass="hidEMHeadFontColour EMHidField"></asp:TextBox>    
    <asp:TextBox ID="txtEMHeadFontSize" runat="server" CssClass="hidEMHeadFontSize EMHidField"></asp:TextBox>
    <asp:TextBox ID="txtEMSubHeadFontFamily" runat="server" CssClass="hidEMSubHeadFontFamily EMHidField"></asp:TextBox>
    <asp:TextBox ID="txtEMSubHeadFontColour" runat="server" CssClass="hidEMSubHeadFontColour EMHidField"></asp:TextBox>    
    <asp:TextBox ID="txtEMSubHeadFontSize" runat="server" CssClass="hidEMSubHeadFontSize EMHidField"></asp:TextBox>
    <asp:TextBox ID="txtEMHFontFamily1" runat="server" CssClass="hidEMHFontFamily1 EMHidField"></asp:TextBox>
    <asp:TextBox ID="txtEMHFontColour1" runat="server" CssClass="hidEMHFontColour1 EMHidField"></asp:TextBox>    
    <asp:TextBox ID="txtEMHFontSize1" runat="server" CssClass="hidEMHFontSize1 EMHidField"></asp:TextBox>    
    <asp:TextBox ID="txtEMHFontFamily2" runat="server" CssClass="hidEMHFontFamily2 EMHidField"></asp:TextBox>
    <asp:TextBox ID="txtEMHFontColour2" runat="server" CssClass="hidEMHFontColour2 EMHidField"></asp:TextBox>    
    <asp:TextBox ID="txtEMHFontSize2" runat="server" CssClass="hidEMHFontSize2 EMHidField"></asp:TextBox>    
    <asp:TextBox ID="txtEMHFontFamily3" runat="server" CssClass="hidEMHFontFamily3 EMHidField"></asp:TextBox>
    <asp:TextBox ID="txtEMHFontColour3" runat="server" CssClass="hidEMHFontColour3 EMHidField"></asp:TextBox>    
    <asp:TextBox ID="txtEMHFontSize3" runat="server" CssClass="hidEMHFontSize3 EMHidField"></asp:TextBox>    
    <asp:TextBox ID="txtEMHFontFamily4" runat="server" CssClass="hidEMHFontFamily4 EMHidField"></asp:TextBox>
    <asp:TextBox ID="txtEMHFontColour4" runat="server" CssClass="hidEMHFontColour4 EMHidField"></asp:TextBox>    
    <asp:TextBox ID="txtEMHFontSize4" runat="server" CssClass="hidEMHFontSize4 EMHidField"></asp:TextBox>    
    <asp:TextBox ID="txtEMHFontFamily5" runat="server" CssClass="hidEMHFontFamily5 EMHidField"></asp:TextBox>
    <asp:TextBox ID="txtEMHFontColour5" runat="server" CssClass="hidEMHFontColour5 EMHidField"></asp:TextBox>    
    <asp:TextBox ID="txtEMHFontSize5" runat="server" CssClass="hidEMHFontSize5 EMHidField"></asp:TextBox>    
    <asp:TextBox ID="txtEMHFontFamily6" runat="server" CssClass="hidEMHFontFamily6 EMHidField"></asp:TextBox>
    <asp:TextBox ID="txtEMHFontColour6" runat="server" CssClass="hidEMHFontColour6 EMHidField"></asp:TextBox>    
    <asp:TextBox ID="txtEMHFontSize6" runat="server" CssClass="hidEMHFontSize6 EMHidField"></asp:TextBox>    
    <asp:TextBox ID="txtEMFontFamily" runat="server" CssClass="hidEMFontFamily EMHidField"></asp:TextBox>
    <asp:TextBox ID="txtEMFontColour" runat="server" CssClass="hidEMFontColour EMHidField"></asp:TextBox>
    <asp:TextBox ID="txtEMFontSize" runat="server" CssClass="hidEMFontSize EMHidField"></asp:TextBox>
    <asp:TextBox ID="txtEMLinkColour" runat="server" CssClass="hidEMLinkColour EMHidField"></asp:TextBox>
    <asp:TextBox ID="txtEMLinkHoverColour" runat="server" CssClass="hidEMLinkHoverColour EMHidField"></asp:TextBox>
    <asp:TextBox ID="txtEMFooterFontFamily" runat="server" CssClass="hidEMFooterFontFamily EMHidField"></asp:TextBox>
    <asp:TextBox ID="txtEMFooterFontColour" runat="server" CssClass="hidEMFooterFontColour EMHidField"></asp:TextBox>
    <asp:TextBox ID="txtEMFooterFontSize" runat="server" CssClass="hidEMFooterFontSize EMHidField"></asp:TextBox>    
    <asp:TextBox ID="txtEMFooterLinkColour" runat="server" CssClass="hidEMFooterLinkColour EMHidField"></asp:TextBox>
    <asp:TextBox ID="txtEMFooterLinkHoverColour" runat="server" CssClass="hidEMFooterLinkHoverColour EMHidField"></asp:TextBox>
    <asp:TextBox ID="txtEMContainerColour1" runat="server" CssClass="hidEMContainerColour1 EMHidField"></asp:TextBox>
    <asp:TextBox ID="txtEMContainerColour2" runat="server" CssClass="hidEMContainerColour2 EMHidField"></asp:TextBox>
    <asp:TextBox ID="txtEMContainerColour3" runat="server" CssClass="hidEMContainerColour3 EMHidField"></asp:TextBox>
    <asp:TextBox ID="txtEMContainerColour4" runat="server" CssClass="hidEMContainerColour4 EMHidField"></asp:TextBox>
    <asp:TextBox ID="txtEMContainerColour5" runat="server" CssClass="hidEMContainerColour5 EMHidField"></asp:TextBox>
    <asp:TextBox ID="txtEMContainerColour6" runat="server" CssClass="hidEMContainerColour6 EMHidField"></asp:TextBox>
    <asp:TextBox ID="txtEMContainerColour7" runat="server" CssClass="hidEMContainerColour7 EMHidField"></asp:TextBox>
    <asp:TextBox ID="txtEMContainerColour8" runat="server" CssClass="hidEMContainerColour8 EMHidField"></asp:TextBox>
    <asp:TextBox ID="txtEMContainerTitleFontFamily1" runat="server" CssClass="hidEMContainerTitleFontFamily1 EMHidField"></asp:TextBox>
    <asp:TextBox ID="txtEMContainerTitleFontFamily2" runat="server" CssClass="hidEMContainerTitleFontFamily2 EMHidField"></asp:TextBox>
    <asp:TextBox ID="txtEMContainerTitleFontFamily3" runat="server" CssClass="hidEMContainerTitleFontFamily3 EMHidField"></asp:TextBox>
    <asp:TextBox ID="txtEMContainerTitleFontFamily4" runat="server" CssClass="hidEMContainerTitleFontFamily4 EMHidField"></asp:TextBox>
    <asp:TextBox ID="txtEMContainerTitleFontFamily5" runat="server" CssClass="hidEMContainerTitleFontFamily5 EMHidField"></asp:TextBox>
    <asp:TextBox ID="txtEMContainerTitleFontFamily6" runat="server" CssClass="hidEMContainerTitleFontFamily6 EMHidField"></asp:TextBox>
    <asp:TextBox ID="txtEMContainerTitleFontFamily7" runat="server" CssClass="hidEMContainerTitleFontFamily7 EMHidField"></asp:TextBox>
    <asp:TextBox ID="txtEMContainerTitleFontFamily8" runat="server" CssClass="hidEMContainerTitleFontFamily8 EMHidField"></asp:TextBox>
    <asp:TextBox ID="txtEMContainerTitleFontColour1" runat="server" CssClass="hidEMContainerTitleFontColour1 EMHidField"></asp:TextBox>
    <asp:TextBox ID="txtEMContainerTitleFontColour2" runat="server" CssClass="hidEMContainerTitleFontColour2 EMHidField"></asp:TextBox>
    <asp:TextBox ID="txtEMContainerTitleFontColour3" runat="server" CssClass="hidEMContainerTitleFontColour3 EMHidField"></asp:TextBox>
    <asp:TextBox ID="txtEMContainerTitleFontColour4" runat="server" CssClass="hidEMContainerTitleFontColour4 EMHidField"></asp:TextBox>
    <asp:TextBox ID="txtEMContainerTitleFontColour5" runat="server" CssClass="hidEMContainerTitleFontColour5 EMHidField"></asp:TextBox>
    <asp:TextBox ID="txtEMContainerTitleFontColour6" runat="server" CssClass="hidEMContainerTitleFontColour6 EMHidField"></asp:TextBox>
    <asp:TextBox ID="txtEMContainerTitleFontColour7" runat="server" CssClass="hidEMContainerTitleFontColour7 EMHidField"></asp:TextBox>
    <asp:TextBox ID="txtEMContainerTitleFontColour8" runat="server" CssClass="hidEMContainerTitleFontColour8 EMHidField"></asp:TextBox>
    <asp:TextBox ID="txtEMContainerTitleFontSize1" runat="server" CssClass="hidEMContainerTitleFontSize1 EMHidField"></asp:TextBox>
    <asp:TextBox ID="txtEMContainerTitleFontSize2" runat="server" CssClass="hidEMContainerTitleFontSize2 EMHidField"></asp:TextBox>
    <asp:TextBox ID="txtEMContainerTitleFontSize3" runat="server" CssClass="hidEMContainerTitleFontSize3 EMHidField"></asp:TextBox>
    <asp:TextBox ID="txtEMContainerTitleFontSize4" runat="server" CssClass="hidEMContainerTitleFontSize4 EMHidField"></asp:TextBox>
    <asp:TextBox ID="txtEMContainerTitleFontSize5" runat="server" CssClass="hidEMContainerTitleFontSize5 EMHidField"></asp:TextBox>
    <asp:TextBox ID="txtEMContainerTitleFontSize6" runat="server" CssClass="hidEMContainerTitleFontSize6 EMHidField"></asp:TextBox>
    <asp:TextBox ID="txtEMContainerTitleFontSize7" runat="server" CssClass="hidEMContainerTitleFontSize7 EMHidField"></asp:TextBox>
    <asp:TextBox ID="txtEMContainerTitleFontSize8" runat="server" CssClass="hidEMContainerTitleFontSize8 EMHidField"></asp:TextBox>

</div>