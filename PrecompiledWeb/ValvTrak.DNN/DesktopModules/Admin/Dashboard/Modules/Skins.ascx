﻿<%@ control language="VB" autoeventwireup="false" inherits="DotNetNuke.Modules.Dashboard.Controls.Skins, App_Web_cexgzs1s" %>
<%@ Register TagPrefix="dnn" Assembly="DotNetNuke" Namespace="DotNetNuke.UI.WebControls"%>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>

<dnn:Label id="plSkins" runat="Server" CssClass="Head" ControlName="grdSkins" />
<asp:DataGrid ID="grdSkins" runat="server" GridLines="None" 
    AutoGenerateColumns="false" EnableViewState="False">
    <Columns>
        <asp:BoundColumn DataField="SkinName" HeaderText="Skin" />
        <asp:BoundColumn DataField="InUse" HeaderText="InUse" />
    </Columns>
</asp:DataGrid>
