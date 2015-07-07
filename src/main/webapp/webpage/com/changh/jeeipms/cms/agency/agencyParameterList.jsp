<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<div class="easyui-layout" fit="true">
  <div region="center" style="padding:1px;">
  <t:datagrid name="agencyParameterList" title="机构统计" actionUrl="sysagencyParameterController.do?datagrid" idField="id" fit="true" queryMode="group">
   <t:dgCol title="编号" field="id" hidden="false"></t:dgCol>
   <t:dgCol title="公司名称" field="name" frozenColumn="true" query="true" width="180"></t:dgCol>
   <t:dgCol title="所在省份" field="province_province" queryMode="single"  query="true" replace="${province}"></t:dgCol>
   <t:dgCol title="所在城市" field="city_city" queryMode="single" hidden="false"></t:dgCol>
   <t:dgCol title="推荐度" field="recommend" ></t:dgCol>
   <t:dgCol title="活跃度" field="liveness" ></t:dgCol>
   <t:dgCol title="访问量" field="pageview" ></t:dgCol>
   <t:dgCol title="到期时间" field="expirationdate" formatter="yyyy-MM-dd hh:mm:ss"></t:dgCol>
   <t:dgCol title="会员" field="vip" replace="普通会员_0,VIP会员_1" query="true"></t:dgCol>
   <t:dgCol title="等级" field="grade" ></t:dgCol>
   <t:dgCol title="积分" field="score" ></t:dgCol>
   <t:dgCol title="金币" field="currency" ></t:dgCol>
   <t:dgCol title="操作" field="opt" width="100"></t:dgCol>
   <t:dgDelOpt title="删除" url="sysagencyParameterController.do?del&id={id}" />
   <t:dgToolBar title="编辑" icon="icon-edit" url="sysagencyParameterController.do?addorupdate" funname="update"></t:dgToolBar>
   <t:dgToolBar title="查看" icon="icon-search" url="sysagencyParameterController.do?addorupdate" funname="detail"></t:dgToolBar>
  </t:datagrid>
  </div>
 </div>