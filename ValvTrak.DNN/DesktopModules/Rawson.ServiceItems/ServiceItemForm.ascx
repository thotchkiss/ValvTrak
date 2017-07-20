<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ServiceItemForm.ascx.cs" Inherits="Rawson.ServiceItems.ServiceItemForm" EnableTheming="true" %>
<%@ Register Assembly="DevExpress.Web.v17.1" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v17.1" Namespace="DevExpress.Web" TagPrefix="dxpc" %>
<%@ Register Assembly="DevExpress.Web.v17.1" Namespace="DevExpress.Web" TagPrefix="dxe" %>

<style type="text/css">
    .style1
    {
        height: 25px;
    }
</style>


<script type="text/javascript">
	function DevExComboUnboundItem(s, e, itemText, itemValue) {
		if (s.GetSelectedIndex() == -1) {
			s.InsertItem(0, itemText, itemValue);
		}
		else if (s.GetItem(0).value != itemValue) {
			s.InsertItem(0, itemText, itemValue);
		}
		if (s.GetSelectedIndex() == -1) { s.SetSelectedIndex(0); }
	}
</script>
<script type="text/javascript">

	function CancelAddValve() {
		pcValveAdd.Hide();
	}

	function IsNumeric(sText) {
		var ValidChars = "0123456789.";
		for (i = 0; i < sText.length; i++) {
			if (ValidChars.indexOf(sText.charAt(i)) == -1) {
				return false;
			}
		}
		return true;
    }

    function ServiceItemSelectedIndexChanged(s, e) {
        
        siLocalData.Set('siServiceItemID', parseInt(s.GetValue())); 

								if (s.GetValue() > 0) {
									edit.SetEnabled(true);
								}
								else {
									edit.SetEnabled(false);
								}
    }

    function ManufacturerSelectedIndexChanged(s,e) {

        siLocalData.Set('siManufacturerID', s.GetValue());
        siLocalData.Set('siManufacturerModelID', -1);

        models.PerformCallback();
    }

    function ModelSelectedIndexChanged(s, e) {

        siLocalData.Set('siManufacturerModelID', s.GetValue());
    }

    function AfterServiceItemSaved(s, e) {

    }

    function AfterManufacturerSaved(s, e) {

        manuForm.Hide();
        manuName.SetText('');

        if (s.cpError != undefined) {
            alert(s.cpError);
        }
        else {

            siLocalData.Set('siManufacturerID', parseInt(s.cpManufacturerID));
            manufacturers.PerformCallback(s.cpManufacturerID);
        }
    }

    function OnManufacturersEndCallback(s, e) {

        var mid = parseInt(s.cpManufacturerID);

        // New Manufacturer has been added
        if (!isNaN(mid)) {

            manufacturers.SetValue(mid);
            modelAdd.Focus();
        }
    }

    function AfterModelSaved(s, e) {

        modelForm.Hide();
        modelName.SetText('');

        if (s.cpError != undefined) {
            alert(s.cpError)
        }
        else {

            siLocalData.Set('siManufacturerModelID', parseInt(s.cpManufacturerModelID));
            models.PerformCallback(s.cpManufacturerModelID);
        }
    }

    

    function OnModelsEndCallback(s, e) {

        var mid = parseInt(s.cpManufacturerModelID);

        // New ManufacturerModel has been added
        if (!isNaN(mid)) {

            models.SetValue(mid);
            siNotes.Focus();
        }
    }

    function AfterServiceItemSaved(s, e) {

        if (s.cpHasErrors) {
            if (validation != undefined) {
                validation.SetContentHtml(s.cpErrorMessage);
                validation.Show();
            }
        }
        else {
            if (validation != undefined)
                validation.Hide();
        }

        if (s.cpServiceItemID != undefined) {
            siLocalData.Set('siServiceItemID', s.cpServiceItemID);
            siSelect.PerformCallback();
        }

        siDetails.Hide();
    }

</script>

