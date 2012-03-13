<%@ Control Language="vb" AutoEventWireup="false" Inherits="DotNetNuke.UI.Containers.Title" CodeFile="Title.ascx.vb" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.UI.WebControls" Assembly="DotNetNuke.WebControls" %>
<dnn:DNNLabelEdit id="lblTitle" runat="server" cssclass="Head" enableviewstate="False" MouseOverCssClass="LabelEditOverClass"
	ToolBarId="tbEIPTitle" LabelEditCssClass="LabelEditTextClass" EditEnabled="True" EventName="none" LostFocusSave="false"></dnn:DNNLabelEdit>

<DNN:DNNToolBar id="tbEIPTitle" runat="server" CssClass="eipbackimg" ReuseToolbar="true"
	DefaultButtonCssClass="eipbuttonbackimg" DefaultButtonHoverCssClass="eipborderhover">
	<DNN:DNNToolBarButton ControlAction="edit" ID="tbEdit2" ToolTip="Edit" CssClass="eipbutton_edit" runat="server"/>
	<DNN:DNNToolBarButton ControlAction="save" ID="tbSave2" ToolTip="Update" CssClass="eipbutton_save" runat="server"/>
	<DNN:DNNToolBarButton ControlAction="cancel" ID="tbCancel2" ToolTip="Cancel" runat="server"/>
</DNN:DNNToolBar>
