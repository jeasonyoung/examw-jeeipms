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
<script type="text/javascript" src="/center/js/jquery-1.8.3.min.js"></script>
<title>${student.username}  我的咨询</title>
</head>
<body>
<%@include file="common/head.jsp"%>
<div class="h10 top_exam_margin" style="height: 25px; display: block;"></div>
<div>
<div class="Container" style="margin: 0px"> 
<div class="Main" style="border-bottom: 1px solid #dfe6ea;margin-top: 20px;">
<%@include file="common/left.jsp"%>
<div class="column_2 column_2bg">
<div class="rightside">
<h1>我的咨询</h1>
<div class="clearfix fy">
<div class="pagination" id="PageList"></div>
</div>
</div>
</div>
</div>
</div>
</div>
<%@include file="../../common/footer_about.jsp"%>
<style>
.column_1{margin-top:20px;}
</style>
<script type="text/javascript" src="/plug-in/artDiglog/jquery.artDialog.js?skin=exam" ></script>
<script type="text/javascript">
//获取笔记
function GetBijiList()
{//			iUserName  ;iTeacher  ;iClassID 
	loading("加载中...");
	var startDate = $("#startDatepicker").val();
	var endDate = $("#endDatepicker").val();
	$.ajax({
		type:"get",
		contentType:"text/html;gb2312",
		url:"../Server/BijiServer.asp",
		data:{Act:"GetMyBijiList",Page:iPage,PageSize:10,ClassID:iClassID,startDate:startDate,endDate:endDate},
		dataType: 'json',
		success: function (result){
			dialoading.close();
			var html="",statestr="",answertips="",pagestr="",replaystr="",isDel=0,fromurl="";
			if(result.S=="1"){
				if(result.BijiList.length>0){
					for(i=0;i<result.BijiList.length;i++)
					{
						html+="<div class=\"content\" id=\"content"+result.BijiList[i].ID+"\"><span>"+unescape(result.BijiList[i].Content)+"("+result.BijiList[i].AddDate+")</span><br /><span class=\"left c999 mtop10\">来源：<a target=\"_blank\" href=\""+fromurl+"\" class=\"c999\">"+unescape(result.BijiList[i].Teacher)+">> "+unescape(result.BijiList[i].MyClassName)+">> "+unescape(result.BijiList[i].Subject)+"</a></span><span class=\"right mtop10\"><a href=\"javascript:;\" onclick=\"delreply("+result.BijiList[i].ID+",'')\" class=\"cf30\">删除</a></span></div>";
					}
					pagestr = Pager(result.AllCount,result.PageSize,result.Page);
					$("#BijiContent").html(html);
					$("#PageList").html(pagestr);
				}
				else
				{
					html="<div class=\"content\"><span class=\"left c999 mtop10\">你还没有发表任何笔记。</span></div>";
					$("#BijiContent").html(html);
					$("#PageList").html("");
				}
			}
			else
			{
				html="<div class=\"content\"><span class=\"left c999 mtop10\">"+result.msg+"</span></div>";
				$("#BijiContent").html(html);
				$("#PageList").html("");
			}
		},
		error: function (e) {notice("载入错误",3);/*错误处理*/},
		async:false,
		cache:false
	});
}
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


function notice(content,t)
{//提示框
		dianotice = art.dialog({id:"notice",content:content,icon:"succeed",lock:true,opacity:0.1,time:t,fixed:true});
}

function error(content,t)
{//提示框
		dianotice = art.dialog({id:"notice",content:content,icon:"warning",lock:true,opacity:0.1,time:t,fixed:true});
}

</script>
</body>
</html>