<table>
	<tr>
		<td>
			<dxe:ASPxComboBox ID="ServiceItemSelect" runat="server" 
					DataSourceID="ServiceItemDataSource" Width="170px"
					TextField="DisplayMember" ValueField="ValueMember"
					ClientInstanceName="siSelect" ValueType="System.Int32" 
                    oncallback="ServiceItemSelect_Callback" TabIndex="100" 
                    IncrementalFilteringMode="StartsWith" EnableIncrementalFiltering="True" >
				<ClientSideEvents 
                            SelectedIndexChanged="function(s,e) { ServiceItemSelectedIndexChanged(s, e); }"
							
							EndCallback="function(s,e){
								s.SetValue(siLocalData.Get('siServiceItemID')); 
								add.Focus(); }" 
						
							GotFocus="function(s, e) {
								if (s.GetValue() == -1)
								{
									s.SelectAll();
									s.ShowDropDown(); 
								} }"
				/>
			</dxe:ASPxComboBox>
		</td>
		<td>
			<dxe:ASPxButton ID="btnEdit" runat="server" ClientInstanceName="edit" 
				AutoPostBack="false" TabIndex="101">
				<BackgroundImage ImageUrl="~/images/edit.gif" HorizontalPosition="center" VerticalPosition="center" Repeat="NoRepeat" />
				<ClientSideEvents Click="function(s, e) { siLocalData.Set('siServiceItemID', parseInt(siSelect.GetValue())); siPanel.PerformCallback(); }" />
			</dxe:ASPxButton>
		</td>
		<td>
			<dxe:ASPxButton ID="btnAdd" runat="server" AutoPostBack="False" ClientInstanceName="add" 
				ToolTip="Add new valve." TabIndex="102">
				<BackgroundImage ImageUrl="~/images/add.gif" HorizontalPosition="center" VerticalPosition="center" Repeat="NoRepeat" />
				<ClientSideEvents Click="function(s, e) { siLocalData.Set('siServiceItemID', -1); siPanel.PerformCallback(); }" />
			</dxe:ASPxButton>
		</td>
	</tr>
</table>

