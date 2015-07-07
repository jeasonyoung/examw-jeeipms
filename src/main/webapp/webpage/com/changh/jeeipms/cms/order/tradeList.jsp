<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<div class="easyui-layout" fit="true">
  <div region="center" style="padding:1px;">
  <t:datagrid name="tradeList" title="账户明细" actionUrl="systradeController.do?datagrid" idField="id" fit="true">
   <t:dgCol title="编号" field="id" hidden="false"></t:dgCol>
   <t:dgCol title="学员" field="student_username" width="60"></t:dgCol>
   <t:dgCol title="收入" field="income"   replace="---_0.00"></t:dgCol>
   <t:dgCol title="支出" field="outlay"  replace="---_0.00" ></t:dgCol>
   <t:dgCol title="交易时间" field="tradeTime" formatter="yyyy-MM-dd hh:mm:ss"></t:dgCol>
   <t:dgCol title="交易IP" field="tradeIp" ></t:dgCol>
   <t:dgCol title="币种" field="tradeCurrency" replace="人民币_0,学习卡_1"></t:dgCol>
   <t:dgCol title="现金结余" field="cashBalance" ></t:dgCol>
   <t:dgCol title="学习卡结余" field="cardBalance" ></t:dgCol>
    <t:dgCol title="备注" field="tradeContent" width="100"></t:dgCol>
   <t:dgCol title="操作" field="opt" width="60"></t:dgCol>
   <t:dgDelOpt title="删除" url="systradeController.do?del&id={id}" />
   <t:dgToolBar title="录入" icon="icon-add" url="systradeController.do?addorupdate" funname="add"></t:dgToolBar>
   <t:dgToolBar title="编辑" icon="icon-edit" url="systradeController.do?addorupdate" funname="update"></t:dgToolBar>
   <t:dgToolBar title="查看" icon="icon-search" url="systradeController.do?addorupdate" funname="detail"></t:dgToolBar>
  </t:datagrid>
  </div>
 </div>