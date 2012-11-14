/**
 * @author Script
 */
$(document).ready(function(){

	$.each($('.box-header'), function(i, n){
		var width = $(n).width();
		if(width < 305){
			$(n).width(305);
		}
	});


    var size = $(".slide-show li").size();
    var i = 1;
    var dir = 0;
    setInterval(function(){
		var mt;
        mt = (0 - i * 200) + "px";
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
			}else if( i == size - 1){
				dir = 1;
			}
        });
    }, 4000);
	
	$(".slide-show").find("a.image").lightBox();
});

$(document).ready(function(){
	var enterpriseList = $('.enterprise ul');
	var memberList = $('.member .info-img-list ul');
	var unitList = $('.unit .info-img-list ul');

	var slide = function(list){
		var _this = this;
		list.animate({marginTop: "-70px"},2000,function(){
			var first = list.find('li').first();
			var last = list.find('li').last();
			first.insertAfter(last);
			list.css('margin-top',0);
		});
	}

	var slideLeft = function(list){
		var _this = this;
		list.animate({marginLeft: "-170px"},2000,function(){
			var first = list.find('li').first();
			var last = list.find('li').last();
			first.insertAfter(last);
			list.css('margin-left',0);
		});
	}
	setInterval(function(){
		slide(unitList);
		slide(memberList);
	}, 5000);
	
	setInterval(function(){
		slideLeft(enterpriseList);
	}, 5000);	
});
