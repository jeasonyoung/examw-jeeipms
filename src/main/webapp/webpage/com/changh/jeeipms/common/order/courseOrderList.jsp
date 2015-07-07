<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<script type="text/javascript" src="http://www.jeasyui.com/easyui/datagrid-detailview.js"></script>  
<div class="easyui-layout" fit="true">
  <div region="center" style="padding:1px;">
  <t:datagrid name="courseOrderList" title="订单列表" actionUrl="syscourseOrderController.do?datagrid"  idField="id" fit="true">
   <t:dgCol title="编号" field="id" hidden="false"></t:dgCol>
   <t:dgCol title="订单号" field="orderCode" ></t:dgCol>
   <t:dgCol title="状态" field="orderStatus" replace="未支付_0,已支付_1"></t:dgCol>
   <t:dgCol title="类型" field="orderType" replace="课程订单_1,充值订单_2,软件订单_3"></t:dgCol>
   <t:dgCol title="学员" field="student_realname" ></t:dgCol>
   <t:dgCol title="已付现金" field="orderCashmoney"  width="50"></t:dgCol>
   <t:dgCol title="已付学习卡" field="orderCards"  width="50"></t:dgCol>
   <t:dgCol title="下单时间" field="orderAddtime" formatter="yyyy-MM-dd hh:mm:ss"></t:dgCol>
   <t:dgCol title="支付时间" field="orderPaytime" formatter="yyyy-MM-dd hh:mm:ss"></t:dgCol>
   <t:dgCol title="联系人" field="contactName" hidden="false"></t:dgCol>
   <t:dgCol title="手机" field="telphone" hidden="false"></t:dgCol>
   <t:dgCol title="总价(不含返现)" field="totalPrice" width="50"></t:dgCol>
   <t:dgCol title="返现" field="returnPrice" ></t:dgCol>
   <t:dgCol title="备注" field="orderContent" hidden="false"></t:dgCol>
   <t:dgCol title="修改人名字" field="modifierName" hidden="false"></t:dgCol>
   <t:dgCol title="修改时间" field="modifyDt" formatter="yyyy-MM-dd hh:mm:ss" hidden="false"></t:dgCol>
   <t:dgCol title="操作" field="opt" width="50"></t:dgCol>
   <t:dgDelOpt title="删除" url="syscourseOrderController.do?del&id={id}" />
   <t:dgToolBar title="录入" icon="icon-add" url="syscourseOrderController.do?addorupdate" funname="add"></t:dgToolBar>
   <t:dgToolBar title="编辑" icon="icon-edit" url="syscourseOrderController.do?addorupdate" funname="update"></t:dgToolBar>
   <t:dgToolBar title="查看" icon="icon-search" url="syscourseOrderController.do?addorupdate" funname="detail"></t:dgToolBar>
  </t:datagrid>
  </div>
 </div>
 
