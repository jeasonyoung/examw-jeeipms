<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
 <head>
  <title>订单列表</title>
  <t:base type="jquery,easyui,tools,DatePicker"></t:base>
 </head>
 <body style="overflow-y: hidden" scroll="no">
  <t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="div" action="syscourseOrderController.do?save">
		<input id="id" name="id" type="hidden" value="${courseOrderPage.id }">
		<fieldset class="step">
			<div class="form">
		      <label class="Validform_label">订单号:</label>
		      <input class="inputxt" id="orderCode" name="orderCode" 
					   value="${courseOrderPage.orderCode}" datatype="*">
		      <span class="Validform_checktip"></span>
		    </div>
			<div class="form">
		      <label class="Validform_label">订单类型:</label>
		      <input class="inputxt" id="orderType" name="orderType" ignore="ignore"
					   value="${courseOrderPage.orderType}" datatype="n">
		      <span class="Validform_checktip"></span>
		    </div>
			<div class="form">
		      <label class="Validform_label">订单状态:</label>
		      <input class="inputxt" id="orderStatus" name="orderStatus" 
					   value="${courseOrderPage.orderStatus}" datatype="n">
		      <span class="Validform_checktip"></span>
		    </div>
			<div class="form">
		      <label class="Validform_label">学员:</label>
		      <input class="inputxt" id="stuId" name="stuId" 
					   value="${courseOrderPage.stuId}" datatype="*">
		      <span class="Validform_checktip"></span>
		    </div>
			<div class="form">
		      <label class="Validform_label">支付现金:</label>
		      <input class="inputxt" id="orderCashmoney" name="orderCashmoney" ignore="ignore"
					   value="${courseOrderPage.orderCashmoney}" datatype="n">
		      <span class="Validform_checktip"></span>
		    </div>
			<div class="form">
		      <label class="Validform_label">支付学习卡:</label>
		      <input class="inputxt" id="orderCards" name="orderCards" ignore="ignore"
					   value="${courseOrderPage.orderCards}" datatype="n">
		      <span class="Validform_checktip"></span>
		    </div>
			<div class="form">
		      <label class="Validform_label">下单时间:</label>
		      <input class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"  style="width: 150px" id="orderAddtime" name="orderAddtime" 
					     value="<fmt:formatDate value='${courseOrderPage.orderAddtime}' type="date" pattern="yyyy-MM-dd hh:mm:ss"/>" datatype="*">
		      <span class="Validform_checktip"></span>
		    </div>
			<div class="form">
		      <label class="Validform_label">支付时间:</label>
		      <input class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"  style="width: 150px" id="orderPaytime" name="orderPaytime" ignore="ignore"
					     value="<fmt:formatDate value='${courseOrderPage.orderPaytime}' type="date" pattern="yyyy-MM-dd hh:mm:ss"/>">
		      <span class="Validform_checktip"></span>
		    </div>
			<div class="form">
		      <label class="Validform_label">联系人:</label>
		      <input class="inputxt" id="contactName" name="contactName" 
					   value="${courseOrderPage.contactName}" datatype="*">
		      <span class="Validform_checktip"></span>
		    </div>
			<div class="form">
		      <label class="Validform_label">手机:</label>
		      <input class="inputxt" id="telphone" name="telphone" ignore="ignore"
					   value="${courseOrderPage.telphone}">
		      <span class="Validform_checktip"></span>
		    </div>
			<div class="form">
		      <label class="Validform_label">总价(不含返款):</label>
		      <input class="inputxt" id="totalPrice" name="totalPrice" 
					   value="${courseOrderPage.totalPrice}" datatype="d">
		      <span class="Validform_checktip"></span>
		    </div>
			<div class="form">
		      <label class="Validform_label">返款:</label>
		      <input class="inputxt" id="returnPrice" name="returnPrice" ignore="ignore"
					   value="${courseOrderPage.returnPrice}" datatype="d">
		      <span class="Validform_checktip"></span>
		    </div>
			<div class="form">
		      <label class="Validform_label">备注:</label>
		      <input class="inputxt" id="orderContent" name="orderContent" ignore="ignore"
					   value="${courseOrderPage.orderContent}">
		      <span class="Validform_checktip"></span>
		    </div>
			<div class="form">
		      <label class="Validform_label">修改人:</label>
		      <input class="inputxt" id="modifier" name="modifier" ignore="ignore"
					   value="${courseOrderPage.modifier}">
		      <span class="Validform_checktip"></span>
		    </div>
			<div class="form">
		      <label class="Validform_label">修改人名字:</label>
		      <input class="inputxt" id="modifierName" name="modifierName" ignore="ignore"
					   value="${courseOrderPage.modifierName}">
		      <span class="Validform_checktip"></span>
		    </div>
			<div class="form">
		      <label class="Validform_label">修改时间:</label>
		      <input class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"  style="width: 150px" id="modifyDt" name="modifyDt" ignore="ignore"
					     value="<fmt:formatDate value='${courseOrderPage.modifyDt}' type="date" pattern="yyyy-MM-dd hh:mm:ss"/>">
		      <span class="Validform_checktip"></span>
		    </div>
			<div class="form">
		      <label class="Validform_label">删除标记:</label>
		      <input class="inputxt" id="delflag" name="delflag" ignore="ignore"
					   value="${courseOrderPage.delflag}" datatype="n">
		      <span class="Validform_checktip"></span>
		    </div>
			<div class="form">
		      <label class="Validform_label">删除时间:</label>
		      <input class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"  style="width: 150px" id="delDt" name="delDt" ignore="ignore"
					     value="<fmt:formatDate value='${courseOrderPage.delDt}' type="date" pattern="yyyy-MM-dd hh:mm:ss"/>">
		      <span class="Validform_checktip"></span>
		    </div>
	    </fieldset>
  </t:formvalid>
 </body>