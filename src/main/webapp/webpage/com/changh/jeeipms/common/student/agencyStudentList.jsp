<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<div class="easyui-layout" fit="true">
  <div region="center" style="padding:1px;">
  <t:datagrid name="agencyStudentList" title="咨询学员" actionUrl="sysagencyStudentController.do?datagrid" idField="id" fit="true">
   <t:dgCol title="编号" field="id" hidden="false"></t:dgCol>
   <t:dgCol title="真实姓名" field="realname" ></t:dgCol>
   <t:dgCol title="电话号码" field="phone" ></t:dgCol>
   <t:dgCol title="联系QQ" field="qq" ></t:dgCol>
   <t:dgCol title="电子邮箱" field="email" ></t:dgCol>
   <t:dgCol title="学员地址" field="address" ></t:dgCol>
   <t:dgCol title="状态" field="status" ></t:dgCol>
   <t:dgCol title="咨询机构" field="agency_name" ></t:dgCol>
   <t:dgCol title="咨询课程" field="course" ></t:dgCol>
   <t:dgCol title="咨询内容" field="content" ></t:dgCol>
   <t:dgCol title="咨询时间" field="addtime" formatter="yyyy-MM-dd hh:mm:ss"></t:dgCol>
   <t:dgCol title="操作" field="opt" width="100"></t:dgCol>
   <t:dgDelOpt title="删除" url="sysagencyStudentController.do?del&id={id}" />
   <t:dgToolBar title="录入" icon="icon-add" url="sysagencyStudentController.do?addorupdate" funname="add"></t:dgToolBar>
   <t:dgToolBar title="编辑" icon="icon-edit" url="sysagencyStudentController.do?addorupdate" funname="update"></t:dgToolBar>
   <t:dgToolBar title="查看" icon="icon-search" url="sysagencyStudentController.do?addorupdate" funname="detail"></t:dgToolBar>
  </t:datagrid>
  </div>
 </div>