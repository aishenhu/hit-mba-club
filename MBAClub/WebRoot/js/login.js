/**
 * @author Script
 */
var GLOABLE;

(function(){
    GLOABLE = GLOABLE || {};
    GLOABLE.username = "用户名，6~20位";
    GLOABLE.password = "字母下划线数字,6~20位";
})();

/**
 * 验证密码，如果验证成功，返回true，否则返回false
 * （格式说明：字母、下划线和数字组成的6~20位字符串）
 * @param {Object} pwd : password
 */
function utilVerifyPwd(pwd){
    var ex = /^[A-Za-z0-9_+-]{6,20}$/;
    var res = ex.test(pwd);
    return res;
}

function verify(item){
    if (item == "username") {
        //验证用户名
        var len = $.trim($("#" + item).val()).length;
        if (len < 6 || len > 20) {
            return false;
        }
        else {
            return true;
        }
    }
    else 
    
        if (item == "password") {
            var str = $("#" + item).val();
            return utilVerifyPwd(str);
        }
    
    return true;
}

$(document).ready(function(){
    $(".userinput").focus(function(){
		$(this).addClass("userinput-focus");
        var help = $(this).attr("name");
        $("." + help).removeClass("hidden").text(GLOABLE[help]);
    });
    
    $(".userinput").blur(function(){
		$(this).removeClass("userinput-focus");
        var help = $(this).attr("name");
        if (verify(help) == false) {
            $("." + help).removeClass("hidden").addClass("error");
        }
        else {
            $("." + help).removeClass("error");
        }
        if ($("." + help).hasClass("error")) {
        
        }
        else {
            $("." + help).addClass("hidden");
        }
    });
    
    $(".g-button-submit").click(function(){
        var vr = true;
        vr = (verify("username") == false) ? false : vr;
        vr = (verify('password') == false) ? false : vr;
        if (vr == false) {
            $(".userinput").each(function(){
                var help = $(this).attr("name");
                $("." + help).addClass("error").removeClass("hidden").text(GLOABLE[help]);
            });
        }
        return vr;
    });
});



