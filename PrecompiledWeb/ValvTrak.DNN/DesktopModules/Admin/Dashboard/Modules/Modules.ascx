<%@ control language="VB" autoeventwireup="false" inherits="DotNetNuke.Modules.Dashboard.Controls.Modules, App_Web_xm3uxdy2" %>

<%@ Register TagPrefix="dnn" Assembly="DotNetNuke" Namespace="DotNetNuke.UI.WebControls"%>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>

<dnn:Label id="plModules" runat="Server" CssClass="Head" ControlName="grdModules" />
<asp:DataGrid ID="grdModules" runat="server" GridLines="None" 
    AutoGenerateColumns="false" EnableViewState="False">
    <Columns>
        <asp:BoundColumn DataField="FriendlyName" HeaderText="Module" />
        <asp:BoundColumn DataField="Version" HeaderText="Version" />
        <asp:BoundColumn DataField="Instances" HeaderText="Instances" />
    </Columns>
</asp:DataGrid>