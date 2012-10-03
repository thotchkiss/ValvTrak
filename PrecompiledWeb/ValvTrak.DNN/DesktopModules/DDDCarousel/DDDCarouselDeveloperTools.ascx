<%@ control language="C#" autoeventwireup="false" inherits="MediaANT.Modules.DDDCarousel.DDDCarouselDeveloperTools, App_Web_dddcarouseldevelopertools.ascx.eb29e08c" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/labelcontrol.ascx" %>
<style type="text/css">
  .label        {width:170px;text-align:left;}
  .caption      {font-size:larger;font-weight:bold;}
  .contenttable {text-align:left;}
  .jsinput      {width:350px;}
  .imageview    {border-style:solid;border-width:1px;border-color:#808080;}
  .pagemenu     {text-align:center;padding-top:15px;padding-bottom:15px;}
  #pagecontainer{width:600px;height: 100%}
</style>
<div id="pagecontainer">
  <div class="pagemenu">
    <asp:LinkButton runat="server" ID="cmdUpdateTop" CssClass="CommandButton" OnClick="cmdUpdate_Click"></asp:LinkButton>&nbsp;
    <asp:LinkButton runat="server" ID="cmdCancelTop" CssClass="CommandButton" OnClick="cmdCancel_Click"></asp:LinkButton>
  </div><br />
  <table border="0" cellpadding="2" cellspacing="2" class="contenttable Normal" width="100%">
    <tr>
      <td class="label" style="vertical-align:top;padding-top:5px;"><dnn:Label id="lblJSFunctionsActive" runat="server" ControlName="lblJSFunctionsActive" Suffix=":" CssClass="SubHead" /></td>
      <td class="content">
        <table border="0" class="Normal" cellpadding="2" cellspacing="2">
          <tr>
            <td>
              <asp:CheckBox id="chkJSImageMouseOver" runat="server" CssClass="NormalTextBox" onclick="javascript:chkJSImageMouseOver_OnClick()" />{<br />
              <asp:TextBox id="txtJSImageMouseOver" runat="server" CssClass="jsinput NormalTextBox" TextMode="MultiLine" Rows="8" /><br />}
            </td>
          </tr>
          <tr><td>&nbsp;</td></tr>
          <tr>
            <td>
              <asp:CheckBox id="chkJSImageMouseOut" runat="server" CssClass="NormalTextBox" onclick="javascript:chkJSImageMouseOut_OnClick()" />{<br />
              <asp:TextBox id="txtJSImageMouseOut" runat="server" CssClass="jsinput NormalTextBox" TextMode="MultiLine" Rows="8" /><br />}
            </td>
          </tr>
          <tr><td>&nbsp;</td></tr>
          <tr>
            <td>
              <asp:CheckBox id="chkJSImageClicked" runat="server" CssClass="NormalTextBox" onclick="javascript:chkJSImageClicked_OnClick()" />{<br />
              <asp:TextBox id="txtJSImageClicked" runat="server" CssClass="jsinput NormalTextBox" TextMode="MultiLine" Rows="8" /><br />}
            </td>
          </tr>
          <tr><td>&nbsp;</td></tr>
          <tr>
            <td>
              <asp:CheckBox id="chkJSDetailPageLoaded" runat="server" CssClass="NormalTextBox" onclick="javascript:chkJSDetailPageLoaded_OnClick()" />{<br />
              <asp:TextBox id="txtJSDetailPageLoaded" runat="server" CssClass="jsinput NormalTextBox" TextMode="MultiLine" Rows="8" /><br />}
            </td>
          </tr>
          <tr><td>&nbsp;</td></tr>
          <tr>
            <td>
              <asp:CheckBox id="chkJSDetailImageClicked" runat="server" CssClass="NormalTextBox" onclick="javascript:chkJSDetailImageClicked_OnClick()" />{<br />
              <asp:TextBox id="txtJSDetailImageClicked" runat="server" CssClass="jsinput NormalTextBox" TextMode="MultiLine" Rows="8" /><br />}
            </td>
          </tr>
          <tr><td>&nbsp;</td></tr>
          <tr>
            <td>
              <asp:CheckBox id="chkJSDetailPageClosed" runat="server" CssClass="NormalTextBox" onclick="javascript:chkJSDetailPageClosed_OnClick()" />{<br />
              <asp:TextBox id="txtJSDetailPageClosed" runat="server" CssClass="jsinput NormalTextBox" TextMode="MultiLine" Rows="8" /><br />}
            </td>
          </tr>
          <tr><td>&nbsp;</td></tr>
          <tr>
            <td>
              <asp:CheckBox id="chkJSAnimationLoaded" runat="server" CssClass="NormalTextBox" onclick="javascript:chkJSAnimationLoaded_OnClick()" />{<br />
              <asp:TextBox id="txtJSAnimationLoaded" runat="server" CssClass="jsinput NormalTextBox" TextMode="MultiLine" Rows="8" /><br />}
            </td>
          </tr>
        </table>
     </td>
    </tr>   
  </table>
  <div class="pagemenu">
    <asp:LinkButton runat="server" ID="cmdUpdateBottom" CssClass="CommandButton" OnClick="cmdUpdate_Click"></asp:LinkButton>&nbsp;
    <asp:LinkButton runat="server" ID="cmdCancelBottom" CssClass="CommandButton" OnClick="cmdCancel_Click"></asp:LinkButton>
  </div>
</div>

<asp:HiddenField id="hiddenModuleID" runat="server" />


<script language="javascript" type="text/javascript">
  
  chkJSImageMouseOver_OnClick();
  chkJSImageMouseOut_OnClick();
  chkJSImageClicked_OnClick();
  chkJSDetailPageLoaded_OnClick();
  chkJSDetailImageClicked_OnClick();
  chkJSDetailPageClosed_OnClick();
  chkJSAnimationLoaded_OnClick();
  
  function chkJSImageMouseOver_OnClick(){
    document.getElementById("<%=txtJSImageMouseOver.ClientID%>").disabled = (! document.getElementById("<%=chkJSImageMouseOver.ClientID%>").checked);
  }
  
  function chkJSImageMouseOut_OnClick(){
    document.getElementById("<%=txtJSImageMouseOut.ClientID%>").disabled = (! document.getElementById("<%=chkJSImageMouseOut.ClientID%>").checked);
  }
  
  function chkJSImageClicked_OnClick(){
    document.getElementById("<%=txtJSImageClicked.ClientID%>").disabled = (! document.getElementById("<%=chkJSImageClicked.ClientID%>").checked);
  }
  
  function chkJSDetailPageLoaded_OnClick(){
    document.getElementById("<%=txtJSDetailPageLoaded.ClientID%>").disabled = (! document.getElementById("<%=chkJSDetailPageLoaded.ClientID%>").checked);
  }
  
  function chkJSDetailImageClicked_OnClick(){
    document.getElementById("<%=txtJSDetailImageClicked.ClientID%>").disabled = (! document.getElementById("<%=chkJSDetailImageClicked.ClientID%>").checked);
  }
  
  function chkJSDetailPageClosed_OnClick(){
    document.getElementById("<%=txtJSDetailPageClosed.ClientID%>").disabled = (! document.getElementById("<%=chkJSDetailPageClosed.ClientID%>").checked);
  }
  
  function chkJSAnimationLoaded_OnClick(){
    document.getElementById("<%=txtJSAnimationLoaded.ClientID%>").disabled = (! document.getElementById("<%=chkJSAnimationLoaded.ClientID%>").checked);
  }
  
</script>