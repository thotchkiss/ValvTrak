/*
EasyMod By DrNuke
Copyright (c) 2009 DrNuke Ltd
Warning: This computer program is protected by copyright law and international treaties. 
Unauthorized reproduction or distribution of this program, or any portion of it, may result in severe civil and criminal penalties, and will be prosecuted under the maximum extent possible under law.
*/
var $j = jQuery.noConflict();
$j(document).ready(function(){
    var currentTab = $j(".hidEMCurrentTab").val();
    $j('#EMTabs1').tabs(
        {
        onShow: function() {
            $j(".hidEMCurrentTab").val($j('#EMTabs1').activeTab());
        }
    });   
       
    if (currentTab != '') {
        $j('#EMTabs1').triggerTab(parseInt(currentTab)); 
    }  
});