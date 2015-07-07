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
<link type="text/css" rel="stylesheet" href="/center/css/order.css" />
<script type="text/javascript" src="/center/js/jquery-1.8.3.min.js"></script>
<title>${student.username}  已支付订单</title>
</head>
<body>
<%@include file="common/head.jsp"%>
<div class="h10 top_exam_margin" style="height: 25px; display: block;"></div>
<div>
<div class="Container" style="margin: 0px"> 
<div class="Main" style="border-bottom: 1px solid #dfe6ea;margin-top: 20px;">
<%@include file="common/left.jsp"%>
<div class="column_2 column_2bg">
<div class="rightside" style="">
<h2 style="text-align: left;">我的订单</h2>
<div class="or-msg">
<h3 id="ztai"><strong>我的交易提醒： 未付款（<em>${nopay }</em>） 待开通课程（<em>0</em>）</h3>
<a class="lessons-car" href="/search/bm/">您的购课车：<em>0</em>个</a>
</div>
<div class="title_box">
<ul id="ordertype">
<li><a href="/cstudyRecordController.do?order" target="_self">未付款订单</a></li>
<li class="now_focus"><a href="/cstudyRecordController.do?paid" target="_self">已付款订单</a></li>
</ul>
<!-- 
<span class="tel-p">客服电话：</span>
-->
</div>
<div class="order-box">
<div class="tb_bottom">
<span class="tb-line"></span>
<span class="tb-line" style="float:right"></span>
</div>
<div id="orderlist">
	<c:forEach items="${list}" var="order">
	<div class="tb_txt gover" id="od${order.orderCode}" style="display: block;">
		<ul class="cr_list">
			<li><input type="checkbox" name="OrdersID" value="${order.id}" class="checkorder"> 订单编号：<em>${order.orderCode}</em></li>
			<li>下单时间：<fmt:formatDate value='${order.orderAddtime}' pattern="yyyy/MM/dd  HH:mm:ss" /></li><li><strong>￥${order.totalPrice-order.returnPrice }</strong></li>
			<li style="float:right;color:green;" id="zkai${order.orderCode}">已支付</li>
		</ul>
	<div class="kc_table">
		<table cellspacing="1" border="0" bgcolor="#e5e5e5" id="d20131007280809" width="100%">
			<tbody>
			<c:forEach items="${order.item}" var ="item">
			<tr cid="c${item.id}" id="tr${item.id}">
				<td bgcolor="#ffffff" width="68%" style="text-align:left;padding-left: 14px;">${item.courseName}<br></td>
				<td bgcolor="#ffffff" width="20%">优惠价：<strong>￥${item.itemRprice }</strong><br><em>节省：${item.itemOprice-item.itemRprice}元</em></td>
				<c:if test="${item.course.coursetype != 2 }">
				<td bgcolor="#ffffff" width="10%"><a class="xuexi" href="/classController.do?class&courseId=${item.course.id}" target="_blank">开始学习</a></td>
				</c:if>
				<c:if test="${item.course.coursetype == 2 }">
				<td bgcolor="#ffffff" width="10%"><a class="xuexi" href="/cstudyRecordController.do?download&courseId=${item.course.id}" target="_blank">下载</a></td>
				</c:if>
			</tr>
			</c:forEach>
			</tbody>
		</table>	
	</div>
	<div class="rightlist" id="tjxx${order.orderCode}">
		<div class="an-lf">
		</div>
	</div>
	</div>
	</c:forEach>
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
<script type="text/javascript">
$(function(){
	$("#left_order").addClass("cur");
	$("#left_order").siblings().removeClass("cur");
});
</script>
</body>
</html>