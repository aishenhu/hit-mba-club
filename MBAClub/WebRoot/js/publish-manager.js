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


$(document).ready(function(){
    $(".deleteop").click(function(){
    	return confirm("确认删除吗？");    	
    });
    $(".topop").click(function(){
    	return confirm("确认置顶吗？");    	
    });
});
