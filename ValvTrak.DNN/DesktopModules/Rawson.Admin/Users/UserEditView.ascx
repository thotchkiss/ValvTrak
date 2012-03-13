<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UserEditView.ascx.cs" Inherits="Rawson.Admin.Users.UserEditView" %>
<%@ Register Assembly="DevExpress.Web.v10.2" Namespace="DevExpress.Web.ASPxHiddenField" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v10.2" Namespace="DevExpress.Web.ASPxDataView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v10.2" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<!--
<table cellspacing="0" cellpadding="1" border="0" summary="User Design Table">
	<tr>
		<td style="white-space: nowrap">
			<dx:ASPxLabel ID="lblFirstName" runat="server" Text="First Name:" >
			</dx:ASPxLabel>
		</td>
		<td style="white-space: nowrap">
			<dx:ASPxTextBox ID="txtFirstName" runat="server" Width="170px">
			</dx:ASPxTextBox>
		</td>
		<td rowspan="9" valign="top">
			<table>
				<tr>
					<td>
						<dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="Roles :">
						</dx:ASPxLabel>
					</td>
					<td>
						<dx:ASPxComboBox ID="cmbRoles" runat="server" Height="16px" Width="275px" ClientInstanceName="roles" >
						</dx:ASPxComboBox>
					</td>
					<td>
						<dx:ASPxHyperLink ID="ASPxHyperLink1" runat="server" Text="Add Role">
							<ClientSideEvents Click="function(s,e){ 

								var role = roles.GetText();
								var roleId = roles.GetValue();

								if (removedRoles.Contains(role))
									removedRoles.Remove(role);

								if (!newRoles.Contains(role))
									newRoles.Add(role, roleId);

								assignedRoles.PerformCallback();
								
							}" />
						</dx:ASPxHyperLink>
					</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>
						<dx:ASPxDataView ID="ASPxDataView1" runat="server" Layout="Table" ColumnCount="1"
							RowPerPage="10" EnableDefaultAppearance="false" 
							ClientInstanceName="assignedRoles" 
							oncustomcallback="ASPxDataView1_CustomCallback">
							<ItemTemplate>
								<table>
									<tr>
										<td>
											<dx:ASPxImage ID="ASPxImage1" runat="server" ImageUrl="~/images/delete.gif" AlternateText='<%# Eval("RoleName") %>'>
												<ClientSideEvents Click="function(s,e){}" />
											</dx:ASPxImage>
										</td>
										<td>
											<dx:ASPxLabel ID="ASPxLabel6" runat="server" Text='<%# Eval("RoleName") %>'>
											</dx:ASPxLabel>
										</td>
									</tr>
								</table>
							</ItemTemplate>
						</dx:ASPxDataView>  
					</td>
					<td>&nbsp;</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td style="white-space: nowrap">
			<dx:ASPxLabel ID="lblLastName" runat="server" Text="Last Name:">
			</dx:ASPxLabel>
		</td>
		<td style="white-space: nowrap">
			<dx:ASPxTextBox ID="txtLastName" runat="server" Width="170px">
			</dx:ASPxTextBox>
		</td>
	</tr>
	<tr>
		<td style="white-space: nowrap">
			<dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Email :">
			</dx:ASPxLabel>
		</td>
		<td style="white-space: nowrap">
			<dx:ASPxTextBox ID="txtEmail" runat="server" Width="170px">
			</dx:ASPxTextBox>
		</td>
	</tr>
	<tr>
		<td colspan="2">&nbsp;<br /></td>
	</tr>
	<tr>
		<td style="white-space: nowrap">
			<dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="User Name :">
			</dx:ASPxLabel>
		</td>
		<td style="white-space: nowrap">
			<dx:ASPxTextBox ID="txtUsername" runat="server" Width="170px">
			</dx:ASPxTextBox>
		</td>
	</tr>
	<tr>
		<td style="white-space: nowrap">
			<dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Password :">
			</dx:ASPxLabel>
		</td>
		<td style="white-space: nowrap">
			<dx:ASPxTextBox ID="txtPassword" runat="server" Width="170px" Password="True">
			</dx:ASPxTextBox> 
		</td>
	</tr>
	<tr>
		<td style="white-space: nowrap">
			<dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Confirm Password :">
			</dx:ASPxLabel>
		</td>
		<td style="white-space: nowrap">
			<dx:ASPxTextBox ID="txtConfirmPassword" runat="server" Width="170px" Password="True">
			</dx:ASPxTextBox>  
		</td>
	</tr>
	<tr>
		<td colspan="2">&nbsp;<br /></td>
	</tr>
	<tr>
		<td>
			<dx:ASPxButton ID="btnSave" runat="server" Text="Save" onclick="btnSave_Click" AutoPostBack="true">
			</dx:ASPxButton>
		</td>
		<td>
			<dx:ASPxButton ID="btnCancel" runat="server" Text="Cancel" AutoPostBack="true" 
				onclick="btnCancel_Click">
				<ClientSideEvents Click="function(s,e){
					
					newRoles.Clear();
					removedRoles.Clear();

				}" />
			</dx:ASPxButton>
		</td>
	</tr>
</table>
<dx:ASPxHiddenField ID="newRoles" runat="server" ClientInstanceName="newRoles">
</dx:ASPxHiddenField>
<dx:ASPxHiddenField ID="removedRoles" runat="server" ClientInstanceName="removedRoles">
</dx:ASPxHiddenField>
-->