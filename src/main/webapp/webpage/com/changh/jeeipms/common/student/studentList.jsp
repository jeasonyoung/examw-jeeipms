<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<div class="easyui-layout" fit="true">
  <div region="center" style="padding:1px;">
  <t:datagrid name="studentList" title="学员管理" actionUrl="sysstudentController.do?datagrid" idField="id" fit="true" queryMode="group">
   <t:dgCol title="编号" field="id" hidden="false"></t:dgCol>
   <t:dgCol title="用户名" field="username"  query="true" ></t:dgCol>
   <t:dgCol title="密码" field="spassword" hidden="false"></t:dgCol>
   <t:dgCol title="真实姓名" field="realname" query="true" ></t:dgCol>
   <t:dgCol title="性别" field="gender" replace="男_0,女_1"></t:dgCol>
   <t:dgCol title="状态" field="status" replace="正常_0,冻结_1"></t:dgCol>
   <t:dgCol title="注册时间" field="addtime" formatter="yyyy-MM-dd hh:mm:ss"></t:dgCol>
   <t:dgCol title="登陆次数" field="logintimes" ></t:dgCol>
   <t:dgCol title="最后登陆时间" field="lastlogintime" formatter="yyyy-MM-dd hh:mm:ss"></t:dgCol>
   <t:dgCol title="最后登陆IP" field="lastloginip" hidden="false"></t:dgCol>
   <t:dgCol title="头像地址" field="imageurl" hidden="false"></t:dgCol>
   <t:dgCol title="电话号码" field="phone"  query="true"  ></t:dgCol>
   <t:dgCol title="联系QQ" field="qq"  query="true" ></t:dgCol>
   <t:dgCol title="电子邮箱" field="email"  query="true"  ></t:dgCol>
   <t:dgCol title="学员地址" field="address" hidden="false"></t:dgCol>
   <t:dgCol title="MSN" field="msn" hidden="false"></t:dgCol>
   <t:dgCol title="操作" field="opt" width="100"></t:dgCol>
   <t:dgDelOpt title="删除" url="sysstudentController.do?del&id={id}" />
   <t:dgToolBar title="编辑" icon="icon-edit" url="sysstudentController.do?addorupdate" funname="update"></t:dgToolBar>
   <t:dgToolBar title="查看" icon="icon-search" url="sysstudentController.do?addorupdate" funname="detail"></t:dgToolBar>
  </t:datagrid>
  </div>
 </div>