<%@ control language="C#" autoeventwireup="true" inherits="MediaANT.Modules.DDDCarousel.DDDCarouselContent, App_Web_dddcarouselcontent.ascx.eb29e08c" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/labelcontrol.ascx" %>
<style type="text/css">
  .pagemenu       {text-align:center;padding-top:10px;padding-bottom:15px;}
  .header         {background-color:#ffffff;border-bottom: 1px dotted #999;}
  .contenttitle   {font-weight:bold;padding-top:7px;}
  .visible        {float:right;padding-right:5px;padding-top:5px;color:#008000;}
  .notvisible     {float:right;padding-right:5px;padding-top:5px;color:#ff0000;}
  .linkimage      {margin-right:2px;}
  #pagecontainer  {width:620px;height:100%}
  #boxcontainer   {background-color:#ffffff;border:1px solid #cccccc;text-align:left;margin-top:5px;}
  #imagepane      {background-color:#e9e9e9;border-right:1px dotted #999999;padding:10px;}
  #imagepanemenu  {float:left;padding-left:10px;padding-top:5px;}
  #ordinal        {float:left;font-weight:bold;padding:5px 5px 4px 7px;}
  #updown         {float:right;padding:5px 7px 4px 5px;}
  #contentcontainer{padding:15px 10px 0px 15px;vertical-align:top;height:120px;}
  #footerstickcontainer{padding:15px 15px 10px 15px;}
  #footerstick    {border-top:1px dotted #ccc;}
  #footermenuleft {float:left;padding-left:10px;}
  #footermenuright{float:right;padding-right:10px;}
  #headermenuleft {float:left;padding-left:10px;}
  #headermenuright{float:right;padding-right:10px;}
</style>
<div id="pagecontainer">
  <div class="pagemenu">
    <asp:LinkButton runat="server" ID="cmdBackTop" CssClass="CommandButton" OnClick="cmdBack_Click"></asp:LinkButton>
  </div>
  <table cellpadding="2" cellspacing="2" width="100%" class="Normal" border="0">
    <tr>
      <td colspan="2">
        <span id="headermenuleft">
          <asp:LinkButton id="cmdNewItemHeader" runat="server" Font-Underline="true" CssClass="Normal" >
            <asp:Image ID="imgNewItemHeader" runat="server" CssClass="linkimage" /><asp:Label ID="lblNewItemHeader" runat="server" />
          </asp:LinkButton>
        </span>
        <span id="headermenuright">
          <asp:LinkButton id="cmdImagesImportHeader" runat="server" Font-Underline="true" CssClass="Normal" >
            <asp:Image id="imgImagesImportHeader" runat="server" CssClass="linkimage" /><asp:Label ID="lblImagesImportHeader" runat="server" />
          </asp:LinkButton>
          <asp:LinkButton id="cmdBulkImportHeader" runat="server" Font-Underline="true" CssClass="Normal" >
            <asp:Image id="imgBulkImportHeader" runat="server" CssClass="linkimage" /><asp:Label ID="lblBulkImportHeader" runat="server" />
          </asp:LinkButton>
          <asp:LinkButton id="cmdBulkExportHeader" runat="server" Font-Underline="true" CssClass="Normal" >
            <asp:Image id="imgBulkExportHeader" runat="server" CssClass="linkimage" /><asp:Label ID="lblBulkExportHeader" runat="server" />
          </asp:LinkButton>
          <asp:LinkButton id="cmdDeleteAllItemsHeader" runat="server" Font-Underline="true" CssClass="Normal" >
            <asp:Image id="imgDeleteAllItemsHeader" runat="server" CssClass="linkimage" /><asp:Label ID="lblDeleteAllItemsHeader" runat="server" />
          </asp:LinkButton>
        </span>
      </td>
    </tr>
    <tr>
      <td colspan="2" align="left"><asp:Label id="lblErrorHeader" runat="server" style="color:#ff0000;" CssClass="Normal" /></td>
    </tr>
    <tr>
      <td>
        <asp:GridView id="grdItems" runat="server" AutoGenerateColumns="false" BorderWidth="0" CssClass="Normal" Width="100%" CellPadding="0" CellSpacing="7" >
          <Columns>
            <asp:TemplateField ItemStyle-HorizontalAlign="Center">
              <ItemTemplate>
                <table id="boxcontainer" class="Normal" width="100%" cellspacing="0" cellpadding="2" border="0">
                  <tr>
                    <td id="imagepane" valign="top">
                      <asp:ImageButton id="cmdAnimationImage" width="120px" CommandName="EditItem" runat="server" BorderColor="#e9e9e9" BorderWidth="2"/>
                      <div id="imagepanemenu">
                        <asp:ImageButton id="cmdEdit" runat="server" CommandName="EditItem" />
                        <asp:ImageButton id="cmdDelete" runat="server" CommandName="DeleteItem" />
                        <asp:ImageButton id="cmdClone" runat="server" CommandName="CloneItem" />
                      </div>
                    </td>
                    <td valign="top" style="width:100%;">
                      <table class="Normal" cellspacing="0" cellpadding="0" border="0" width="100%">
                        <tr>
                          <td class="header">
                            <span id="ordinal">#<%# Container.DataItemIndex + 1%></span>
                          </td>
                          <td class="header">
                            <span id="updown">
                              <asp:ImageButton id="cmdDown" runat="server" CommandName="MoveDown" />
                              <asp:ImageButton id="cmdUp" runat="server" CommandName="MoveUp" />
                            </span>
                          </td>
                        </tr>
                        <tr>
                          <td colspan="2" id="contentcontainer">
                            <table class="Normal" border="0" cellpadding="0" cellspacing="0" width="100%">
                              <tr><td class="Normal contenttitle"><asp:Label ID="lblToolTip" runat="server" />:</td></tr>
                              <tr><td class="Normal"><%# Server.HtmlEncode(DataBinder.Eval(Container.DataItem, "ToolTip").ToString())%></td></tr>
                              <tr><td class="Normal contenttitle"><asp:Label ID="lblContent1" runat="server" />:</td></tr>
                              <tr><td class="Normal"><%# Server.HtmlEncode(DataBinder.Eval(Container.DataItem, "Content1").ToString())%></td></tr>
                              <tr><td class="Normal contenttitle"><asp:Label ID="lblContent2" runat="server" />:</td></tr>
                              <tr><td class="Normal"><%# Server.HtmlEncode(DataBinder.Eval(Container.DataItem, "Content2").ToString())%></td></tr>
                              <tr><td class="Normal contenttitle"><asp:Label ID="lblImageLink" runat="server" />:</td></tr>
                              <tr><td class="Normal"><%# Server.HtmlEncode(DataBinder.Eval(Container.DataItem, "ImageLink").ToString())%>&nbsp;&nbsp;<%# Server.HtmlEncode(DataBinder.Eval(Container.DataItem, "ImageLinkTarget").ToString())%></td></tr>
                              <tr><td class="Normal contenttitle"><asp:Label ID="lblJSFunction" runat="server" />:</td></tr>
                              <tr><td class="Normal"><%# Server.HtmlEncode(DataBinder.Eval(Container.DataItem, "JSFunction").ToString())%></td></tr>
                            </table>
                          </td>
                        </tr>
                        <tr>
                          <td colspan="2" id="footerstickcontainer">
                            <table class="Normal" cellpadding="0" cellspacing="0" width="100%" border="0">
                              <tr>
                                <td id="footerstick">
                                  <span class="notvisible Normal"><asp:Label ID="lblNotVisible" runat="server" Visible='<%#! IsVisible(DataBinder.Eval(Container.DataItem, "Visible")) %>' /> </span>
                                  <span class="visible Normal"><asp:Label ID="lblVisible" runat="server" Visible='<%# IsVisible(DataBinder.Eval(Container.DataItem, "Visible")) %>' /> </span>
                                </td>
                              </tr>
                            </table>
                          </td>
                        </tr>
                      </table>
                    </td>
                  </tr>
                </table>
              </ItemTemplate>
            </asp:TemplateField>
          </Columns>
        </asp:GridView>
      </td>
    </tr>
    <tr>
      <td colspan="2">
        <span id="footermenuleft">
          <asp:LinkButton id="cmdNewItemFooter" runat="server" Font-Underline="true" CssClass="Normal" >
            <asp:Image ID="imgNewItemFooter" runat="server" /><asp:Label ID="lblNewItemFooter" runat="server" />
          </asp:LinkButton>
        </span>
        <span id="footermenuright">
          <asp:LinkButton id="cmdImagesImportFooter" runat="server" Font-Underline="true" CssClass="Normal" >
            <asp:Image id="imgImagesImportFooter" runat="server" CssClass="linkimage" /><asp:Label ID="lblImagesImportFooter" runat="server" />
          </asp:LinkButton>
          <asp:LinkButton id="cmdBulkImportFooter" runat="server" Font-Underline="true" CssClass="Normal" >
            <asp:Image ID="imgBulkImportFooter" runat="server" CssClass="linkimage" /><asp:Label ID="lblBulkImportFooter" runat="server" />
          </asp:LinkButton>
          <asp:LinkButton id="cmdBulkExportFooter" runat="server" Font-Underline="true" CssClass="Normal" >
            <asp:Image ID="imgBulkExportFooter" runat="server" CssClass="linkimage" /><asp:Label ID="lblBulkExportFooter" runat="server" />
          </asp:LinkButton>
          <asp:LinkButton id="cmdDeleteAllItemsFooter" runat="server" Font-Underline="true" CssClass="Normal" >
            <asp:Image ID="imgDeleteAllItemsFooter" runat="server" />&nbsp;<asp:Label ID="lblDeleteAllItemsFooter" runat="server" />
          </asp:LinkButton>
        </span>
      </td>
    </tr>
    <tr>
      <td colspan="2" align="center"><asp:Label id="lblErrorFooter" runat="server" style="color:#ff0000;" CssClass="normal" /></td>
    </tr>
  </table>
  <div class="pagemenu">
    <asp:LinkButton runat="server" ID="cmdBackBottom" CssClass="CommandButton" OnClick="cmdBack_Click"></asp:LinkButton>
  </div>
</div>


<asp:HiddenField id="hiddenModuleID" runat="server" />

