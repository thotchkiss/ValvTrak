<%@ Control language="vb" AutoEventWireup="false" Explicit="True" Inherits="DotNetNuke.UI.Skins.Skin" %>
<%@ Register TagPrefix="dnn" TagName="LOGIN" Src="~/Admin/Skins/Login.ascx" %>
<%@ Register TagPrefix="dnn" TagName="LOGO" Src="~/Admin/Skins/Logo.ascx" %>
<%@ Register TagPrefix="dnn" TagName="USER" Src="~/Admin/Skins/User.ascx" %>
<%@ Register TagPrefix="dnn" TagName="SOLPARTMENU" Src="~/Admin/Skins/SolPartMenu.ascx" %>
<%@ Register TagPrefix="dnn" TagName="BREADCRUMB" Src="~/Admin/Skins/BreadCrumb.ascx" %>
<%@ Register TagPrefix="dnn" TagName="SEARCH" Src="~/Admin/Skins/Search.ascx" %>
<%@ Register TagPrefix="dnn" TagName="CURRENTDATE" Src="~/Admin/Skins/CurrentDate.ascx" %>
<%@ Register TagPrefix="dnn" TagName="COPYRIGHT"   Src="~/Admin/Skins/Copyright.ascx" %>
<%@ Register TagPrefix="dnn" TagName="PRIVACY"     Src="~/Admin/Skins/Privacy.ascx" %>
<%@ Register TagPrefix="dnn" TagName="TERMS"       Src="~/Admin/Skins/Terms.ascx" %>

<link href="skin.css" rel="stylesheet" type="text/css">
<link href="<%=skinpath%>Open.css" rel="stylesheet" type="text/css" />

<div id="PageBgImage">

<div id="OuterContainer" class="w800x600">
	<div id="OuterContainerTop">
		<img src="<%=skinpath%>images/dummy.gif" alt="dummy" width="10" height="10" class="corner" style="display: none;">
	</div>
	<div id="OuterContainerMiddle">
		<div id="OuterContainerMiddlePadding">
			<div id="HeaderRow">
				<div id="Logo"><dnn:LOGO runat="server" id="dnnLOGO" CssClass="LOGO_object" /></div>
				<div id="Search"><dnn:SEARCH runat="server" id="dnnSEARCH" cssClass="SearchButton" Submit="<div></div>" /></div>
			</div>			
		
			<div id="NavBar">
					<table border="0" cellpadding="0" cellspacing="0" width="100%">
						<tr>
							<td id="NavBarBgL"><img src="<%=skinpath%>images/dummy.gif" alt="canto do menu" border="0"></td>
							<td id="Nav">
								<dnn:SOLPARTMENU
									runat="server"
									id="dnnSOLPARTMENU"
									menualignment="left"
									separatecss="true"
									display="horizontal"
									userootbreadcrumbarrow="false"
									usesubmenubreadcrumbarrow="false"
									menueffectsmenutransition=""
									menueffectsmenutransitionlength=""
					                menueffectsshadowstrength=""
									rootmenuitemcssclass="MainMenu_Idle"
									rootmenuitemactivecssclass="MainMenu_Active"
									rootmenuitemselectedcssclass="MainMenu_Selected"
									rootmenuitembreadcrumbcssclass="MainMenu_BreadcrumbActive"
									rootmenuitemlefthtml=""
									rootmenuitemrighthtml=""
								/>
							</td>
							<td id="NavBarBgR"><img src="<%=skinpath%>images/dummy.gif" alt="canto do menu" border="0"></td>
						</tr>
					</table>
			</div>
			<div id="Breadcrumb" class="BorderBottom">
				<div class="left"><dnn:BREADCRUMB runat="server" id="dnnBREADCRUMB" RootLevel="0" cssClass="BREADCRUMBS_object" Separator="&nbsp;&nbsp;&nbsp;&raquo;&nbsp;&nbsp;&nbsp;" /></div>
				<div class="right"><dnn:LOGIN runat="server" id="dnnLOGIN" CssClass="LOGIN_object" />&nbsp;&nbsp;|&nbsp;&nbsp;<dnn:USER runat="server" id="dnnUSER" CssClass="USER_object" /></div>
				<div class="clear"></div>
			</div>
			<div id="MiddleRow">
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td id="TopPane" runat="server" class="TopPane" visible="false" colspan="3"></td>
					</tr>
					<tr>
						<td id="LeftPane" runat="server" class="LeftPane" visible="false"></td>
						<td valign="top">
							<table width="100%" border="0" cellpadding="0" cellspacing="0">
								<tr><td>
									<table width="100%" border="0" cellpadding="0" cellspacing="0">
										<tr>
											<td id="SidePane1" runat="server" class="SidePane" visible="false"></td>
											<td id="ContentPane" runat="server" class="ContentPane" visible="false"></td>
											<td id="SidePane2" runat="server" class="SidePane" visible="false"></td>
										</tr>
									</table>
								</td></tr>
								<tr><td>
									<table width="100%" border="0" cellpadding="0" cellspacing="0">
										<tr>
											<td id="MiddlePane1" runat="server" class="MiddlePane" visible="false"></td>
											<td id="MiddlePane2" runat="server" class="MiddlePane" visible="false"></td>
										</tr>
									</table>
								</td></tr>
								<tr><td>
									<table width="100%" border="0" cellpadding="0" cellspacing="0">
										<tr>
											<td id="SidePane3" runat="server" class="SidePane" visible="false"></td>
											<td id="ContentPane2" runat="server" class="ContentPane" visible="false"></td>
											<td id="SidePane4" runat="server" class="SidePane" visible="false"></td>
										</tr>
									</table>
								</td></tr>
								<tr><td>
									<table width="100%" border="0" cellpadding="0" cellspacing="0">
										<tr>
											<td id="MiddlePane3" runat="server" class="MiddlePane" visible="false"></td>
											<td id="MiddlePane4" runat="server" class="MiddlePane" visible="false"></td>
										</tr>
									</table>
								</td></tr>
							</table>
						</td>
						<td id="RightPane" runat="server" class="RightPane" visible="false"></td>
					</tr>
					<tr>
						<td id="BottomPane" runat="server" class="BottomPane" visible="false" colspan="3"></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<div id="OuterContainerBottom">
		<img src="<%=skinpath%>images/dummy.gif" alt="dummy" width="10" height="10" class="corner" style="display: none;">
	</div>
</div>

<div id="FooterRow">
            <dnn:COPYRIGHT runat="server" id="dnnCOPYRIGHT" CssClass="FOOTER_objects" /> <br/>
            <span class="FooterArrow"> <dnn:PRIVACY runat="server" id="dnnPRIVACY" CssClass="FOOTER_objects" /> | </span>
            <span class="FooterArrow"> <dnn:TERMS   runat="server" id="dnnTERMS"   CssClass="FOOTER_objects" /> </span>
</div>
</div>



