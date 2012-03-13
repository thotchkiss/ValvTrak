<%@ control language="C#" autoeventwireup="true" inherits="MediaANT.Modules.DDDCarousel.DDDCarouselContentEdit, App_Web_dddcarouselcontentedit.ascx.eb29e08c" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/labelcontrol.ascx" %>
<%@ Register TagPrefix="dnn" TagName="URL" Src="~/controls/URLControl.ascx" %>
<style type="text/css">
  .label        {width:165px;background-color:#e9e9e9;text-align:left;}
  .label2       {width:165px;background-color:#e9e9e9;height:30px;text-align:left;}
  .caption      {font-size:larger;font-weight:bold;}
  .content      {background-color:#f6f6f6;text-align:left;}
  .shortinput   {width:80px;}
  .shortinput2  {width:250px;}
  .mediuminput  {width:467px;}
  .largeinput   {width:490px;}
  .pagemenu     {text-align:center;padding-top:10px;padding-bottom:10px;}
  .box          {border:1px solid #cccccc;margin-top:5px;}
  .deprecated   {color:#b50000;}
  #pagecontainer{width:690px;height:100%;}
  #bgcolor      {margin-top:10px;}
</style>
<div id="pagecontainer">
  <div class="pagemenu">
    <asp:LinkButton runat="server" ID="cmdUpdateTop" CssClass="CommandButton" />&nbsp;
    <asp:LinkButton runat="server" ID="cmdCancelTop" CssClass="CommandButton" />
  </div>
  <table cellpadding="4" cellspacing="1" width="100%" class="box Normal" border="0">
    <tr>
      <td class="label2"><asp:Label id="lblImageCaption" runat="server" CssClass="caption SubHead"/></td>
      <td class="content">&nbsp;</td>
    </tr>
    <tr>
      <td class="label"><dnn:Label id="lblVisible" runat="server" ControlName="lblVisible" Suffix=":" CssClass="SubHead" /></td>
      <td class="content"><asp:CheckBox ID="chkVisible" runat="server" CssClass="NormalTextBox"></asp:CheckBox></td>
    </tr>
    <tr>
      <td class="label"><dnn:Label id="lblImagePath" runat="server" ControlName="lblImagePath" Suffix=":" CssClass="SubHead" /></td>
      <td class="content">
        <asp:Image ID="imgImagePath" runat="server" /><br />
        <asp:TextBox ID="txtImagePath" runat="server" CssClass="mediuminput NormalTextBox" />
        <asp:ImageButton id="cmdImagePath" runat="server" style="height:22; width:22; vertical-align:text-bottom" />
      </td>
    </tr>
    <tr>
      <td class="label"><dnn:Label id="lblToolTip" runat="server" ControlName="lblToolTip" Suffix=":" CssClass="SubHead" /></td>
      <td class="content"><asp:TextBox ID="txtToolTip" runat="server" CssClass="largeinput NormalTextBox" TextMode="MultiLine" Rows="4" /></td>
    </tr>
    <tr>
      <td class="label"><dnn:Label id="lblLink" runat="server" ControlName="lblLink" Suffix=":" CssClass="SubHead" /><br /></td>
      <td class="content">
        <asp:TextBox ID="txtLink" runat="server" CssClass="largeinput NormalTextBox" /><br />
        <asp:DropDownList id="cboLinkTarget" runat="server" CssClass="shortinput2 NormalTextBox" />
      </td>
    </tr>
    <tr>
      <td class="label"><dnn:Label id="lblJSFunction" runat="server" ControlName="lblJSFunction" Suffix=":" CssClass="SubHead deprecated" /></td>
      <td class="content"><asp:TextBox ID="txtJSFunction" runat="server" CssClass="largeinput NormalTextBox" /></td>
    </tr>
    </table>
    
    <table cellpadding="4" cellspacing="1" width="100%" class="box Normal" border="0">
    <tr>
      <td class="label2"><asp:Label id="lblDetailPageCaption" runat="server" CssClass="caption SubHead"/></td>
      <td class="content">&nbsp;</td>
    </tr>
    <tr>
      <td class="label"><dnn:Label id="lblContent1" runat="server" ControlName="lblContent1" Suffix=":" CssClass="SubHead" /></td>
      <td class="content"><asp:TextBox ID="txtContent1" runat="server" CssClass="largeinput NormalTextBox" TextMode="MultiLine" Rows="8" /></td>
    </tr>
    <tr>
      <td class="label"><dnn:Label id="lblContent2" runat="server" ControlName="lblContent2" Suffix=":" CssClass="SubHead" /></td>
      <td class="content"><asp:TextBox ID="txtContent2" runat="server" CssClass="largeinput NormalTextBox" TextMode="MultiLine" Rows="8" /></td>
    </tr>
  </table>
  <div class="pagemenu">
    <asp:LinkButton runat="server" ID="cmdUpdateBottom" CssClass="CommandButton" />&nbsp;
    <asp:LinkButton runat="server" ID="cmdCancelBottom" CssClass="CommandButton" />
  </div>
</div>


<script language="javascript" type="text/javascript"> 
  
  function ColorPicker(ifn,sam,path){var newwindow='';var bl=screen.width/2-102;var bt=screen.height/2-104;var page=path+"?ifn="+escape(ifn)+"&sam="+escape(sam);if(!newwindow.closed&&newwindow.location){newwindow.location.href=page;}else{newwindow=window.open(page,"CTRLWINDOW","help=no,status=no,toolbar=no,menubar=no,location=no,scrollbars=no,resizable=no,dependent=yes,width=248,height=280,left="+bl+",top="+bt+",");if(!newwindow.opener){newwindow.opener=self;}if(window.focus){newwindow.focus();}}}
  function FilePicker(filePath, action){       
    var xsize = screen.width;var ysize = screen.height;var width=360;var height=500;var xpos=(xsize-width)/2;var ypos=(ysize-height)/2;var wnd = window.open(filePath,"","scrollbars=yes,status=no,toolbar=no,location=no,directories=no,resizable=no,menubar=no,width="+width+",height="+height+",screenX="+xpos+",screenY="+ypos+",top="+ypos+",left="+xpos);if(!wnd.opener){wnd.opener = self;}if(window.focus){wnd.focus();}
  }
  
</script>
