<%@ page language="C#" autoeventwireup="true" inherits="MediaANT.Modules.DDDCarousel.DDDImagePicker, App_Web_dddimagepicker.aspx.eb29e08c" enableEventValidation="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
  <title>ImagePicker</title>
  <script language="javascript" type="text/javascript">
    function ImageClick(url){
      if (window.opener!=null){
        try
        {
          window.opener.frames.document.forms[0].elements[document.getElementById("hiddenOpener").value].value = url;
          window.opener.frames.document.forms[0].elements[document.getElementById("hiddenOpener").value].focus();
          
          if((document.getElementById("hiddenImage").value != "") 
          && (window.opener.frames.document.forms[0].elements[document.getElementById("hiddenImage").value] != null) )
          {
            window.opener.frames.document.forms[0].elements[document.getElementById("hiddenImage").value].src = url;
            window.opener.frames.document.forms[0].elements[document.getElementById("hiddenImage").value].width = document.getElementById("hiddenImageWidth").value;
          }
        }
        catch(err)
        {
          alert(err.name + ": " + err.number + "\n\r" + err.message);
        } 
        window.close();
      }
    }
  </script>
  <style type="text/css">
    body{font-family: Verdana, Arial, Sans-Serif;font-size: 10px;}
    #picker{padding:0px;}
    #directories{padding-left:2px;}
    .smallText{font-size:10px;}
    .item{color: #000000;	text-decoration: none;}
  </style>
</head>
<body>
<form id="formImagePicker" runat="server">
  <div id="picker">
    <div id="directories">
    <asp:Label ID="lblDirectories" runat="server" /><br />
    <asp:DropDownList ID="cboDirectories" runat="server" width="319" OnSelectedIndexChanged="cboDirectories_SelectedIndexChanged" Font-Size="10px" AutoPostBack="true" />
    </div>
  <asp:DataList ID="datalistImages" runat="server" 
    RepeatColumns="3" 
    RepeatDirection="Horizontal" 
    DataKeyField="PhysicalPath" 
    ItemStyle-Height="110" 
    ItemStyle-Width="105" 
    ItemStyle-BorderColor="white"
    ItemStyle-BorderWidth="2"
    ItemStyle-HorizontalAlign="Center"
    ItemStyle-BackColor="#dddddd"
    BorderColor="#ffffff" ItemStyle-CssClass="item">
    <ItemTemplate>
    <a href="javascript:ImageClick('<%# DataBinder.Eval(Container.DataItem, "WebPath")%>')">
      <div id="xitem">
      <asp:Image runat="server" ID="itemImage" OnDataBinding="itemImage_DataBinding" ImageUrl='<%# DataBinder.Eval(Container.DataItem, "WebPath")%>' CssClass="item" /><br />
      <asp:Label runat="server" ID="itemLabel" OnDataBinding="itemLabel_DataBinding" Text='<%# DataBinder.Eval(Container.DataItem, "Name")%>' CssClass="item" /><br />
      <asp:Label runat="server" ID="itemSize" Text='<%# DataBinder.Eval(Container.DataItem, "FileSize")%>' CssClass="smallText item" />
      </div>
    </a>
    </ItemTemplate>
  </asp:DataList>
  </div>
<asp:HiddenField ID="hiddenOpener" runat="server" />
<asp:HiddenField ID="hiddenImage" runat="server" />
<asp:HiddenField ID="hiddenImageWidth" runat="server" />
</form>
</body>
</html>