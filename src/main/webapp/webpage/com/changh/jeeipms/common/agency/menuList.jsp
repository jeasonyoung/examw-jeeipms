<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<div class="easyui-layout" fit="true">
  <div region="center" style="padding:1px;">
  <t:datagrid name="menuList" title="机构菜单" actionUrl="sysmenuController.do?datagrid" idField="id" fit="true">
   <t:dgCol title="编号" field="id" hidden="false"></t:dgCol>
   <t:dgCol title="中文名称" field="cnname" ></t:dgCol>
   <t:dgCol title="英文名称" field="enname" ></t:dgCol>
   <t:dgCol title="上级菜单" field="parentmenuid" ></t:dgCol>
   <t:dgCol title="菜单地址" field="menuurl" ></t:dgCol>
   <t:dgCol title="菜单图片" field="imageurl" ></t:dgCol>
   <t:dgCol title="推荐排序" field="menuorder" ></t:dgCol>
   <t:dgCol title="菜单介绍" field="description" ></t:dgCol>
   <t:dgCol title="添加时间" field="addtime" formatter="yyyy-MM-dd hh:mm:ss"></t:dgCol>
   <t:dgCol title="操作" field="opt" width="100"></t:dgCol>
   <t:dgDelOpt title="删除" url="sysmenuController.do?del&id={id}" />
   <t:dgToolBar title="录入" icon="icon-add" url="sysmenuController.do?addorupdate" funname="add"></t:dgToolBar>
   <t:dgToolBar title="编辑" icon="icon-edit" url="sysmenuController.do?addorupdate" funname="update"></t:dgToolBar>
   <t:dgToolBar title="查看" icon="icon-search" url="sysmenuController.do?addorupdate" funname="detail"></t:dgToolBar>
  </t:datagrid>
  </div>
 </div>