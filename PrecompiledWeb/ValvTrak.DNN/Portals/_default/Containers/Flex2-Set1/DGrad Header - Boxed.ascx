<%@ Control language="vb" AutoEventWireup="false" Explicit="True" Inherits="DotNetNuke.UI.Containers.Container" %>
<%@ Register TagPrefix="dnn" TagName="ACTIONS" Src="~/Admin/Containers/SolPartActions.ascx" %>
<%@ Register TagPrefix="dnn" TagName="TITLE" Src="~/Admin/Containers/Title.ascx" %>
<%@ Register TagPrefix="dnn" TagName="VISIBILITY" Src="~/Admin/Containers/Visibility.ascx" %>
<%@ Register TagPrefix="dnn" TagName="ACTIONBUTTON" Src="~/Admin/Containers/ActionButton.ascx" %>
<table class="flex-container-1 fullwidth">
<tr class="EMContainerColour1">
<td class="flex-container-tl-dgrad trans-png"><img src="<%= SkinPath %>images/spacer.gif" height="33" width="14" alt="" /></td>
<td class="flex-container-t-dgrad trans-png">
	<div class="flex-container-action"><dnn:ACTIONS runat="server" id="dnnACTIONS" ProviderName="DNNMenuNavigationProvider" ExpandDepth="1" PopulateNodesFromClient="True" /></div>
    <div class="flex-container-title"><h1 class="EMContainerTitleFontSize1"><dnn:TITLE runat="server" id="dnnTITLE" CssClass="EMContainerTitleFontColour1 EMContainerTitleFontFamily1 EMContainerTitleFontSize1" /></h1></div>
    <div class="flex-container-visibility"><dnn:VISIBILITY runat="server" id="dnnVISIBILITY1" MinIcon="images/minimize-colhead.png" MaxIcon="images/maximize-colhead.png" /></div>
    <div class="flex-container-help"><dnn:ACTIONBUTTON runat="server" id="dnnACTIONBUTTON5" CommandName="ModuleHelp.Action" DisplayIcon="True" DisplayLink="False" /></div>
</td>
<td class="flex-container-tr-dgrad trans-png"><img src="<%= SkinPath %>images/spacer.gif" height="33" width="14" alt="" /></td>
</tr>
<tr>
  <td class="flex-container-l"></td>
  <td class="flex-container-m">
    <table class="flex-container-m-table fullwidth">
    <tr><td class="flex-container-m-td flex-container-content" id="ContentPane" runat="server"></td></tr>
    <tr><td class="flex-container-m-td">
    	<div class="flex-container-action2"><dnn:ACTIONBUTTON runat="server" id="dnnACTIONBUTTON1" CommandName="AddContent.Action" DisplayIcon="True" DisplayLink="True" /></div>
        <div class="flex-container-syndicate"><dnn:ACTIONBUTTON runat="server" id="dnnACTIONBUTTON2" CommandName="SyndicateModule.Action" DisplayIcon="True" DisplayLink="False" /></div>
        <div class="flex-container-print"><dnn:ACTIONBUTTON runat="server" id="dnnACTIONBUTTON3" CommandName="PrintModule.Action" DisplayIcon="True" DisplayLink="False" /></div>
        <div class="flex-container-settings"><dnn:ACTIONBUTTON runat="server" id="dnnACTIONBUTTON4" CommandName="ModuleSettings.Action" DisplayIcon="True" DisplayLink="False" /></div>
    </td></tr>    
    </table>
  </td>
  <td class="flex-container-r"></td>
</tr>
<tr><td class="flex-container-bl"><img src="<%= SkinPath %>images/spacer.gif" height="12" width="14" alt="" /></td><td class="flex-container-b"></td><td class="flex-container-br"><img src="<%= SkinPath %>images/spacer.gif" height="12" width="14" alt="" /></td></tr>
</table>
<div class="clear cont-br"></div>







