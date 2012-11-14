/**
 * @author Script
 */
$(document).ready(function(){
    $(".outline-op").toggle(function(){
        //显示列表
        $(".outline-op").addClass("unfolder");
        $(".outline-list").removeClass("hidden").animate({
            opacity: 1.0
        }, "normal");
    }, function(){
        //隐藏列表
        $(".outline-list").animate({
            opacity: 0.2
        }, "normal", function(){
            $(".outline-list").addClass("hidden");
        });
        $(".outline-op").removeClass("unfolder");
    });
    
    $(".milestone-more").click(function(){
        $(this).text("载入中...");
        $.ajax({
            type: "POST",
            data: {
                requestPage: $(this).attr("next")
            },
            url: "ajax/milestone-more.jsp",
            success: function(more){
                $(".milestone-more").attr("next", function(){
                    return parseInt($(".milestone-more").attr("next")) + 1;
                });
                $(".milestone-more").before(more).text("载入更多");
            }
        });
    });
});
