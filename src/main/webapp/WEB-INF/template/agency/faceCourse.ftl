<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${agency.name}-面授课程</title>
<link href="${domain}/agency/img/jg-index.css" rel="stylesheet" type="text/css" />
<link href="${domain}/agency/img/top_footer.css" rel="stylesheet" type="text/css" />
<link href="../img/page.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${domain}/plug-in/jquery/jquery-1.8.0.min.js"></script>
<script type="text/javascript">
 var stuName, courseid ="${course.id}",pagesize=6;
</script>
</head>

<body>
<div id="top"></div>
<div class="jg-nav" id="head_nav">
</div>
<!--主体部分-->
<div class="content">
<div class="location">您现在所在的位置：<a href="index.html">${course.agency.name}</a> >><a href="faceList.html">面授课程</a> >> <a href="#">${course.coursename}</a></div>
<!--左-->
<div class="jgLeft">
<div id="left_course"></div>
<div class="blk10"></div>
<div class="jgboxl">
<div class="jgtitl"><div class="Hleft"><a href="javascript:;">名师排行</a></div><div class="amore"><a href="javascript:;">更多>></a></div></div>

</div>
</div>
<!--右-->
<div class="jgRight">
<div class="jgboxr">
<div class="jgtitl"><div class="Hleft nob"><a href="javascript:;">课程介绍</a></div></div>
<div class="boxSx">
<div class="infor">
<div class="j_name"><div class="h03">${course.coursename}</div><div class="amore1 fenshu"><span class="cRed">4.0</span>分/120人评</div><div class="zs_evb"><div class="zs_evb4"></div></div></div>
<div class="blk10"></div>
<div class="ship">
<div id="player"></div>
</div>
<div class="shipRbox">
<div class="spBox">
<h3>开课时间：<span>${course.opentime?string('yyyy-MM-dd')}</span></h3>
<h3>报名电话：<span>4000-525-585</span></h3>
<div class="bttn"><a href="contact.html">联系我们</a></div>
<div class="blk10"></div>
</div>

<div class="spBox">
<div class="jgboxl" id="left_news">

</div>

</div>
</div>
<div class="blk10"></div>
<div class="titleSx">
<div class="btn1" id="sj_1" onMouseOver="switchTag('sj_','sj_list',1,2,'btn1','btn2');"><a href="javascript:;">课程介绍</a></div>
<div class="btn2" id="sj_2" onMouseOver="switchTag('sj_','sj_list',2,2,'btn1','btn2');"><a href="javascript:;">学员评价</a></div>
</div>
<div id="sj_list1">
<em>${course.description?default("")}</em>
</div>
<div id="sj_list2" class="Hidebox">
<div class="ping" id="comment"></div>
<div class="pagination" id="PageStr"></div>
<div class="titleSx"><div class="btn1"><a href="javascript:;">我要评价</a></div></div>
<div class="ping">
<div class="blk10"></div>
            <div class="p1">
                <div id="xzw_starSys">
                            <div id="xzw_starBox">
                                <ul id="xzw_star" class="star">
                                    <li><a href="javascript:;" title="1颗星" class="one-star">1</a></li>
                                    <li><a href="javascript:;" title="2颗星" class="two-stars">2</a></li>
                                    <li><a href="javascript:;" title="3颗星" class="three-stars">3</a></li>
                                    <li><a href="javascript:;" title="4颗星" class="four-stars">4</a></li>
                                    <li><a href="javascript:;" title="5颗星" class="five-stars">5</a></li>
                                </ul>
                                <div id="showb" class="current-rating" style="width: 124.8px; top: 3px;">
                                </div>
                            </div>
                           	<span class="description">请点击五星进行评分</span>
                   </div>
                </div>
            
<div class="p1"><div class="fz">请评论：</div><textarea name="" id="content" cols="" rows="" class="kuang"></textarea></div>
<div class="anniu"><a onclick="return AddComment();" href="javascript:;"></a></div>

</div>

</div>

</div>
<div class="clear"></div>
</div>

</div>

</div>
<!--尾部-->
<div class="blk10"></div>
<div class="footer" id="footer_nav">

</div>
<div class="blk10"></div>
<div class="footer" id="footer_link">

</div>
<div class="blk10"></div>
<div class="footer" id="footer_about">

