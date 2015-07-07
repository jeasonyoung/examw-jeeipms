<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<div class="easyui-layout" fit="true">
  <div region="center" style="padding:1px;">
  <t:datagrid name="orderList" fitColumns="true" title="订单主数据" actionUrl="sysorderController.do?datagrid" idField="id" fit="true">
   <t:dgCol title="编号" field="id" hidden="false"></t:dgCol>
   <t:dgCol title="订单号" field="orderCode" ></t:dgCol>
   <t:dgCol title="订单类型" field="orderType" ></t:dgCol>
   <t:dgCol title="订单状态" field="orderStatus" ></t:dgCol>
   <t:dgCol title="学员" field="stuId" ></t:dgCol>
   <t:dgCol title="支付现金" field="orderCashmoney" ></t:dgCol>
   <t:dgCol title="支付学习卡" field="orderCards" ></t:dgCol>
   <t:dgCol title="下单时间" field="orderAddtime" formatter="yyyy-MM-dd hh:mm:ss"></t:dgCol>
   <t:dgCol title="支付时间" field="orderPaytime" formatter="yyyy-MM-dd hh:mm:ss"></t:dgCol>
   <t:dgCol title="联系人" field="contactName" ></t:dgCol>
   <t:dgCol title="手机" field="telphone" ></t:dgCol>
   <t:dgCol title="总价(不含返款)" field="totalPrice" ></t:dgCol>
   <t:dgCol title="返款" field="returnPrice" ></t:dgCol>
   <t:dgCol title="备注" field="orderContent" ></t:dgCol>
   <t:dgCol title="修改人" field="modifier" ></t:dgCol>
   <t:dgCol title="修改人名字" field="modifierName" ></t:dgCol>
   <t:dgCol title="修改时间" field="modifyDt" formatter="yyyy-MM-dd hh:mm:ss"></t:dgCol>
   <t:dgCol title="删除标记" field="delflag" ></t:dgCol>
   <t:dgCol title="删除时间" field="delDt" formatter="yyyy-MM-dd hh:mm:ss"></t:dgCol>
   <t:dgCol title="操作" field="opt" width="100"></t:dgCol>
   <t:dgDelOpt title="删除" url="sysorderController.do?del&id={id}" />
   <t:dgToolBar title="录入" icon="icon-add" url="sysorderController.do?addorupdate" funname="add"></t:dgToolBar>
   <t:dgToolBar title="编辑" icon="icon-edit" url="sysorderController.do?addorupdate" funname="update"></t:dgToolBar>
  </t:datagrid>
  </div>
 </div>