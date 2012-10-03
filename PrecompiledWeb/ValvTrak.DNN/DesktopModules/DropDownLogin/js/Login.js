if (!window.dccJQL)
    dccJQL = jQuery.noConflict();
(function(jQuery) {
    var widthForOpera = 200;
    function ResetPage() {
        jQuery(".loginText").val("");
        jQuery(".loginError").text("");
    }
    jQuery(document).ready(function() {
        if (eval(jQuery("a.signin").attr("Authenticated")) !== 1) {
            jQuery("a.signin").click(function(e) {
                e.preventDefault();
                var divSigninMenu = jQuery("div#signin_menu");
                if (jQuery.browser.opera) {
                    divSigninMenu.css("width", widthForOpera)
                }
                var width = parseInt(divSigninMenu.css("width"));
                divSigninMenu.css("left", e.currentTarget.offsetLeft + jQuery(e.currentTarget).width() - width).css("top", e.currentTarget.offsetTop + e.currentTarget.offsetHeight - 8); //.toggle("slow");
                ResetPage();
                var signinlnk = jQuery(".signin");
                if (!signinlnk.attr("open") || signinlnk.attr("open") == "0") {
                    signinlnk.addClass("menu-open").find("img").attr("src", strModulePath + "/images/toggle_up_dark.png");
                    signinlnk.attr("open", "1");
                }
                else {
                    signinlnk.attr("open", "0");
                }
                divSigninMenu.animate(
                    { height: 'toggle' }, 'medium', 'swing',
                    function() {
                        var signinlnk = jQuery("a.signin");
                        if (signinlnk.attr("open") == "0") {
                            signinlnk.removeClass("menu-open").find("img").attr("src", strModulePath + "/images/toggle_down_light.png");
                        }
                    }
                );
                return false;
            });
        }
        jQuery("a.signin").mouseup(function() {
            return false;
        });
        jQuery("div#signin_menu").mouseup(function() {
            return false;
        });
        jQuery(document).mouseup(function(e) {
            if (jQuery(e.target).parent("a.signin").length == 0) {
                jQuery("a.signin").removeClass("menu-open").attr("open", "0").find("img").attr("src", strModulePath + "/images/toggle_down_light.png");
                jQuery("div#signin_menu").hide();
            }
        });
        var btnSignin = jQuery("a.signin");
        if (btnSignin.attr("KeepOpen") != undefined && eval(btnSignin.attr("KeepOpen")) == 0) {
            var divSigninMenu = jQuery("div#signin_menu");
            var width = widthForOpera;
            if (!jQuery.browser.opera) {
                width = parseInt(divSigninMenu.css("width"));
            }
            divSigninMenu.css("left", btnSignin[0].offsetLeft + jQuery(btnSignin[0]).width() - width).css("top", btnSignin[0].offsetTop + btnSignin[0].offsetHeight - 8).show();
            jQuery("a.signin").addClass("menu-open").find("img").attr("src", strModulePath + "/images/toggle_up_dark.png")
            btnSignin.attr("open", "1");
        }
        else {
            jQuery("#signin_menu").hide();
            jQuery("a.signin").removeClass("menu-open").find("img").attr("src", strModulePath + "/images/toggle_down_light.png");
        }
    });
})(dccJQL);