<dxpc:ASPxPopupControl ID="ServiceItemDetailsWindow" runat="server" 
	HeaderText="Add Valve" Modal="True" Width="400px" Height="450px"
		ClientInstanceName="siDetails" CloseAction="CloseButton" EnableClientSideAPI="True"
		AllowDragging="true" AllowResize="false" 
		PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" TabIndex="1">
		<ClientSideEvents Shown="function(s,e){ serialNum.Focus(); }" />
	<ContentCollection>
		<dxpc:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
			<dx:ASPxCallbackPanel ID="ServiceItemPanel" runat="server" ClientInstanceName="siPanel" 
				OnCallback="ServiceItemPanel_Callback" >
				<ClientSideEvents EndCallback="function(s,e) { siDetails.Show(); }" />
				<PanelCollection>
					<dx:PanelContent>
						<table>
							<tr>
								<td>
									<dxe:ASPxLabel ID="ASPxLabel1" runat="server" Text="Location :">
									</dxe:ASPxLabel>
								</td>
								<td>
									<dxe:ASPxLabel ID="ServiceItemLocationLabel" runat="server" Text="ASPxLabel">
									</dxe:ASPxLabel>
								</td>
							</tr>
							<tr>
								<td>
									<dxe:ASPxLabel ID="ASPxLabel2" runat="server" Text="Serial Num. :">
									</dxe:ASPxLabel>
								</td>
								<td>
									<dxe:ASPxTextBox ID="SerialNum" runat="server" Width="200" 
										ClientInstanceName="serialNum" TabIndex="103">
									</dxe:ASPxTextBox>
								</td>
							</tr>
							<tr>
								<td class="style1">
									<dxe:ASPxLabel ID="ASPxLabel4" runat="server" Text="Type :">
									</dxe:ASPxLabel>
								</td>
								<td class="style1">
									<dxe:ASPxComboBox ID="ServiceItemTypeSelect" runat="server" Width="200" 
                                        DataSourceID="ServiceItemTypeDataSource"
										TextField="DisplayMember" ValueField="ValueMember" 
										ValueType="System.Int32" AutoPostBack="false" TabIndex="105" 
										EnableIncrementalFiltering="True" IncrementalFilteringMode="Contains" >
									</dxe:ASPxComboBox>
								</td>
							</tr>
							<tr>
								<td>
									<dxe:ASPxLabel ID="ASPxLabel5" runat="server" Text="Manfacturer :">
									</dxe:ASPxLabel>
								</td>
								<td>
									<table cellpadding="0" cellspacing="0" border="0">
										<tr>
											<td>
                                                <dxe:ASPxComboBox ID="ManufacturerSelect" runat="server" Width="200" 
														TextField="DisplayMember" AutoPostBack="false" 
														ValueField="ValueMember" EnableClientSideAPI="true" 
														ClientInstanceName="manufacturers" TabIndex="106" 
														OnCallback="ManufacturerSelect_Callback" 
													    EnableIncrementalFiltering="True" IncrementalFilteringMode="Contains" 
													    ValueType="System.Int32" EnableCallbackMode="True" 
													    OnItemRequestedByValue="ManufacturerSelect_ItemRequestedByValue" 
                                                        OnItemsRequestedByFilterCondition="ManufacturerSelect_ItemsRequestedByFilterCondition" >
													<ClientSideEvents 
                                                        SelectedIndexChanged="function(s,e) { ManufacturerSelectedIndexChanged(s,e); }"  
                                                        EndCallback="function(s,e) { OnManufacturersEndCallback(s,e); } " />
												</dxe:ASPxComboBox>
											</td>
											<td>
												<dxe:ASPxImage ID="ASPxImage3" runat="server" ImageUrl="~/spacer.gif" Width="5px">
												</dxe:ASPxImage>
											</td>
											<td>
												<dxe:ASPxButton ID="btnManufacturerAdd" runat="server" AutoPostBack="false" 
													TabIndex="-1">
													<BackgroundImage ImageUrl="~/images/add.gif" Repeat="NoRepeat" HorizontalPosition="center" VerticalPosition="center" />
													<ClientSideEvents Click="function(s,e){ manuForm.Show(); }" />
												</dxe:ASPxButton>
											</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<dxe:ASPxLabel ID="ASPxLabel6" runat="server" Text="Model">
									</dxe:ASPxLabel>
								</td>
								<td>
									<table cellpadding="0" cellspacing="0" border="0">
										<tr>
											<td>
												<dxe:ASPxComboBox ID="ModelSelect" runat="server" EnableClientSideAPI="true" ClientInstanceName="models"
														TextField="DisplayMember" Width="200" 
														ValueField="ValueMember" OnCallback="ModelSelect_Callback" AutoPostBack="false"
													    TabIndex="107" IncrementalFilteringMode="Contains" ValueType="System.Int32" 
													    EnableCallbackMode="True" CallbackPageSize="150" DropDownStyle="DropDown"
                                                    OnItemRequestedByValue="ModelSelect_ItemRequestedByValue" 
                                                    OnItemsRequestedByFilterCondition="ModelSelect_ItemsRequestedByFilterCondition">
														<ClientSideEvents
                                                            SelectedIndexChanged="function(s,e) { ModelSelectedIndexChanged(s,e); }"
                                                            EndCallback="function(s,e) { OnModelsEndCallback(s,e); } "  />
												</dxe:ASPxComboBox>
											</td>
											<td>
												<dxe:ASPxImage ID="ASPxImage4" runat="server" ImageUrl="~/spacer.gif" Width="5px">
												</dxe:ASPxImage>
											</td>
											<td>
												<dxe:ASPxButton ID="btnModelAdd" runat="server" AutoPostBack="false" 
													TabIndex="-1" ClientInstanceName="modelAdd">
													<BackgroundImage ImageUrl="~/images/add.gif" Repeat="NoRepeat" HorizontalPosition="center" VerticalPosition="center" />
													<ClientSideEvents Click="function(s,e){ modelForm.Show(); }" />
												</dxe:ASPxButton>
											</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr valign="top">
								<td>
									<dxe:ASPxLabel ID="ASPxLabel7" runat="server" Text="Description :">
									</dxe:ASPxLabel>
								</td>
								<td>
									<dxe:ASPxMemo ID="NotesTB" runat="server" ClientInstanceName="siNotes" 
                                        Height="50px" Width="200px" TabIndex="110">
									</dxe:ASPxMemo>
								</td>
							</tr>
							<tr>
								<td colspan="2">&nbsp;</td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td>
									<table cellpadding="0" cellspacing="0" width="100%">
										<tr>
											<td style="padding-bottom: 5px;">
                                                <dxe:ASPxRadioButton ID="rbThreaded" GroupName="EndType" Text="Threaded" TabIndex="111" runat="server">
                                                </dxe:ASPxRadioButton>
                                            </td>
											<td style="padding-bottom: 5px">
                                                <dxe:ASPxRadioButton ID="rbFlanged" GroupName="EndType" Text="Flanged" TabIndex="112" runat="server">
                                                </dxe:ASPxRadioButton>
                                            </td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<dxe:ASPxLabel ID="ASPxLabel8" runat="server" Text="Sizes :">
									</dxe:ASPxLabel>
								</td>
								<td>
									<table cellpadding="0" cellspacing="0" width="100%">
										<tr>
											<td style="padding-right: 10px;">
												<table cellpadding="0" cellspacing="0">
													<tr>
														<td>
															<dxe:ASPxTextBox ID="txtInletFrac" runat="server" Width="75px" 
																ToolTip="Enter fractions as '## ##/##'" TabIndex="113" >
															</dxe:ASPxTextBox>
														</td>
														<td>
															<dxe:ASPxLabel ID="ASPxLabel9" runat="server" Text="(Inlet)">
															</dxe:ASPxLabel>
														</td>
													</tr>
												</table>
											</td>
											<td>
												<table cellpadding="0" cellspacing="0">
													<tr>
														<td>
															<dxe:ASPxTextBox ID="txtOutletFrac" runat="server" Width="75px" 
																ToolTip="Enter fractions as '##-##/##'" TabIndex="114">
															</dxe:ASPxTextBox>
														</td>
														<td>
															<dxe:ASPxLabel ID="ASPxLabel10" runat="server" Text="(Outlet)">
															</dxe:ASPxLabel>
														</td>
													</tr>
												</table>
											</td>
										</tr>
									</table>                        
								</td>
							</tr>
							<tr>
								<td>
									<dxe:ASPxLabel ID="ASPxLabel11" runat="server" Text="Press. Rating :">
									</dxe:ASPxLabel>
								</td>
								<td>
									<table cellpadding="0" cellspacing="0" width="100%">
										<tr>
											<td style="padding-right: 10px;">
												<table cellpadding="0" cellspacing="0">
													<tr>
														<td>
															<dxe:ASPxSpinEdit ID="seInletFlangeRating" runat="server" Number="0"
																DecimalPlaces="2" AllowUserInput="true" Width="75" TabIndex="115" 
																MaxValue="10000">
															</dxe:ASPxSpinEdit>
														</td>
														<td>
															<dxe:ASPxLabel ID="ASPxLabel12" runat="server" Text="(Inlet)">
															</dxe:ASPxLabel>
														</td>
													</tr>
												</table>
											</td>
											<td>
												<table cellpadding="0" cellspacing="0">
													<tr>
														<td>
															<dxe:ASPxSpinEdit ID="seOutletFlangeRating" runat="server" Number="0" 
																DecimalPlaces="2" AllowUserInput="true" Width="75" TabIndex="116" 
																MaxValue="10000">
															</dxe:ASPxSpinEdit>
														</td>
														<td>
															<dxe:ASPxLabel ID="ASPxLabel13" runat="server" Text="(Outlet)">
															</dxe:ASPxLabel>
														</td>
													</tr>
												</table>
											</td>
										</tr>
									</table>                        
								</td>
							</tr>
                            <tr valign="bottom">
                                <td style="padding-top:5px">
                                    <dxe:ASPxLabel ID="ASPxLabel17" runat="server" Text="Coordinates :">
                                    </dxe:ASPxLabel>
                                </td>
								<td style="padding-top:5px">
									<table cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                            <td>
                                                <dxe:ASPxLabel ID="ASPxLabel3" runat="server" Text="Lat." Font-Bold="True">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td>
                                                <dxe:ASPxLabel ID="ASPxLabel16" runat="server" Text="Long." Font-Bold="True">
                                                </dxe:ASPxLabel>
                                            </td>
                                        </tr>
										<tr>
											<td>
                                                <dxe:ASPxTextBox ID="txtLatitude" runat="server" Width="100px" 
                                                    NullText="Latitude" TabIndex="117">
                                                </dxe:ASPxTextBox>
							                </td>
											<td>
                                                <dxe:ASPxTextBox ID="txtLongitude" runat="server" Width="100px" 
                                                    NullText="Longitude" TabIndex="118">
                                                </dxe:ASPxTextBox>
                                            </td>
										</tr>
									</table>
								</td>
                            </tr>
							<tr>
								<td>&nbsp;</td>
								<td style="padding-top: 5px">
									<dxe:ASPxCheckBox ID="chkActive" runat="server" Text="Is Active?" 
										Checked="true" TabIndex="119">
									</dxe:ASPxCheckBox>
								</td>
							</tr>
							<tr align="right">
								<td colspan="2" style="padding-top: 10PX">
									<table cellpadding="0" cellspacing="0">
										<tr>
											<td>
												<dxe:ASPxButton ID="btnOK" runat="server" AutoPostBack="false" Text="Save" 
													ClientInstanceName="btnOK" TabIndex="120" >
													<ClientSideEvents Click="function(s,e) { siSaveAction.PerformCallback(); }" />
												</dxe:ASPxButton>
											</td>
											<td >
												<dxe:ASPxImage ID="Spacer1" runat="server" ImageUrl="~/spacer.gif" Width="10px">
												</dxe:ASPxImage>
											</td>
											<td>
												<dxe:ASPxButton ID="btnCancel" runat="server" AutoPostBack="false" 
													Text="Cancel" TabIndex="121">
													<ClientSideEvents Click="function(s, e) { siDetails.Hide(); siSelect.Focus(); }"></ClientSideEvents>
												</dxe:ASPxButton>
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</dx:PanelContent>
				</PanelCollection>
			</dx:ASPxCallbackPanel>
		</dxpc:PopupControlContentControl>
	</ContentCollection>
