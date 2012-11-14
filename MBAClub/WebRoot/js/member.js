/**
 * @author Script
 */
$(document).ready(function(){
    var size = $(".slide-show li").size();
	//console.log(size);
	size -= 4;
    var i = 0;
    var dir = 0;
    setInterval(function(){
		if(size < 0){
			return ;
		}
		var mt;
        mt = (0 - ( i) * 210) + "px";
        $(".slide-show ul").animate({
            marginLeft: mt
        }, 1500, function(){
            if(dir == 0){
				i ++;
			}else{
				i --;
			}
			
			if(i == 0){
				dir = 0;
			}else if( i == size){
				dir = 1;
			}
        });
    }, 4000);
	
	$(".outline-op").toggle(function(){
		//显示列表
		$(".outline-op").addClass("unfolder");
		$(".outline-list").removeClass("hidden").animate({
			opacity:1.0
		},"normal");
	},function(){
		//隐藏列表
		$(".outline-list").animate({
			opacity:0.2
		},"normal",function(){
			$(".outline-list").addClass("hidden");
		});
		$(".outline-op").removeClass("unfolder");
	});
});