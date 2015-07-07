<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<div class="easyui-layout" fit="true">
  <div region="center" style="padding:1px;">
  <t:datagrid name="recourseList" title="机构资源" actionUrl="sysrecourseController.do?datagrid" idField="id" fit="true">
   <t:dgCol title="编号" field="id" hidden="false"></t:dgCol>
   <t:dgCol title="标题" field="title"  width="80"></t:dgCol>
   <t:dgCol title="机构" field="agency_name" width="80"></t:dgCol>
   <t:dgCol title="状态" field="status" replace="未审核_0,审核通过_1,审核未过_2" ></t:dgCol>
   <t:dgCol title="排序" field="aOrder" ></t:dgCol>
   <t:dgCol title="添加时间" field="addtime" formatter="yyyy-MM-dd hh:mm:ss"></t:dgCol>
   <t:dgCol title="操作" field="opt" width="60"></t:dgCol>
   <t:dgDelOpt title="删除" url="sysrecourseController.do?del&id={id}" />
   <t:dgFunOpt operationCode="conetent" funname="content(id)" title="审核" />
  </t:datagrid>
  </div>
 </div>
 <script>
  function content(id){
	  createconetentwindow('审核','sysrecourseController.do?doCheck&id='+id)
  }
 </script>