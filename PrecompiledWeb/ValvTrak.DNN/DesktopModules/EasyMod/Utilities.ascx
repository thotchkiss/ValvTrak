<%@ Control language="vb" Inherits="DrNuke.EasyMod.EMUtilities" AutoEventWireup="false" Explicit="True" Codebehind="Utilities.ascx.vb" %>

<div id="EMContainerMain"> 

    <asp:Panel ID="pnlMessage" runat="server">
    <div id="EMMessage">
        <table cellpadding="0" cellspacing="0" border="0">
        <tr><td><asp:Image ID="imgMessage" runat="server" /></td><td><asp:Label ID="lblMessage" runat="server" Text="" CssClass="normal"></asp:Label></td></tr>
        </table>
    </div>
    </asp:Panel>

    <div id="EMContainerUtilities">
        <p>Use the Import and Export functions to backup and restore the EasyMod settings for the skin</p>
        <p>This is particularly useful when upgrading the skin packs to the latest version, or copying your settings to another skin pack.</p>
        <div id="EMTabs1">
            <ul>
                <li><a href="#tab-1"><span>Import</span></a></li>
                <li><a href="#tab-2"><span>Export</span></a></li>
            </ul>

            <div id="tab-1">                        
                <fieldset>
                <legend><span class="legend">Import</span></legend>
                <div id="EMContainerImport"> 
                    <div class="note"><asp:Label ID="lblEMSkinImport" runat="server" CssClass="SubHead">Destination Skin</asp:Label></div><div class="floatleft"><asp:Label ID="lblSkinImport" runat="server" Text=""></asp:Label></div>
                    <div class="clear"></div>                               
                    <div class="note2"><asp:Label ID="lblEMFolderImport" runat="server" CssClass="SubHead">Folder</asp:Label></div><div class="floatleft"><asp:DropDownList ID="cboFoldersImport" Runat="server" CssClass="NormalTextBox" AutoPostBack="true" /></div>
                    <div class="clear"></div>
                    <div class="note2"><asp:Label ID="lblEMFileImport" runat="server" CssClass="SubHead">File</asp:Label></div><div class="floatleft"><asp:DropDownList ID="cboFilesImport" Runat="server" CssClass="NormalTextBox" Width="300"></asp:DropDownList></div>                
                    <div class="clear"></div>                    
                    <div style="float:left;"><asp:ImageButton id="btnImportCancel" AlternateText="Cancel" runat="server" CausesValidation="false" OnClick="btnImportCancel_Click" CssClass="btn-cancel"></asp:ImageButton></div>
                    <div style="float:right;"><asp:ImageButton id="btnImport" AlternateText="Import" runat="server" OnClick="btnImport_Click" CssClass="btn-import" OnClientClick="return confirm('Please confirm you wish to overwrite all current settings?')"></asp:ImageButton></div>                                     
                    <div class="clear"></div>
                    <asp:Label ID="lblEMImportLog" runat="server" CssClass="EMImportLog"></asp:Label></div>
                </fieldset>
            </div>

            <div id="tab-2">
                <fieldset>
                <legend><span class="legend">Export</span></legend>                    
                <div id="EMContainerExport">
                    <div class="note"><asp:Label ID="lblEMSkinExport" runat="server" CssClass="SubHead">Source Skin</asp:Label></div><div class="floatleft"><asp:Label ID="lblSkinExport" runat="server" Text=""></asp:Label></div>
                    <div class="clear"></div>                               
                    <div class="note2"><asp:Label ID="lblEMFolderExport" runat="server" CssClass="SubHead">Folder</asp:Label></div><div class="floatleft"><asp:DropDownList ID="cboFoldersExport" Runat="server" CssClass="NormalTextBox"></asp:DropDownList></div>
                    <div class="clear"></div>
                    <div class="note2"><asp:Label ID="lblEMFileExport" runat="server" CssClass="SubHead">File</asp:Label></div><div class="floatleft"><asp:textbox id="txtFileExport" cssclass="NormalTextBox" runat="server" maxlength="200" width="300"></asp:textbox></div>                
                    <div class="clear"></div>
                    <div style="float:left;"><asp:ImageButton id="btnExportCancel" AlternateText="Cancel" runat="server" CausesValidation="false" OnClick="btnExportCancel_Click" CssClass="btn-cancel"></asp:ImageButton></div>
                    <div style="float:right;"><asp:ImageButton id="btnExport" AlternateText="Export" runat="server" OnClick="btnExport_Click" CssClass="btn-export"></asp:ImageButton></div>                                                        			               
                </div>
                </fieldset>                             
            </div>
        </div>
        
     
    </div>
    
    <asp:TextBox ID="txtEMCurrentTab" runat="server" CssClass="hidEMCurrentTab EMHidField"></asp:TextBox>

</div>
