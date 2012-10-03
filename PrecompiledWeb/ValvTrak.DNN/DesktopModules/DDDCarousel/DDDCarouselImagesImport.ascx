<%@ control language="C#" autoeventwireup="true" inherits="MediaANT.Modules.DDDCarousel.DDDCarouselImagesImport, App_Web_dddcarouselimagesimport.ascx.eb29e08c" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/labelcontrol.ascx" %>
<style type="text/css">
  .contenttable {text-align:left;}
  .largeinput   {width:200px;}
  .header       {padding-top:20px;padding-bottom:15px;}
  .pagemenu     {text-align:center;padding-top:10px;padding-top:10px;}
  #pagecontainer{width:400px;height:100%;}
  #scrollTree   {background-color:#ffffff;height:200px;width:400px;overflow:auto;border:solid 1px #A9A9A9;margin-top:5px;}
</style>
<div id="pagecontainer">
  <div class="pagemenu">
    <asp:LinkButton runat="server" ID="cmdBackTop" CssClass="CommandButton"></asp:LinkButton>
  </div>
  <table border="0" class="contenttable Normal" cellpadding="2" cellspacing="2">
    <tr>
      <td colspan="2" class="header">
        <asp:Label ID="lblImport" runat="server" CssClass="Normal" />
      </td>
    </tr>
    <tr>
      <td colspan="2">
        <dnn:Label id="lblImportDir" runat="server" ControlName="lblImportDir" Suffix="" CssClass="SubHead"/>
        <div id="scrollTree">
          <asp:TreeView ID="treeImportDir" runat="server" CssClass="Normal" NodeStyle-CssClass="Normal" OnClick="OnTreeItemClick()"
            SelectedNodeStyle-Font-Underline="true" SelectedNodeStyle-BackColor="#DFE5F2" EnableClientScript="true" EnableViewState="true">
          </asp:TreeView>
        </div>
      </td>
    </tr>
    <tr>
      <td colspan="2">
        <asp:CheckBox ID="chkImageDir" runat="server" CssClass="NormalTextBox" onclick="javascript:HandleImageDir();" /><br />
        <asp:label ID="lblImageDir" runat="server" CssClass="SubHead" /><asp:TextBox ID="txtImageDir" runat="server" CssClass=" mediuminput NormalTextBox" />
      </td>
    </tr>
    <tr>
      <td colspan="2">&nbsp;</td>
    </tr>
    <tr>
      <td><div style="width:90px;"><dnn:Label ID="lblImportFile" runat="server" ControlName="lblImportDir" Suffix=":" CssClass="SubHead" /></div></td>
      <td><asp:FileUpload id="uploadImportFile" runat="server" CssClass="NormalTextBox" Width="290px" /></td>
    </tr>
    <tr>
      <td colspan="2">&nbsp;</td>
    </tr>
    <tr>
      <td colspan="2">
        <asp:LinkButton ID="cmdStartImport" runat="server">
          <asp:Image ID="imgStartImport" runat="server" />
          <asp:Label ID="lblStartImport" runat="server" />
        </asp:LinkButton>
      </td>
    </tr>
    <tr>
      <td colspan="2">
        <asp:label ID="lblError" runat="server" CssClass="Normal" ForeColor="#ff0000" />
      </td>
    </tr>
  </table>
  <div class="pagemenu">
    <asp:LinkButton runat="server" ID="cmdBackBottom" CssClass="CommandButton"></asp:LinkButton>
  </div>
  <asp:HiddenField ID="hiddenTreeScrollPos" runat="server" />
</div>

<script language="javascript" type="text/javascript"> 
  HandleImageDir();
  
  function HandleImageDir()
  {
    if(document.getElementById("<%=chkImageDir.ClientID%>").checked)
    {
      document.getElementById("<%=lblImageDir.ClientID%>").disabled = false;
      document.getElementById("<%=txtImageDir.ClientID%>").disabled = false;
    }
    else
    {
      document.getElementById("<%=lblImageDir.ClientID%>").disabled = true;
      document.getElementById("<%=txtImageDir.ClientID%>").disabled = true;
    }
  }

</script>