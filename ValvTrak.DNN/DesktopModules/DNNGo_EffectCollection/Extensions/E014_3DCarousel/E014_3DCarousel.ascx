<%@ Control Language="C#" AutoEventWireup="true"
    Inherits="DNNSmart.EffectCollection.E014_3DCarousel" Codebehind="E014_3DCarousel.ascx.cs" %>
<asp:PlaceHolder ID="phScript" runat="server"></asp:PlaceHolder>
<asp:Literal ID="litContent" runat="server"></asp:Literal>

<script type="text/javascript" charset="utf-8">
<!--
		jQuery(document).ready(function($){
			$("#<%=SettingsEffect %><%=ModuleId %>").CloudCarousel(		
		{			
			xPos: <%=SettingstxtxPosition %>,      //Horizontal position of the circle centre relative to the container. You would normally set this to half the width of the container.
			yPos: <%=SettingstxtyPosition %>,      //Vertical position of the circle centre relative to the container. You would normally set this to around half the height of container.
			//bringToFront: 'true', //If true, moves the item clicked on to the front.
			minScale: <%=SettingstxtMinScale %>,  //The minimum scale appled to the furthest item. The item at the front has a scale of 1. To make items in the distance one quarter of the size, minScale would be 0.25.
            reflHeight:<%=SettingstxtReflectionHeight %>,   //Height of the auto-reflection in pixels, assuming applied to the item at the front. The reflection will scale automatically. A value of 0 means that no auto-reflection will appear.
			reflGap:<%=SettingstxtReflectionGap %>,     //Amount of vertical space in pixels between image and reflection, assuming applied to the item at the front. Gap will scale automatically.
			reflOpacity:<%=SettingstxtReflectionOpacity %>,//Specifies how transparent the reflection is. 0 is invisible, 1 is totally opaque.
			<%=SettingstxtxRadius %>    //Half-width of the circle that items travel around. 	Width of container / 2.3
			<%=SettingstxtyRadius %>    //Half-height of the circle that items travel around. By playing around with this value, you can alter the amount of 'tilt'. 	Height of container / 6			
			speed:<%=SettingstxtSpeed %>,      //This value represents the speed at which the carousel rotates between items. Good values are around 0.1 ~ 0.3. A value of one will instantly move from one item to the next without any rotation animation. Values should be greater than zero and less than one.
			autoRotate:'<%=SettingsrblAutoRotate %>', //Turn on auto-rotation of the carousel using either 'left' or 'right' as the value. The carousel will rotate between items automatically. The auto-rotation stops when the user hovers over the carousel area, and starts again when the mouse is moved off.
			autoRotateDelay:<%=SettingstxtAutoRotateDelay %>, //Delay in milliseconds between each rotation in auto-rotate mode. A minimum value of 1000 (i.e. one second) is recommended.
			mouseWheel:<%=SettingscbMouseWheel %>,    //If set to true, this will enable mouse wheel support for the carousel.
			buttonLeft: $("#left-but<%=ModuleId %>"),
			buttonRight: $("#right-but<%=ModuleId %>"),
			altBox: $("#alt-text<%=ModuleId %>"),
			titleBox: $("#title-text<%=ModuleId %>")
		}
	);
		});
		//-->
</script>

