<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ attribute name="status" type="java.lang.Integer" required="false" description="状态"%>
<%@ attribute name="isfree" type="java.lang.Integer" required="false" description="是否免费"%>
<%@ attribute name="orderStatus" type="java.lang.Integer" required="false" description="是否免费"%>
<%@ attribute name="orderType" type="java.lang.Integer" required="false" description="订单类型"%>
<c:if test="${status eq 0}">
	<span class="label label-warning">未审核</span>
</c:if>
<c:if test="${status eq 1}">
	<span class="label label-success">审核通过</span>
</c:if>
<c:if test="${status eq 2}">
	<span class="label label-important">审核未过</span>
</c:if>
<c:if test="${isfree eq 0}">
	<span class="label label-success">否</span>
</c:if>
<c:if test="${isfree eq 1}">
	<span class="label label-important">是</span>
</c:if>
<c:if test="${orderStatus eq 1}">
	 已支付
</c:if>
<c:if test="${orderStatus eq 0}">
	未支付
</c:if>
<c:if test="${orderStatus eq 2}">
	已过期
</c:if>
<c:if test="${orderType eq 1}">
	课程订单
</c:if>
<c:if test="${orderType eq 2}">
	充值订单
</c:if>
<c:if test="${orderType eq 3}">
	软件订单
</c:if>
