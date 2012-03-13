/*
EasyMod By DrNuke
Copyright (c) 2009 DrNuke Ltd
Warning: This computer program is protected by copyright law and international treaties. 
Unauthorized reproduction or distribution of this program, or any portion of it, may result in severe civil and criminal penalties, and will be prosecuted under the maximum extent possible under law.
*/

var blnIsFullHeight;

function getCSSRule(ruleName, deleteFlag) {
	ruleName=ruleName.toLowerCase(); 
	var objStyleSheets = document.styleSheets;									
	if (objStyleSheets) { 										
		for (var i = 0; i < objStyleSheets.length; i++) { 
			var styleSheet = objStyleSheets[i];	
			var ii = 0; 													
			var cssRule=false; 
			var last=false;
													
			do { 														
				if (styleSheet.cssRules) { 								
					cssRule = styleSheet.cssRules[ii];
				} else { 												
					cssRule = styleSheet.rules[ii];					
				} 													
				if (cssRule) {				   
                    if (typeof(cssRule.selectorText) != "undefined") {
				        if (cssRule.selectorText.toLowerCase()==ruleName) {
						    if (deleteFlag=='delete') { 					
							    if (styleSheet.cssRules) { 					
								    styleSheet.deleteRule(ii); 			
							    } else { 									
								    styleSheet.removeRule(ii); 				
							    } 											
							    return true; 							
						    } else { 										
							    return cssRule; 							
						    } 												
                         }
                      }											
				 }
				  
				 // Chrome fix	
				 if (cssRule == last) {
                    cssRule = false;
                 }
                 last=cssRule;
                  											
				ii++;
			} while (cssRule);
		}
	}
	return false;
}

function addCSSRule(ruleName) {
	if (document.styleSheets) {
		if (!getCSSRule(ruleName)) {
			if (document.styleSheets[0].addRule) {
				document.styleSheets[0].addRule(ruleName, null,0);
			} else { // Browser is IE?
				document.styleSheets[0].insertRule(ruleName+' { }', 0);
			}
		} 																
	} 																	
	return getCSSRule(ruleName); 										
}

function setEMFullHeight() {
	var intContentHeight = document.getElementById('InnerContainer').offsetHeight;
	var intHeightContainer = document.getElementById('ContentHeightContainer').offsetHeight;
	var intWindowHeight = document.body.offsetHeight;		
	var intOffset = document.getElementById('EMOffset1').offsetHeight + document.getElementById('EMOffset2').offsetHeight + document.getElementById('EMOffset3').offsetHeight + document.getElementById('EMOffset4').offsetHeight;
	var intNewHeight = intWindowHeight - intOffset;		
	if (intHeightContainer >= intContentHeight) {
		if (intNewHeight >= intContentHeight) {
			document.getElementById("ContentHeightContainer").style.height = intNewHeight + "px";
		}
	} else {
		document.getElementById("ContentHeightContainer").style.height = intContentHeight + "px";
	}
} 

function setEMAutoHeight(blnFullHeight) {
	document.getElementById("ContentHeightContainer").style.height = "auto";
} 

function addLoadEvent(func,param) {
	var oldonload = window.onload;
	if (typeof window.onload != 'function') {
		window.onload = func;
	} else {
		window.onload = function() {
		  if (oldonload) {
			oldonload();
		  }
		  func(param);
		};
	}
}

function isFullHeight() {
	if (typeof blnIsFullHeight == 'undefined') {
		EMFullHeight = addCSSRule('.EMFullHeight');
		if (EMFullHeight.style.height === "100%") {
			blnIsFullHeight = "true";
		} else {
			blnIsFullHeight = "false";
		}
	}
	if (blnIsFullHeight == 'true') {
		setInterval(setEMFullHeight, 100);
	} else {
		setEMAutoHeight();
	}
}

addLoadEvent(isFullHeight);