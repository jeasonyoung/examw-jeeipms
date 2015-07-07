// JavaScript Document

function ToggleMenu(obj,content){
	obj.hover(function(){
		content.show()
		obj.addClass("showmenu")
	},function(){
		content.hide()
		obj.removeClass("showmenu")
	})
}

function SNmenuNav(){
	$$$("#SNmenuNav dl").hover(function(){
		$$$(this).find("dt a").addClass("on");
		$$$(this).find("dd").show();
		$$$(this).find("dt b").hide();
	},function(){
		$$$(this).find("dt a").removeClass("on");
		$$$(this).find("dd").hide();
		$$$(this).find("dt b").show();
	})
}

$$$(function(){
	ToggleMenu($$$("#menuTree"),$$$("#SNmenuNav"));
	SNmenuNav();
})