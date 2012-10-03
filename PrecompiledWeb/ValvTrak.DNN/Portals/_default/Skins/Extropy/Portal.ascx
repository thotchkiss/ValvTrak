<%@ Control language="vb" AutoEventWireup="false" Explicit="True" Inherits="DotNetNuke.UI.Skins.Skin" %>
<%@ Register TagPrefix="dnn" TagName="LOGIN" Src="~/Admin/Skins/Login.ascx" %>
<%@ Register TagPrefix="dnn" TagName="USER" Src="~/Admin/Skins/User.ascx" %>
<%@ Register TagPrefix="dnn" TagName="LANGUAGE" Src="~/Admin/Skins/Language.ascx" %>
<%@ Register TagPrefix="dnn" TagName="SEARCH" Src="~/Admin/Skins/Search.ascx" %>
<%@ Register TagPrefix="dnn" TagName="LOGO" Src="~/Admin/Skins/Logo.ascx" %>
<%@ Register TagPrefix="dnn" TagName="NAV" Src="~/Admin/Skins/Nav.ascx" %>
<%@ Register TagPrefix="dnn" TagName="CURRENTDATE" Src="~/Admin/Skins/CurrentDate.ascx" %>
<%@ Register TagPrefix="dnn" TagName="BREADCRUMB" Src="~/Admin/Skins/BreadCrumb.ascx" %>
<%@ Register TagPrefix="dnn" TagName="LINKS" Src="~/Admin/Skins/Links.ascx" %>
<%@ Register TagPrefix="dnn" TagName="TERMS" Src="~/Admin/Skins/Terms.ascx" %>
<%@ Register TagPrefix="dnn" TagName="PRIVACY" Src="~/Admin/Skins/Privacy.ascx" %>
<%@ Register TagPrefix="dnn" TagName="COPYRIGHT" Src="~/Admin/Skins/Copyright.ascx" %>
<%@ Register TagPrefix="dnn" TagName="DOTNETNUKE" Src="~/Admin/Skins/DotNetNuke.ascx" %>

