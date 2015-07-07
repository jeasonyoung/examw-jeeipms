<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<script type="text/javascript">
	function loginOut()
	{
		//登出
		$.ajax({
    		async:true,
    		type:"POST",
    		dataType:'json',
    		url:"/stuCenter.do?logout",
    		success:function(data)
    		{
    			if(data.success)
    			{

    				window.location="/"; //回首页

    			}else
    			{
    				alert("退出失败");
    			}
    		},
    		error:function()
    		{
    			alert("系统异常");
    		}
    		
    	});
	}
	$(function(){ 
		  $("#navuserbt").hover(function(){ $(this).toggleClass("hover");$("#navuserbox").show();},function(){ $(this).toggleClass("hover");$("#navuserbox").hide(); });
		  $("#msgnoticnav").hover(function(){ $(this).toggleClass("hover");$("#msgnoticlay").toggle();},function(){ $(this).toggleClass("hover");$("#msgnoticlay").toggle(); });
		  $("#qzhtnav").hover(function(){ $(this).toggleClass("hover");$("#qzhtlist").toggle();},function(){ $(this).toggleClass("hover");$("#qzhtlist").toggle(); });
		    var course = getCookie('course');
			var length=course.split(",").length;
			$("#course").html(length-1);
			
	});
	
	function getCookie(name) {
		var cookieValue = "";
		var search = name + "=";
		if (document.cookie.length > 0) {
			offset = document.cookie.indexOf(search);
			if (offset != -1) {
				offset += search.length;
				end = document.cookie.indexOf(";", offset);
				if (end == -1) end = document.cookie.length;
				cookieValue = unescape(document.cookie.substring(offset, end));
			};
		}
		return unescape(cookieValue);
	}
</script>
 <div class="top roll">
<div class="frame-header" style="position:relative">

<div class="header-nav">
<ul>
<li><a href="/" target="_blank"><span>首页</span></a></li>
<li><a href="/cstudyRecordController.do?myclass" target="_blank"><span>学习中心</span></a></li>
<li><a href="/cstudyRecordController.do?cash"><span>账户充值</span></a></li>
<li><a href="/cartController.do?cartList" ><span>选课包</span><em id="course" class="cart-num">0</em></a></li>
</ul>
</div>
<div class="header-user-panel">
       <div class="hu-info">
                    <dl drop="1" id="navuserbt" class="">
                        <dt>
                            <img src="${student.imageurl}" onerror="this.src='http://img.233.com/wx/img/uc/Avatar.png'">
                            <span>${student.username}</span>
                                 <i class="icon-vip icovip-disabled"></i>
                       <b></b>
                        </dt>
                        <dd>
                            <div class="hu-popup" id="navuserbox" style="display: none;"><div class="popup-user-panel">
            <div class="pu-info">
                <div class="pu-head"><a href="/cstudyRecordController.do?head" target="_blank"><img src="${student.imageurl}" onerror="this.src='http://img.233.com/wx/img/uc/Avatar.png'"></a></div>
                <div class="pu-nicky">
                    <a href="/search/UserCenter/nexus/people/10468683" target="_blank">${student.username}</a>
                </div>
            </div>
            <div class="pu-balance" style="padding:0; text-align: center;">等级：书童 <em>|</em>  金钱：<b id="js_pay_fb">${student.cash}</b>元 <em>|</em>  <a href="/cstudyRecordController.do?cash">充值</a></div>
                        <div class="pu-setting">
                                    <a href="/cstudyRecordController.do?password"><i class="icon-pu ipu-setting"></i><span>帐号安全</span></a>
                                <a href="/cstudyRecordController.do?info"><i class="icon-pu ipu-info"></i><span>个人资料</span></a>

                                    <a href="javascript:;" onclick="loginOut();" target="_top"><i class="icon-pu ipu-logout"></i><span>退出</span></a>
                            </div>
        </div></div>
                        </dd>
                    </dl>
                </div>
        <ul class="hu-notice">
             <li id="msgnoticnav"><a href="/search/UserCenter/Message/" title="233会员中心消息" class="news" id="mess"><i class="hun-msg">消息通知</i></a>
                <div class="message" id="msgnoticlay">
                    <dl>
                    <dt>最新消息通知：</dt>
                    <dd>您暂时没有未读通知</dd>
                    </dl>
               	</div>
             </li>
        </ul>
   </div>
</div>
</div>
    