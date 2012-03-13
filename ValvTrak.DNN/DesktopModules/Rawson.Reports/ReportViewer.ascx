<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ReportViewer.ascx.cs" Inherits="Rawson.Reports.ReportViewer" EnableTheming="true" %>
<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=9.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<table cellpadding="0" cellspacing="0" border="0" width="910px">
    <tr>
        <td>
            <div>
                <rsweb:ReportViewer ID="ReportViewer1" Height="100%" Width="910px" runat="server" AsyncRendering="false" 
                    ShowRefreshButton="false" PageCountMode="Estimate">
                </rsweb:ReportViewer>
            </div>
        </td>
    </tr>
</table>