<!-- *********************************************************************** -->
<!--                 BEGIN DOTNETNUKE SKIN TEMPLATE                          -->
<!-- *********************************************************************** -->
<div runat="server" id="ControlPanel" ></div>
<div id="Layout-Background">
    <div id="Layout-Grid">
        <div id="Layout-TopRow">
                <div id="Layout-TopRow-Profile">
                    <dnn:LOGIN runat="server" id="dnnLogin"  cssclass="ServerSkinWidget" />
                    <dnn:USER runat="server" id="dnnUser"  cssclass="ServerSkinWidget" text="" url="" />
                    <dnn:LANGUAGE runat="server" id="dnnLanguage"  cssclass="ServerSkinWidget" showMenu="False" showLinks="True" />
                </div>
                <div id="Layout-TopRow-Search">
                    <dnn:SEARCH runat="server" id="dnnSearch"  cssclass="ServerSkinWidget" showWeb="False" showSite="False" />
                </div>        
        </div>
        <div id="Layout-Masthead">                
            <div id="Layout-Cell-N">

                <div id="Layout-Cell-NW"></div>

                <div id="Layout-Masthead-Identity-Logo">
                    <dnn:LOGO runat="server" id="dnnLogo"  borderWidth="0" />
                </div>  

                <div id="Layout-Cell-NE"></div>

                <div id="Layout-Masthead-Identity-Graphic">
                    <object id="HeaderRotator" codetype="dotnetnuke/client" codebase="RotatorWidget" declare="declare">
                        <param name="height" value="129" />
                        <param name="width" value="479" />
                        <param name="imageUrl" value="<%=SkinPath %>images/headers/" />
                        <param name="imageCount" value="6" />
                        <param name="imageTemplate" value="header_0{INDEX}.png" />
                        <param name="interval" value="5000" />
                        <param name="direction" value="left" />
                        <param name="transition" value="snap" />
                    </object>
                    
                </div>  

                <div id="Layout-Masthead-NavBar">
                <object id="Toolbox" codetype="dotnetnuke/client" codebase="VisibilityWidget" declare="declare">
                        <param name="expandClassName" value="Layout-Masthead-InfoBar-ToolBoxIcon-Expanded" />
                        <param name="collapseClassName" value="Layout-Masthead-InfoBar-ToolBoxIcon-Collapsed" />
                        <param name="targetElementId" value="Layout-ToolBox" />
                        <param name="title" value="Toolbox" />
                </object>                    

                <dnn:NAV runat="server" id="dnnNav"  cssclass="ServerSkinWidget" IndicateChildImageExpandedRoot="action_down.gif" IndicateChildren="true" providername="DNNMenuNavigationProvider" toolTip="description" populateNodesFromClient="False" expandDepth="4" startTabId="-1" pathSystemScript="" pathSystemImage="" pathImage="" workImage="" controlOrientation="horizontal" cssControl="Menu-Control" cssNodeRoot="Menu-Root" cssBreadCrumbRoot="Menu-Root-ChildSelected" cssNodeSelectedRoot="Menu-Root-Selected" cssNodeHoverRoot="Menu-Root-Hover" cssContainerSub="Menu-Child-Container" cssNode="Menu-Child" cssBreadCrumbSub="Menu-Child-ChildSelected" cssNodeSelectedSub="Menu-Child-Selected" cssNodeHoverSub="Menu-Child-Hover" cssIcon="Menu-Icon" />
            </div>
                <div id="Layout-Masthead-InfoBar">
                    <div id="Layout-Masthead-InfoBar-Date">
                        <dnn:CURRENTDATE runat="server" id="dnnCurrentDate"  cssclass="ServerSkinWidget" />
                    </div>


                    <div id="Layout-Masthead-InfoBar-BreadCrumbs">
                        <dnn:BREADCRUMB runat="server" id="dnnBreadCrumb"  cssclass="ServerSkinWidget" separator="&lt;span&gt;&nbsp;&gt;&nbsp;&lt;/span&gt;" rootLevel="0" />
                    </div>       
                </div>
        
            </div>        
        </div>

        
        <div id="Layout-Cell-W">
            <div id="Layout-Cell-E">
                <div id="Layout-ToolBox">
                    <div id="WidgetPanel">
                        <!-- Begin Text Sizer widget      -->
                        <object id="TextSizeWidget" codetype="dotnetnuke/client" codebase="StyleSheetWidget" declare="declare">
                                <param name="baseUrl" value="<%= SkinPath %>stylesheets/textsizes/" />
                                <param name="template" value="&lt;input type='button' title='{TEXT}' value='' {ID} {CLASS} /&gt; " />
                                <param name="default" value="textsize-small" />

                                <param name="Small Text" value="textsize-small" />
                                <param name="Medium Text" value="textsize-medium" />
                                <param name="Large Text" value="textsize-large" />
                        </object>
                            <!-- param name="Giant Text" value="textsize-giant" / -->       
                        <!-- End Text Sizer widget       -->    

                        <!-- Begin Layout Switcher widget -->
                        <object id="LayoutWidget" codetype="dotnetnuke/client" codebase="StyleSheetWidget" declare="declare">
                                <param name="baseUrl" value="<%= SkinPath %>stylesheets/layouts/" />
                                <param name="template" value="&lt;input type='button' title='{TEXT}' value='' {ID} {CLASS} /&gt; " />
                                <param name="default" value="layout-1024" />
                                
                                <param name="Small (1024 pixels wide)" value="layout-1024" />
                                <param name="Medium (1400 pixels wide)" value="layout-1400" />
                                <param name="Large (1680 pixels wide)" value="layout-1680" />
                        </object>
                        
                            <!-- param name="SXGA (1280)" value="layout-1280" / -->
                            <!-- param name="WUXGA (1920)" value="layout-1920" / -->
                            <!-- param name="Flex (Browser width)" value="layout-flex" / -->
                        <!-- End Layout Switcher widget   -->

                        <!-- Begin Color Palette widget      -->
                        <object id="ColorPaletteWidget" codetype="dotnetnuke/client" codebase="StyleSheetWidget" declare="declare">
                                <param name="baseUrl" value="<%= SkinPath %>stylesheets/palettes/" />
                                <param name="template" value="&lt;input type='button' title='{TEXT}' value='' {ID} {CLASS} /&gt; " />
                                <param name="default" value="blue/palette-blue" />
                                
                                <param name="Blue" value="blue/palette-blue" />
                                <param name="Teal" value="teal/palette-teal" />
                                <param name="Brown" value="brown/palette-brown" />
                                <param name="Green" value="green/palette-green" />
                                <param name="Pink" value="pink/palette-pink" />
                                <param name="Orange" value="orange/palette-orange" />
                                <param name="Red" value="red/palette-red" />
                                <param name="Grayscale" value="grayscale/palette-grayscale" />
                        </object>
                        <!-- End Color Palette widget       -->
                    </div>
                                        
                </div>

                <div id="Layout-Content">
                    <div runat="server" id="TopPane"  cssclass="Layout-ContentPane" ></div>

                    <table class="Layout-Table">    
	                    <tr>
		                    <td id="LeftPane" class="Layout-SidePane" runat="server"></td>
		                    <td id="ContentPane" class="Layout-ContentPane" runat="server"></td>    
		                    <td id="RightPane" class="Layout-SidePane" runat="server"></td>
	                    </tr>
                    </table>
                    
                    <table class="Layout-Table">    
	                    <tr>
		                    <td id="SidePane" class="Layout-SidePane" runat="server"></td>
		                    <td id="WidePane" class="Layout-WidePane" runat="server"></td>
	                    </tr>
                    </table>
                                        
                    <div>
	                    <div id="LeftHalfPane" class="Layout-LeftHalfPane" runat="server"></div>
	                    <div id="RightHalfPane" class="Layout-RightHalfPane" runat="server"></div>		            
		            </div>

                    <div runat="server" id="BottomPane"  cssclass="Layout-ContentPane" ></div>

                </div>
            </div>
        </div>

        <div id="Layout-Cell-S">
            <div id="Layout-Cell-SW"></div>
            <div id="Layout-Cell-SE"></div>
            <div id="Layout-Bottom">
                <dnn:LINKS runat="server" id="dnnLinks"  cssclass="ServerSkinWidget" separator=" | " disabled="False" />
                <div>
                    <dnn:TERMS runat="server" id="dnnTerms"  cssclass="ServerSkinWidget" />
                    <dnn:PRIVACY runat="server" id="dnnPrivacy"  cssclass="ServerSkinWidget" />
                    <dnn:COPYRIGHT runat="server" id="dnnCopyright"  cssclass="ServerSkinWidget" />
                </div>
                <dnn:DOTNETNUKE runat="server" id="dnnDotNetNuke"  cssclass="ServerSkinWidget" />
            </div>
        </div>
    
    </div>    
</div>

<object id="StyleScrubber" codetype="dotnetnuke/client" codebase="StyleScrubberWidget" declare="declare">
    <param name="classNames" value="ServerSkinWidget" />
    <param name="removeAttribute" value="style" />
    <param name="recursive" value="True" />
</object>

<!-- *********************************************************************** -->
<!--                  END DOTNETNUKE SKIN TEMPLATE                           -->
<!-- *********************************************************************** -->


