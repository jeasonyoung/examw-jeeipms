<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<div class="easyui-layout" fit="true">
  <div region="center" style="padding:1px;">
  <t:datagrid name="courseItemList" title="订单详细" actionUrl="syscourseItemController.do?datagrid" idField="id" fit="true">
   <t:dgCol title="编号" field="id" hidden="false"></t:dgCol>
   <t:dgCol title="所属订单" field="orderId" ></t:dgCol>
   <t:dgCol title="课程" field="courseId" ></t:dgCol>
   <t:dgCol title="课程名称" field="courseName" ></t:dgCol>
   <t:dgCol title="原价" field="itemOprice" ></t:dgCol>
   <t:dgCol title="优惠价格" field="itemRprice" ></t:dgCol>
   <t:dgCol title="备注" field="itemContent" ></t:dgCol>
   <t:dgCol title="操作" field="opt" width="100"></t:dgCol>
   <t:dgDelOpt title="删除" url="syscourseItemController.do?del&id={id}" />
   <t:dgToolBar title="录入" icon="icon-add" url="syscourseItemController.do?addorupdate" funname="add"></t:dgToolBar>
   <t:dgToolBar title="编辑" icon="icon-edit" url="syscourseItemController.do?addorupdate" funname="update"></t:dgToolBar>
   <t:dgToolBar title="查看" icon="icon-search" url="syscourseItemController.do?addorupdate" funname="detail"></t:dgToolBar>
  </t:datagrid>
  </div>
 </div>