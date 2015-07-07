<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<div class="easyui-layout" fit="true">
  <div region="center" style="padding:1px;">
  <t:datagrid name="courseCategoryList" title="课程类别" treegrid="true"  pagination="false"  actionUrl="syscourseCategoryController.do?coursegrid" idField="id" >
   <t:dgCol title="编号" field="id" treefield="id" hidden="false"></t:dgCol>
   <t:dgCol title="课程名称" field="categoryname"  treefield="text"></t:dgCol>
   <t:dgCol title="备注" field="content" treefield="src"></t:dgCol>
   <t:dgCol title="排序" field="categoryorder" treefield="order"></t:dgCol>
   <t:dgCol title="操作" field="opt"></t:dgCol>
   <t:dgDelOpt title="删除" url="syscourseCategoryController.do?del&id={id}" />
   <t:dgToolBar title="录入" icon="icon-add" url="syscourseCategoryController.do?addorupdate" funname="add"></t:dgToolBar>
   <t:dgToolBar title="编辑" icon="icon-edit" url="syscourseCategoryController.do?addorupdate" funname="update"></t:dgToolBar>
   <t:dgToolBar title="查看" icon="icon-search" url="syscourseCategoryController.do?addorupdate" funname="detail"></t:dgToolBar>
  </t:datagrid>
  </div>
 </div>