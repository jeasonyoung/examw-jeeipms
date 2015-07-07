<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<div class="easyui-layout" fit="true">
  <div region="center" style="padding:1px;">
  <t:datagrid name="orderList" fitColumns="true" title="订单主数据" actionUrl="sysorderController.do?datagrid" idField="id" fit="true" queryMode="group">
   <t:dgCol title="编号" field="id" hidden="false"></t:dgCol>
   <t:dgCol title="订单号" field="orderCode" query="true" ></t:dgCol>
   <t:dgCol title="订单状态" field="orderStatus" query="true"  replace="未支付_0,已支付_1" ></t:dgCol>
   <t:dgCol title="类型" field="orderType" width="50" replace="课程订单_1,充值订单_2,软件订单_3"></t:dgCol>
   <t:dgCol title="学员" field="student_username" width="80" query="true"></t:dgCol>
   <t:dgCol title="支付现金" field="orderCashmoney" ></t:dgCol>
   <t:dgCol title="支付学习卡" field="orderCards" ></t:dgCol>
   <t:dgCol title="下单时间" field="orderAddtime" formatter="yyyy-MM-dd hh:mm:ss" width="80" query="true" queryMode="group"></t:dgCol>
   <t:dgCol title="支付时间" field="orderPaytime" formatter="yyyy-MM-dd hh:mm:ss" width="80" ></t:dgCol>
   <t:dgCol title="总价(不含返款)" field="totalPrice" width="60"></t:dgCol>
   <t:dgCol title="返款" field="returnPrice" ></t:dgCol>
   <t:dgCol title="备注" field="orderContent" ></t:dgCol>
   <t:dgCol title="修改人" field="modifierName" ></t:dgCol>
   <t:dgCol title="操作" field="opt" width="80"></t:dgCol>
   <t:dgDelOpt title="删除" url="sysorderController.do?del&id={id}" />
   <t:dgFunOpt  operationCode="order_detail" funname="orderdetail(id)" title="订单详情" />
   <t:dgToolBar title="录入" icon="icon-add" url="sysorderController.do?addorupdate" funname="add"></t:dgToolBar>
   <t:dgToolBar title="编辑" icon="icon-edit" url="sysorderController.do?addorupdate" funname="update"></t:dgToolBar>
  </t:datagrid>
  </div>
 </div>
 <script type="text/javascript">
	function orderdetail(id){
		addOneTab('订单详情','sysorderController.do?orderDetail&id='+id,'pie');
	}
	
	$(document).ready(function(){
		$("input[name='orderAddtime_begin']").attr("class","easyui-datebox");
		$("input[name='orderAddtime_end']").attr("class","easyui-datebox");
	});
</script>
 