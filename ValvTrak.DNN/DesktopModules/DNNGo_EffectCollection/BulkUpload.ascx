<%@ Control Language="C#" Inherits="DNNSmart.EffectCollection.BulkUpload"
    AutoEventWireup="true" Codebehind="BulkUpload.ascx.cs" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>

<script type="text/javascript">
		var swfu;
		var ModulePath = '<%=UrlHeader %>DesktopModules/DNNGo_EffectCollection/';
		window.onload = function() {
			var settings = {
				// Flash Settings
				flash_url : ModulePath+"flash/swfupload.swf",	// Relative to this file
				flash9_url : ModulePath+"flash/swfupload_FP9.swf",	// Relative to this file
				upload_url: ModulePath+"upload.aspx",
				post_params : {
				 "post_param_uploadfolderid" : "<%=RootFolderId %>",					
				 "post_param_uploadfolderpath" : "<%=RootFolderPath %>",				 
                 "post_param_portalid" : "<%=PortalId %>",
                 "post_param_moduleid" : "<%=ModuleId %>",
                 "post_param_tabid" : "<%=TabId %>"		                 				 				 
				 }, 
				use_query_string: false,
				file_size_limit : "6000 MB",
				file_types : "*.jpg;*.png;*.jpeg;*.gif",
				file_types_description : "Image",
				file_upload_limit : 0,
				file_queue_limit : 0,				
				custom_settings : {
					progressTarget : "fsUploadProgress",
					cancelButtonId : "btnCancel",
					tdFilesQueued : document.getElementById("tdFilesQueued"),
					tdFilesUploaded : document.getElementById("tdFilesUploaded"),
					tdErrors : document.getElementById("tdErrors"),
					tdCurrentSpeed : document.getElementById("tdCurrentSpeed"),
					tdAverageSpeed : document.getElementById("tdAverageSpeed"),
					tdMovingAverageSpeed : document.getElementById("tdMovingAverageSpeed"),
					tdTimeRemaining : document.getElementById("tdTimeRemaining"),
					tdTimeElapsed : document.getElementById("tdTimeElapsed"),
					tdPercentUploaded : document.getElementById("tdPercentUploaded"),
					tdSizeUploaded : document.getElementById("tdSizeUploaded"),
					tdFileSize:document.getElementById("tdFileSize"),
					tdProgressEventCount : document.getElementById("tdProgressEventCount")
				},
				debug: false,

				// Button settings
				button_image_url: ModulePath+"images/XPButtonNoText_160x22.png",
				button_width: "160",
				button_height: "22",
				button_placeholder_id: "spanButtonPlaceHolder",
				button_text: '<span class="SubHead">Select Images</span>',
				button_text_style: ".theFont { font-size: 16; }",
				button_text_left_padding: 12,
				button_text_top_padding: 3,
				
				// The event handler functions are defined in handlers.js

				file_queued_handler : fileQueued,
				file_queue_error_handler : fileQueueError,
				file_dialog_complete_handler : fileDialogComplete,
				upload_start_handler : uploadStart,
				upload_progress_handler : uploadProgress,
				upload_error_handler : uploadError,
				upload_success_handler : uploadSuccess,
				upload_complete_handler : uploadComplete,
			//	queue_complete_handler : queueComplete	// Queue plugin event
			};
			swfu = new SWFUpload(settings);
	     };	          
</script>

