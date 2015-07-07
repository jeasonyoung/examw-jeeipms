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
<title>${student.username} 我的提问</title>
</head>
<body>
	<%@include file="common/head.jsp"%>
	<div class="h10 top_exam_margin" style="height: 25px; display: block;"></div>
	<div>
		<div class="Container" style="margin: 0px">
			<div class="Main"
				style="border-bottom: 1px solid #dfe6ea;margin-top: 20px;">
				<%@include file="common/left.jsp"%>
				<div class="column_2 column_2bg">
					<div class="rightside">
						<h1>问题详情</h1>
					</div>
					<div id="BijiContent">
						<div
							style="border: 1px solid #C6DBEB;color: #166AA1;width: 708px;float:left; text-align:left;"
							id="question">
							<input id="questionid" value="${ask.id }" type="hidden">
							<span class="qw_sp">
								<dl>
									<dt>
										<img width="16" height="16" src="../../center/img/pic_13.gif">
									</dt>
									<dd class="ddq_1">
										<strong> 请问： <span data-bind="text: Title">${ask.title}
										</span> </strong> <span id="questiontitle"></span>
									</dd>
								</dl> </span>
							<div id="Div1" class="qw_wt center" data-bind="html:Body"
								style="_margin-left:-50px;">${ask.content}</div>
							<span id="questiondetail" class="qw_xx center">
								<dl>
									<dd>
										提问人： <span data-bind="text: OwnerName">${student.username}</span>
									</dd>
									<dd style="width:300px;">
										问题类型： <span data-bind="text: TypeName"><c:if
												test="${ask.type eq 0 }">课程咨询</c:if> <c:if
												test="${ask.type eq 1 }">学习答疑</c:if>
										</span>
									</dd>
									<dd style="width: 200px;">
										提问时间： <span data-bind="text: CreateDate"><fmt:formatDate
												value='${ask.createDate}' pattern="yyyy/MM/dd  HH:mm:ss" />
										</span>
									</dd>
								</dl> </span>
						</div>
						<div style="clear:both;"></div>
						<c:if test="${fn:length(ask.answerList) == 0}">
							<div class="qingwen_b" id="answer">
								<em ><img src="../../center/img/pic_22.gif"></em>
								<span class="qw_bsp center">
									<dl>
										<dt>
											<img width="16" height="16" src="../../center/img/pic_13.gif">
										</dt>
										<dd>
											<strong>回答：</strong>
										</dd>
									</dl> 
								</span>
								<div class="qw_hd center" id="lire">暂时没有回答</div>
							</div>
						</c:if>
						<c:forEach items="${ask.answerList}" var="answer"
							varStatus="status">
							<div class="qingwen_b" id="answer1">
								<em ><img src="../../center/img/pic_22.gif"></em>
								<span class="qw_bsp center"> 
									<dl>
										<dt>
											<img width="16" height="16" src="../../center/img/pic_13.gif">
										</dt>
										<dd>
											<strong>回答：</strong>
										</dd>
									</dl> 
								</span>
								<div class="qw_hd center" id="lire">${answer.content}</div>
								<span id="questiondetail" class="qw_xx center">
								<dl>
									<dd style="width: 300px;">
										解答团队： <span data-bind="text: OwnerName">${answer.createBy}</span>
									</dd>
									<dd style="width: 200px;">
										解答时间： <span data-bind="text: CreateDate"><fmt:formatDate
												value='${answer.createDate}' pattern="yyyy/MM/dd  HH:mm:ss" />
										</span>
									</dd>
								</dl> </span>
							</div>
						</c:forEach>
					</div>
				</div>
				<br clear="all" />
			</div>
		</div>
	</div>
	<%@include file="../../common/footer_about.jsp"%>
