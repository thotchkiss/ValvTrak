<%@ Control language="vb" CodeBehind="~/admin/Containers/container.vb" AutoEventWireup="false" Explicit="True" Inherits="DotNetNuke.UI.Containers.Container" %>
<%@ Register TagPrefix="dnn" TagName="SOLPARTACTIONS" Src="~/Admin/Containers/SolPartActions.ascx" %>
<%@ Register TagPrefix="dnn" TagName="PRINTMODULE" Src="~/Admin/Containers/PrintModule.ascx" %>
<%@ Register TagPrefix="dnn" TagName="ACTIONBUTTON" Src="~/Admin/Containers/ActionButton.ascx" %>  

<div class="container">
   <div class="C01_Black_roundtop_left">
       <img src="<%=skinpath%>dummy.gif" alt="" class="C01_corner_left" style="display: none" />
   </div>
   <div class="C01_Black_roundtop_right">
       <img src="<%=skinpath%>dummy.gif" alt="" class="C01_corner_right" style="display: none" />
   </div>
   <div class="C01_roundcont">
       <div class="C01_Actions">
           <dnn:SOLPARTACTIONS runat="server" id="dnnSOLPARTACTIONS" />
       </div>
       <div runat="server" id="ContentPane" class="C01_ContentPane_NT"/>
       <span class="C01_Icons"><dnn:ACTIONBUTTON runat="server" id="dnnACTIONBUTTON" CommandName="SyndicateModule.Action" DisplayIcon="True" DisplayLink="False" /> <dnn:PRINTMODULE runat="server" id="dnnPRINTMODULE" /></span>
   </div>
   <div class="C01_Black_roundbottom_left">
	   <img src="<%=skinpath%>dummy.gif" alt="" class="C01_corner_left" style="display: none" />
   </div>
   <div class="C01_Black_roundbottom_right">
	   <img src="<%=skinpath%>dummy.gif" alt="" class="C01_corner_right" style="display: none" />
   </div>
 </div>

