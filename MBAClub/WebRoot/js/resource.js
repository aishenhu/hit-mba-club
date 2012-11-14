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


$(document).ready(function(){
    /**
     * TAB切换
     */
    $(".tab-nav-item").click(function(){
        var target = $(this).attr("target");
        $(".tab-nav-item").removeClass("tab-nav-current");
        $(this).addClass("tab-nav-current");
        $(".tab-content").addClass("hidden");
        $("." + target).removeClass("hidden");
    });
    
    /**
     * 全选、取消全选和批量操作
     */
    $(".select-all").click(function(){
        //console.log($("input").attr("checked"));
        $("input").attr("checked", true);
		return false;
    });
    $(".select-cancel").click(function(){
        //console.log($("input").attr("checked"));
        $("input").attr("checked", false);
		return false;
    });
    $("select-download").click(function(){
    	return false;
    });
});