<style>
.column_1 {
	margin-top: 0px;
}
.qw_sp{background:none repeat scroll 0 0 #ECF7FE;display:block;height:30px;padding-top:12px;}
.qw_sp dl dt{float:left;text-indent:17px;width:42px;}
.qw_sp dl dd{float:left;}
.qw_xx{color:#525252;display:block;height:38px;line-height:38px;width:683px;}
.qw_xx dl dd{float:left;text-indent:20px;width:166px;}
.qw_wt{line-height:21px;padding-bottom:5px;padding-left:33px;padding-top:10px;width:650px;}
.qingwen_b{border:1px solid #FEDC9C;margin-top:20px;width:708px;}
.qw_bsp{background:url("../../center/img/pic_16.gif") repeat-x scroll 0 bottomrgba(0,0,0,0);display:block;height:30px;padding-top:15px;width:683px;}
em{display:block;height:9px;left:0;margin-left:33px;margin-top:-9px;top:0;width:17px;}
.qw_bsp dl dt{float:left;text-align:center;width:30px;}
.qw_bsp dl dd{color:#000000;float:left;font-size:14px;}
</style>
	<script type="text/javascript"
		src="/plug-in/artDiglog/jquery.artDialog.js?skin=exam"></script>
	<script type="text/javascript">
		var page = "${page}", total = "${total}";
		$(function() {
			$("#left_ask").addClass("cur");
			$("#left_ask").siblings().removeClass("cur");
		});

		$(document).ready(function() {
			$('.content').live("mouseover", function() {
				$(this).addClass('li-bg')
			});
			$('.content').live("mouseout", function() {
				$(this).removeClass('li-bg')
			});
			//$("#PageList").html(pagestr);
			$("#PageList").html(Pager(total, 10, page));

		});

		//分页
		function Pager(AllCount, PageSize, Page) {
			var PageStr = "", MaxPage = 0, ShowPageNum = 7, k = 0;
			Page = parseInt(Page);
			MaxPage = parseInt(AllCount / PageSize);
			if (AllCount % PageSize != 0) {
				MaxPage++;
			}
			PageStr = "<span class=\"current prev\">共有" + AllCount + "条 当前"
					+ Page + "/" + MaxPage + "页</span>";
			PageStr += "<a href=\"javascript:;\" onclick=\"GotoPage(1)\">首页</a>";
			PageStr += (Page - 1 > 0) ? "<a href=\"javascript:;\" onclick=\"GotoPage("
					+ (Page - 1) + ")\">上一页</a>"
					: "<span class=\"current prev\">上一页</span>";
			for (j = 0; j < MaxPage; j++) {
				if (k >= ShowPageNum) {
					break;
				}
				if (((Page - j - 4 <= 0) && (MaxPage - j - ShowPageNum >= 0))
						|| (MaxPage - j - ShowPageNum <= 0)) {
					k++;
					PageStr += (Page - j == 1) ? "<span class=\"current\">"
							+ (j + 1) + "</span>"
							: "<a href=\"javascript:;\" onclick=\"GotoPage("
									+ (j + 1) + ")\">" + (j + 1) + "</a>";
				}
			}
			PageStr += (Page - MaxPage < 0) ? "<a href=\"javascript:;\" onclick=\"GotoPage("
					+ (Page + 1) + ")\">下一页</a>"
					: "<span class=\"current prev\">下一页</span>";
			PageStr += "<a href=\"javascript:;\" onclick=\"GotoPage(" + MaxPage
					+ ")\">尾页</a>";
			PageStr += "<span class=\"goto_span\">第<input name=\"go_to\" class=\"goto_input\" id=\"num_go_to\" size=\"3\" type=\"text\">页</span><a href=\"javascript:;\" onclick=\"GotoPage($('#num_go_to').val())\">转到</a><div style=\"clear: both;\"></div>"
			return PageStr;
		}

		//删除
		function delreply(id) {
			art.dialog({
				id : "deldialog",
				content : "确定删除吗？该操作不可恢复！",
				button : [ {
					name : "删除",
					callback : function() {
						$.ajax({
							type : "get",
							url : "/cstudyRecordController.do?deleteNote",
							data : {
								id : id
							},
							dataType : 'json',
							success : function(result) {
								if (result.success) {
									succeed("删除成功", 2);
									$("#" + id).remove();
								} else {
									notice("删除失败", 3);
								}
							},
							error : function(e) {
								notice("载入错误", 3);/*错误处理*/
							},
							async : false,
							cache : false
						});
					},
					focus : true
				}, {
					name : "取消"
				} ],
				lock : true,
				opacity : 0.1,
				icon : "question"
			});
		}
		function GotoPage(i) {
			if (i == null || i == 0) {
				iPage = 1;
			} else {
				iPage = i;
			}
			location.replace("/cstudyRecordController.do?getAsk&page=" + iPage);
		}

		function notice(content, t) {//提示框
			dianotice = art.dialog({
				id : "notice",
				content : content,
				icon : "succeed",
				lock : true,
				opacity : 0.1,
				time : t,
				fixed : true
			});
		}

		function error(content, t) {//提示框
			dianotice = art.dialog({
				id : "notice",
				content : content,
				icon : "warning",
				lock : true,
				opacity : 0.1,
				time : t,
				fixed : true
			});
		}
		function loading(content) {//提示框
			dialoading = art.dialog({
				id : "loading123",
				content : content,
				icon : "loading",
				cancel : false,
				title : false,
				fixed : true
			});
		}
		function succeed(content, t) {
			artdialog = art.dialog({
				id : "artdialog",
				content : content,
				icon : "succeed",
				lock : true,
				opacity : 0.1,
				time : t,
				fixed : true,
				title : false
			});
		}
	</script>
</body>
</html>