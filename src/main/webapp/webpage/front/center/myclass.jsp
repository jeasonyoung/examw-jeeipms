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
<link type="text/css" rel="stylesheet" href="/center/css/course.css" />
<script type="text/javascript" src="/center/js/jquery-1.8.3.min.js"></script>
<title>${student.username}  我的课程</title>
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
	<h1>我的课程</h1>
	<div class="test clearfix">
		<div>&nbsp;</div>
		<table class="table-course" style="text-align: left">
			<thead>
					<tr>
						<th class="text-center" style="width: 509px;"><span style="padding-left: 10px;">课程信息</span></th>
						<th class="text-center" style="width: 129px;"><span style="padding-left: 20px;">发布机构</span></th>
						<th style="width: 138px;"><span style="padding-left: 20px; ">操作</span></th>
					</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="item">
						<tr class="detail">
							<td class="course-descript">
								<div class="course-picct">
									<a target="_blank" href="/classController.do?class&courseId=${item.course.id}" style="display: none;" class="hover-pic">开始学习</a>
									<img class="course-pic" src="${item.course.imageurl }">
									<div class="round-mask"></div>
								</div>
								<div class="course-info">
									<div class="title-statics-wrapper clearfix">
										<h3 class="title-wrap">
										<a href="/classController.do?class&courseId=${item.course.id}" class="title" title="" target="_blank">${item.course.agency.name } ${item.course.coursename }</a>
										</h3>
										<div class="statics clearfix">
											<div class="cnt-wrap">
												<span title="学习数" class="view-count ablesky-colortip">&nbsp;</span>
												<strong>10,953</strong>
												<span title="课件数" class="video-count ablesky-colortip">&nbsp;</span><strong>3</strong>
												<span title="好评度：100.00%" class="star ablesky-colortip">
													<span class="star-score" style="width: 100%">&nbsp;</span>
												</span>
											</div>
											<span class="date"><fmt:formatDate value='${item.course.addtime}' pattern="yyyy/MM/dd  HH:mm:ss" /> </span>
										</div>
									</div>
									<p>${item.course.agency.name } ${item.course.coursename }</p>
								</div>
							</td>
							<td class="course-owner">
								<span class="bar">&nbsp;</span>
								<a  style="margin-top: 15px" class="orgname" href="/agency/${fn:substring(item.course.agency.id,21,32)}/" title="" target="_blank">${item.course.agency.name }</a>
							</td>
							<td class="course-price clearfix">
								<span class="bar">&nbsp;</span> 					   
								<div class="operation-btns clearfix">
								<div id="bdshare" class="bdshare_t bds_tools get-codes-bdshare">
									<span class="bds_more" id="bd-share-special-style"></span>
								</div>
								<c:if test="${item.course.coursetype == 2 }">
								<a href="/cstudyRecordController.do?download&courseId=${item.course.id}" class="eduplat ablesky-colortip" title="立即下载" style="text-align: center" target="_blank">&nbsp;立即下载&nbsp;</a></div>
								</c:if>
								<c:if test="${item.course.coursetype != 2 }">
								<a href="/classController.do?class&courseId=${item.course.id}" class="viewbtn ablesky-colortip" title="立即学习" style="text-align: center" target="_blank">&nbsp;</a></div>
								</c:if>
							</td>
						</tr>
						</c:forEach>
				</tbody>
		</table>
	</div>
	</div>
	</div>
</div>
<%@include file="../../common/footer_about.jsp"%>
<style>
.column_1{margin-top:0px;}
</style>
<script type="text/javascript" src="/plug-in/artDiglog/jquery.artDialog.js?skin=default" ></script>
<script type="text/javascript">
$(function(){
	$("#left_myclass").addClass("cur");
	$("#left_myclass").siblings().removeClass("cur")
});
</script>
</body>
</html>