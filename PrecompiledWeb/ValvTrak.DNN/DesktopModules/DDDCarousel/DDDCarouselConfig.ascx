<%@ control language="C#" autoeventwireup="true" inherits="MediaANT.Modules.DDDCarousel.DDDCarouselConfig, App_Web_dddcarouselconfig.ascx.eb29e08c" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/labelcontrol.ascx" %>
<style type="text/css">
  .label        {width:170px;text-align:left;}
  .label2       {width:177px;text-align:left;}
  .group        {text-align:left;}
  .caption      {font-size:larger;font-weight:bold;}
  .contenttable {text-align:left;}
  .tinyinput    {width:40px;}
  .shortinput   {width:80px;}
  .mediuminput  {width:140px;}
  .mediuminput2 {width:120px;}
  .mediuminput3 {width:230px;}
  .mediuminput4 {width:235px;}
  .longinput    {width:260px;}
  .imageview    {border-style:solid;border-width:1px;border-color:#808080;}
  .pagemenu     {text-align:center;padding-top:15px;}
  #pagecontainer{width:550px;height: 100%;}
  hr            {border-style:dotted none none none;}
</style>
<div id="pagecontainer">
  <div class="pagemenu">
    <asp:LinkButton runat="server" id="cmdUpdateTop" CssClass="CommandButton" OnClick="cmdUpdate_Click"></asp:LinkButton>&nbsp;
    <asp:LinkButton runat="server" id="cmdCancelTop" CssClass="CommandButton" OnClick="cmdCancel_Click"></asp:LinkButton>
  </div>
  <table border="0" cellpadding="2" cellspacing="2" class="Normal" width="100%">
    <tr>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td class="group SubHead">
        <table id="tblImageClickAction" runat="server" border="0" cellpadding="0" cellspacing="0" class="Normal" >
          <tr>
            <td class="label"><dnn:Label id="lblImageClickAction" runat="server" ControlName="lblImageClickAction" Suffix=":" CssClass="SubHead" /></td>
            <td style="width:340px">
              <table border="0" class="NormalTextBox">
              <tr>
                <td><asp:RadioButton id="optImageClickActionLink" runat="server" GroupName="ImageClickAction" /></td>
                <td><asp:RadioButton id="optImageClickActionDetail" runat="server" GroupName="ImageClickAction" /></td>
                <td><asp:RadioButton id="optImageClickActionLightbox" runat="server" GroupName="ImageClickAction" /></td>
              </tr>
              </table>
            </td>
          </tr>
         </table>
      </td>
    </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td class="group SubHead"><asp:ImageButton runat="server" id="imgFlashToggle" />&nbsp;&nbsp;<asp:Label id="lblFlash" runat="server" CssClass="caption SubHead" /></td>
    </tr>
    <tr>
      <td class="group">
        <table id="tblFlash" runat="server" border="0" cellpadding="2" cellspacing="2" class="contenttable Normal" >
          <tr>
            <td class="label"><dnn:Label id="lblFlashWidth" runat="server" ControlName="lblFlashWidth" Suffix=":" CssClass="SubHead" /></td>
            <td style="width:260"><asp:TextBox id="txtFlashWidth" runat="server" MaxLength="4" CssClass="shortinput NormalTextBox" />&nbsp;px</td>
          </tr>
          <tr>
            <td class="label"><dnn:Label id="lblFlashHeight" runat="server" ControlName="lblFlashHeight" Suffix=":" CssClass="SubHead" /></td>
            <td><asp:TextBox id="txtFlashHeight" runat="server" MaxLength="4" CssClass="shortinput NormalTextBox" />&nbsp;px</td>
          </tr>
          <tr>
            <td class="label"><dnn:Label id="lblFlashLeft" runat="server" ControlName="lblFlashLeft" Suffix=":" CssClass="SubHead" /></td>
            <td><asp:TextBox id="txtFlashLeft" runat="server" MaxLength="4" CssClass="shortinput NormalTextBox" />&nbsp;px</td>
          </tr>
          <tr>
            <td class="label"><dnn:Label id="lblFlashTop" runat="server" ControlName="lblFlashTop" Suffix=":" CssClass="SubHead" /></td>
            <td><asp:TextBox id="txtFlashTop" runat="server" MaxLength="4" CssClass="shortinput NormalTextBox" />&nbsp;px</td>
          </tr>
          <tr>
            <td class="label"><dnn:Label id="lblFlashQuality" runat="server" ControlName="lblFlashQuality" Suffix=":" CssClass="SubHead" /></td>
            <td><asp:DropDownList id="cboFlashQuality" runat="server" CssClass="longinput NormalTextBox" /></td>
          </tr>
          <tr>
            <td class="label"><dnn:Label id="lblFlashMenu" runat="server" ControlName="lblFlashMenu" Suffix=":" CssClass="SubHead" /></td>
            <td><asp:CheckBox id="chkFlashMenu" runat="server" Text="" CssClass="NormalTextBox" /></td>
          </tr>
          <tr>
            <td class="label"><dnn:Label id="lblFlashAlternative" runat="server" ControlName="lblFlashAlternative" Suffix=":" CssClass="SubHead" /></td>
            <td><asp:TextBox id="txtFlashAlternative" runat="server" TextMode="MultiLine" Rows="4" CssClass="longinput NormalTextBox" /></td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td><hr /></td>
    </tr>
    <tr>
      <td class="group SubHead"><asp:ImageButton runat="server" id="imgCarouselToggle" />&nbsp;&nbsp;<asp:Label id="lblCarousel" runat="server" CssClass="caption SubHead" /></td>
    </tr>
    <tr>
      <td class="group">
        <table id="tblCarousel" runat="server" border="0" cellpadding="2" cellspacing="2" class="contenttable Normal" >
          <tr>
            <td class="label"><dnn:Label id="lblCarouselRadiusX" runat="server" ControlName="lblCarouselRadiusX" Suffix=":" CssClass="SubHead" /></td>
            <td style="width:260"><asp:TextBox id="txtCarouselRadiusX" runat="server" MaxLength="4" CssClass="shortinput NormalTextBox" />&nbsp;px</td>
          </tr>
          <tr>
            <td class="label"><dnn:Label id="lblCarouselRadiusY" runat="server" ControlName="lblCarouselRadiusY" Suffix=":" CssClass="SubHead" /></td>
            <td><asp:TextBox id="txtCarouselRadiusY" runat="server" MaxLength="4" CssClass="shortinput NormalTextBox" />&nbsp;px</td>
          </tr>
          <tr>
            <td class="label"><dnn:Label id="lblCarouselPerspective" runat="server" ControlName="lblCarouselPerspective" Suffix=":" CssClass="SubHead" /></td>
            <td><asp:DropDownList id="cboCarouselPerspective" runat="server" CssClass="shortinput NormalTextBox" /></td>
          </tr>
          <tr>
            <td class="label"><dnn:Label id="lblCarouselCenterLeft" runat="server" ControlName="lblCarouselCenterLeft" Suffix=":" CssClass="SubHead" /></td>
            <td><asp:TextBox id="txtCarouselCenterLeft" runat="server" MaxLength="4" CssClass="shortinput NormalTextBox" />&nbsp;px</td>
          </tr>
          <tr>
            <td class="label"><dnn:Label id="lblCarouselCenterTop" runat="server" ControlName="lblCarouselCenterTop" Suffix=":" CssClass="SubHead" /></td>
            <td><asp:TextBox id="txtCarouselCenterTop" runat="server" MaxLength="4" CssClass="shortinput NormalTextBox" />&nbsp;px</td>
          </tr>
          <tr>
            <td class="label"><dnn:Label id="lblCarouselSpeed" runat="server" ControlName="lblCarouselSpeed" Suffix=":" CssClass="SubHead" /></td>
            <td><asp:DropDownList id="cboCarouselSpeed" runat="server" CssClass="shortinput NormalTextBox" /></td>
          </tr>
          <tr>
            <td class="label"><dnn:Label id="lblCarouselSpeedMax" runat="server" ControlName="lblCarouselSpeedMax" Suffix=":" CssClass="SubHead" /></td>
            <td><asp:DropDownList id="cboCarouselSpeedMax" runat="server" CssClass="shortinput NormalTextBox" /></td>
          </tr>
          <tr>
            <td class="label"><dnn:Label id="lblCarouselRandomImages" runat="server" ControlName="lblCarouselRandomImages" Suffix=":" CssClass="SubHead" /></td>
            <td><asp:DropDownList id="cboCarouselRandomImages" runat="server" CssClass="shortinput NormalTextBox" /></td>
          </tr>
          <tr>
            <td class="label"><dnn:Label id="lblCarouselPreloader" runat="server" ControlName="lblCarouselPreloader" Suffix=":" CssClass="SubHead" /></td>
            <td><nobr><asp:TextBox id="txtCarouselPreloader" runat="server" CssClass="mediuminput4 NormalTextBox" />
            <asp:ImageButton id="imgCarouselPreloader" runat="server" style="height:22; width:22; vertical-align:text-bottom" /></nobr></td>
          </tr>
        </table> 
      </td>
    </tr> 
    <tr>
      <td><hr /></td>
    </tr>
    <tr>
      <td class="group SubHead"><asp:ImageButton runat="server" id="imgBackgroundToggle" />&nbsp;&nbsp;<asp:Label id="lblBackground" runat="server" CssClass="caption SubHead" /></td>
    </tr>
    <tr>
      <td class="group">
        <table id="tblBackground" runat="server" border="0" cellpadding="2" cellspacing="2" class="contenttable Normal" >
          <tr>
            <td class="label"><dnn:Label id="lblBackgroundTransparent" runat="server" ControlName="lblBackgroundTransparent" Suffix=":" CssClass="SubHead" /></td>
            <td style="width:260"><asp:CheckBox id="chkBackgroundTransparent" runat="server" Text="" CssClass="NormalTextBox" onclick="javascript:chkBackgroundTransparent_onClick()" /></td>
          </tr>
          <tr>
            <td colspan="2">&nbsp;</td>
          </tr>
          <tr>
            <td class="label"><dnn:Label id="lblBackgroundColor" runat="server" ControlName="lblBackgroundColor" Suffix=":" CssClass="SubHead" /></td>
            <td><asp:TextBox id="txtBackgroundColor" runat="server" MaxLength="7" CssClass="shortinput NormalTextBox" />&nbsp;
              <asp:ImageButton id="imgBackgroundColor" runat="server" style="height:18; width:22; vertical-align:text-bottom;" /></td>
          </tr>
          <tr>
            <td colspan="2">&nbsp;</td>
          </tr>
          <tr>
            <td class="label"><dnn:Label id="lblBackgroundImagePath" runat="server" ControlName="lblBackgroundImagePath" Suffix=":" CssClass="SubHead" /></td>
            <td><nobr><asp:TextBox id="txtBackgroundImagePath" runat="server" CssClass="mediuminput4 NormalTextBox" />
            <asp:ImageButton id="imgBackgroundImagePath" runat="server" style="height:22; width:22; vertical-align:text-bottom" /></nobr></td>
          </tr>
          <tr>
            <td class="label"><dnn:Label id="lblBackgroundImageLeft" runat="server" ControlName="lblBackgroundImageLeft" Suffix=":" CssClass="SubHead" /></td>
            <td><asp:TextBox id="txtBackgroundImageLeft" runat="server" MaxLength="4" CssClass="shortinput NormalTextBox" />&nbsp;px</td>
          </tr>
          <tr>
            <td class="label"><dnn:Label id="lblBackgroundImageTop" runat="server" ControlName="lblBackgroundImageTop" Suffix=":" CssClass="SubHead" /></td>
            <td><asp:TextBox id="txtBackgroundImageTop" runat="server" MaxLength="4" CssClass="shortinput NormalTextBox" />&nbsp;px</td>
          </tr>
        </table> 
      </td>
    </tr>     
    <tr>
      <td><hr /></td>
    </tr>
    <tr>
      <td class="group SubHead"><asp:ImageButton runat="server" id="imgNavigationToggle" />&nbsp;&nbsp;<asp:Label id="lblNavigation" runat="server" CssClass="caption SubHead" /></td>
    </tr>
    <tr>
      <td class="group">
        <table id="tblNavigation" runat="server" border="0" cellpadding="2" cellspacing="2" class="contenttable Normal">
          <tr>
            <td class="label"><dnn:Label id="lblNavigationType" runat="server" ControlName="lblNavigationType" Suffix=":" CssClass="SubHead" /></td>
            <td style="width:280px"><asp:DropDownList id="cboNavigationType" runat="server" CssClass="mediuminput3 NormalTextBox" onchange="javascript:cboNavigationType_onchange()" /></td>
          </tr>
          <tr>
            <td colspan="2">
              <table id="tblNavigationEx" runat="server" border="0" cellpadding="0" cellspacing="0" class="contenttable Normal" >
                <tr>
                  <td colspan="2">&nbsp;</td>
                </tr>
                <tr>
                  <td class="label2"><dnn:Label id="lblNavigationButtonsColor" runat="server" ControlName="lblNavigationButtonsColor" Suffix=":" CssClass="SubHead" /></td>
                  <td><asp:TextBox id="txtNavigationButtonsColor" runat="server" MaxLength="7" CssClass="shortinput NormalTextBox" />&nbsp;
                    <asp:ImageButton id="imgNavigationButtonsColor" runat="server" style="height:18; width:22; vertical-align:text-bottom;" /></td>
                </tr>
                <tr style="padding-top:5px">
                  <td class="label2"><dnn:Label id="lblNavigationButtonsAlpha" runat="server" ControlName="lblNavigationButtonsAlpha" Suffix=":" CssClass="SubHead" /></td>
                  <td colspan="2"><asp:DropDownList id="cboNavigationButtonsAlpha" runat="server" CssClass="shortinput NormalTextBox" />&nbsp;%</td>
                </tr>
                <tr style="padding-top:5px">
                  <td class="label2"><dnn:Label id="lblNavigationButtonLeftPath" runat="server" ControlName="lblNavigationButtonLeftPath" Suffix=":" CssClass="SubHead" /></td>
                  <td><nobr><asp:TextBox id="txtNavigationButtonLeftPath" runat="server" CssClass="mediuminput4 NormalTextBox" />
                  <asp:ImageButton id="imgNavigationButtonLeftPath" runat="server" style="height:22; width:22; vertical-align:text-bottom" /></nobr></td>
                </tr>
                <tr style="padding-top:5px">
                  <td class="label2"><dnn:Label id="lblNavigationButtonRightPath" runat="server" ControlName="lblNavigationButtonRightPath" Suffix=":" CssClass="SubHead" /></td>
                  <td><nobr><asp:TextBox id="txtNavigationButtonRightPath" runat="server" CssClass="mediuminput4 NormalTextBox" />
                  <asp:ImageButton id="imgNavigationButtonRightPath" runat="server" style="height:22; width:22; vertical-align:text-bottom" /></nobr></td>
                </tr>
                <tr style="padding-top:5px">
                  <td class="label2"><dnn:Label id="lblNavigationInitialRotation" runat="server" ControlName="lblNavigationInitialRotation" Suffix=":" CssClass="SubHead" /></td>
                  <td><asp:DropDownList id="cboNavigationInitialRotation" runat="server" CssClass="shortinput NormalTextBox" /></td>
                </tr>
                 <tr>
                   <td colspan="2">&nbsp;</td>
                </tr>
              </table>
              <table border="0" id="tblNavigationPos" runat="server" class="contenttable Normal" cellpadding="0" cellspacing="0">
                <tr style="padding-top:5px">
                  <td class="label2">&nbsp;</td>
                  <td><asp:Label id="lblNavigationButtonLeft" runat="server" CssClass="SubHead" Font-Underline="true" /></td>
                  <td><asp:Label id="lblNavigationButtonRight" runat="server" CssClass="SubHead" Font-Underline="true" /></td>
                </tr>
                <tr style="padding-top:5px">
                  <td class="label2"><dnn:Label id="lblNavigationButtonsLeft" runat="server" ControlName="lblNavigationButtonLeftLeft" Suffix=":" CssClass="SubHead" /></td>
                  <td><asp:TextBox id="txtNavigationButtonLeftLeft" runat="server" CssClass="shortinput NormalTextBox" />&nbsp;px&nbsp;&nbsp;</td>
                  <td><asp:TextBox id="txtNavigationButtonRightLeft" runat="server" CssClass="shortinput NormalTextBox" />&nbsp;px</td>
                </tr>
                <tr style="padding-top:5px">
                  <td class="label2"><dnn:Label id="lblNavigationButtonsTop" runat="server" ControlName="lblNavigationButtonLeftTop" Suffix=":" CssClass="SubHead" /></td>
                  <td><asp:TextBox id="txtNavigationButtonLeftTop" runat="server" CssClass="shortinput NormalTextBox" />&nbsp;px&nbsp;&nbsp;</td>
                  <td><asp:TextBox id="txtNavigationButtonRightTop" runat="server" CssClass="shortinput NormalTextBox" />&nbsp;px</td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td><hr /></td>
    </tr>
    <tr>
      <td class="group SubHead"><asp:ImageButton runat="server" id="imgEffectsToggle" />&nbsp;&nbsp;<asp:Label id="lblEffects" runat="server" CssClass="caption SubHead" /></td>
    </tr>
    <tr>
      <td class="group">
        <table id="tblEffects" runat="server" border="0" cellpadding="2" cellspacing="2" class="contenttable Normal">
          <tr>
            <td colspan="2"><asp:Label id="lblReflection" runat="server" CssClass="SubHead" /></td>
          </tr>
          <tr>
            <td class="label"><dnn:Label id="lblReflectionVisible" runat="server" ControlName="lblReflectionVisible" Suffix=":" CssClass="SubHead" /></td>
            <td style="width:260"><asp:CheckBox id="chkReflectionVisible" runat="server" Text="" CssClass="NormalTextBox" /></td>
          </tr>
          <tr>
            <td class="label"><dnn:Label id="lblReflectionAlpha" runat="server" ControlName="lblReflectionAlpha" Suffix=":" CssClass="SubHead" /></td>
            <td><asp:DropDownList id="cboReflectionAlpha" runat="server" CssClass="shortinput NormalTextBox" />&nbsp;%</td>
          </tr>
          <tr>
            <td class="label"><dnn:Label id="lblReflectionHeight" runat="server" ControlName="lblReflectionHeight" Suffix=":" CssClass="SubHead" /></td>
            <td><asp:DropDownList id="cboReflectionHeight" runat="server" CssClass="shortinput NormalTextBox" />&nbsp;%</td>
          </tr>
          <tr>
            <td class="label"><dnn:Label id="lblReflectionDistance" runat="server" ControlName="lblReflectionDistance" Suffix=":" CssClass="SubHead" /></td>
            <td><asp:DropDownList id="cboReflectionDistance" runat="server" CssClass="shortinput NormalTextBox" />&nbsp;px</td>
          </tr>
          <tr>
            <td colspan="2">&nbsp;</td>
          </tr>
          <tr>
          <td colspan="2"><asp:Label id="lblFrame" runat="server" CssClass="SubHead" /></td>
          </tr>
          <tr>
            <td class="label"><dnn:Label id="lblFrameVisible" runat="server" ControlName="lblFrameVisible" Suffix=":" CssClass="SubHead" /></td>
            <td><asp:CheckBox id="chkFrameVisible" runat="server" Text="" CssClass="NormalTextBox" /></td>
          </tr>
          <tr>
            <td class="label"><dnn:Label id="lblFrameDistance" runat="server" ControlName="lblFrameDistance" Suffix=":" CssClass="SubHead" /></td>
            <td><asp:DropDownList id="cboFrameDistance" runat="server" CssClass="shortinput NormalTextBox" />&nbsp;px</td>
          </tr>
          <tr>
            <td colspan="2">&nbsp;</td>
          </tr>
          <tr>
            <td class="label"><dnn:Label id="lblFrameBorderWidth" runat="server" ControlName="lblFrameBorderWidth" Suffix=":" CssClass="SubHead" /></td>
            <td><asp:DropDownList id="cboFrameBorderWidth" runat="server" CssClass="shortinput NormalTextBox" />&nbsp;px</td>
          </tr>
          <tr>
            <td class="label"><dnn:Label id="lblFrameBorderColor" runat="server" ControlName="lblFrameBorderColor" Suffix=":" CssClass="SubHead" /></td>
            <td><asp:TextBox id="txtFrameBorderColor" runat="server" MaxLength="7" CssClass="shortinput NormalTextBox" />&nbsp;
              <asp:ImageButton id="imgFrameBorderColor" runat="server" style="height:18; width:22; vertical-align:text-bottom;" /></td>
          </tr>
          <tr>
            <td class="label"><dnn:Label id="lblFrameBorderAlpha" runat="server" ControlName="lblFrameBorderAlpha" Suffix=":" CssClass="SubHead" /></td>
            <td><asp:DropDownList id="cboFrameBorderAlpha" runat="server" CssClass="shortinput NormalTextBox" />&nbsp;%</td>
          </tr>
          <tr>
            <td colspan="2">&nbsp;</td>
          </tr>
          <tr>
            <td class="label"><dnn:Label id="lblFrameFillColor1" runat="server" ControlName="lblFrameFillColor1" Suffix=":" CssClass="SubHead" /></td>
            <td><asp:TextBox id="txtFrameFillColor1" runat="server" MaxLength="7" CssClass="shortinput NormalTextBox" />&nbsp;
              <asp:ImageButton id="imgFrameFillColor1" runat="server" style="height:18; width:22; vertical-align:text-bottom;" /></td>
          </tr>
          <tr>
            <td class="label"><dnn:Label id="lblFrameFillAlpha1" runat="server" ControlName="lblFrameFillAlpha1" Suffix=":" CssClass="SubHead" /></td>
            <td><asp:DropDownList id="cboFrameFillAlpha1" runat="server" CssClass="shortinput NormalTextBox" />&nbsp;%</td>
          </tr>
          <tr>
            <td class="label"><dnn:Label id="lblFrameFillColor2" runat="server" ControlName="lblFrameFillColor2" Suffix=":" CssClass="SubHead" /></td>
            <td><asp:TextBox id="txtFrameFillColor2" runat="server" MaxLength="7" CssClass="shortinput NormalTextBox" />&nbsp;
              <asp:ImageButton id="imgFrameFillColor2" runat="server" style="height:18; width:22; vertical-align:text-bottom;" /></td>
          </tr>
          <tr>
            <td class="label"><dnn:Label id="lblFrameFillAlpha2" runat="server" ControlName="lblFrameFillAlpha2" Suffix=":" CssClass="SubHead" /></td>
            <td><asp:DropDownList id="cboFrameFillAlpha2" runat="server" CssClass="shortinput NormalTextBox" />&nbsp;%</td>
          </tr>
          <tr>
            <td class="label"><dnn:Label id="lblFrameFillTransition" runat="server" ControlName="lblFrameFillTransition" Suffix=":" CssClass="SubHead" /></td>
            <td><asp:DropDownList id="cboFrameFillTransition" runat="server" CssClass="shortinput NormalTextBox" />&nbsp;%</td>
          </tr>
          <tr>
            <td class="label"><dnn:Label id="lblFrameFillRotation" runat="server" ControlName="lblFrameFillRotation" Suffix=":" CssClass="SubHead" /></td>
            <td><asp:DropDownList id="cboFrameFillRotation" runat="server" CssClass="shortinput NormalTextBox" />&nbsp;rad</td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td><hr /></td>
    </tr>
    <tr>
      <td class="group SubHead"><asp:ImageButton runat="server" id="imgToolTipToggle" />&nbsp;&nbsp;<asp:Label id="lblToolTip" runat="server" CssClass="caption SubHead" /></td>
    </tr>
    <tr>
      <td class="group">
        <table id="tblToolTip" runat="server" border="0" cellpadding="2" cellspacing="2" class="contenttable Normal">
          <tr>
            <td class="label"><dnn:Label id="lblToolTipVisible" runat="server" ControlName="lblToolTipVisible" Suffix=":" CssClass="SubHead" /></td>
            <td style="width:260"><asp:CheckBox id="chkToolTipVisible" runat="server" Text="" CssClass="NormalTextBox" /></td>
          </tr>
          <tr>
            <td colspan="3">&nbsp;</td>
          </tr>
          <tr>
            <td class="label"><dnn:Label id="lblToolTipHTML" runat="server" ControlName="lblToolTipHTML" Suffix=":" CssClass="SubHead" /></td>
            <td><asp:CheckBox id="chkToolTipHTML" runat="server" Text="" CssClass="NormalTextBox" /></td>
          </tr>
          <tr>
            <td colspan="2">&nbsp;</td>
          </tr>
          <tr>
            <td class="label"><dnn:Label id="lblToolTipAntiAliasing" runat="server" ControlName="lblToolTipAntiAliasing" Suffix=":" CssClass="SubHead" /></td>
            <td><asp:CheckBox id="chkToolTipAntiAliasing" runat="server" Text="" CssClass="NormalTextBox" /></td>
          </tr>
          <tr>
            <td class="label"><dnn:Label id="lblToolTipAlign" runat="server" ControlName="lblToolTipAlign" Suffix=":" CssClass="SubHead" /></td>
            <td><asp:DropDownList id="cboToolTipAlign" runat="server" CssClass="shortinput NormalTextBox" /></td>
          </tr>
          <tr>
            <td class="label"><dnn:Label id="lblToolTipBold" runat="server" ControlName="lblToolTipBold" Suffix=":" CssClass="SubHead" /></td>
            <td><asp:CheckBox id="chkToolTipBold" runat="server" Text="" CssClass="NormalTextBox" /></td>
          </tr>
          <tr>
            <td class="label"><dnn:Label id="lblToolTipFont" runat="server" ControlName="lblToolTipFont" Suffix=":" CssClass="SubHead" /></td>
            <td><asp:DropDownList id="cboToolTipFont" runat="server" CssClass="mediuminput3 NormalTextBox" /></td>
          </tr>
          <tr>
            <td class="label"><dnn:Label id="lblToolTipFontColor" runat="server" ControlName="lblToolTipFontColor" Suffix=":" CssClass="SubHead" /></td>
            <td><asp:TextBox id="txtToolTipFontColor" runat="server" MaxLength="7" CssClass="shortinput NormalTextBox" />&nbsp;
              <asp:ImageButton id="imgToolTipFontColor" runat="server" style="height:18; width:22; vertical-align:text-bottom;" /></td>
          </tr>
          <tr>
            <td class="label"><dnn:Label id="lblToolTipFontSize" runat="server" ControlName="lblToolTipFontSize" Suffix=":" CssClass="SubHead" /></td>
            <td><asp:DropDownList id="cboToolTipFontSize" runat="server" CssClass="shortinput NormalTextBox" /></td>
          </tr>
          <tr>
            <td class="label"><dnn:Label id="lblToolTipLeading" runat="server" ControlName="lblToolTipLeading" Suffix=":" CssClass="SubHead" /></td>
            <td><asp:TextBox id="txtToolTipLeading" runat="server" CssClass="shortinput NormalTextBox" />&nbsp;px</td>
          </tr>
          <tr>
            <td class="label"><dnn:Label id="lblToolTipUnderline" runat="server" ControlName="lblToolTipUnderline" Suffix=":" CssClass="SubHead" /></td>
            <td><asp:CheckBox id="chkToolTipUnderline" runat="server" Text="" CssClass="NormalTextBox" /></td>
          </tr>
          <tr>
            <td colspan="2">&nbsp;</td>
          </tr>
          <tr>
            <td class="label"><dnn:Label id="lblToolTipDefaultTop" runat="server" ControlName="lblToolTipDefaultTop" Suffix=":" CssClass="SubHead" /></td>
            <td><asp:TextBox id="txtToolTipDefaultTop" runat="server" MaxLength="4" CssClass="shortinput Normal" />&nbsp;px</td>
          </tr>
          <tr>
            <td class="label"><dnn:Label id="lblToolTipWidth" runat="server" ControlName="lblToolTipWidth" Suffix=":" CssClass="SubHead" /></td>
            <td><asp:TextBox id="txtToolTipWidth" runat="server" MaxLength="4" CssClass="shortinput Normal" />&nbsp;px</td>
          </tr>
          <tr>
            <td class="label"><dnn:Label id="lblToolTipHeight" runat="server" ControlName="lblToolTipHeight" Suffix=":" CssClass="SubHead" /></td>
            <td><asp:TextBox id="txtToolTipHeight" runat="server" MaxLength="4" CssClass="shortinput Normal" />&nbsp;px</td>
          </tr>
          <tr>
            <td colspan="2">&nbsp;</td>
          </tr>
          <tr>
            <td class="label"><dnn:Label id="lblToolTipBgColor" runat="server" ControlName="lblToolTipBgColor" Suffix=":" CssClass="SubHead" /></td>
            <td><asp:TextBox id="txtToolTipBgColor" runat="server" MaxLength="7" CssClass="shortinput Normal" />&nbsp;
              <asp:ImageButton id="imgToolTipBgColor" runat="server" style="height:18; width:22; vertical-align:text-bottom;" /></td>
          </tr>
          <tr>
            <td class="label"><dnn:Label id="lblToolTipBorder" runat="server" ControlName="lblToolTipBorder" Suffix=":" CssClass="SubHead" /></td>
            <td><asp:CheckBox id="chkToolTipBorder" runat="server" Text="" CssClass="Normal" /></td>
          </tr>
          <tr>
            <td class="label"><dnn:Label id="lblToolTipBorderColor" runat="server" ControlName="lblToolTipBorderColor" Suffix=":" CssClass="SubHead" /></td>
            <td><asp:TextBox id="txtToolTipBorderColor" runat="server" MaxLength="7" CssClass="shortinput Normal" />&nbsp;
              <asp:ImageButton id="imgToolTipBorderColor" runat="server" style="height:18; width:22; vertical-align:text-bottom;" /></td>
          </tr>
          <tr>
            <td colspan="2">&nbsp;</td>
          </tr>
          <tr>
            <td class="label"><dnn:Label id="lblToolTipAlpha" runat="server" ControlName="lblToolTipHeight" Suffix=":" CssClass="SubHead" /></td>
            <td><asp:DropDownList id="cboToolTipAlpha" runat="server" CssClass="shortinput Normal" />&nbsp;%</td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td><hr /></td>
    </tr>
    <tr>
      <td class="group SubHead"><asp:ImageButton runat="server" id="imgContentStaticToggle" />&nbsp;&nbsp;<asp:Label id="lblContentStatic" runat="server" CssClass="caption SubHead" /></td>
    </tr>
    <tr>
      <td class="group">
        <table id="tblContentStatic" runat="server" border="0" cellpadding="2" cellspacing="2" class="contenttable Normal" >
          <tr>
            <td colspan="2">
              <table border="0" cellpadding="2" cellspacing="2" class="Normal">
                <tr>
                  <td></td>
                  <td><asp:Label id="lblContent3Header" runat="server" CssClass="SubHead" Font-Underline="true" /></td>
                  <td><asp:Label id="lblContent4Header" runat="server" CssClass="SubHead" Font-Underline="true" /></td>
                </tr>
                <tr>
                  <td class="label"><dnn:Label id="lblContentHTMLStatic" runat="server" ControlName="lblContentHTMLStatic" Suffix=":" CssClass="SubHead" /></td>
                  <td><asp:CheckBox id="chkContent3HTML" runat="server" Text="" CssClass="NormalTextBox" /></td>
                  <td><asp:CheckBox id="chkContent4HTML" runat="server" Text="" CssClass="NormalTextBox" /></td>
                </tr>
                <tr>
                  <td colspan="3">&nbsp;</td>
                </tr>
                <tr>
                  <td class="label"><dnn:Label id="lblContentAntiAliasingStatic" runat="server" ControlName="lblContentAntiAliasingStatic" Suffix=":" CssClass="SubHead" /></td>
                  <td><asp:CheckBox id="chkContent3AntiAliasing" runat="server" Text="" CssClass="NormalTextBox" /></td>
                  <td><asp:CheckBox id="chkContent4AntiAliasing" runat="server" Text="" CssClass="NormalTextBox" /></td>
                </tr>
                <tr>
                  <td class="label"><dnn:Label id="lblContentAlignStatic" runat="server" ControlName="lblContentAlignStatic" Suffix=":" CssClass="SubHead" /></td>
                  <td><asp:DropDownList id="cboContent3Align" runat="server" CssClass="shortinput NormalTextBox" /></td>
                  <td><asp:DropDownList id="cboContent4Align" runat="server" CssClass="shortinput NormalTextBox" /></td>
                </tr>
                <tr>
                  <td class="label"><dnn:Label id="lblContentBoldStatic" runat="server" ControlName="lblContentBoldStatic" Suffix=":" CssClass="SubHead" /></td>
                  <td><asp:CheckBox id="chkContent3Bold" runat="server" Text="" CssClass="NormalTextBox" /></td>
                  <td><asp:CheckBox id="chkContent4Bold" runat="server" Text="" CssClass="NormalTextBox" /></td>
                </tr>
                <tr>
                  <td class="label"><dnn:Label id="lblContentFontStatic" runat="server" ControlName="lblContentFontStatic" Suffix=":" CssClass="SubHead" /></td>
                  <td><asp:DropDownList id="cboContent3Font" runat="server" CssClass="mediuminput2 NormalTextBox" /></td>
                  <td><asp:DropDownList id="cboContent4Font" runat="server" CssClass="mediuminput2 NormalTextBox" /></td>
                </tr>
                <tr>
                  <td class="label"><dnn:Label id="lblContentFontColorStatic" runat="server" ControlName="lblContentFontColorStatic" Suffix=":" CssClass="SubHead" /></td>
                  <td><asp:TextBox id="txtContent3FontColor" runat="server" MaxLength="7" CssClass="shortinput NormalTextBox" />&nbsp;
                    <asp:ImageButton id="imgContent3FontColor" runat="server" style="height:18; width:22; vertical-align:text-bottom;" /></td>
                  <td><asp:TextBox id="txtContent4FontColor" runat="server" MaxLength="7" CssClass="shortinput NormalTextBox" />&nbsp;
                    <asp:ImageButton id="imgContent4FontColor" runat="server" style="height:18; width:22; vertical-align:text-bottom;" /></td>
                </tr>
                <tr>
                  <td class="label"><dnn:Label id="lblContentFontSizeStatic" runat="server" ControlName="lblContentFontSizeStatic" Suffix=":" CssClass="SubHead" /></td>
                  <td><asp:DropDownList id="cboContent3FontSize" runat="server" CssClass="shortinput NormalTextBox" /></td>
                  <td><asp:DropDownList id="cboContent4FontSize" runat="server" CssClass="shortinput NormalTextBox" /></td>
                </tr>
                <tr>
                  <td class="label"><dnn:Label id="lblContentLeadingStatic" runat="server" ControlName="lblContentLeadingStatic" Suffix=":" CssClass="SubHead" /></td>
                  <td><asp:TextBox id="txtContent3Leading" runat="server" CssClass="shortinput NormalTextBox" />&nbsp;px</td>
                  <td><asp:TextBox id="txtContent4Leading" runat="server" CssClass="shortinput NormalTextBox" />&nbsp;px</td>
                </tr>
                <tr>
                  <td class="label"><dnn:Label id="lblContentUnderlineStatic" runat="server" ControlName="lblContentUnderlineStatic" Suffix=":" CssClass="SubHead" /></td>
                  <td><asp:CheckBox id="chkContent3Underline" runat="server" Text="" CssClass="NormalTextBox" /></td>
                  <td><asp:CheckBox id="chkContent4Underline" runat="server" Text="" CssClass="NormalTextBox" /></td>
                </tr>
                <tr>
                  <td colspan="3">&nbsp;</td>
                </tr>
                <tr>
                  <td class="label"><dnn:Label id="lblContentLeftStatic" runat="server" ControlName="lblContentLeftStatic" Suffix=":" CssClass="SubHead" /></td>
                  <td><asp:TextBox id="txtContent3Left" runat="server" MaxLength="4" CssClass="shortinput NormalTextBox" />&nbsp;px</td>
                  <td><asp:TextBox id="txtContent4Left" runat="server" MaxLength="4" CssClass="shortinput NormalTextBox" />&nbsp;px</td>
                </tr>
                <tr>
                  <td class="label"><dnn:Label id="lblContentTopStatic" runat="server" ControlName="lblContentTopStatic" Suffix=":" CssClass="SubHead" /></td>
                  <td><asp:TextBox id="txtContent3Top" runat="server" MaxLength="4" CssClass="shortinput NormalTextBox" />&nbsp;px</td>
                  <td><asp:TextBox id="txtContent4Top" runat="server" MaxLength="4" CssClass="shortinput NormalTextBox" />&nbsp;px</td>
                </tr>
                <tr>
                  <td class="label"><dnn:Label id="lblContentWidthStatic" runat="server" ControlName="lblContentWidthStatic" Suffix=":" CssClass="SubHead" /></td>
                  <td><asp:TextBox id="txtContent3Width" runat="server" MaxLength="4" CssClass="shortinput NormalTextBox" />&nbsp;px</td>
                  <td><asp:TextBox id="txtContent4Width" runat="server" MaxLength="4" CssClass="shortinput NormalTextBox" />&nbsp;px</td>
                </tr>
                <tr>
                  <td class="label"><dnn:Label id="lblContentHeightStatic" runat="server" ControlName="lblContentHeightStatic" Suffix=":" CssClass="SubHead" /></td>
                  <td><asp:TextBox id="txtContent3Height" runat="server" MaxLength="4" CssClass="shortinput NormalTextBox" />&nbsp;px</td>
                  <td><asp:TextBox id="txtContent4Height" runat="server" MaxLength="4" CssClass="shortinput NormalTextBox" />&nbsp;px</td>
                </tr>
                <tr>
                  <td colspan="3">&nbsp;</td>
                </tr>
                <tr>
                  <td class="label"><dnn:Label id="lblContentBgColorStatic" runat="server" ControlName="lblContentBgColorStatic" Suffix=":" CssClass="SubHead" /></td>
                  <td><asp:TextBox id="txtContent3BgColor" runat="server" MaxLength="7" CssClass="shortinput NormalTextBox" />&nbsp;
                    <asp:ImageButton id="imgContent3BgColor" runat="server" style="height:18; width:22; vertical-align:text-bottom;" /></td>
                  <td><asp:TextBox id="txtContent4BgColor" runat="server" MaxLength="7" CssClass="shortinput NormalTextBox" />&nbsp;
                    <asp:ImageButton id="imgContent4BgColor" runat="server" style="height:18; width:22; vertical-align:text-bottom;" /></td>
                </tr>
                <tr>
                  <td class="label"><dnn:Label id="lblContentBorderStatic" runat="server" ControlName="lblContentBorderStatic" Suffix=":" CssClass="SubHead" /></td>
                  <td><asp:CheckBox id="chkContent3Border" runat="server" Text="" CssClass="NormalTextBox" /></td>
                  <td><asp:CheckBox id="chkContent4Border" runat="server" Text="" CssClass="NormalTextBox" /></td>
                </tr>
                <tr>
                  <td class="label"><dnn:Label id="lblContentBorderColorStatic" runat="server" ControlName="lblContentBorderColorStatic" Suffix=":" CssClass="SubHead" /></td>
                  <td><asp:TextBox id="txtContent3BorderColor" runat="server" MaxLength="7" CssClass="shortinput NormalTextBox" />&nbsp;
                    <asp:ImageButton id="imgContent3BorderColor" runat="server" style="height:18; width:22; vertical-align:text-bottom;" /></td>
                  <td><asp:TextBox id="txtContent4BorderColor" runat="server" MaxLength="7" CssClass="shortinput NormalTextBox" />&nbsp;
                    <asp:ImageButton id="imgContent4BorderColor" runat="server" style="height:18; width:22; vertical-align:text-bottom;" /></td>
                </tr>
                <tr>
                  <td colspan="3">&nbsp;</td>
                </tr>
                <tr>
                  <td class="label"><dnn:Label id="lblContentAlphaStatic" runat="server" ControlName="lblContentAlphaStatic" Suffix=":" CssClass="SubHead" /></td>
                  <td><asp:DropDownList id="cboContent3Alpha" runat="server" CssClass="shortinput NormalTextBox" /></td>
                  <td><asp:DropDownList id="cboContent4Alpha" runat="server" CssClass="shortinput NormalTextBox" /></td>
                </tr>
                <tr>
                  <td class="label"><dnn:Label id="lblContentSelectableStatic" runat="server" ControlName="lblContentSelectableStatic" Suffix=":" CssClass="SubHead" /></td>
                  <td><asp:CheckBox id="chkContent3Selectable" runat="server" Text="" CssClass="NormalTextBox" /></td>
                  <td><asp:CheckBox id="chkContent4Selectable" runat="server" Text="" CssClass="NormalTextBox" /></td>
                </tr>
                <tr>
                  <td class="label"><dnn:Label id="lblContentTopMostStatic" runat="server" ControlName="lblContentTopMostStatic" Suffix=":" CssClass="SubHead" /></td>
                  <td><asp:CheckBox id="chkContent3TopMost" runat="server" Text="" CssClass="NormalTextBox" /></td>
                  <td><asp:CheckBox id="chkContent4TopMost" runat="server" Text="" CssClass="NormalTextBox" /></td>
                </tr>
                <tr>
                  <td colspan="3">&nbsp;</td>
                </tr>
                <tr>
                  <td class="label"><dnn:Label id="lblContentVisibleOnAnimationPage" runat="server" ControlName="lblContentVisibleOnAnimationPage" Suffix=":" CssClass="SubHead" /></td>
                  <td class="label"><asp:CheckBox id="chkContent3VisibleOnAnimationPage" runat="server" Text="" CssClass="NormalTextBox" /></td>
                  <td class="label"><asp:CheckBox id="chkContent4VisibleOnAnimationPage" runat="server" Text="" CssClass="NormalTextBox" /></td>
                </tr>
                <tr>
                  <td class="label"><dnn:Label id="lblContentVisibleOnDetailPage" runat="server" ControlName="lblContentVisibleOnDetailPage" Suffix=":" CssClass="SubHead" /></td>
                  <td><asp:CheckBox id="chkContent3VisibleOnDetailPage" runat="server" Text="" CssClass="NormalTextBox" /></td>
                  <td><asp:CheckBox id="chkContent4VisibleOnDetailPage" runat="server" Text="" CssClass="NormalTextBox" /></td>
                </tr>
                <tr>
                  <td colspan="3"><hr style="border-style:dotted" /></td>
                </tr>
                <tr>
                  <td class="label"><dnn:Label id="lblContent3" runat="server" ControlName="lblContent3" Suffix=":" CssClass="SubHead" /></td>
                  <td colspan="2"><asp:TextBox id="txtContent3" runat="server" Rows="8" TextMode="MultiLine" CssClass="longinput NormalTextBox" /></td>
                </tr>
                <tr>
                  <td class="label"><dnn:Label id="lblContent4" runat="server" ControlName="lblContent4" Suffix=":" CssClass="SubHead" /></td>
                  <td colspan="2"><asp:TextBox id="txtContent4" runat="server" Rows="8" TextMode="MultiLine" CssClass="longinput NormalTextBox" /></td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td><hr /></td>
    </tr>
    <tr id="trDetailPage1">
      <td class="group SubHead"><asp:ImageButton runat="server" id="imgDetailPageToggle" />&nbsp;&nbsp;<asp:Label id="lblDetailPage" runat="server" CssClass="caption SubHead" /></td>
    </tr>
    <tr id="trDetailPage2">
      <td class="group">
        <table id="tblDetailPage" runat="server" border="0" cellpadding="2" cellspacing="2" class="contenttable Normal" >
          <tr>
            <td colspan="2">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="2">
              <asp:Label id="lblContentDynamic" runat="server" CssClass="SubHead" />
            </td>
          </tr>
          <tr>
            <td colspan="2">
              <table border="0" cellpadding="2" cellspacing="2" class="Normal">
                <tr>
                  <td>&nbsp;</td>
                  <td><asp:Label id="lblContent1Header" runat="server" CssClass="SubHead" Font-Underline="true" /></td>
                  <td><asp:Label id="lblContent2Header" runat="server" CssClass="SubHead" Font-Underline="true" /></td>
                </tr>
                <tr>
                  <td class="label"><dnn:Label id="lblContentHTMLDynamic" runat="server" ControlName="lblContentHTMLDynamic" Suffix=":" CssClass="SubHead" /></td>
                  <td><asp:CheckBox id="chkContent1HTML" runat="server" Text="" CssClass="NormalTextBox" /></td>
                  <td><asp:CheckBox id="chkContent2HTML" runat="server" Text="" CssClass="NormalTextBox" /></td>
                </tr>
                <tr>
                  <td colspan="3">&nbsp;</td>
                </tr>
                <tr>
                  <td class="label"><dnn:Label id="lblContentAntiAliasingDynamic" runat="server" ControlName="lblContentAntiAliasingDynamic" Suffix=":" CssClass="SubHead" /></td>
                  <td><asp:CheckBox id="chkContent1AntiAliasing" runat="server" Text="" CssClass="NormalTextBox" /></td>
                  <td><asp:CheckBox id="chkContent2AntiAliasing" runat="server" Text="" CssClass="NormalTextBox" /></td>
                </tr>
                <tr>
                  <td class="label"><dnn:Label id="lblContentAlignDynamic" runat="server" ControlName="lblContentAlignDynamic" Suffix=":" CssClass="SubHead" /></td>
                  <td><asp:DropDownList id="cboContent1Align" runat="server" CssClass="shortinput NormalTextBox" /></td>
                  <td><asp:DropDownList id="cboContent2Align" runat="server" CssClass="shortinput NormalTextBox" /></td>
                </tr>
                <tr>
                  <td class="label"><dnn:Label id="lblContentBoldDynamic" runat="server" ControlName="lblContentBoldDynamic" Suffix=":" CssClass="SubHead" /></td>
                  <td><asp:CheckBox id="chkContent1Bold" runat="server" Text="" CssClass="NormalTextBox" /></td>
                  <td><asp:CheckBox id="chkContent2Bold" runat="server" Text="" CssClass="NormalTextBox" /></td>
                </tr>
                <tr>
                  <td class="label"><dnn:Label id="lblContentFontDynamic" runat="server" ControlName="lblContentFontDynamic" Suffix=":" CssClass="SubHead" /></td>
                  <td><asp:DropDownList id="cboContent1Font" runat="server" CssClass="mediuminput2 NormalTextBox" /></td>
                  <td><asp:DropDownList id="cboContent2Font" runat="server" CssClass="mediuminput2 NormalTextBox" /></td>
                </tr>
                <tr>
                  <td class="label"><dnn:Label id="lblContentFontColorDynamic" runat="server" ControlName="lblContentFontColorDynamic" Suffix=":" CssClass="SubHead" /></td>
                  <td><asp:TextBox id="txtContent1FontColor" runat="server" MaxLength="7" CssClass="shortinput NormalTextBox" />&nbsp;
                    <asp:ImageButton id="imgContent1FontColor" runat="server" style="height:18; width:22; vertical-align:text-bottom;" /></td>
                  <td><asp:TextBox id="txtContent2FontColor" runat="server" MaxLength="7" CssClass="shortinput NormalTextBox" />&nbsp;
                    <asp:ImageButton id="imgContent2FontColor" runat="server" style="height:18; width:22; vertical-align:text-bottom;" /></td>
                </tr>
                <tr>
                  <td class="label"><dnn:Label id="lblContentFontSizeDynamic" runat="server" ControlName="lblContentFontSizeDynamic" Suffix=":" CssClass="SubHead" /></td>
                  <td><asp:DropDownList id="cboContent1FontSize" runat="server" CssClass="shortinput NormalTextBox" /></td>
                  <td><asp:DropDownList id="cboContent2FontSize" runat="server" CssClass="shortinput NormalTextBox" /></td>
                </tr>
                <tr>
                  <td class="label"><dnn:Label id="lblContentLeadingDynamic" runat="server" ControlName="lblContentLeadingDynamic" Suffix=":" CssClass="SubHead" /></td>
                  <td><asp:TextBox id="txtContent1Leading" runat="server" CssClass="shortinput NormalTextBox" />&nbsp;px</td>
                  <td><asp:TextBox id="txtContent2Leading" runat="server" CssClass="shortinput NormalTextBox" />&nbsp;px</td>
                </tr>
                <tr>
                  <td class="label"><dnn:Label id="lblContentUnderlineDynamic" runat="server" ControlName="lblContentUnderlineDynamic" Suffix=":" CssClass="SubHead" /></td>
                  <td><asp:CheckBox id="chkContent1Underline" runat="server" Text="" CssClass="NormalTextBox" /></td>
                  <td><asp:CheckBox id="chkContent2Underline" runat="server" Text="" CssClass="NormalTextBox" /></td>
                </tr>
                <tr>
                  <td colspan="3">&nbsp;</td>
                </tr>
                <tr>
                  <td class="label"><dnn:Label id="lblContentLeftDynamic" runat="server" ControlName="lblContentLeftDynamic" Suffix=":" CssClass="SubHead" /></td>
                  <td><asp:TextBox id="txtContent1Left" runat="server" MaxLength="4" CssClass="shortinput NormalTextBox" />&nbsp;px</td>
                  <td><asp:TextBox id="txtContent2Left" runat="server" MaxLength="4" CssClass="shortinput NormalTextBox" />&nbsp;px</td>
                </tr>
                <tr>
                  <td class="label"><dnn:Label id="lblContentTopDynamic" runat="server" ControlName="lblContentTopDynamic" Suffix=":" CssClass="SubHead" /></td>
                  <td><asp:TextBox id="txtContent1Top" runat="server" MaxLength="4" CssClass="shortinput NormalTextBox" />&nbsp;px</td>
                  <td><asp:TextBox id="txtContent2Top" runat="server" MaxLength="4" CssClass="shortinput NormalTextBox" />&nbsp;px</td>
                </tr>
                <tr>
                  <td class="label"><dnn:Label id="lblContentWidthDynamic" runat="server" ControlName="lblContentWidthDynamic" Suffix=":" CssClass="SubHead" /></td>
                  <td><asp:TextBox id="txtContent1Width" runat="server" MaxLength="4" CssClass="shortinput NormalTextBox" />&nbsp;px</td>
                  <td><asp:TextBox id="txtContent2Width" runat="server" MaxLength="4" CssClass="shortinput NormalTextBox" />&nbsp;px</td>
                </tr>
                <tr>
                  <td class="label"><dnn:Label id="lblContentHeightDynamic" runat="server" ControlName="lblContentHeightDynamic" Suffix=":" CssClass="SubHead" /></td>
                  <td><asp:TextBox id="txtContent1Height" runat="server" MaxLength="4" CssClass="shortinput NormalTextBox" />&nbsp;px</td>
                  <td><asp:TextBox id="txtContent2Height" runat="server" MaxLength="4" CssClass="shortinput NormalTextBox" />&nbsp;px</td>
                </tr>
                <tr>
                  <td colspan="3">&nbsp;</td>
                </tr>
                <tr>
                  <td class="label"><dnn:Label id="lblContentBgColorDynamic" runat="server" ControlName="lblContentBgColorDynamic" Suffix=":" CssClass="SubHead" /></td>
                  <td><asp:TextBox id="txtContent1BgColor" runat="server" MaxLength="7" CssClass="shortinput NormalTextBox" />&nbsp;
                    <asp:ImageButton id="imgContent1BgColor" runat="server" style="height:18; width:22; vertical-align:text-bottom;" /></td>
                  <td><asp:TextBox id="txtContent2BgColor" runat="server" MaxLength="7" CssClass="shortinput NormalTextBox" />&nbsp;
                    <asp:ImageButton id="imgContent2BgColor" runat="server" style="height:18; width:22; vertical-align:text-bottom;" /></td>
                </tr>
                <tr>
                  <td class="label"><dnn:Label id="lblContentBorderDynamic" runat="server" ControlName="lblContentBorderDynamic" Suffix=":" CssClass="SubHead" /></td>
                  <td><asp:CheckBox id="chkContent1Border" runat="server" Text="" CssClass="NormalTextBox" /></td>
                  <td><asp:CheckBox id="chkContent2Border" runat="server" Text="" CssClass="NormalTextBox" /></td>
                </tr>
                <tr>
                  <td class="label"><dnn:Label id="lblContentBorderColorDynamic" runat="server" ControlName="lblContentBorderColorDynamic" Suffix=":" CssClass="SubHead" /></td>
                  <td><asp:TextBox id="txtContent1BorderColor" runat="server" MaxLength="7" CssClass="shortinput NormalTextBox" />&nbsp;
                    <asp:ImageButton id="imgContent1BorderColor" runat="server" style="height:18; width:22; vertical-align:text-bottom;" /></td>
                  <td><asp:TextBox id="txtContent2BorderColor" runat="server" MaxLength="7" CssClass="shortinput NormalTextBox" />&nbsp;
                    <asp:ImageButton id="imgContent2BorderColor" runat="server" style="height:18; width:22; vertical-align:text-bottom;" /></td>
                </tr>
                <tr>
                  <td colspan="3">&nbsp;</td>
                </tr>
                <tr>
                  <td class="label"><dnn:Label id="lblContentAlphaDynamic" runat="server" ControlName="lblContentAlphaDynamic" Suffix=":" CssClass="SubHead" /></td>
                  <td><asp:DropDownList id="cboContent1Alpha" runat="server" CssClass="shortinput NormalTextBox" /></td>
                  <td><asp:DropDownList id="cboContent2Alpha" runat="server" CssClass="shortinput NormalTextBox" /></td>
                </tr>
                <tr>
                  <td class="label"><dnn:Label id="lblContentSelectableDynamic" runat="server" ControlName="lblContentSelectableDynamic" Suffix=":" CssClass="SubHead" /></td>
                  <td><asp:CheckBox id="chkContent1Selectable" runat="server" Text="" CssClass="NormalTextBox" /></td>
                  <td><asp:CheckBox id="chkContent2Selectable" runat="server" Text="" CssClass="NormalTextBox" /></td>
                </tr>
              </table>
            </td>
          </tr>
          <tr><td colspan="2">&nbsp;</td></tr>
          <tr>
            <td colspan="2">
              <asp:Label id="lblDetailImage" runat="server" CssClass="SubHead" />
            </td>
          </tr>
          <tr>
            <td class="label"><dnn:Label id="lblDetailImageLeft" runat="server" ControlName="lblDetailImageLeft" Suffix=":" CssClass="SubHead" /></td>
            <td style="width:260"><asp:TextBox id="txtDetailImageLeft" runat="server" MaxLength="4" CssClass="shortinput NormalTextBox" />&nbsp;px</td>
          </tr>
          <tr>
            <td class="label"><dnn:Label id="lblDetailImageTop" runat="server" ControlName="lblDetailImageTop" Suffix=":" CssClass="SubHead" /></td>
            <td><asp:TextBox id="txtDetailImageTop" runat="server" MaxLength="4" CssClass="shortinput NormalTextBox" />&nbsp;px</td>
          </tr>
       </table>
      </td>
    </tr>
    <tr id="trLightbox1">
      <td class="group SubHead"><asp:ImageButton runat="server" id="imgLightboxToggle" />&nbsp;&nbsp;<asp:Label id="lblLightbox" runat="server" CssClass="caption SubHead" /></td>
    </tr>
    <tr id="trLightbox2">
      <td class="group">
        <table id="tblLightbox" runat="server" border="0" cellpadding="2" cellspacing="2" class="contenttable Normal" >
          <tr>
            <td class="label"><dnn:Label id="lblLightboxContent" runat="server" ControlName="lblLightboxContent" Suffix=":" CssClass="SubHead" /></td>
            <td><asp:DropDownList id="cboLightboxContent" runat="server" CssClass="mediuminput NormalTextBox" /></td>
          </tr>
          <tr>
            <td class="label"><dnn:Label id="lblLightboxTitle" runat="server" ControlName="lblLightboxTitle" Suffix=":" CssClass="SubHead" /></td>
            <td><asp:DropDownList id="cboLightboxTitle" runat="server" CssClass="mediuminput NormalTextBox" onchange="javascript:cboLightboxTitle_onchange()" /><br />
                <div style="padding-top:5px"><asp:TextBox id="txtLightboxTitle" runat="server" CssClass="mediuminput3 NormalTextBox" /></div>
            </td>
          </tr>
          <tr>
            <td class="label"><dnn:Label id="lblLightboxTheme" runat="server" ControlName="lblLightboxTheme" Suffix=":" CssClass="SubHead" /></td>
            <td style="width:260"><asp:DropDownList id="cboLightboxTheme" runat="server" CssClass="mediuminput NormalTextBox" /></td>
          </tr>
           <tr>
            <td class="label"><dnn:Label id="lblLightboxAlpha" runat="server" ControlName="lblLightboxAlpha" Suffix=":" CssClass="SubHead" /></td>
            <td><asp:DropDownList id="cboLightboxAlpha" runat="server" CssClass="shortinput NormalTextBox" />&nbsp;%</td>
          </tr>
          <tr><td>&nbsp;</td><td>&nbsp;</td></tr>
          <tr>
            <td class="label"><dnn:Label id="lblLightboxCenter" runat="server" ControlName="lblLightboxCenter" Suffix=":" CssClass="SubHead" /></td>
            <td><asp:CheckBox id="chkLightboxCenter" runat="server" Text="" CssClass="NormalTextBox" /></td>
          </tr>
          <tr>
            <td class="label"><dnn:Label id="lblLightboxLeft" runat="server" ControlName="lblLightboxLeft" Suffix=":" CssClass="SubHead" /></td>
            <td><asp:TextBox id="txtLightboxLeft" runat="server" MaxLength="4" CssClass="shortinput NormalTextBox" />&nbsp;px</td>
          </tr>
          <tr>
            <td class="label"><dnn:Label id="lblLightboxTop" runat="server" ControlName="lblLightboxTop" Suffix=":" CssClass="SubHead" /></td>
            <td><asp:TextBox id="txtLightboxTop" runat="server" MaxLength="4" CssClass="shortinput NormalTextBox" />&nbsp;px</td>
          </tr>
          <tr><td>&nbsp;</td><td>&nbsp;</td></tr>
          <tr>
            <td class="label"><dnn:Label id="lblLightboxResizable" runat="server" ControlName="lblLightboxResizable" Suffix=":" CssClass="SubHead" /></td>
            <td><asp:CheckBox id="chkLightboxResizable" runat="server" Text="" CssClass="NormalTextBox" /></td>
          </tr>
          <tr>
            <td class="label"><dnn:Label id="lblLightboxWidth" runat="server" ControlName="lblLightboxWidth" Suffix=":" CssClass="SubHead" /></td>
            <td><asp:TextBox id="txtLightboxWidth" runat="server" MaxLength="4" CssClass="shortinput NormalTextBox" />&nbsp;px</td>
          </tr>
          <tr>
            <td class="label"><dnn:Label id="lblLightboxHeight" runat="server" ControlName="lblLightboxHeight" Suffix=":" CssClass="SubHead" /></td>
            <td><asp:TextBox id="txtLightboxHeight" runat="server" MaxLength="4" CssClass="shortinput NormalTextBox" />&nbsp;px</td>
          </tr>
          <tr><td>&nbsp;</td><td>&nbsp;</td></tr>
          <tr>
            <td class="label"><dnn:Label id="lblLightboxEffectEntry" runat="server" ControlName="lblLightboxEffectEntry" Suffix=":" CssClass="SubHead" /></td>
            <td><asp:DropDownList id="cboLightboxEffectEntry" runat="server" CssClass="mediuminput NormalTextBox" /></td>
          </tr>
          <tr>
            <td class="label"><dnn:Label id="lblLightboxEffectExit" runat="server" ControlName="lblLightboxEffectExit" Suffix=":" CssClass="SubHead" /></td>
            <td><asp:DropDownList id="cboLightboxEffectExit" runat="server" CssClass="mediuminput NormalTextBox" /></td>
          </tr>
          <tr>
            <td class="label"><dnn:Label id="lblLightboxEffectsTime" runat="server" ControlName="lblLightboxEffectsTime" Suffix=":" CssClass="SubHead" /></td>
            <td><asp:DropDownList id="cboLightboxEffectsTime" runat="server" CssClass="mediuminput NormalTextBox" /></td>
          </tr>
        </table>
      </td>
    </tr>
    
  </table>
  <div class="pagemenu">
    <asp:LinkButton runat="server" id="cmdUpdateBottom" CssClass="CommandButton" OnClick="cmdUpdate_Click"></asp:LinkButton>&nbsp;
    <asp:LinkButton runat="server" id="cmdCancelBottom" CssClass="CommandButton" OnClick="cmdCancel_Click"></asp:LinkButton>
  </div>
</div>

<asp:HiddenField id="hiddenModuleID" runat="server" />
<asp:HiddenField id="hiddenModulePath" runat="server" />
<asp:HiddenField id="hiddenTblFlash" runat="server" Value="none" />
<asp:HiddenField id="hiddenTblCarousel" runat="server" Value="none" />
<asp:HiddenField id="hiddenTblBackground" runat="server" Value="none" />
<asp:HiddenField id="hiddenTblNavigation" runat="server" Value="none" />
<asp:HiddenField id="hiddenTblEffects" runat="server" Value="none" />
<asp:HiddenField id="hiddenTblToolTip" runat="server" Value="none" />
<asp:HiddenField id="hiddenTblContentStatic" runat="server" Value="none" />
<asp:HiddenField id="hiddenTblDetailPage" runat="server" Value="none" />
<asp:HiddenField id="hiddenTblLightbox" runat="server" Value="none" />

<script language="javascript" type="text/javascript">
  
  HandleClickActionChanged();
  cboNavigationType_onchange();
  chkBackgroundTransparent_onClick();
  cboLightboxTitle_onchange();
  
  function ColorPicker(ifn,sam,path){var newwindow='';var bl=screen.width/2-102;var bt=screen.height/2-104;var page=path+"?ifn="+escape(ifn)+"&sam="+escape(sam);if(!newwindow.closed&&newwindow.location){newwindow.location.href=page;}else{newwindow=window.open(page,"CTRLWINDOW","help=no,status=no,toolbar=no,menubar=no,location=no,scrollbars=no,resizable=no,dependent=yes,width=248,height=280,left="+bl+",top="+bt+",");if(!newwindow.opener){newwindow.opener=self;}if(window.focus){newwindow.focus();}}}
  
  function FilePicker(filePath)
  {  
    var xsize = screen.width;var ysize = screen.height;var width=360;var height=500;var xpos=(xsize-width)/2;var ypos=(ysize-height)/2;var wnd = window.open(filePath,"","scrollbars=yes,status=no,toolbar=no,location=no,directories=no,resizable=no,menubar=no,width="+width+",height="+height+",screenX="+xpos+",screenY="+ypos+",top="+ypos+",left="+xpos);if(!wnd.opener){wnd.opener = self;}if(window.focus){wnd.focus();}
  }
  
  function HandleClickActionChanged()
  {
    if(document.getElementById("<%=optImageClickActionLink.ClientID%>").checked)
    {
      document.getElementById("trDetailPage1").style.display = "none";
      document.getElementById("trDetailPage2").style.display = "none";
      document.getElementById("trLightbox1").style.display = "none";
      document.getElementById("trLightbox2").style.display = "none";
    }
    else if(document.getElementById("<%=optImageClickActionDetail.ClientID%>").checked)
    {
      document.getElementById("trDetailPage1").style.display = "";
      document.getElementById("trDetailPage2").style.display = "";
      document.getElementById("trLightbox1").style.display = "none";
      document.getElementById("trLightbox2").style.display = "none";
    }
    else if(document.getElementById("<%=optImageClickActionLightbox.ClientID%>").checked)
    {
      document.getElementById("trDetailPage1").style.display = "none";
      document.getElementById("trDetailPage2").style.display = "none";
      document.getElementById("trLightbox1").style.display = "";
      document.getElementById("trLightbox2").style.display = "";
    }
  }
  
  function cboNavigationType_onchange()
  {
    if(document.getElementById("<%=cboNavigationType.ClientID%>")[document.getElementById("<%=cboNavigationType.ClientID%>").selectedIndex].value == "auto")
    {
      document.getElementById("<%=tblNavigationEx.ClientID%>").style.display = "none";
      document.getElementById("<%=tblNavigationPos.ClientID%>").style.display = "none";
    }
    else if(document.getElementById("<%=cboNavigationType.ClientID%>")[document.getElementById("<%=cboNavigationType.ClientID%>").selectedIndex].value == "custom")
    {
      document.getElementById("<%=tblNavigationEx.ClientID%>").style.display = "";
      document.getElementById("<%=tblNavigationPos.ClientID%>").style.display = "";
    }
    else
    {
      document.getElementById("<%=tblNavigationEx.ClientID%>").style.display = "";
      document.getElementById("<%=tblNavigationPos.ClientID%>").style.display = "none";
    }
  }
  
  function ToggleSettings(ctrTable,ctrImage,ctrHidden)
  {
    
    if(document.getElementById(ctrTable).style.display == "")
    {
      document.getElementById(ctrTable).style.display = "none";
      document.getElementById(ctrImage).src = document.getElementById("<%=hiddenModulePath.ClientID%>").value + "res/plus12x15.gif";
      document.getElementById(ctrHidden).value = "none";
    }
    else
    {
      document.getElementById(ctrTable).style.display = "";
      document.getElementById(ctrImage).src = document.getElementById("<%=hiddenModulePath.ClientID%>").value + "res/minus12x15.gif";
      document.getElementById(ctrHidden).value = "";
    }
    
    var newDisplay = document.getElementById(ctrTable).style.display;
    switch(ctrTable)
    {
      case document.getElementById("<%=tblFlash.ClientID%>").id: document.getElementById("<%=hiddenTblFlash.ClientID%>").value = newDisplay; break;
      case document.getElementById("<%=tblCarousel.ClientID%>").id: document.getElementById("<%=hiddenTblCarousel.ClientID%>").value = newDisplay; break;
      case document.getElementById("<%=tblBackground.ClientID%>").id: document.getElementById("<%=hiddenTblBackground.ClientID%>").value = newDisplay; break;
      case document.getElementById("<%=tblNavigation.ClientID%>").id: document.getElementById("<%=hiddenTblNavigation.ClientID%>").value = newDisplay; break;
      case document.getElementById("<%=tblEffects.ClientID%>").id: document.getElementById("<%=hiddenTblEffects.ClientID%>").value = newDisplay; break;
      case document.getElementById("<%=tblToolTip.ClientID%>").id: document.getElementById("<%=hiddenTblToolTip.ClientID%>").value = newDisplay; break;
      case document.getElementById("<%=tblContentStatic.ClientID%>").id: document.getElementById("<%=hiddenTblContentStatic.ClientID%>").value = newDisplay; break;
      case document.getElementById("<%=tblDetailPage.ClientID%>").id: document.getElementById("<%=hiddenTblDetailPage.ClientID%>").value = newDisplay; break;
      case document.getElementById("<%=tblLightbox.ClientID%>").id: document.getElementById("<%=hiddenTblLightbox.ClientID%>").value = newDisplay; break;
    } 
  }
  
  function chkBackgroundTransparent_onClick()
  {
    if(document.getElementById("<%=chkBackgroundTransparent.ClientID%>").checked)
    {
      document.getElementById("<%=txtBackgroundColor.ClientID%>").disabled = true;
      document.getElementById("<%=imgBackgroundColor.ClientID%>").disabled = true;
      document.getElementById("<%=txtBackgroundImagePath.ClientID%>").disabled = true;
      document.getElementById("<%=imgBackgroundImagePath.ClientID%>").disabled = true;
      document.getElementById("<%=txtBackgroundImageLeft.ClientID%>").disabled = true;
      document.getElementById("<%=txtBackgroundImageTop.ClientID%>").disabled = true;
    }
    else
    {
      document.getElementById("<%=txtBackgroundColor.ClientID%>").disabled = false;
      document.getElementById("<%=imgBackgroundColor.ClientID%>").disabled = false;
      document.getElementById("<%=txtBackgroundImagePath.ClientID%>").disabled = false;
      document.getElementById("<%=imgBackgroundImagePath.ClientID%>").disabled = false;
      document.getElementById("<%=txtBackgroundImageLeft.ClientID%>").disabled = false;
      document.getElementById("<%=txtBackgroundImageTop.ClientID%>").disabled = false;
    }
  }
  
  
  function cboLightboxTitle_onchange()
  {
    if(document.getElementById("<%=cboLightboxTitle.ClientID%>")[document.getElementById("<%=cboLightboxTitle.ClientID%>").selectedIndex].value == "Text")
    {
      document.getElementById("<%=txtLightboxTitle.ClientID%>").style.display = "";
    }
    else
    {
      document.getElementById("<%=txtLightboxTitle.ClientID%>").style.display = "none";
    }
  }
  
  
</script>

