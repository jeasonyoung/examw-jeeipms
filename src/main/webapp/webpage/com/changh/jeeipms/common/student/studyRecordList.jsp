<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<div class="easyui-layout" fit="true">
  <div region="center" style="padding:1px;">
  <t:datagrid name="studyRecordList" title="学习记录" actionUrl="sysstudyRecordController.do?datagrid" idField="id" fit="true">
   <t:dgCol title="编号" field="id" hidden="false"></t:dgCol>
   <t:dgCol title="学员" field="stuId" ></t:dgCol>
   <t:dgCol title="课程" field="courseId" ></t:dgCol>
   <t:dgCol title="开始时间" field="starttime" formatter="yyyy-MM-dd hh:mm:ss"></t:dgCol>
   <t:dgCol title="结束时间" field="endtime" formatter="yyyy-MM-dd hh:mm:ss"></t:dgCol>
   <t:dgCol title="学习IP地址" field="studyIp" ></t:dgCol>
   <t:dgCol title="操作" field="opt" width="100"></t:dgCol>
   <t:dgDelOpt title="删除" url="sysstudyRecordController.do?del&id={id}" />
   <t:dgToolBar title="编辑" icon="icon-edit" url="sysstudyRecordController.do?addorupdate" funname="update"></t:dgToolBar>
   <t:dgToolBar title="查看" icon="icon-search" url="sysstudyRecordController.do?addorupdate" funname="detail"></t:dgToolBar>
  </t:datagrid>
  </div>
 </div>