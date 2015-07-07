<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<div class="easyui-layout" fit="true">
  <div region="center" style="padding:1px;">
  <t:datagrid name="noteList" title="学员笔记" actionUrl="sysnoteController.do?datagrid" idField="id" fit="true">
   <t:dgCol title="编号" field="id" hidden="false"></t:dgCol>
   <t:dgCol title="学员" field="student_username" ></t:dgCol>
   <t:dgCol title="课程" field="course_coursename" ></t:dgCol>
   <t:dgCol title="笔记时间" field="notetime" formatter="yyyy-MM-dd hh:mm:ss"></t:dgCol>
   <t:dgCol title="笔记内容" field="content" ></t:dgCol>
   <t:dgCol title="笔记来源" field="derived" ></t:dgCol>
   <t:dgCol title="操作" field="opt" width="100"></t:dgCol>
   <t:dgDelOpt title="删除" url="sysnoteController.do?del&id={id}" />
   <t:dgToolBar title="编辑" icon="icon-edit" url="sysnoteController.do?addorupdate" funname="update"></t:dgToolBar>
   <t:dgToolBar title="查看" icon="icon-search" url="sysnoteController.do?addorupdate" funname="detail"></t:dgToolBar>
  </t:datagrid>
  </div>
 </div>