</div>
<script type="text/javascript" src="${domain}/plug-in/player/jwplayer.min.js" ></script>
<script type="text/javascript">
	$(function(){
		$("#top").load("head_top.html");
		$("#head_nav").load("head_nav.html");
		$("#footer_nav").load("footer_nav.html");
		$("#footer_link").load("footer_link.html");
		$("#footer_about").load("footer_about.html");
		$("#left_course").load("left_course.html");
		$("#left_news").load("left_news.html");
	});
  //切换
  function switchTag(tag,content,k,n,stylea,styleb){	 
   for(i=1; i <=n; i++){if (i==k){
      document.getElementById(tag+i).className=stylea;
	  document.getElementById(content+i).className="Showbox";
	  }else{
	     document.getElementById(tag+i).className=styleb;
		 document.getElementById(content+i).className="Hidebox";
		 }
	}
   }
   $(function(){
		GetCommentList(1);
	});
   function Pager(AllCount, PageSize, Page) {
	    var PageStr = "", MaxPage = 0, ShowPageNum = 3, k = 0;
	    Page = parseInt(Page);
	    MaxPage = parseInt(AllCount / PageSize);
	    if (AllCount % PageSize != 0) { MaxPage++; }
	    PageStr = "<span>共有" + AllCount + "条 当前" + Page + "/" + MaxPage + "页</span>";
	    PageStr += "<span class=\"prev\" onclick=\"GotoPage(1)\">首页</span>";
	    PageStr += (Page - 1 > 0) ? "<span class=\"prev\" onclick=\"GotoPage(" + (Page - 1) + ")\">上一页</span>" : "<span>上一页</span>";
	    for (j = 0; j < MaxPage; j++) {
	        if (k >= ShowPageNum) { break; }
	        if (((Page - j - 2 <= 0) && (MaxPage - j - ShowPageNum >= 0)) || (MaxPage - j - ShowPageNum <= 0)) {
	            k++;
	            PageStr += (Page - j == 1) ? "<span class=\"current\">" + (j + 1) + "</span>" : "<span class=\"prev\" onclick=\"GotoPage(" + (j + 1) + ")\">" + (j + 1) + "</span>";
	        }
	    }
	    PageStr += (Page - MaxPage < 0) ? "<span class=\"prev\" onclick=\"GotoPage(" + (Page + 1) + ")\">下一页</span>" : "<span>下一页</span>";
	    PageStr += "<span class=\"prev\" onclick=\"GotoPage(" + MaxPage + ")\">尾页</span>";
	    PageStr += "<span class=\"goto_span\">第<input name=\"go_to\" class=\"goto_input\" id=\"num_go_to\" size=\"3\" type=\"text\">页</span><a href=\"javascript:;\" onclick=\"GotoPage($('#num_go_to').val())\">转到</a><div style=\"clear: both;\"></div>"
	    $("#PageStr").html(PageStr);
		}
	//评论
	function GetCommentList(page)
	{
		$.ajax({
			type:"get",
			contentType:"text/html;UTF-8",
			url: hostname+"/agencyfront.do?commentList",
			data: { page: page, pagesize: pagesize,courseid:courseid },
			dataType: 'json',
			success: function (result){
				if(result!=null)
				{
					if(result.comment.length>0)
					{
						var html="";
						for( var i=0;i<result.comment.length;i++)
						{		
							html+="<div class=\"pcont\"><div class=\"head\"><a href=\"#\"><img src=\"../img/user-default-0.png\" /></a><div class=\"pname\"><a href=\"#\">"+result.comment[i].stuname+"</a></div></div><div class=\"pner\"><div class=\"time\"><span class=\"xing\"><div class=\"zs_eva\"><div class=\"zs_eva"+result.comment[i].coursescore+"\"></div></div></span><span class=\"value\">"+result.comment[i].coursescore+"分</span><span class=\"shij\">"+result.comment[i].formattime+"</span></div><div class=\"zw\">"+result.comment[i].content+"</div></div></div>"
						}
						
					}
					else
					{
						html="<divclass=\"zw\">暂时没有讨论内容，您来第一个发表吧</div>";
					}
					$("#comment").html(html);
					pagestr = (result.count-result.pagesize>0)?Pager(result.count,result.pagesize,result.page):"";
					$("#PageStr").html(pagestr);
				}
				else
				{
					$("#comment").html("<div class=\"xdbox\">暂时没有讨论内容，您来第一个发表吧</div>");
				}
			},
			error: function (e) {/*错误处理*/},
			async:true,
			cache:false
		});
	}
	function GotoPage(i) {
    	this.iPage = i;
    	this.GetCommentList(i);
	}

	function fetchObject(idname)
	{
		if (document.getElementById) {
			return document.getElementById(idname);
		} else if (document.all) {
			return document.all[idname];
		} else if (document.layers) {
			return document.layers[idname];
		} else {
			return null;
		}
	}
	
	var temp=5;
	$("#xzw_star > li").each(function() {
            $(this).hover(
				function() {
				    $(".description").html($(this).find("a").html()).show();
				}
			);
            $(this).click(function() {
                temp = $(this).find("a").html() * 1;
                $("#showb").css({ "width": 26 * temp, "top": 3 });
            });
        });
	$("div#xzw_starSys").mouseover(function() {
          $("#showb").css({ "width": 0 });
      });

    $("div#xzw_starSys").mouseout(function() {
             $("#showb").css({ "width": 26 * temp, "top": 3 });
             $(".description").html(temp).show();
     });
	
	$()
	//发布评论
	function AddComment() {
        var content = $("#content").val().replace(/[\n]/ig,'');
        if (content == "" ) {
            alert("请写下您的评论内容")
			return;
        }
        $.ajax({
        	contentType:"text/html;UTF-8",
            type: "get",
            url: hostname+"/agencyfront.do?save",
            data: {content:content,coursescore:temp,courseid:courseid},
            dataType: 'json',
            success: function(result) {
                if (result.success==true) {
                	$("#content").val("");
                	alert(result.msg);
                    GotoPage(1);
                }
                else {
                    alert(result.msg);
                }
            },
            error: function(e) { /*错误处理*/ },
            async: true,
            cache: false
        });
    }
   var thePlayer;  //保存当前播放器以便操作
   var timer;  
   function test(){
	   thePlayer =   jwplayer("player").setup({
		    flashplayer: hostname+'/plug-in/player/examw.swf',			   
          	'file': "${course.audition}" ,
			controlbar: 'bottom',
			height:300,
			width:530,
			stretching:'fill',
			"skin":hostname+"/plug-in/player/stormtrooper.zip",	
			image:hostname+'/main/images/bg2.png',
			provider: 'http',
			repeat:"always",
			autostart: 'true'
       }); 
   }      

   $(function() {  
	   test();
    });  
   
   function userName() {
		return stuName;
   }
</script>
</body>
</html>
