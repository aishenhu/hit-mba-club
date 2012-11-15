/**
 * @author Script
 */
(function(){
    // remove layerX and layerY    
    var all = $.event.props, len = all.length, res = [];
    while (len--) {
        var el = all[len];
        if (el != 'layerX' && el != 'layerY') 
            res.push(el);
    }
    $.event.props = res;
}());

var publish = {
    title: "",
    tags: "", /*使用英文分号作为分隔符*/
    thumb: "",
    thumbType:0,//0 小图， 1大图
    images: [],
    username: "",
    usercompany: "",
    userschool: "",
    usermotto: "",
    userpage: "",
    companyname: "",
    companyinfo: "",
    companypage: "",
    companylogo: "",
    content: "", /*文字正文*/
    modify: "",
    id: ""
}

var editor;

$(document).ready(function(){
    /*
     * 修复输入框获得焦点时的样式切换
     */
    $(".userinput").focus(function(){
        $(this).addClass("userinput-focus");
    });
    
    $(".userinput").blur(function(){
        $(this).removeClass("userinput-focus");
    });
    
    /*
     * 显示和隐藏标签的删除按钮
     */
    $(".tag-item").live("mouseover", function(){
        $(this).find(".close").removeClass("hidden");
    });
    $(".tag-item").live("mouseout", function(){
        $(this).find(".close").addClass("hidden");
    });
    
    /*
     * 删除标签
     */
    $(".close").live("click", function(){
        $(this).parent().replaceWith("");
        var str = "";
        $(".tag-item").each(function(){
            str += $(this).attr("value") + ";";
        });
        $("#tag").val(str);
    });
    
    /*
     * 处理标签输入
     */
    $("#tag").blur(function(){
        var str = $(this).val();
        if ($.trim(str).length == 0) {
            return;
        }
        var tags = str.split(";");
        $(".tags-result").empty();
        for (var i = 0; i < tags.length; i++) {
            if (tags[i].length > 0) {
                $(".tags-result").append("<span class='tag-item fl mr-6 button' value='" + tags[i] + "'>" + tags[i] + "<a class='close hidden' title='删除'>x</a></span>");
            }
        }
    });
    
    /*
     * 切换显示图片上传操作区域
     */
    $(".switch").click(function(){
        var check = $(this).attr("checked") == "checked";
        if (check) {
            $(this).parent().find(".fileupload").removeClass("hidden");
        }
        else {
            $(this).parent().find(".fileupload").addClass("hidden");
        }
    });
    
    /*
     * 切换缩略图大小格式
     */
    $(".switchThumbType").click(function(){
        var type = $(this).attr("type");
        if (type == 0) {
            $(this).attr("type", 1);
            $("#thumb").attr("width", 120).attr("height", 80);
        }
        else {
            $(this).attr("type", 0);
            $("#thumb").attr("width", 120).attr("height", 50);
        }
    });
    
    /*
     * 继续上传图片
     */
    $(".imagesmore").click(function(){
        $(".image .fileupload").prepend("<div class='imagewrapper'><img class='images-candidates' src='" + $("#img").attr("src") + "' width='200' height='160' /><a class='close'>删除</a></div>");
        $("#img").attr("src", "");
    });
    
    
    
    /*
     * 提交
     */
    $("#submit").click(function(){
        getPublishInfo();
        submit();
    });
});

/**
 * 获取需要提交的信息
 */
function getPublishInfo(){
    publish.title = $("input[name=title]").val();
    publish.tags = $("input[name=tag]").val();
    publish.thumb = $("#thumb").attr("src");
    publish.thumbType = $('.switchThumbType').attr('type');//0 小图， 1大图
    $(".images-candidates").each(function(){
        publish.images.push($(this).attr("src"));
    });
    if ($("#img").attr("src")) {
        publish.images.push($("#img").attr("src"));
    }
    
    publish.username = $("input[name=username]").val();
    publish.usercompany = $("input[name=usercompany]").val();
    publish.userschool = $("input[name=userschool]").val();
    publish.usermotto = $("input[name=usermotto]").val();
    publish.userpage = $("input[name=userpage]").val();
    
    publish.companyname = $("input[name=companyname]").val();
    publish.companyinfo = $("textarea[name=companyinfo]").val();
    publish.companypage = $("input[name=companypage]").val();
    publish.companylogo = $("#img").attr("src");
    
    publish.content = editor.getContent();
    publish.modify = $("input[name=is_modify]").val();
    publish.id = $("input[name=id]").val();
}

function submit(){
    //var type = $(".current").val("value");
    $.ajax({
        type: "POST",
        data: {
    	type:$(".side-title").attr("type"),
    	title: publish.title,
        tags: publish.tags, /*使用英文分号作为分隔符*/
        thumb: publish.thumb,
        thumbType: publish.thumbType,
        images: publish.images,
        username: publish.username,
        usercompany: publish.usercompany,
        userschool: publish.userschool,
        usermotto: publish.usermotto,
        userpage: publish.userpage,
        companyname: publish.companyname,
        companyinfo: publish.companyinfo,
        companypage: publish.companypage,
        companylogo: publish.companylogo,
        content: publish.content, /*文字正文*/
        modify: publish.modify,
        id: publish.id
        },
        url: "publish",
        success: function(msg){
           window.location.href = msg;
        }
    })
}


$(document).ready(function(){
    editor = new baidu.editor.ui.Editor();
    editor.render("myEditor");
});
