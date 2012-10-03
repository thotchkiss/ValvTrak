<%@ Register TagPrefix="dnn" Assembly="DotNetNuke" Namespace="DotNetNuke.UI.WebControls"%>
<%@ control language="vb" autoeventwireup="false" explicit="True" inherits="DotNetNuke.Modules.Admin.Users.Membership, App_Web_pi4i0lsx" %>

<dnn:propertyeditorcontrol id="MembershipEditor" runat="Server" 
	editmode="View" 
	width="375px" 
	editcontrolwidth="150px" 
	labelwidth="200px" 
	editcontrolstyle-cssclass="NormalTextBox" 
	helpstyle-cssclass="Help" 
	labelstyle-cssclass="SubHead" 
	sortmode="SortOrderAttribute" />
<p align="center">
	<dnn:commandbutton id="cmdAuthorize" runat="server" 
		resourcekey="cmdAuthorize" imageurl="~/images/icon_securityroles_16px.gif" 
		causesvalidation="False" />
	<dnn:commandbutton id="cmdUnAuthorize" runat="server" 
		resourcekey="cmdUnAuthorize" imageurl="~/images/icon_securityroles_16px.gif" 
		causesvalidation="False" />
	&nbsp;&nbsp;
	<dnn:commandbutton id="cmdUnLock" runat="server" 
		resourcekey="cmdUnLock" imageurl="~/images/icon_securityroles_16px.gif" 
		causesvalidation="False" />
	&nbsp;&nbsp;
	<dnn:commandbutton id="cmdPassword" runat="server" 
		resourcekey="cmdPassword" imageurl="~/images/icon_securityroles_16px.gif" 
		causesvalidation="False" />
</p>
