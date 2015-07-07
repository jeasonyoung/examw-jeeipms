(function($){
	$.fn.Promptbox = function(options){
		var opts = $.extend({},$.fn.Promptbox.defaults,options);
		return this.each(function(){
		   var p = $(this);
		   $.fn.Promptbox.appends(opts);
		});
    };
	 
	$.fn.Promptbox.appends = function(obj){
		var submittext = "";
		if(obj.b_text2!="" && obj.b_text1!=""){
			submittext = '<div class="pt_txt3"><div id="submit2" class="submit2">'+obj.b_text2+'</div><div id="submit" class="submit">'+obj.b_text1+'</div></div>'; }
		else if(obj.b_text1!=""){
			submittext = '<div class="pt_txt3"><div id="submit" class="submit">'+obj.b_text1+'</div></div>';
		}
		
		var Pboxhtml = '<div class="point3"><div class="pt3_box"><div class="pt_title"><span>提示</span><a href="javascript:void(0);" id="close" class="close">关闭</a></div><div class="pt_txt"><div class="pt_ts"><div class="spa'+obj.span_num+'">'+obj.pt_info+'</div></div>'+submittext+'<br clear="all" /></div></div></div>';
		var mark = $("<div class='mark'></div>").css({
						width : $("body").width() ,   
                        height : $("body").height()						 
					}).appendTo('body');
		
        var Pbox = $(Pboxhtml).appendTo("body");
		
		setPosition(Pbox)

		mark.dblclick(function(){mark.remove();Pbox.remove()});
		
		if($("#submit").length){
			$("#submit").click(function(){						
				if(obj.b1_link!=""){
					window.location = obj.b1_link;
				}else{
					if($.isFunction(obj.callback)) {
						obj.callback(); 
					}
					Pbox.remove();
					mark.remove();
				}
			}); 
		}
		if($("#submit2").length){
	    $("#submit2").click(function(){Pbox.remove();mark.remove();});}
		$("#close").click(function(){Pbox.remove();mark.remove();});
	};
	
	function setPosition(obj){
	    var screenWidth = $(window).width(); 
		var screenHeight = $(window).height();
		var scrolltop = $(document).scrollTop();//获取当前窗口距离页面顶部高度
		var objLeft = (screenWidth - obj.width())/2 ;
		if($.browser.msie && $.browser.version=="6.0"){
           var objTop = (screenHeight - obj.height())/2 + scrolltop;
		}else{
		   var objTop = (screenHeight - obj.height())/2;	
		}
        obj.css({left: objLeft + 'px', top: objTop + 'px','display': 'block'});	
		
		if($.browser.msie && $.browser.version=="6.0"){
			//浏览器窗口大小改变时 
			$(window).resize(function() { 
			screenWidth = $(window).width(); 
			screenHeight = $(window).height(); 
			scrolltop = $(document).scrollTop(); 
			objLeft = (screenWidth - obj.width())/2 ; 
			objTop = (screenHeight - obj.height())/2 + scrolltop; 
			obj.css({left: objLeft + 'px', top: objTop + 'px','display': 'block'}); 
			}); 
			//浏览器有滚动条时的操作、 
			$(window).scroll(function() { 
			screenWidth = $(window).width(); 
			screenHeight = $(window).height(); 
			scrolltop = $(document).scrollTop(); 
			objLeft = (screenWidth - obj.width())/2 ; 
			objTop = (screenHeight - obj.height())/2 + scrolltop; 
			obj.css({left: objLeft + 'px', top: objTop + 'px','display': 'block'}); 
			});
		}
	}
	
	$.fn.Promptbox.defaults = {
		 pt_info:"您无权访问",
		 span_num: "3",
		 b_text1:"确定",
		 b_text2:"关闭",
		 b1_link:"",
		 b2_link:"",
		 callback:null
	};
})(jQuery);