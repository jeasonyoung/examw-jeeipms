<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/context/context.jsp"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>网络课堂${course.coursename}</title>
<link href="/agency/img/style.css" rel="stylesheet" type="text/css" />
<link href="/agency/img/top_footer.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
var loginSate,courseId = "${course.id}", examwplay,videoId,url;  //保存当前播放器以便操作
</script>
</head>
<body>
<div class="topx">
<div class="top">
<div class="t1"><a href="/">首页</a> |  <a href="/course/" class="ks1">快速选课</a> |  <a href="/agency/" class="ks2">网校列表</a></div>
<div class="t3"><a href="javascript:;">报名流程</a> | <a href="javascript:;">常见问题</a> | <a href="javascript:;">交易安全</a></div>
<div class="t2" id="stu"></div>
</div>
</div>
<div class="header">
<div class="logo"><img src="/agency/img/logo.gif" width="224" height="79" /></div>
<div class="search-box">
<div class="search">
<div id="J_SearchTab" class="search-triggers">
   <ul class="ks-switchable-nav" id="test1">
     <li class="J_SearchTab selected" data-searchtype="item"  data-defaultpage="/agencyfront.do?searchCourse" >
       <a href="javascript:;">课程</a>
     </li>
     <li class="J_SearchTab"  data-searchtype="item"  data-defaultpage="/agencyfront.do?searchAgency" >
       <a href="javascript:;">机构</a>
     </li>
   </ul>
   <i>
   <em></em>
   <span></span>
   </i>
</div>
<form action="/agencyfront.do?searchCourse" id="search_form" method="post">
<input name="keywords" type="text" class="search1" value="" />
<div class="ss" ><a href="javascript:;" id="search_button"></a></div></div>
</form>
</div>
</div>
<div class="nav">
<ul>
<li class="cur"><a href="javascript:;">首页</a></li>
<li><a href="javascript:;">课程大全</a></li>
<li><a href="javascript:;">培训机构</a></li>
</ul>
</div>
<div class="blk10"></div>
<div class="contentx">
	<div class="tkleft">
		<div class="tksp" id="player">
        </div>
	</div>
	<div class="tkright">
    	<div class="tkrbox">
         	<div class="tanbox">
        	<div class="kcmenu" onMouseOver="switchTag('content',2,2);"><a href="javascript:;">课程目录</a></div>
            <div class="kctip" onMouseOver="switchTag('content',1,2);"><a href="javascript:;">笔记</a></div>
            <div class="kcask"><a href="javascript:;">答疑</a></div>
            </div>
            <div class="tiparea"  id="showShareSay"> 
            <textarea class="wordBiji" id="wordSay" maxlen="300" name="word" onclick="if($(this).val()=='在这里写下你的笔记吧！'){$(this).val('');examwplay.play(false);}"
            onblur="if($(this).val()==''){$(this).val('在这里写下你的笔记吧！');}">在这里写下你的笔记吧！</textarea>
            </div>
            <div class="tjan"><input name="" type="button" onclick="AddBiji()" value="提交" class="tjan" /></div>
            <div class="tiplist " id="content1">
            	<ul class="clearfix" id="note">
                </ul>
            </div>
            <div class="tiplist" id="content2" style="display: none;">
            	<ul class="clearfix"> 
            		<c:forEach items="${course.list}" var="video" varStatus="status">
                    <li class="bbb" ><a class="video" id="video_${status.index}" href="javascript:;" videoid="${video.id}" url="${video.videoUrl}">${video.title}</a></li> 
                    </c:forEach>          	
                </ul>
            </div>
        </div>
    </div>
    <div class="endline"></div>
</div>
<div class="blk10"></div>
<%@ include file="../common/footer_about.jsp"%> 
<script type="text/javascript" src="/plug-in/jquery/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="/plug-in/player/jwplayer.min.js" ></script>
<script type="text/javascript" src ="/plug-in/agencycms/js/common.js"></script>
<script type="text/javascript" src="/plug-in/artDiglog/jquery.artDialog.js?skin=default" ></script>
<script type="text/javascript">
$(function(){
	url =$("#video_0").attr("url");
	videoId =$("#video_0").attr("videoid");
    $(".sptime").live("click", function() {
        var thisObj = $(this);
        var time = thisObj.attr("time");
        if (examwplay.getState() != 'PLAYING') {    //若当前未播放，先启动播放器  
        	examwplay.play();  
        }  
        examwplay.seek(time); 
    });
    $(".video").live("click",function(){
    	var thisobj =$(this);
    	url = thisobj.attr("url");
    	videoId =thisobj.attr("videoid");
    	StartPlay(url);
    	GetBijiList(videoId)
    });
    
});

setTimeout(function(){StartPlay(url);},1000);
setTimeout(function(){GetBijiList(videoId);},500);
function switchTag(content,k,n){	 
	   for(i=1; i <=n; i++){if (i==k){
		  document.getElementById(content+i).style.display="inline-block";
		  }else{
			 document.getElementById(content+i).style.display="none";
			 }
		}
	}
	
