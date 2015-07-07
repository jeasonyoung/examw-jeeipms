<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<div class="easyui-layout" fit="true">
  <div region="center" style="padding:1px;">
  <t:datagrid name="examCategoryList" title="考试类别" actionUrl="sysexamCategoryController.do?datagrid" idField="id" fit="true">
   <t:dgCol title="编号" field="id" hidden="false"></t:dgCol>
   <t:dgCol title="考试类别" field="classId" ></t:dgCol>
   <t:dgCol title="考试英文名" field="examEname" ></t:dgCol>
   <t:dgCol title="考试中文名" field="examCname" ></t:dgCol>
   <t:dgCol title="上级考试" field="parentId" ></t:dgCol>
   <t:dgCol title="下级数量" field="childNum" ></t:dgCol>
   <t:dgCol title="删除标记" field="delFlag" ></t:dgCol>
   <t:dgCol title="添加时间" field="addTime" formatter="yyyy-MM-dd hh:mm:ss"></t:dgCol>
   <t:dgCol title="排序" field="orderId" ></t:dgCol>
   <t:dgCol title="描述" field="examDesc" ></t:dgCol>
   <t:dgCol title="标题" field="examTitle" ></t:dgCol>
   <t:dgCol title="关键字" field="examKeywords" ></t:dgCol>
   <t:dgCol title="操作" field="opt" width="100"></t:dgCol>
   <t:dgDelOpt title="删除" url="sysexamCategoryController.do?del&id={id}" />
   <t:dgToolBar title="录入" icon="icon-add" url="sysexamCategoryController.do?addorupdate" funname="add"></t:dgToolBar>
   <t:dgToolBar title="编辑" icon="icon-edit" url="sysexamCategoryController.do?addorupdate" funname="update"></t:dgToolBar>
   <t:dgToolBar title="查看" icon="icon-search" url="sysexamCategoryController.do?addorupdate" funname="detail"></t:dgToolBar>
  </t:datagrid>
  </div>
 </div>
