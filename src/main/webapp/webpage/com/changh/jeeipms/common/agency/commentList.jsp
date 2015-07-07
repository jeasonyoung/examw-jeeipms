<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<div class="easyui-layout" fit="true">
  <div region="center" style="padding:1px;">
  <t:datagrid name="commentList" title="课程评论" actionUrl="syscommentController.do?datagrid" idField="id" fit="true">
   <t:dgCol title="编号" field="id" hidden="false"></t:dgCol>
   <t:dgCol title="评论内容" field="content" ></t:dgCol>
   <t:dgCol title="评论课程" field="courseid" ></t:dgCol>
   <t:dgCol title="评分" field="coursescore" ></t:dgCol>
   <t:dgCol title="状态" field="status" replace="正常_0,冻结_1" ></t:dgCol>
   <t:dgCol title="时间" field="addtime" formatter="yyyy-MM-dd hh:mm:ss" width="60"></t:dgCol>
   <t:dgCol title="评论人姓名" field="stuname" ></t:dgCol>
   <t:dgCol title="IP地址" field="ip" ></t:dgCol>
   <t:dgCol title="操作" field="opt" width="60"></t:dgCol>
   <t:dgDelOpt title="删除" url="syscommentController.do?del&id={id}" />
   <t:dgToolBar title="编辑" icon="icon-edit" url="syscommentController.do?addorupdate" funname="update"></t:dgToolBar>
   <t:dgToolBar title="查看" icon="icon-search" url="syscommentController.do?addorupdate" funname="detail"></t:dgToolBar>
  </t:datagrid>
  </div>
 </div>