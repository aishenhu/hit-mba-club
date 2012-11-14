/**
 * @author Script
 */
$(document).ready(function(){
    $(".pass").click(function(){
        var processid = $(this).parent().parent().attr("id");
		process(processid,1);
    });
    $(".ignore").click(function(){
        var processid = $(this).parent().parent().attr("id");
		process(processid,0);
    });
});

/**
 * 移除指定id的元素
 * @param {Object} id
 */
function removeTr(id){
    $("#" + id).replaceWith("");
	var app = $(".appNum").attr("num");
	app -= 1;
	$(".appNum").attr("num",app).html("["+app+"]");
	if(app == 0){
		$(".application").replaceWith("<p>目前没有未处理的请求</p>");
	}
}

/**
 * 处理申请
 * @param {Object} id 申请的id
 * @param {Object} type 处理类型  0:用户审核  1:内容审核
 * @param {Object} result 结果  0:忽略  1:通过
 */
function process(id, result){
	var processUrl = "http://localhost/project/MBA/ajax/audit-user.php";
	if(type == 1){
		processUrl = "news_audit"
	}
    $.ajax({
        type: "POST",
        data: {
            pid: id,
			presult:result
        },
        url: processUrl,
        success: function(p){
			removeTr(id);
        }
    });
}
