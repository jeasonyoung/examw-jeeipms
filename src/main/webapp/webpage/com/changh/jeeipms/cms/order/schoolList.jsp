<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<div class="easyui-layout" fit="true">
  <div region="center" style="padding:1px;">
  <t:datagrid name="schoolList" title="合作网校" actionUrl="sysschoolController.do?datagrid" idField="id" fit="true">
   <t:dgCol title="编号" field="id" hidden="false"></t:dgCol>
   <t:dgCol title="网站名称" field="scName" ></t:dgCol>
   <t:dgCol title="网址" field="scUrl" ></t:dgCol>
   <t:dgCol title="接口" field="scInterface" ></t:dgCol>
   <t:dgCol title="密钥" field="scKey" ></t:dgCol>
   <t:dgCol title="修改时间" field="updatetime" formatter="yyyy-MM-dd hh:mm:ss"></t:dgCol>
   <t:dgCol title="添加时间" field="addtime" formatter="yyyy-MM-dd hh:mm:ss"></t:dgCol>
   <t:dgCol title="添加人" field="addby" ></t:dgCol>
   <t:dgCol title="修改人" field="updateby" ></t:dgCol>
   <t:dgCol title="操作" field="opt" width="100"></t:dgCol>
   <t:dgDelOpt title="删除" url="sysschoolController.do?del&id={id}" />
   <t:dgToolBar title="录入" icon="icon-add" url="sysschoolController.do?addorupdate" funname="add"></t:dgToolBar>
   <t:dgToolBar title="编辑" icon="icon-edit" url="sysschoolController.do?addorupdate" funname="update"></t:dgToolBar>
   <t:dgToolBar title="查看" icon="icon-search" url="sysschoolController.do?addorupdate" funname="detail"></t:dgToolBar>
  </t:datagrid>
  </div>
 </div>