<table width="600">
    <tr>
        <td colspan="2">
           
            <span class="Normal"><strong>Note:</strong> On this page,you can upload images in bulk. But Title of each item
                will be configured to image name in default, so you need to name the image well
                before you upload them.<br />
                <br />
            </span>
        </td>
    </tr>
    <tr>
        <td  align="center">
            <asp:LinkButton ID="lbBack" runat="server" OnClick="lbBack_Click">
                <asp:Image ID="Image1" runat="server" ImageUrl="~/images/action_export.gif" /><asp:Label
                    ID="Label1" runat="server" resourcekey="lblBack" CssClass="SubHead"></asp:Label></asp:LinkButton>
        </td>
        <td  align="center">
            <asp:LinkButton ID="lbContinue" runat="server" OnClick="lbContinue_Click">
                <asp:Image ID="imgContinue" runat="server" ImageUrl="~/images/action_import.gif" /><asp:Label
                    ID="lblContinue" runat="server" resourcekey="lblContinue" CssClass="SubHead"></asp:Label></asp:LinkButton><br /><br />
        </td>
    </tr>
    <tr>
        <td style="width: 250px" align="center">
            <table class="EC_BulkUpload">
                <tr>
                    <td colspan="2">
                        <table>
                            <tr>
                                <td class="SubHead">
                                    <dnn:Label ID="lblUploadFolder" runat="server" ResourceKey="lblUploadFolder" />
                                </td>
                                <td>
                                    <asp:DropDownList ID="drpUploadFolder" runat="server" AutoPostBack="true" OnSelectedIndexChanged="drpUploadFolder_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <div>
                            <table>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblFilesQueued" runat="server" CssClass="SubHead" resourcekey="lblFilesQueued"></asp:Label>
                                    </td>
                                    <td id="tdFilesQueued" class="Normal">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblFilesUploaded" runat="server" CssClass="SubHead" resourcekey="lblFilesUploaded"></asp:Label>
                                    </td>
                                    <td id="tdFilesUploaded" class="Normal">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblErrors" runat="server" CssClass="SubHead" resourcekey="lblErrors"></asp:Label>
                                    </td>
                                    <td id="tdErrors" class="Normal">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblCurrentSpeed" runat="server" CssClass="SubHead" resourcekey="lblCurrentSpeed"></asp:Label>
                                    </td>
                                    <td id="tdCurrentSpeed" class="Normal">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblAverageSpeed" runat="server" CssClass="SubHead" resourcekey="lblAverageSpeed"></asp:Label>
                                    </td>
                                    <td id="tdAverageSpeed" class="Normal">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblMovingAverageSpeed" runat="server" CssClass="SubHead" resourcekey="lblMovingAverageSpeed"></asp:Label>
                                    </td>
                                    <td id="tdMovingAverageSpeed" class="Normal">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblTimeRemaining" runat="server" CssClass="SubHead" resourcekey="lblTimeRemaining"></asp:Label>
                                    </td>
                                    <td id="tdTimeRemaining" class="Normal">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lbblTimeElapsed" runat="server" CssClass="SubHead" resourcekey="lbblTimeElapsed"></asp:Label>
                                    </td>
                                    <td id="tdTimeElapsed" class="Normal">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblPercentUploaded" runat="server" CssClass="SubHead" resourcekey="lblPercentUploaded"></asp:Label>
                                    </td>
                                    <td id="tdPercentUploaded" class="Normal">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblSizeUploaded" runat="server" CssClass="SubHead" resourcekey="lblSizeUploaded"></asp:Label>
                                    </td>
                                    <td id="tdSizeUploaded" class="Normal">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblFileSize" runat="server" CssClass="SubHead" resourcekey="lblFileSize"></asp:Label>
                                    </td>
                                    <td id="tdFileSize" class="Normal">
                                    </td>
                                </tr>
                                <tr style="display: none">
                                    <td>
                                        <asp:Label ID="lblProgressEventCount" runat="server" CssClass="SubHead" resourcekey="lblProgressEventCount"></asp:Label>
                                    </td>
                                    <td id="tdProgressEventCount" class="Normal">
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </td>
                </tr>
            </table>
        </td>
        <td>
            <div>
                <span id="spanButtonPlaceHolder"></span>
                <input id="btnCancel" type="button" value="Cancel All Uploads" onclick="swfu.cancelQueue();"
                    disabled="disabled" style="margin-left: 2px; font-size: 8pt; height: 29px;" />
            </div>
            <div class="fieldset flash" id="fsUploadProgress">
                <span class="legend">
                    <asp:Label ID="lblUploadQueue" runat="server" CssClass="SubHead" resourcekey="lblUploadQueue"></asp:Label></span>
            </div>
        </td>
    </tr>
</table>
