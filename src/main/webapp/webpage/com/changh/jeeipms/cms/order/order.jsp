<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
 <head>
  <title>订单主数据</title>
  <t:base type="jquery,easyui,tools,DatePicker"></t:base>
  <script type="text/javascript">
  //初始化下标
	function resetTrNum(tableId) {
		$tbody = $("#"+tableId+"");
		$tbody.find('>tr').each(function(i){
			$(':input, select', this).each(function(){
				var $this = $(this), name = $this.attr('name'), val = $this.val();
				if(name!=null){
					if (name.indexOf("#index#") >= 0){
						$this.attr("name",name.replace('#index#',i));
					}else{
						var s = name.indexOf("[");
						var e = name.indexOf("]");
						var new_name = name.substring(s+1,e);
						$this.attr("name",name.replace(new_name,i));
					}
				}
			});
		});
	}
 </script>
 </head>
 <body>
  <t:formvalid formid="formobj"  dialog="true" usePlugin="password" layout="table" tiptype="1" action="sysorderController.do?save">
			<input id="id" name="id" type="hidden" value="${orderPage.id }">
			<table cellpadding="0" cellspacing="1" class="formtable">
			<tr>
			<td align="right"><label class="Validform_label">订单号:</label></td>
			<td class="value">
				<input nullmsg="请填写订单号" errormsg="订单号格式不对" class="inputxt" id="orderCode" name="orderCode" 
									   value="${orderPage.orderCode}" datatype="*">
								<span class="Validform_checktip"></span>
			</td>
			<td align="right"><label class="Validform_label">订单类型:</label></td>
			<td class="value">
				<input nullmsg="请填写订单类型" errormsg="订单类型格式不对" class="inputxt" id="orderType" name="orderType" ignore="ignore"
									   value="${orderPage.orderType}" datatype="n">
								<span class="Validform_checktip"></span>
			</td>
			</tr>
			<tr>
			<td align="right"><label class="Validform_label">订单状态:</label></td>
			<td class="value">
				<input nullmsg="请填写订单状态" errormsg="订单状态格式不对" class="inputxt" id="orderStatus" name="orderStatus" 
									   value="${orderPage.orderStatus}" datatype="n">
								<span class="Validform_checktip"></span>
			</td>
			<td align="right"><label class="Validform_label">学员:</label></td>
			<td class="value">
				<input nullmsg="请填写学员" errormsg="学员格式不对" class="inputxt" id="student.username" name="stuId" 
									   value="${orderPage.student.username}" datatype="*">
								<span class="Validform_checktip"></span>
								<input type="hidden" name="student.id" value="${orderPage.student.id}" >
			</td>
			</tr>
			<tr>
			<td align="right"><label class="Validform_label">支付现金:</label></td>
			<td class="value">
				<input nullmsg="请填写支付现金" errormsg="支付现金格式不对" class="inputxt" id="orderCashmoney" name="orderCashmoney" ignore="ignore"
									   value="${orderPage.orderCashmoney}" datatype="n">
								<span class="Validform_checktip"></span>
			</td>
			<td align="right"><label class="Validform_label">支付学习卡:</label></td>
			<td class="value">
				<input nullmsg="请填写支付学习卡" errormsg="支付学习卡格式不对" class="inputxt" id="orderCards" name="orderCards" ignore="ignore"
									   value="${orderPage.orderCards}" datatype="n">
								<span class="Validform_checktip"></span>
			</td>
			</tr>
			<tr>
			<td align="right"><label class="Validform_label">下单时间:</label></td>
			<td class="value">
				<input nullmsg="请填写下单时间" errormsg="下单时间格式不对" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"  style="width: 150px" id="orderAddtime" name="orderAddtime" 
									     value="<fmt:formatDate value='${orderPage.orderAddtime}' type="date" pattern="yyyy-MM-dd hh:mm:ss"/>" datatype="*">
								<span class="Validform_checktip"></span>
			</td>
			<td align="right"><label class="Validform_label">支付时间:</label></td>
			<td class="value">
				<input nullmsg="请填写支付时间" errormsg="支付时间格式不对" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"  style="width: 150px" id="orderPaytime" name="orderPaytime" ignore="ignore"
									     value="<fmt:formatDate value='${orderPage.orderPaytime}' type="date" pattern="yyyy-MM-dd hh:mm:ss"/>">
								<span class="Validform_checktip"></span>
			</td>
			</tr>
			<tr>
			<td align="right"><label class="Validform_label">联系人:</label></td>
			<td class="value">
				<input nullmsg="请填写联系人" errormsg="联系人格式不对" class="inputxt" id="contactName" name="contactName" 
									   value="${orderPage.contactName}" datatype="*">
								<span class="Validform_checktip"></span>
			</td>
			<td align="right"><label class="Validform_label">手机:</label></td>
			<td class="value">
				<input nullmsg="请填写手机" errormsg="手机格式不对" class="inputxt" id="telphone" name="telphone" ignore="ignore"
									   value="${orderPage.telphone}">
								<span class="Validform_checktip"></span>
			</td>
			</tr>
			<tr>
			<td align="right"><label class="Validform_label">总价(不含返款:</label></td>
			<td class="value">
				<input nullmsg="请填写总价(不含返款" errormsg="总价(不含返款格式不对" class="inputxt" id="totalPrice" name="totalPrice" 
									   value="${orderPage.totalPrice}" datatype="d">
								<span class="Validform_checktip"></span>
			</td>
			<td align="right"><label class="Validform_label">返款:</label></td>
			<td class="value">
				<input nullmsg="请填写返款" errormsg="返款格式不对" class="inputxt" id="returnPrice" name="returnPrice" ignore="ignore"
									   value="${orderPage.returnPrice}" datatype="d">
								<span class="Validform_checktip"></span>
			</td>
			</tr>
			</table>
			<div style="width: auto;height: 50px;">
				<%-- 增加一个div，用于调节页面大小，否则默认太小 --%>
				<div style="width:690px;height:1px;"></div>
				<t:tabs id="tt" iframe="false" tabPosition="top" fit="false">
				 <t:tab href="sysorderController.do?itemList&id=${orderPage.id}" icon="icon-search" title="订单明细" id="item"></t:tab>
				</t:tabs>
			</div>
			</t:formvalid>
			<!-- 添加 产品明细 模版 -->
		<table style="display:none">
		<tbody id="add_item_table_template">
			<tr>
			 <td align="center"><input style="width:20px;" type="checkbox" name="ck"/></td>
				  <td align="left"><input name="itemList[#index#].courseId" maxlength="32" type="text" style="width:120px;"></td>
				  <td align="left"><input name="itemList[#index#].courseName" maxlength="100" type="text" style="width:120px;"></td>
				  <td align="left"><input name="itemList[#index#].itemOprice" maxlength="" type="text" style="width:120px;"></td>
				  <td align="left"><input name="itemList[#index#].itemRprice" maxlength="" type="text" style="width:120px;"></td>
				  <td align="left"><input name="itemList[#index#].itemContent" maxlength="200" type="text" style="width:120px;"></td>
			</tr>
		 </tbody>
		</table>
 </body>