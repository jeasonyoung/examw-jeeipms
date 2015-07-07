//2014.03.31增加
var hostname = location.hostname.toLowerCase();
if(hostname.indexOf("www.")==0||hostname.indexOf("localhost")==0){hostname="";}
else{hostname="http://www"+hostname.substring(hostname.indexOf("."), hostname.length);}
(function($){
	$('#search_button').click(function(){
		$("#search_form").submit();
		});
	//搜索初始化
	function chkCss(){	
		$("input[class='search1']").each(function(){
			setCss($(this));
			$(this).focus(function(){
				clearCss($(this));
			});
			$(this).blur(function(){
				setCss($(this));
			});
		});	
		$('#loginout').click(function(){
			loginout();
		})
	}
	function loginout()
	{
		if(hostname=="")
		{
		$.ajax({
    		async:true,
    		type:"POST",
    		dataType:'json',
    		url:hostname+"/stuCenter.do?logout",
    		success:function(data)
    		{
    			if(data.success)
    			{
    				location.reload(); 
    			}else
    			{
    				alert("退出失败");
    			}
    		},
    		error:function()
    		{
    			alert("系统异常");
    		}	
    	});}else
    	{
    		$.getJSON(hostname+"/stuCenter.do?logout&callback=?",function(data){
    			if(data.success)
    			{
    				location.reload(); 
    			}else
    			{
    				alert("退出失败");
    			}
    		});
    	}
	}
	function setCss(obj){
		if(obj.val() != "")	clearCss(obj);
		else fillCss(obj);
	} 
	function clearCss(obj){
		obj.css("background-position","-20px -35px");
	}
	function fillCss(obj){
		obj.css("background-position","-20px -7px");
	}
	if(hostname==""){
	$.post(hostname+"/stuCenter.do?checkStu",function(result){
		if(result.success){
			$("#stu").html("您好，"+result.attributes.username+"（<a href='"+hostname+"/stuCenter.do?index' cl class='cRed1 bold'>会员中心</a>）"+"【<a href='javascript:;' id='loginout'  class='cRed1 bold'>退出</a>】");
			loginSate=1;
			stuName = result.attributes.username;
		}else{
			$("#stu").html("您好，请<a href='"+hostname+"/stuCenter.do?index' class='bold'>登录</a>&nbsp;<a href='"+hostname+"/stuCenter.do?regist' class='bold'>注册</a>");
			stuName = "guest";
			loginSate=0;
		}
	});}
	else{
		$.getJSON(hostname+"/stuCenter.do?checkStu&callback=?",function(result){
			if(result.success){
				$("#stu").html("您好，"+result.attributes.username+"（<a href='"+hostname+"/stuCenter.do?index' cl class='cRed1 bold'>会员中心</a>）"+"【<a href='javascript:;' id='loginout'  class='cRed1 bold'>退出</a>】");
				loginSate=1;
				stuName = result.attributes.username;
			}else{
				$("#stu").html("您好，请<a href='"+hostname+"/stuCenter.do?index' class='bold'>登录</a>&nbsp;<a href='"+hostname+"/stuCenter.do?regist' class='bold'>注册</a>");
				stuName = "guest";
				loginSate=0;
			}
		});}
	$("#J_SearchTab").hover(
		  function () {
			$(this).addClass("triggers-hover");
		  },
		  function () {
		    $(this).removeClass("triggers-hover");
		  }
			); 
	$("li[data-searchtype='item']").each(function(){
		$(this).click(function(){
			//当前选择
			$(this).addClass('selected');
			//根据选择获得action
			$("#search_form").attr('action',$(this).attr('data-defaultpage'))
			//其他移除选
			$li =$(this).siblings().clone([true]);
			$(this).siblings().remove();
			$("#test1").append($li)
			$("#J_SearchTab").removeClass("triggers-hover");
		})
	})
	setTimeout(function(){chkCss();},100);
})(jQuery);    