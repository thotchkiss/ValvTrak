<%@ Control language="vb" CodeBehind="~/admin/Containers/container.vb" AutoEventWireup="false" Explicit="True" Inherits="DotNetNuke.UI.Containers.Container" %>
<%@ Register TagPrefix="dnn" TagName="SOLPARTACTIONS" Src="~/Admin/Containers/SolPartActions.ascx" %>
<%@ Register TagPrefix="dnn" TagName="TITLE" Src="~/Admin/Containers/Title.ascx" %>
<%@ Register TagPrefix="dnn" TagName="PRINTMODULE" Src="~/Admin/Containers/PrintModule.ascx" %>
<%@ Register TagPrefix="dnn" TagName="ACTIONBUTTON" Src="~/Admin/Containers/ActionButton.ascx" %>  
<%@ Register TagPrefix="dnn" TagName="VISIBILITY" src="~/Admin/Containers/Visibility.ascx"%>

<div class="container">
   <div class="C00_TitleLine">
       <div class="C00_Title">
            <dnn:TITLE runat="server" id="dnnTITLE" Cssclass="Title"/>
       </div>
       <div class="C00_Actions">
            <dnn:SOLPARTACTIONS runat="server" id="dnnSOLPARTACTIONS" />
       </div>
       <div class="C00_Visibility">
            <dnn:VISIBILITY runat="server" id="dnnVISIBILITY" />
       </div>
   </div>
   <div runat="server" id="ContentPane" class="C00_ContentPane"/>
   <span class="C00_Icons"><dnn:ACTIONBUTTON runat="server" id="dnnACTIONBUTTON" CommandName="SyndicateModule.Action" DisplayIcon="True" DisplayLink="False" /> <dnn:PRINTMODULE runat="server" id="dnnPRINTMODULE" /></span>
</div>