</dxpc:ASPxPopupControl>
<dxpc:ASPxPopupControl ID="ASPxPopupControl1" runat="server" ClientInstanceName="manuForm"
	 Modal="True" CloseAction="CloseButton" AllowDragging="True" HeaderText="Add Manufacturer"
	 PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter">
	 <ClientSideEvents Shown="function(s, e) {
	manuName.Focus();
}" />
	 <ContentCollection>
		<dxpc:PopupControlContentControl>
			<table cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td style="white-space: nowrap">
						<dxe:ASPxLabel ID="ASPxLabel14" runat="server" Text="Manufacturer Name : ">
						</dxe:ASPxLabel>
					</td>
					<td>
						<dxe:ASPxTextBox ID="txtManufacturerName" runat="server" Width="200px" ClientInstanceName="manuName" EnableClientSideAPI="true">
						</dxe:ASPxTextBox>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="right">
						<table cellpadding="0" cellspacing="5px" border="0">
							<tr>
								<td>
									<dxe:ASPxButton ID="btnManufacturerSave" runat="server" Text="Save" AutoPostBack="false">
										<ClientSideEvents Click="function(s,e) { manuSaveAction.PerformCallback( manuName.GetText() ); }" />
									</dxe:ASPxButton>
								</td>
								<td>
									<dxe:ASPxImage ID="ASPxImage1" runat="server" ImageUrl="~/spacer.gif" Width="10px" Height="30px">
									</dxe:ASPxImage>
								</td>
								<td>
									<dxe:ASPxButton ID="btnManufacturerCancel" runat="server" Text="Cancel" AutoPostBack="false">
										<ClientSideEvents Click="function(s,e) { manuName.SetText(''); manuForm.Hide(); }" />
									</dxe:ASPxButton>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</dxpc:PopupControlContentControl>
	 </ContentCollection>
