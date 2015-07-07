<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<div class="easyui-layout" fit="true">
  <div region="center" style="padding:1px;">
  <t:datagrid name="teacherList" title="机构老师" actionUrl="systeacherController.do?datagrid" idField="id" fit="true">
   <t:dgCol title="编号" field="id" hidden="false"></t:dgCol>
   <t:dgCol title="姓名" field="realname" ></t:dgCol>
   <t:dgCol title="所属机构" field="agencyid" ></t:dgCol>
   <t:dgCol title="头像" field="imageurl" ></t:dgCol>
   <t:dgCol title="电话号码" field="phone" ></t:dgCol>
   <t:dgCol title="联系QQ" field="qq" ></t:dgCol>
   <t:dgCol title="电子邮箱" field="email" ></t:dgCol>
   <t:dgCol title="推荐排序" field="teacherorder" ></t:dgCol>
   <t:dgCol title="主要课程" field="lessons" ></t:dgCol>
   <t:dgCol title="老师介绍" field="description" ></t:dgCol>
   <t:dgCol title="添加时间" field="addtime" formatter="yyyy-MM-dd hh:mm:ss"></t:dgCol>
   <t:dgCol title="操作" field="opt" width="100"></t:dgCol>
   <t:dgDelOpt title="删除" url="systeacherController.do?del&id={id}" />
   <t:dgToolBar title="录入" icon="icon-add" url="systeacherController.do?addorupdate" funname="add"></t:dgToolBar>
   <t:dgToolBar title="编辑" icon="icon-edit" url="systeacherController.do?addorupdate" funname="update"></t:dgToolBar>
   <t:dgToolBar title="查看" icon="icon-search" url="systeacherController.do?addorupdate" funname="detail"></t:dgToolBar>
  </t:datagrid>
  </div>
 </div>