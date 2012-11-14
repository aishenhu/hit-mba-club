/**
 * @author Script
 */
var GLOABLE;

(function(){
    GLOABLE = GLOABLE || {};
    GLOABLE.username = "用户名，6~20位，不含中文";
    GLOABLE.email = "正确的邮箱地址";
    GLOABLE.password = "字母下划线数字,6~20位";
    GLOABLE.passwordag = "密码确认";
    GLOABLE.truename = "输入真实姓名";
    GLOABLE.school = "毕业院校";
    GLOABLE.date = "入学年份";
    GLOABLE.phone = "手机号码"
    GLOABLE.infor = "附加的信息";
    GLOABLE.ajax = {};    /*缓存客户端的ajax请求结果*/
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

/**
 * 验证是否符合Email格式
 * @param {Object} str
 */
function utilVerifyEmail(str){
    var myReg = /^[-_A-Za-z0-9\.]+@([_A-Za-z0-9]+\.)+[A-Za-z0-9]{2,3}$/;
    if (myReg.test(str)) 
        return true;
    return false;
}

function verify(item){
    if (item == "username") {
        //验证用户名
        var len = $.trim($("#" + item).val()).length;
        if (len < 6 || len > 20) {
            return false;
        }
        else {
            /*
             * 通过ajax验证用户名是否可用
             */
            var uname = $.trim($("#" + item).val());
            if (GLOABLE.ajax[uname] == undefined) {
                $(".username").addClass("process").text("正在验证是否可用...");
                $.ajax({
                    type: "POST",
                    data: {
                        username: uname
                    },
                    url: "verify_username",
                    success: function(msg){
                        GLOABLE.ajax[uname] = msg;
                        if (msg == 1) {
                            $(".username").removeClass("hidden").removeClass("error").text("用户名可用");
                            
                        }
                        else 
                            if (msg == 0) {
                                $(".username").addClass("error").removeClass("hidden").text("该用户已存在！");
                                
                            }
                    }
                });
                return false;
            }
            else {
                if (GLOABLE.ajax[uname] == 1) {
                    $(".username").removeClass("hidden").removeClass("error").text("用户名可用");
                    return true;
                }
                else 
                    if (GLOABLE.ajax[uname] == 0) {
                        $(".username").addClass("error").removeClass("process").text("该用户已存在！");
                        return false;
                    }
            }
            return true;
            
        }
    }
    else 
        if (item == "email") {
            //验证邮箱地址
            var str = $("#" + item).val();
            return utilVerifyEmail(str);
        }
        else 
            if (item == "password") {
                var str = $("#" + item).val();
                return utilVerifyPwd(str);
            }
            else 
                if (item == "passwordag") {
                    var pwd = $("#password").val();
                    var pwdag = $("#passwordag").val();
                    if (pwd == pwdag) {
                        return true;
                    }
                    else {
                        return false;
                    }
                }else if(item == "truename"){
					var str = $("#truename").val();
					if($.trim(str).length > 0){
						return true;
					}else{
						return false;
					}
				}else if(item == 'school'){
					var str = $('#school').val();
					if($.trim(str).length > 0){
						return true;
					}else{
						return false;
					}
				}else if(item == 'date'){
					var str = $('#date').val();
					if($.trim(str).length > 0){
						return true;
					}else{
						return false;
					}
				}else if(item ==  'phone'){
					var str = $('#phone').val();
					if($.trim(str).length == 11){
						var myreg = /^(((13[0-9]{1})|15[0-9]{1}|18[0-9]{1}|)+\d{8})$/;
						//console.log(myreg.test($.trim(str)))
						if(myreg.test($.trim(str))){
							return true;
						}else{
							return false;
						}
					}else{
						return false;
					}
				}
    	
    return true;
}

$(document).ready(function(){
    $(".userinput").focus(function(){
        var help = $(this).attr("name");
        $("." + help).removeClass("hidden").text(GLOABLE[help]);
        $(this).addClass("userinput-focus");
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
        else 
            if ($("." + help).hasClass("process") == false) {
                $("." + help).addClass("hidden");
            }
    });
    
    $(".g-button-submit").click(function(){
        var vr = true;
        vr = (verify("username") == false) ? false : vr;
        vr = (verify('password') == false) ? false : vr;
        vr = (verify("passwordag") == false) ? false : vr;
        vr = (verify("email") == false) ? false : vr;
		vr = (verify("truename") == false)?false :vr;
		vr = (verify("school") == false)?false :vr;
		vr = (verify("date") == false)?false :vr;
		vr = (verify("phone") == false)?false :vr;
        if (vr == false) {
            $(".userinput").each(function(){
                var help = $(this).attr("name");
                if (verify(help) == false) {
                    $("." + help).addClass("error").removeClass("hidden");
					if($("." + help).text() == ""){
						$("." + help).text(GLOABLE[help])
					}
                }
            });
        }
        return vr;
    });
});



