/**
 * @author Script
 */
/**
 * 匿名函数解决jQuery bug
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

function showLoading(){
    $(".loading-status").removeClass("hidden");
}

function hideLoading(){
    $(".loading-status").addClass("hidden");
}

$(document).ready(function(){
    $(".activity").each(function(){
        $(this).find("a.image").lightBox();
    });
    
    /**
     * 显示方法切换
     */
    $(".type-switch a").click(function(){
        $(".type-switch a").removeClass("type-current");
        $(this).addClass("type-current");
        if ($(this).hasClass("type-thumb")) {
            $(".thumb").removeClass("hidden");
            $(".list").addClass("hidden");
        }
        else {
            $(".thumb").addClass("hidden");
            $(".list").removeClass("hidden");
        }
    });
    
    /**
     *
     */
    $(".side-box a").live("click",function(){
		var newsID = $(this).attr("id");
        $(".side-box").animate({
            width: "240px"
        }, "3000", function(){
            $(".main").removeClass("hidden");
			showLoading();
            $.ajax({
                type: "POST",
                data: {
                    id:newsID
                },
                url: "news",
                success: function(news){
					hideLoading();
                    $(".main-content").empty().append(news);                    
                }
            });
        });
        
        return false;
    });
    
    /**
     * 获取更多活动回顾列表
     */
    $(".more-loading").click(function(){
        $(this).addClass("more-status");
	
		$.ajax({
                type: "POST",
                data: {
                    requestPage:$(".more-loading").attr("next")
                },
                url: "http://localhost/project/MBA/ajax/review-more.php",
                success: function(more){
                    $(".more-loading").attr("next", function(){
                        return parseInt($(".more-loading").attr("next")) + 1;
                    });
                    $(".more.button").prev("ul").append(more);
					$(".more-loading").removeClass("more-status");
                }
            });
    });
});
