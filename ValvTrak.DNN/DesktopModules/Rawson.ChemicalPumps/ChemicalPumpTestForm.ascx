<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ChemicalPumpTestForm.ascx.cs" Inherits="Rawson.ChemicalPumps.ChemicalPumpTestForm" EnableTheming="true" %>
<%@ Register assembly="DevExpress.Web.v15.1" namespace="DevExpress.Web" tagprefix="dx" %>






<style type="text/css">
    .style1
    {
        height: 22px;
    }
    .style2
    {
        height: 21px;
    }
</style>

<dx:ASPxCallbackPanel ID="ASPxCallbackPanel1" runat="server" Width="910px" 
    oncallback="ASPxCallbackPanel1_Callback">
    <PanelCollection>
        <dx:PanelContent runat="server" SupportsDisabledAttribute="True">
            <table cellpadding="0" cellspacing="3px" border="0" width="100%">
                <tr>
                    <td>
                        <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Job ID :">
                        </dx:ASPxLabel>
                    </td>
                    <td>
                        <dx:ASPxLabel ID="lblJobID" runat="server">
                        </dx:ASPxLabel>
                    </td>
                    <td>
                        <dx:ASPxImage ID="ASPxImage1" runat="server" ImageUrl="~/spacer.gif" Width="10px">
                        </dx:ASPxImage>
                    </td>
                    <td>
                        <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Chem. Pumped :">
                        </dx:ASPxLabel>
                    </td>
                    <td>
                        <dx:ASPxTextBox ID="txtChemicalPumped" runat="server" Width="170px">
                        </dx:ASPxTextBox>
                    </td>
                    <td>
                        <dx:ASPxImage ID="ASPxImage2" runat="server" ImageUrl="~/spacer.gif" Width="10px">
                        </dx:ASPxImage>
                    </td>
                    <td>
                        <dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="Voltage :">
                        </dx:ASPxLabel>
                    </td>
                    <td>
                        <dx:ASPxSpinEdit ID="seVoltage" runat="server" Height="21px" Number="0" 
                            Width="100px">
                        </dx:ASPxSpinEdit>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="FSR # :">
                        </dx:ASPxLabel>
                    </td>
                    <td>
                        <dx:ASPxTextBox ID="txtFsrNum" runat="server" Width="170px">
                        </dx:ASPxTextBox>
                    </td>
                    <td></td>
                    <td>
                        <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Vol. Setting  :">
                        </dx:ASPxLabel>
                    </td>
                    <td>
                        <dx:ASPxSpinEdit ID="seVolumeSetting" runat="server" Height="21px" Number="0">
                        </dx:ASPxSpinEdit>
                    </td>
                    <td></td>
                    <td>
                        <dx:ASPxLabel ID="ASPxLabel8" runat="server" Text="S.P. Wattage :">
                        </dx:ASPxLabel>
                    </td>
                    <td>
                        <dx:ASPxSpinEdit ID="ASPxSpinEdit1" runat="server" Height="21px" Number="0" 
                            Width="100px">
                        </dx:ASPxSpinEdit>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="Serv. Item :">
                        </dx:ASPxLabel>
                    </td>
                    <td>
                        <dx:ASPxComboBox ID="ASPxComboBox1" runat="server" ValueType="System.String">
                        </dx:ASPxComboBox>
                    </td>
                    <td></td>
                    <td>
                        <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="Head Size :">
                        </dx:ASPxLabel>
                    </td>
                    <td>
                        <dx:ASPxSpinEdit ID="seHeadSize" runat="server" Height="21px" Number="0">
                        </dx:ASPxSpinEdit>
                    </td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td>
                        <dx:ASPxLabel ID="ASPxLabel38" runat="server" Text="Coordinates:">
                        </dx:ASPxLabel>
                    </td>
                    <td><table cellpadding="0" cellspacing="3px" border="0" width="100%" >
                                    <tr>
                                        <td>
                                            <dx:ASPxLabel ID="lblCoords0" runat="server" Text="Lattitude">
                                            </dx:ASPxLabel>
                                            <dx:ASPxTextBox ID="txtLatitude" runat="server" TabIndex="1" Width="100px">
                                            </dx:ASPxTextBox>
                                        </td>
                                        <td>
                                            <dx:ASPxLabel ID="ASPxLabel37" runat="server" Text="Longitude">
                                            </dx:ASPxLabel>
                                            <dx:ASPxTextBox ID="txtLongitude" runat="server" TabIndex="2" Width="100px">
                                            </dx:ASPxTextBox>
                                        </td>
                                    </tr>
                                    </table></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td>
                        <dx:ASPxLabel ID="ASPxLabel9" runat="server" Text="Supply Press. :">
                        </dx:ASPxLabel>
                    </td>
                    <td>
                        <dx:ASPxSpinEdit ID="seSupplyPressure" runat="server" Height="21px" Number="0" 
                            Width="100px">
                        </dx:ASPxSpinEdit>
                    </td>
                    <td></td>
                    <td>
                        <dx:ASPxLabel ID="ASPxLabel11" runat="server" Text="Flowline Press. :">
                        </dx:ASPxLabel>
                    </td>
                    <td>
                        <dx:ASPxSpinEdit ID="seFlowlinePressure" runat="server" Height="21px" 
                            Number="0" Width="100px">
                        </dx:ASPxSpinEdit>
                    </td>
                    <td></td>
                    <td>
                        <dx:ASPxLabel ID="ASPxLabel13" runat="server" Text="Casing Press. :">
                        </dx:ASPxLabel>
                    </td>
                    <td>
                        <dx:ASPxSpinEdit ID="seCasingPressure" runat="server" Height="21px" Number="0" 
                            Width="100px">
                        </dx:ASPxSpinEdit>
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        <dx:ASPxLabel ID="ASPxLabel10" runat="server" Text="Discharge Press. :">
                        </dx:ASPxLabel>
                    </td>
                    <td class="style1">
                        <dx:ASPxSpinEdit ID="seDischargePressure" runat="server" Height="21px" 
                            Number="0" Width="100px">
                        </dx:ASPxSpinEdit>
                    </td>
                    <td class="style1"></td>
                    <td class="style1">
                        <dx:ASPxLabel ID="ASPxLabel12" runat="server" Text="Tubing Press. :">
                        </dx:ASPxLabel>
                    </td>
                    <td class="style1">
                        <dx:ASPxSpinEdit ID="seTubingPressure" runat="server" Height="21px" Number="0" 
                            Width="100px">
                        </dx:ASPxSpinEdit>
                    </td>
                    <td class="style1"></td>
                    <td class="style1">
                        <dx:ASPxLabel ID="ASPxLabel14" runat="server" Text="P.L./Riser Press. :">
                        </dx:ASPxLabel>
                    </td>
                    <td class="style1">
                        <dx:ASPxSpinEdit ID="sePipelinePressure" runat="server" Height="21px" 
                            Number="0" Width="100px">
                        </dx:ASPxSpinEdit>
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        <dx:ASPxImage ID="ASPxImage6" runat="server" Height="10px" 
                            ImageUrl="~/spacer.gif">
                        </dx:ASPxImage>
                    </td>
                    <td class="style1"></td>
                    <td class="style1"></td>
                    <td class="style1"></td>
                    <td class="style1"></td>
                    <td class="style1"></td>
                    <td class="style1"></td>
                    <td class="style1"></td>
                </tr>
                <tr>
                    <td colspan="6" rowspan="4">
                        <table cellpadding="0" cellspacing="2px" border="0" width="100%">
                            <tr>
                                <td></td>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel16" runat="server" Font-Bold="True" Text="Replaced">
                                    </dx:ASPxLabel>
                                </td>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel17" runat="server" Font-Bold="True" Text="Repaired">
                                    </dx:ASPxLabel>
                                </td>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel18" runat="server" Font-Bold="True" Text="Resealed">
                                    </dx:ASPxLabel>
                                </td>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel19" runat="server" Font-Bold="True" 
                                        Text="Tested Good">
                                    </dx:ASPxLabel>
                                </td>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel33" runat="server" Text="Warranty" Font-Bold="True">
                                    </dx:ASPxLabel>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel15" runat="server" Text="Packing">
                                    </dx:ASPxLabel>
                                </td>
                                <td colspan="4">
                                    <dx:ASPxRadioButtonList ID="rbfPacking" runat="server" 
                                        RepeatDirection="Horizontal" Width="100%" 
                                        TextWrap="False" Height="21px" ValueType="System.Int32">
                                        <Items>
                                            <dx:ListEditItem Text=" " Value="1" />
                                            <dx:ListEditItem Text=" " Value="2"/>
                                            <dx:ListEditItem Text=" " Value="3"/>
                                            <dx:ListEditItem Text=" " Value="0" />
                                        </Items>
                                    </dx:ASPxRadioButtonList>
                                </td>
                                <td>
                                    <dx:ASPxRadioButtonList ID="ASPxRadioButtonList2" runat="server" Height="21px" 
                                        RepeatDirection="Horizontal">
                                        <Items>
                                            <dx:ListEditItem Text="Yes" Value="1" />
                                            <dx:ListEditItem Text="No" Value="0" />
                                        </Items>
                                    </dx:ASPxRadioButtonList>
                                </td>
                            </tr>
                            <tr>
                                <td class="style2">
                                    <dx:ASPxLabel ID="ASPxLabel20" runat="server" Text="Bearing">
                                    </dx:ASPxLabel>
                                </td>
                                <td colspan="4" class="style2">
                                    <dx:ASPxRadioButtonList ID="rbfBearing" runat="server" Height="21px" 
                                        RepeatDirection="Horizontal" TextWrap="False" Width="100%" 
                                        ValueType="System.Int32">
                                        <Items>
                                            <dx:ListEditItem Text=" " Value="1" />
                                            <dx:ListEditItem Text=" " Value="2"/>
                                            <dx:ListEditItem Text=" " Value="3"/>
                                            <dx:ListEditItem Text=" " Value="0" />
                                        </Items>
                                    </dx:ASPxRadioButtonList>
                                </td>
                                <td>
                                    <dx:ASPxRadioButtonList ID="ASPxRadioButtonList16" runat="server" Height="21px" 
                                        RepeatDirection="Horizontal">
                                        <Items>
                                            <dx:ListEditItem Text="Yes" Value="1" />
                                            <dx:ListEditItem Text="No" Value="0" />
                                        </Items>
                                    </dx:ASPxRadioButtonList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel21" runat="server" Text="Shaft">
                                    </dx:ASPxLabel>
                                </td>
                                <td colspan="4">
                                    <dx:ASPxRadioButtonList ID="rbfShaft" runat="server" Height="21px" 
                                        RepeatDirection="Horizontal" TextWrap="False" Width="100%" 
                                        ValueType="System.Int32">
                                        <Items>
                                            <dx:ListEditItem Text=" " Value="1" />
                                            <dx:ListEditItem Text=" " Value="2"/>
                                            <dx:ListEditItem Text=" " Value="3"/>
                                            <dx:ListEditItem Text=" " Value="0" />
                                        </Items>
                                    </dx:ASPxRadioButtonList>
                                </td>
                                <td>
                                    <dx:ASPxRadioButtonList ID="ASPxRadioButtonList17" runat="server" Height="21px" 
                                        RepeatDirection="Horizontal">
                                        <Items>
                                            <dx:ListEditItem Text="Yes" Value="1" />
                                            <dx:ListEditItem Text="No" Value="0" />
                                        </Items>
                                    </dx:ASPxRadioButtonList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel22" runat="server" Text="Motor">
                                    </dx:ASPxLabel>
                                </td>
                                <td colspan="4">
                                    <dx:ASPxRadioButtonList ID="rbfMotor" runat="server" Height="21px" 
                                        RepeatDirection="Horizontal" TextWrap="False" Width="100%" 
                                        ValueType="System.Int32">
                                        <Items>
                                            <dx:ListEditItem Text=" " Value="1" />
                                            <dx:ListEditItem Text=" " Value="2"/>
                                            <dx:ListEditItem Text=" " Value="3"/>
                                            <dx:ListEditItem Text=" " Value="0" />
                                        </Items>
                                    </dx:ASPxRadioButtonList>
                                </td>
                                <td>
                                    <dx:ASPxRadioButtonList ID="ASPxRadioButtonList18" runat="server" Height="21px" 
                                        RepeatDirection="Horizontal">
                                        <Items>
                                            <dx:ListEditItem Text="Yes" Value="1" />
                                            <dx:ListEditItem Text="No" Value="0" />
                                        </Items>
                                    </dx:ASPxRadioButtonList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel23" runat="server" Text="O-rings">
                                    </dx:ASPxLabel>
                                </td>
                                <td colspan="4">
                                    <dx:ASPxRadioButtonList ID="rbfORings" runat="server" Height="21px" 
                                        RepeatDirection="Horizontal" TextWrap="False" Width="100%" 
                                        ValueType="System.Int32">
                                        <Items>
                                            <dx:ListEditItem Text=" " Value="1" />
                                            <dx:ListEditItem Text=" " Value="2"/>
                                            <dx:ListEditItem Text=" " Value="3"/>
                                            <dx:ListEditItem Text=" " Value="0" />
                                        </Items>
                                    </dx:ASPxRadioButtonList>
                                </td>
                                <td>
                                    <dx:ASPxRadioButtonList ID="ASPxRadioButtonList19" runat="server" Height="21px" 
                                        RepeatDirection="Horizontal">
                                        <Items>
                                            <dx:ListEditItem Text="Yes" Value="1" />
                                            <dx:ListEditItem Text="No" Value="0" />
                                        </Items>
                                    </dx:ASPxRadioButtonList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel24" runat="server" Text="Head">
                                    </dx:ASPxLabel>
                                </td>
                                <td colspan="4">
                                    <dx:ASPxRadioButtonList ID="rbfHead" runat="server" Height="21px" 
                                        RepeatDirection="Horizontal" TextWrap="False" Width="100%" 
                                        ValueType="System.Int32">
                                        <Items>
                                            <dx:ListEditItem Text=" " Value="1" />
                                            <dx:ListEditItem Text=" " Value="2"/>
                                            <dx:ListEditItem Text=" " Value="3"/>
                                            <dx:ListEditItem Text=" " Value="0" />
                                        </Items>
                                    </dx:ASPxRadioButtonList>
                                </td>
                                <td>
                                    <dx:ASPxRadioButtonList ID="ASPxRadioButtonList20" runat="server" Height="21px" 
                                        RepeatDirection="Horizontal">
                                        <Items>
                                            <dx:ListEditItem Text="Yes" Value="1" />
                                            <dx:ListEditItem Text="No" Value="0" />
                                        </Items>
                                    </dx:ASPxRadioButtonList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel25" runat="server" Text="Coupling">
                                    </dx:ASPxLabel>
                                </td>
                                <td colspan="4">
                                    <dx:ASPxRadioButtonList ID="rbfCoupling" runat="server" Height="21px" 
                                        RepeatDirection="Horizontal" TextWrap="False" Width="100%" 
                                        ValueType="System.Int32">
                                        <Items>
                                            <dx:ListEditItem Text=" " Value="1" />
                                            <dx:ListEditItem Text=" " Value="2"/>
                                            <dx:ListEditItem Text=" " Value="3"/>
                                            <dx:ListEditItem Text=" " Value="0" />
                                        </Items>
                                    </dx:ASPxRadioButtonList>
                                </td>
                                <td>
                                    <dx:ASPxRadioButtonList ID="ASPxRadioButtonList21" runat="server" Height="21px" 
                                        RepeatDirection="Horizontal">
                                        <Items>
                                            <dx:ListEditItem Text="Yes" Value="1" />
                                            <dx:ListEditItem Text="No" Value="0" />
                                        </Items>
                                    </dx:ASPxRadioButtonList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel26" runat="server" Text="Timer">
                                    </dx:ASPxLabel>
                                </td>
                                <td colspan="4">
                                    <dx:ASPxRadioButtonList ID="rbfTimer" runat="server" Height="21px" 
                                        RepeatDirection="Horizontal" TextWrap="False" Width="100%" 
                                        ValueType="System.Int32">
                                        <Items>
                                            <dx:ListEditItem Text=" " Value="1" />
                                            <dx:ListEditItem Text=" " Value="2"/>
                                            <dx:ListEditItem Text=" " Value="3"/>
                                            <dx:ListEditItem Text=" " Value="0" />
                                        </Items>
                                    </dx:ASPxRadioButtonList>
                                </td>
                                <td>
                                    <dx:ASPxRadioButtonList ID="ASPxRadioButtonList22" runat="server" Height="21px" 
                                        RepeatDirection="Horizontal">
                                        <Items>
                                            <dx:ListEditItem Text="Yes" Value="1" />
                                            <dx:ListEditItem Text="No" Value="0" />
                                        </Items>
                                    </dx:ASPxRadioButtonList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel27" runat="server" Text="Solar Panel">
                                    </dx:ASPxLabel>
                                </td>
                                <td colspan="4">
                                    <dx:ASPxRadioButtonList ID="rbfSolarPanel" runat="server" Height="21px" 
                                        RepeatDirection="Horizontal" TextWrap="False" Width="100%" 
                                        ValueType="System.Int32">
                                        <Items>
                                            <dx:ListEditItem Text=" " Value="1" />
                                            <dx:ListEditItem Text=" " Value="2"/>
                                            <dx:ListEditItem Text=" " Value="3"/>
                                            <dx:ListEditItem Text=" " Value="0" />
                                        </Items>
                                    </dx:ASPxRadioButtonList>
                                </td>
                                <td>
                                    <dx:ASPxRadioButtonList ID="ASPxRadioButtonList23" runat="server" Height="21px" 
                                        RepeatDirection="Horizontal">
                                        <Items>
                                            <dx:ListEditItem Text="Yes" Value="1" />
                                            <dx:ListEditItem Text="No" Value="0" />
                                        </Items>
                                    </dx:ASPxRadioButtonList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel28" runat="server" Text="Controls">
                                    </dx:ASPxLabel>
                                </td>
                                <td colspan="4">
                                    <dx:ASPxRadioButtonList ID="rbfControls" runat="server" Height="21px" 
                                        RepeatDirection="Horizontal" TextWrap="False" Width="100%" 
                                        ValueType="System.Int32">
                                        <Items>
                                            <dx:ListEditItem Text=" " Value="1" />
                                            <dx:ListEditItem Text=" " Value="2"/>
                                            <dx:ListEditItem Text=" " Value="3"/>
                                            <dx:ListEditItem Text=" " Value="0" />
                                        </Items>
                                    </dx:ASPxRadioButtonList>
                                </td>
                                <td>
                                    <dx:ASPxRadioButtonList ID="ASPxRadioButtonList24" runat="server" Height="21px" 
                                        RepeatDirection="Horizontal">
                                        <Items>
                                            <dx:ListEditItem Text="Yes" Value="1" />
                                            <dx:ListEditItem Text="No" Value="0" />
                                        </Items>
                                    </dx:ASPxRadioButtonList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel29" runat="server" Text="Battery">
                                    </dx:ASPxLabel>
                                </td>
                                <td colspan="4">
                                    <dx:ASPxRadioButtonList ID="rbfBattery" runat="server" Height="21px" 
                                        RepeatDirection="Horizontal" TextWrap="False" Width="100%" 
                                        ValueType="System.Int32">
                                        <Items>
                                            <dx:ListEditItem Text=" " Value="1" />
                                            <dx:ListEditItem Text=" " Value="2"/>
                                            <dx:ListEditItem Text=" " Value="3"/>
                                            <dx:ListEditItem Text=" " Value="0" />
                                        </Items>
                                    </dx:ASPxRadioButtonList>
                                </td>
                                <td>
                                    <dx:ASPxRadioButtonList ID="ASPxRadioButtonList25" runat="server" Height="21px" 
                                        RepeatDirection="Horizontal">
                                        <Items>
                                            <dx:ListEditItem Text="Yes" Value="1" />
                                            <dx:ListEditItem Text="No" Value="0" />
                                        </Items>
                                    </dx:ASPxRadioButtonList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel30" runat="server" Text="Battery Charger">
                                    </dx:ASPxLabel>
                                </td>
                                <td colspan="4">
                                    <dx:ASPxRadioButtonList ID="rbfBatteryCharger" runat="server" Height="21px" 
                                        RepeatDirection="Horizontal" TextWrap="False" Width="100%" 
                                        ValueType="System.Int32">
                                        <Items>
                                            <dx:ListEditItem Text=" " Value="1" />
                                            <dx:ListEditItem Text=" " Value="2"/>
                                            <dx:ListEditItem Text=" " Value="3"/>
                                            <dx:ListEditItem Text=" " Value="0" />
                                        </Items>
                                    </dx:ASPxRadioButtonList>
                                </td>
                                <td>
                                    <dx:ASPxRadioButtonList ID="ASPxRadioButtonList26" runat="server" Height="21px" 
                                        RepeatDirection="Horizontal">
                                        <Items>
                                            <dx:ListEditItem Text="Yes" Value="1" />
                                            <dx:ListEditItem Text="No" Value="0" />
                                        </Items>
                                    </dx:ASPxRadioButtonList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel31" runat="server" Text="Diaphragm">
                                    </dx:ASPxLabel>
                                </td>
                                <td colspan="4">
                                    <dx:ASPxRadioButtonList ID="rbfDiaphram" runat="server" Height="21px" 
                                        RepeatDirection="Horizontal" TextWrap="False" Width="100%" 
                                        ValueType="System.Int32">
                                        <Items>
                                            <dx:ListEditItem Text=" " Value="1" />
                                            <dx:ListEditItem Text=" " Value="2"/>
                                            <dx:ListEditItem Text=" " Value="3"/>
                                            <dx:ListEditItem Text=" " Value="0" />
                                        </Items>
                                    </dx:ASPxRadioButtonList>
                                </td>
                                <td>
                                    <dx:ASPxRadioButtonList ID="ASPxRadioButtonList27" runat="server" Height="21px" 
                                        RepeatDirection="Horizontal">
                                        <Items>
                                            <dx:ListEditItem Text="Yes" Value="1" />
                                            <dx:ListEditItem Text="No" Value="0" />
                                        </Items>
                                    </dx:ASPxRadioButtonList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel32" runat="server" Text="Spring">
                                    </dx:ASPxLabel>
                                </td>
                                <td colspan="4">
                                    <dx:ASPxRadioButtonList ID="rbfSpring" runat="server" Height="21px" 
                                        RepeatDirection="Horizontal" TextWrap="False" Width="100%" 
                                        ValueType="System.Int32">
                                        <Items>
                                            <dx:ListEditItem Text=" " Value="1" />
                                            <dx:ListEditItem Text=" " Value="2"/>
                                            <dx:ListEditItem Text=" " Value="3"/>
                                            <dx:ListEditItem Text=" " Value="0" />
                                        </Items>
                                    </dx:ASPxRadioButtonList>
                                </td>
                                <td>
                                    <dx:ASPxRadioButtonList ID="ASPxRadioButtonList28" runat="server" Height="21px" 
                                        RepeatDirection="Horizontal">
                                        <Items>
                                            <dx:ListEditItem Text="Yes" Value="1" />
                                            <dx:ListEditItem Text="No" Value="0" />
                                        </Items>
                                    </dx:ASPxRadioButtonList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel34" runat="server" Text="Check Valve">
                                    </dx:ASPxLabel>
                                </td>
                                <td colspan="4">
                                    <dx:ASPxRadioButtonList ID="rbfCheckValve" runat="server" Height="21px" 
                                        RepeatDirection="Horizontal" SelectedIndex="-1" TextWrap="False" 
                                        Width="100%" ValueType="System.Int32">
                                        <Items>
                                            <dx:ListEditItem Text=" " Value="1" />
                                            <dx:ListEditItem Text=" " Value="2"/>
                                            <dx:ListEditItem Text=" " Value="3"/>
                                            <dx:ListEditItem Text=" " Value="0" />
                                        </Items>
                                    </dx:ASPxRadioButtonList>
                                </td>
                                <td>
                                    <dx:ASPxRadioButtonList ID="ASPxRadioButtonList30" runat="server" Height="21px" 
                                        RepeatDirection="Horizontal">
                                        <Items>
                                            <dx:ListEditItem Text="Yes" Value="1" />
                                            <dx:ListEditItem Text="No" Value="0" />
                                        </Items>
                                    </dx:ASPxRadioButtonList>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td colspan="2" rowspan="4" valign="top">
                        <table cellpadding="0" cellspacing="0" border="0" width="100%">
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel35" runat="server" Text="Notes                   ">
                                    </dx:ASPxLabel>
                                    <dx:ASPxMemo ID="memNotes" runat="server" Width="220px" Rows="10">
                                        <Border BorderStyle="Solid" />
                                    </dx:ASPxMemo>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dx:ASPxImage ID="ASPxImage3" runat="server" ImageUrl="~/spacer.gif" Height="20px">
                                    </dx:ASPxImage>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel36" runat="server" Text="Customer Witness">
                                    </dx:ASPxLabel>
                                    <dx:ASPxTextBox ID="txtCustomerWitness" runat="server" Width="200px">
                                    </dx:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dx:ASPxImage ID="ASPxImage4" runat="server" ImageUrl="~/spacer.gif" Height="20px">
                                    </dx:ASPxImage>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dx:ASPxButton ID="btnSave" runat="server" Text="Save" Width="200px">
                                    </dx:ASPxButton>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </dx:PanelContent>
    </PanelCollection>
</dx:ASPxCallbackPanel>

<dx:ASPxGlobalEvents ID="ASPxGlobalEvents1" runat="server">
</dx:ASPxGlobalEvents>
<dx:ASPxLoadingPanel ID="ASPxLoadingPanel1" runat="server">
</dx:ASPxLoadingPanel>