function GetBijiList(videoId) {
    if (loginSate == 1) {
        $.ajax({
            type: "GET",
            url: "/classController.do?noteList",
            data: { videoId: videoId}, //Act=getstudybiji&TypeID=7786&MyNote=0&Page=1
            dataType: 'json',
            success: function(result) {
                if (result !=null) {
                    var html = "", nickname = "", delstr;
                    if (result.length > 0) {
                        for (i = 0; i < result.length; i++) {
                        	html+="<li>";
                        	html+="<div class='sptime' time= '"+ result[i].coursetime+ "'>"+result[i].formatTime+"</div>";
                        	html+="<div class='tipitem'>"
                        	html+="<div class='tiplist1'>"+result[i].content+"</div>"
                        	html+="<div class='tiplist2'><em>"+result[i].notetime+"</em><span><a href='#' onclick=\"ShowBiji('" + result[i].id + "','" + result[i].content + "')\">编辑</a> <a href='#' onclick=\"DelNote('" + result[i].id + "')\">删除</a></span></div>"
                        	html+="</div>"
                        	html+="</li>"
                          }
                    }
                    else {
                        html += "<div class='tiplist1'>暂无笔记，去发表您对这道题目的笔记吧</div>";
                    }
                    $("#note").html(html).slideDown();
                    $("#MyBiji .tit_classify").html("<span>写笔记</span>");
                    $("#MyBiji .tit_classify").attr("NoteID", "");
                }
            }
				,
            error: function(e) { /*notice("载入错误",3);错误处理*/ }
				,
            async: true,
            cache: false
        });
    }
    else {
        $("#note").html("<div class=\"No-text\">您还未登录，登录后即可发表您的笔记。</div>");
    }
	}
	
	//删除笔记
	function DelNote(NoteID) {
        if (loginSate) {
            art.dialog({ id: "deldialog", content: "<div style=\"white-space:nowrap;\">确定删除该笔记吗？</div>", button: [{ name: "删除", callback: function() {
                $.ajax({
                    type: "GET",
                    url: "/classController.do?deleteNote",
                    data: {id: NoteID},
                    dataType: 'json',
                    success: function(result) {
                        if (result.success) {
                            succeed("删除成功", 2);
                            $("#showShareSay").find("#wordSay").attr("NoteID", "");
                            GetBijiList(videoId);
                        }
                    }
					,
                    error: function(e) { /*notice("载入错误",3);错误处理*/ }
					,
                    async: true,
                    cache: false
                });
            }, focus: true
            }, { name: "取消"}], lock: true, zIndex: 18008, opacity: 0.1, icon: "question"
            });
        }
        else {
            LoginTishi("您还没有登录，请先登录或注册优异网校免费会员再操作！");
        }
    }
	function AddBiji() {
	    	var videotime =examwplay.getPosition();
	        var Content = $("#showShareSay").find("#wordSay").val();
	        var NoteID = $("#showShareSay").find("#wordSay").attr("NoteID");
	        if (StrLength(Content) > 1000) { notice("问题内容请不要超过500字", 2); return; }
	        if (StrLength(Content) < 10) { notice("请输入有意义的内容，长度不能小于10", 2); return; }
	        if (Content == "在这里写下你的笔记吧！") { notice("请输入有意义的内容", 2); return; }
	        if(loginSate==1){
	        	loading("提交中。。。");
		        $.ajax({
		            type: "POST",
		            url: "/classController.do?save",
		            data: {"coursetime":videotime, "video.id": videoId, "content": Content, "id": NoteID },
		            dataType: 'json',
		            success: function(result) {
		                dialoading.close();
		                if (result.success) {
		                    if (NoteID != ""&&NoteID!=null) { succeed("修改成功", 2); } else { succeed("发布成功", 2); }
		                    $("#showShareSay").find("#wordSay").val("").attr("NoteID", "");
		                    GetBijiList(videoId);
		                }
		                else {
		                    notice('添加失败，请重试', 2);
		                }
		            }
					,
		            error: function(e) { /*notice("载入错误",3);错误处理*/ }
					,
		            async: true,
		            cache: false
		        });
	        
	        }else{
	        	LoginTishi("您还没有登录，请先登录或注册优异网校免费会员再操作！");
	        }
	        
	   }
	function ShowBiji(NoteID, content) {
        if (NoteID !="") {
            $("#showShareSay").find("#wordSay").attr("NoteID", NoteID);
        }
        else {
            $("#l-zl #kcbj div").eq(1).find("a").click();
        }
        $("#showShareSay").find("#wordSay").val(unescape(content));
    }
	//播放器
	function StartPlay(url)
	{
		 examwplay = jwplayer("player").setup({
			    flashplayer: '/plug-in/player/examw.swf',			   
	          	'file': url ,
				controlbar: 'bottom',
				height:425,
				width:'100%',
				stretching:'fill',
				"skin":"/plug-in/player/stormtrooper.zip",	
				image:'/main/images/bg2.png',
				provider: 'http',
				repeat:"always",
				autostart: 'true'
	       }); 
	}
	function StrLength(str){
		var i,sum;
		sum=0;
		for(i=0;i<str.length;i++){
			if ((str.charCodeAt(i)>=0) && (str.charCodeAt(i)<=255))
			sum=sum+1;
			else{
				sum=sum+2;
			}
		}
		return sum;
	}
	
	function userName() {
		return "guest";
	}
	function notice(content,t)
	{//提示框
		dianotice = art.dialog({id:"notice",content:"<div style=\"white-space:nowrap;\">"+content+"</div>",icon:"warning",lock:true,opacity:0.1,time:t,title: false,fixed:true,zIndex : 18008});
	}
	function loading(content)
	{//提示框
		dialoading = art.dialog({id:"loading123",content:"<div style=\"white-space:nowrap;\">"+content+"</div>",icon:"loading",cancel:false,title: false,fixed:true,zIndex : 18008});
	}
	function succeed(content,t)
	{
		artdialog = art.dialog({id:"artdialog",content:"<div style=\"white-space:nowrap;\">"+content+"</div>",icon:"succeed",lock:true,opacity:0.1,time:t,fixed:true,title: false,zIndex : 18008});
	}  

</script>
</body>
</html>