</dxpc:ASPxPopupControl>
<dxpc:ASPxPopupControl ID="ASPxPopupControl2" runat="server" ClientInstanceName="modelForm"
	Modal="True" CloseAction="CloseButton" AllowDragging="True" HeaderText="Add Model" 
	PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter">
	<ClientSideEvents Shown="function(s, e) {
	modelName.Focus();
}" />
	<ContentCollection>
		<dxpc:PopupControlContentControl>
			<table cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td style="white-space: nowrap">
						<dxe:ASPxLabel ID="ASPxLabel15" runat="server" Text="Model Name : ">
						</dxe:ASPxLabel>
					</td>
					<td>
						<dxe:ASPxTextBox ID="txtManufacturerModel" runat="server" Width="200px" ClientInstanceName="modelName" EnableClientSideAPI="true">
						</dxe:ASPxTextBox>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="right">
						<table cellpadding="0" cellspacing="5px" border="0">
							<tr>
								<td>
									<dxe:ASPxButton ID="btnModelSave" runat="server" Text="Save" AutoPostBack="false">
										<ClientSideEvents Click="function(s,e) { modelSaveAction.PerformCallback(modelName.GetText()); }" />
									</dxe:ASPxButton>
								</td>
								<td>
									<dxe:ASPxImage ID="ASPxImage2" runat="server" ImageUrl="~/spacer.gif" Width="10px" Height="30px">
									</dxe:ASPxImage>
								</td>
								<td>
									<dxe:ASPxButton ID="btnModelCancel" runat="server" Text="Cancel" AutoPostBack="false">
										<ClientSideEvents Click="function(s,e) { modelName.SetText(''); modelForm.Hide(); }" />
									</dxe:ASPxButton>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</dxpc:PopupControlContentControl>
	 </ContentCollection>
