<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<div class="easyui-layout" fit="true">
  <div region="center" style="padding:1px;">
  <t:datagrid name="cardRecordList" title="学习卡流水" actionUrl="syscardRecordController.do?datagrid" idField="id" fit="true">
   <t:dgCol title="编号" field="id" hidden="false"></t:dgCol>
   <t:dgCol title="学员" field="student_username" ></t:dgCol>
   <t:dgCol title="卡号" field="studycard_cardNum" ></t:dgCol>
   <t:dgCol title="涉及金额" field="recordValue" ></t:dgCol>
   <t:dgCol title="操作时间" field="useTime" formatter="yyyy-MM-dd hh:mm:ss"></t:dgCol>
   <t:dgCol title="操作内容" field="userContent" ></t:dgCol>
   <t:dgCol title="备注" field="recordContent" ></t:dgCol>
   <t:dgCol title="操作" field="opt" width="50"></t:dgCol>
   <t:dgDelOpt title="删除" url="syscardRecordController.do?del&id={id}" />
  </t:datagrid>
  </div>
 </div>
 <script>
/* $('#cardRecordList').datagrid({
	    rowStyler:function(index,row){
	        if (true){
	            return 'background-color:pink;color:red;font-weight:bold;';
	        }
	    }
	});*/
 </script>