<%@ Control language="vb" CodeBehind="~/admin/Containers/container.vb" AutoEventWireup="false" Explicit="True" Inherits="DotNetNuke.UI.Containers.Container" %>
<%@ Register TagPrefix="dnn" TagName="SOLPARTACTIONS" Src="~/Admin/Containers/SolPartActions.ascx" %>
<%@ Register TagPrefix="dnn" TagName="TITLE" Src="~/Admin/Containers/Title.ascx" %>
<%@ Register TagPrefix="dnn" TagName="PRINTMODULE" Src="~/Admin/Containers/PrintModule.ascx" %>
<%@ Register TagPrefix="dnn" TagName="ACTIONBUTTON" Src="~/Admin/Containers/ActionButton.ascx" %>  
<%@ Register TagPrefix="dnn" TagName="VISIBILITY" src="~/Admin/Containers/Visibility.ascx"%>

<div class="container_clean">
   <div class="C00_Actions">
        <dnn:SOLPARTACTIONS runat="server" id="dnnSOLPARTACTIONS" />
   </div>
   <div runat="server" id="ContentPane" class="C00_ContentPane_NT/>
   <span class="C00_Icons"><dnn:ACTIONBUTTON runat="server" id="dnnACTIONBUTTON" CommandName="SyndicateModule.Action" DisplayIcon="True" DisplayLink="False" /> <dnn:PRINTMODULE runat="server" id="dnnPRINTMODULE" /></span>
</div>
