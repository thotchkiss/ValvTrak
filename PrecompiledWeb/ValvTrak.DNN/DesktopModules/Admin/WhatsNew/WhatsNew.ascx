﻿<%@ control language="VB" autoeventwireup="false" inherits="DotNetNuke.Modules.Admin.Host.WhatsNew, App_Web_5i5fu2ck" %>
<p class="Normal" id="header" runat="server"></p>
<asp:Repeater ID="WhatsNewList" runat="server">
    <ItemTemplate>
        <span class="Head"><%#Eval("Version")%></span>
        <hr />
        <div class="Normal"><%#Eval("Notes")%></div>
        <p><hr style="color:#DDD;" /></p>
    </ItemTemplate>
</asp:Repeater>
<p class="NormalBold" id="footer" runat="server"></p>