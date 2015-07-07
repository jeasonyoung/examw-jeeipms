<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<div class="easyui-layout" fit="true">
  <div region="center" style="padding:1px;">
  <t:datagrid name="studyCardList" title="学习卡管理" actionUrl="sysstudyCardController.do?datagrid" idField="id" fit="true">
   <t:dgCol title="编号" field="id" hidden="false"></t:dgCol>
   <t:dgCol title="卡号" field="cardNum"  frozenColumn="true" width="150"></t:dgCol>
   <t:dgCol title="密码" field="cardPassword" ></t:dgCol>
   <t:dgCol title="面值" field="cardValue" ></t:dgCol>
   <t:dgCol title="结余" field="cardBalance" ></t:dgCol>
   <t:dgCol title="添加时间" field="addtime" formatter="yyyy-MM-dd hh:mm:ss"></t:dgCol>
   <t:dgCol title="过期时间" field="overtime" formatter="yyyy-MM-dd hh:mm:ss"></t:dgCol>
   <t:dgCol title="使用时间" field="usetime" formatter="yyyy-MM-dd hh:mm:ss"></t:dgCol>
   <t:dgCol title="类型" field="isfree" replace="收费_0,免费_1"></t:dgCol>
   <t:dgCol title="操作" field="opt" width="50"></t:dgCol>
   <t:dgDelOpt title="删除" url="sysstudyCardController.do?del&id={id}" />
   <t:dgToolBar title="批量录入" icon="icon-add" url="sysstudyCardController.do?batch" funname="add"></t:dgToolBar>
   <t:dgToolBar title="编辑" icon="icon-edit" url="sysstudyCardController.do?addorupdate" funname="update"></t:dgToolBar>
   <t:dgToolBar title="查看" icon="icon-search" url="sysstudyCardController.do?addorupdate" funname="detail"></t:dgToolBar>
  </t:datagrid>
  </div>
 </div>