</dxpc:ASPxPopupControl>
<dx:ASPxCallback ID="ServiceItemSaveAction" runat="server" 
		ClientInstanceName="siSaveAction" oncallback="ServiceItemnSaveAction_Callback">
	<ClientSideEvents EndCallback="function(s,e) { AfterServiceItemSaved(s,e); }"  />
</dx:ASPxCallback>
<dx:ASPxCallback ID="ManufacturerSaveAction" runat="server" 
	ClientInstanceName="manuSaveAction" 
	oncallback="ManufacturerSaveAction_Callback">
	<ClientSideEvents EndCallback="function(s,e) { AfterManufacturerSaved(s,e);	}" />
</dx:ASPxCallback>
<dx:ASPxCallback ID="ModelSaveAction" runat="server" 
	ClientInstanceName="modelSaveAction" oncallback="ModelSaveAction_Callback">
	<ClientSideEvents EndCallback="function(s,e) { AfterModelSaved(s,e) }" />
</dx:ASPxCallback>
<dx:ASPxHiddenField ID="hfServiceItem" runat="server" ClientInstanceName="siLocalData"
	SyncWithServer="true">
</dx:ASPxHiddenField>

<asp:LinqDataSource ID="ServiceItemDataSource" runat="server" onselecting="ServiceItemDataSource_Selecting">
</asp:LinqDataSource>
<asp:LinqDataSource ID="ServiceItemTypeDataSource" runat="server" OnSelecting="ServiceItemTypeDataSource_Selecting">
</asp:LinqDataSource>
<asp:LinqDataSource ID="ManufacturerDataSource" runat="server" OnSelecting="ManufacturerDataSource_Selecting">
</asp:LinqDataSource>
<asp:LinqDataSource ID="ModelDataSource" runat="server" OnSelecting="ModelDataSource_Selecting">
</asp:LinqDataSource>

