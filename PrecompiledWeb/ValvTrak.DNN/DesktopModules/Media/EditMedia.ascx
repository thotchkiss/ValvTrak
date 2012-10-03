<%@ Register TagPrefix="Portal" TagName="Tracking" Src="~/controls/URLTrackingControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="Portal" TagName="URL" Src="~/controls/URLControl.ascx" %>
<%@ Control language="vb" CodeBehind="EditMedia.ascx.vb" AutoEventWireup="false" Explicit="True" Inherits="DotNetNuke.Modules.Media.EditMedia" %>
<table width="560" cellspacing="0" cellpadding="0" summary="Edit Image Design Table">
	<tr>
		<td class="SubHead" width="125" vAlign="top" noWrap>
			<dnn:label id="plAlignment" runat="server" controlname="ddlImageAlignment" suffix=":" /></td>
		<td width="400" vAlign="top"><asp:DropDownList ID="ddlImageAlignment" Runat="server" Width="200"></asp:DropDownList></td>
	</tr>
	<tr>
		<td class="SubHead" width="125" vAlign="top" noWrap><BR>
			<dnn:label id="plURL" runat="server" controlname="ctlURL" suffix=":" /></td>
		<td width="400" vAlign="top"><portal:url id="ctlURL" runat="server" width="300" showtabs="False" showfiles="True" showUrls="True"
				urltype="F" showlog="False" shownewwindow="False" showtrack="False" /></td>
	</tr>
	<tr valign="top">
		<td class="SubHead" width="125" vAlign="top" noWrap><dnn:label id="plAlt" runat="server" controlname="txtAlt" suffix=":" /></td>
		<td width="400" vAlign="top">
			<asp:textbox id="txtAlt" cssclass="NormalTextBox" columns="50" runat="server" />
			<asp:requiredfieldvalidator id="valAltText" resourcekey="valAltText.ErrorMessage" runat="server" controltovalidate="txtAlt"
				display="Dynamic" cssclass="NormalRed" errormessage="<br />Alternate Text Is Required" />
		</td>
	</tr>
	<tr valign="top">
		<td class="SubHead" width="125" vAlign="top" noWrap><dnn:label id="plWidth" runat="server" controlname="txtWidth" suffix=":" /></td>
		<td width="400" vAlign="top">
			<asp:textbox id="txtWidth" cssclass="NormalTextBox" columns="50" runat="server" />
			<asp:regularexpressionvalidator id="valWidth" resourcekey="valWidth.ErrorMessage" controltovalidate="txtWidth" validationexpression="^[1-9]+[0-9]*$"
				display="Dynamic" cssclass="NormalRed" errormessage="<br />Width Must Be A Valid Integer" runat="server" />
		</td>
	</tr>
	<tr valign="top">
		<td class="SubHead" width="125" vAlign="top" noWrap><dnn:label id="plHeight" runat="server" controlname="txtHeight" suffix=":" /></td>
		<td width="400" vAlign="top">
			<asp:textbox id="txtHeight" cssclass="NormalTextBox" columns="50" runat="server" />
			<asp:regularexpressionvalidator id="valHeight" resourcekey="valHeight.ErrorMessage" controltovalidate="txtHeight"
				validationexpression="^[1-9]+[0-9]*$" display="Dynamic" cssclass="NormalRed" errormessage="<br />Height Must Be A Valid Integer"
				runat="server" />
		</td>
	</tr>
	<tr valign="top">
		<td class="SubHead" width="125" vAlign="top" noWrap><BR>
			<dnn:label id="plNavigateUrl" runat="server" controlname="txtNavigateUrl" suffix=":" /></td>
		<td width="400" vAlign="top"><portal:url id="ctlNavigateUrl" runat="server" width="300" required="False" showtabs="False"
				showfiles="True" showUrls="True" showlog="False" shownewwindow="False" showtrack="False" /></td>
	</tr>
	<tr valign="top">
		<td class="SubHead" width="125" vAlign="top" noWrap></td>
		<td width="400" vAlign="top"><portal:tracking id="ctlTracking" runat="server"></portal:tracking></td>
	</tr>
</table>
<p>
	<asp:linkbutton class="CommandButton" id="cmdUpdate" resourcekey="cmdUpdate" runat="server" borderstyle="none"
		text="Update" />&nbsp;
	<asp:linkbutton class="CommandButton" id="cmdCancel" resourcekey="cmdCancel" runat="server" borderstyle="none"
		text="Cancel" causesvalidation="False" />
</p>
