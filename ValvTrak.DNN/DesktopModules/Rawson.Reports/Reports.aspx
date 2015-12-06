<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Reports.aspx.cs" Inherits="Rawson.Reports.ReportsHost" %>
<%@ Register Src="~/DesktopModules/Rawson.Reports/ReportViewer.ascx" TagPrefix="uc1" TagName="ReportViewer" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <uc1:ReportViewer runat="server" ID="ReportViewer" />
    </form>
</body>
</html>
