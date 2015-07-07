<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/context/context.jsp"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="/center/css/top_footer.css" />
<link type="text/css" rel="stylesheet" href="/center/css/index.css" />
<link type="text/css" rel="stylesheet" href="/center/css/note.css" />
<script type="text/javascript" src="/center/js/jquery-1.8.3.min.js"></script>
<title>${student.username}  我的提问</title>
</head>
<body>
<%@include file="common/head.jsp"%>
<div class="h10 top_exam_margin" style="height: 25px; display: block;"></div>
<div>
<div class="Container" style="margin: 0px"> 
<div class="Main" style="border-bottom: 1px solid #dfe6ea;margin-top: 20px;">
<%@include file="common/left.jsp"%>
<div class="column_2 column_2bg">
<div class="rightside" >
<h1>我的答疑</h1>
<div id="BijiContent">
<c:if test="${fn:length(list)<=0}">
	<div class="content"><span class="left c999 mtop10">你还没有任何提问。</span></div>
</c:if>
<c:forEach items="${list}" var="ask">
<div class="content" id="${ask.id}" >
	<span ><a style="color:#0000ff;" href="/cstudyRecordController.do?askDetail&id=${ask.id}">${ask.title }</a></span>
	<span style="margin-left:5px;color:green">[<c:if test="${ask.status eq 0}">未回复</c:if><c:if test="${ask.status eq 1}">新回复</c:if>
	<c:if test="${ask.status eq 2}">已回复</c:if>]</span>
	<br>
	<span class="left c999 mtop10">提问时间：<fmt:formatDate value='${ask.createDate}' pattern="yyyy/MM/dd  HH:mm:ss" /></span>
	<span class="left c999 mtop10">&nbsp;&nbsp;机构：<a target="_blank" href="" class="c999">${ask.agency.name}</a></span>
	<span class="right mtop10" style="display:none"><a href="javascript:;" onclick="delreply('${ask.id}')" class="cf30">删除</a></span>
</div>
</c:forEach>
</div>
<div class="clearfix fy" >
    <div class="pagination" id="PageList"></div>
</div>
</div>
<br clear="all" />
</div>
</div>
</div>
</div>
</div>
</div>
<%@include file="../../common/footer_about.jsp"%>
<style>
.column_1{margin-top:0px;}
</style>
<script type="text/javascript" src="/plug-in/artDiglog/jquery.artDialog.js?skin=exam" ></script>
<script type="text/javascript">

var page = "${page}",total="${total}";
$(function(){
	$("#left_ask").addClass("cur");
	$("#left_ask").siblings().removeClass("cur");
});

$(document).ready(function(){
	$('.content').live("mouseover",function(){$(this).addClass('li-bg')});
	$('.content').live("mouseout",function(){$(this).removeClass('li-bg')});
	//$("#PageList").html(pagestr);
	$("#PageList").html(Pager(total,10,page));
	
});

//分页
function Pager(AllCount,PageSize,Page)
{
	var PageStr="",MaxPage=0,ShowPageNum=7,k=0;
	Page = parseInt(Page);
	MaxPage = parseInt(AllCount/PageSize);
	if(AllCount%PageSize!=0){MaxPage++;}
	PageStr = "<span class=\"current prev\">共有"+AllCount+"条 当前"+Page+"/"+MaxPage+"页</span>";
	PageStr += "<a href=\"javascript:;\" onclick=\"GotoPage(1)\">首页</a>";
	PageStr += (Page-1>0)?"<a href=\"javascript:;\" onclick=\"GotoPage("+(Page-1)+")\">上一页</a>":"<span class=\"current prev\">上一页</span>";
    for(j=0;j<MaxPage;j++)
	{
		if(k>=ShowPageNum){break;}
        if(((Page-j -4<=0) && (MaxPage-j-ShowPageNum>=0))||(MaxPage-j-ShowPageNum<=0))
		{
			k ++;
	        PageStr += (Page - j == 1)?  "<span class=\"current\">"+(j+1)+"</span>":"<a href=\"javascript:;\" onclick=\"GotoPage("+(j+1)+")\">"+(j+1)+"</a>";
	    }
    }
	PageStr += (Page-MaxPage<0)? "<a href=\"javascript:;\" onclick=\"GotoPage("+(Page+1)+")\">下一页</a>":"<span class=\"current prev\">下一页</span>";
    PageStr += "<a href=\"javascript:;\" onclick=\"GotoPage("+MaxPage+")\">尾页</a>";
	PageStr += "<span class=\"goto_span\">第<input name=\"go_to\" class=\"goto_input\" id=\"num_go_to\" size=\"3\" type=\"text\">页</span><a href=\"javascript:;\" onclick=\"GotoPage($('#num_go_to').val())\">转到</a><div style=\"clear: both;\"></div>"
	return PageStr;
}


//删除
function delreply(id)
{
    art.dialog({id:"deldialog",content:"确定删除吗？该操作不可恢复！",button:[{name:"删除",callback: function () {	
		$.ajax({
			type:"get",
			url:"/cstudyRecordController.do?deleteNote",
			data:{id:id},
			dataType: 'json',
			success: function (result){
				if(result.success)
				{
					succeed("删除成功",2);
					$("#"+id).remove();
				}
				else
				{
					notice("删除失败",3);
				}
			},
			error: function (e) {notice("载入错误",3);/*错误处理*/},
			async:false,
			cache:false
		});
	},focus: true},{name:"取消"}],lock:true,opacity:0.1,icon:"question"});
}
function GotoPage(i)
{
	if(i==null||i==0){
		iPage = 1;
	}else{
		iPage = i;
	}
	location.replace("/cstudyRecordController.do?getAsk&page="+iPage);
}


function notice(content,t)
{//提示框
		dianotice = art.dialog({id:"notice",content:content,icon:"succeed",lock:true,opacity:0.1,time:t,fixed:true});
}

function error(content,t)
{//提示框
		dianotice = art.dialog({id:"notice",content:content,icon:"warning",lock:true,opacity:0.1,time:t,fixed:true});
}
function loading(content)
{//提示框
	dialoading = art.dialog({id:"loading123",content:content,icon:"loading",cancel:false,title: false,fixed:true});
}
function succeed(content,t)
{
	artdialog = art.dialog({id:"artdialog",content:content,icon:"succeed",lock:true,opacity:0.1,time:t,fixed:true,title: false});
}

</script>
</body>
</html>