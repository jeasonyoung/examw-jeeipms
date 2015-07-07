<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<div class="easyui-layout" fit="true">
  <div region="center" style="padding:1px;">
  <t:datagrid name="linkListList" title="友情链接" actionUrl="syslinkListController.do?datagrid" idField="id" fit="true">
   <t:dgCol title="编号" field="id" hidden="false"></t:dgCol>
   <t:dgCol title="链接地址" field="linkname" ></t:dgCol>
   <t:dgCol title="链接地址" field="inurl" ></t:dgCol>
   <t:dgCol title="栏目" field="menu_cnname" ></t:dgCol>
   <t:dgCol title="联系QQ" field="qq" ></t:dgCol>
   <t:dgCol title="添加时间" field="addtime" formatter="yyyy-MM-dd hh:mm:ss"></t:dgCol>
   <t:dgCol title="排序" field="orderid" ></t:dgCol>
   <t:dgCol title="操作者" field="editor" ></t:dgCol>
   <t:dgCol title="操作" field="opt" width="100"></t:dgCol>
   <t:dgDelOpt title="删除" url="syslinkListController.do?del&id={id}" />
   <t:dgToolBar title="录入" icon="icon-add" url="syslinkListController.do?addorupdate" funname="add"></t:dgToolBar>
   <t:dgToolBar title="编辑" icon="icon-edit" url="syslinkListController.do?addorupdate" funname="update"></t:dgToolBar>
   <t:dgToolBar title="查看" icon="icon-search" url="syslinkListController.do?addorupdate" funname="detail"></t:dgToolBar>
  </t:datagrid>
  </div>
 </div>