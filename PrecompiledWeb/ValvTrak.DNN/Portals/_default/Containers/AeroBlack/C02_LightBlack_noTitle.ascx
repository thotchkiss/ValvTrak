<%@ Control language="vb" CodeBehind="~/admin/Containers/container.vb" AutoEventWireup="false" Explicit="True" Inherits="DotNetNuke.UI.Containers.Container" %>
<%@ Register TagPrefix="dnn" TagName="SOLPARTACTIONS" Src="~/Admin/Containers/SolPartActions.ascx" %>
<%@ Register TagPrefix="dnn" TagName="PRINTMODULE" Src="~/Admin/Containers/PrintModule.ascx" %>
<%@ Register TagPrefix="dnn" TagName="ACTIONBUTTON" Src="~/Admin/Containers/ActionButton.ascx" %>  

<div class="container">
    <div class="C02_Black_roundtop_leftL">
       <img src="<%=skinpath%>dummy.gif" alt="" class="C02_corner_left" style="display: none" />
    </div>
    <div class="C02_Black_roundtop_rightL">
       <img src="<%=skinpath%>dummy.gif" alt="" class="C02_corner_right" style="display: none" />
    </div>
   <div class="C02_LightBlack_roundcont">
       <div class="C02_Actions">
           <dnn:SOLPARTACTIONS runat="server" id="dnnSOLPARTACTIONS" />
       </div>
       <div runat="server" id="ContentPane" class="C02_ContentPaneB_NT"/>
       <span class="C02_Icons"><dnn:ACTIONBUTTON runat="server" id="dnnACTIONBUTTON" CommandName="SyndicateModule.Action" DisplayIcon="True" DisplayLink="False" /> <dnn:PRINTMODULE runat="server" id="dnnPRINTMODULE" /></span>
   </div>
    <div class="C02_Black_roundbottom_leftL">
       <img src="<%=skinpath%>dummy.gif" alt="" class="C02_corner_left" style="display: none" />
    </div>
    <div class="C02_Black_roundbottom_rightL">
       <img src="<%=skinpath%>dummy.gif" alt="" class="C02_corner_right" style="display: none" />
    </div>
 </div>


