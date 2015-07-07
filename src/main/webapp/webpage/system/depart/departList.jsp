<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<div class="easyui-layout" fit="true">
<div region="center" style="padding:1px;">
<t:datagrid name="departList" title="部门列表" actionUrl="sysdepartController.do?departgrid" treegrid="true" idField="departid" pagination="false" >
 <t:dgCol title="编号" field="id" treefield="id" hidden="false"></t:dgCol>
 <t:dgCol title="部门名称" field="departname" treefield="text"  ></t:dgCol>
 <t:dgCol title="职能描述" field="description" treefield="src"></t:dgCol>
 <t:dgCol title="操作" field="opt"></t:dgCol>
 <t:dgDelOpt url="sysdepartController.do?del&id={id}" title="删除"></t:dgDelOpt>
</t:datagrid>
<div id="departListtb" style="padding: 3px; height: 25px">
 <div style="float:left;">
  <a href="#" class="easyui-linkbutton" plain="true" icon="icon-add" onclick="add('部门录入','sysdepartController.do?add','departList')">部门录入</a>
  <a href="#" class="easyui-linkbutton" plain="true" icon="icon-edit" onclick="update('部门编辑','sysdepartController.do?update','departList')">部门编辑</a>
 </div>
</div>
</div>