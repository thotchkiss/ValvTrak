<%@ Control language="vb" CodeBehind="~/admin/Containers/container.vb" AutoEventWireup="false" Explicit="True" Inherits="DotNetNuke.UI.Containers.Container" %>
<%@ Register TagPrefix="dnn" TagName="SOLPARTACTIONS" Src="~/Admin/Containers/SolPartActions.ascx" %>
<%@ Register TagPrefix="dnn" TagName="TITLE" Src="~/Admin/Containers/Title.ascx" %>
<%@ Register TagPrefix="dnn" TagName="PRINTMODULE" Src="~/Admin/Containers/PrintModule.ascx" %>
<%@ Register TagPrefix="dnn" TagName="ACTIONBUTTON" Src="~/Admin/Containers/ActionButton.ascx" %>  
<%@ Register TagPrefix="dnn" TagName="VISIBILITY" src="~/Admin/Containers/Visibility.ascx"%>

<div class="container">
    <div class="C03_Grey_roundtop_leftD">
       <img src="<%=skinpath%>dummy.gif" alt="" class="C03_corner_leftT" style="display: none" />
    </div>
    <div class="C03_Grey_roundtop_rightD">
       <img src="<%=skinpath%>dummy.gif" alt="" class="C03_corner_rightT" style="display: none" />
    </div>  
    <div class="C03_DarkGrey_TitleLine">
       <div class="C03_Grey_DarkTitle">
            <dnn:TITLE runat="server" id="dnnTITLE" Cssclass="Title"/>
       </div>
       <div class="C03_Actions">
            <dnn:SOLPARTACTIONS runat="server" id="dnnSOLPARTACTIONS" />
       </div>
       <div class="C03_Visibility">
            <dnn:VISIBILITY runat="server" id="dnnVISIBILITY" />
       </div>
    </div>
    <div class="C03_roundcont">
        <div class="C03_content">   
           <div runat="server" id="ContentPane" class="C03_ContentPane"/>
           <span class="C03_Icons"><dnn:ACTIONBUTTON runat="server" id="dnnACTIONBUTTON" CommandName="SyndicateModule.Action" DisplayIcon="True" DisplayLink="False" /> <dnn:PRINTMODULE runat="server" id="dnnPRINTMODULE" /></span>
        </div>
    </div>
    <div class="C03_Grey_roundbottom_leftD">
       <img src="<%=skinpath%>dummy.gif" alt="" class="C03_corner_leftB" style="display: none" />
    </div>
    <div class="C03_Grey_roundbottom_rightD">
       <img src="<%=skinpath%>dummy.gif" alt="" class="C03_corner_rightB" style="display: none" />
    </div>
</div>
