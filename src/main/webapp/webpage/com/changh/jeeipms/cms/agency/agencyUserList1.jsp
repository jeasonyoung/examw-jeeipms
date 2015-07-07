<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<div class="easyui-layout" fit="true">
  <div region="center" style="padding:1px;">
   <myTag:introduce age="15" name="Jim"/>
  <t:datagrid name="agencyUserList" title="机构用户" actionUrl="sysagencyUserController.do?datagrid"  idField="id" fit="true">
   <t:dgCol title="编号" field="id" hidden="false"></t:dgCol>
   <t:dgCol title="真实姓名" field="realname" ></t:dgCol>
   <t:dgCol title="用户名" field="username" ></t:dgCol>
   <t:dgCol title="密码" field="password"  hidden="false"></t:dgCol>
   <t:dgCol title="手机号码" field="mobilephone" ></t:dgCol>
   <t:dgCol title="办公电话" field="officephone" ></t:dgCol>
   <t:dgCol title="QQ" field="qq"  hidden="false"></t:dgCol>
   <t:dgCol title="电子邮箱" field="email" ></t:dgCol>
   <t:dgCol title="浏览器" field="browser"  hidden="false"></t:dgCol>
   <t:dgCol title="最近登陆" field="lastlogintime" formatter="yyyy-MM-dd hh:mm:ss"></t:dgCol>
   <t:dgCol title="登陆次数" field="logincount" ></t:dgCol>
   <t:dgCol title="登陆IP" field="loginip" ></t:dgCol>
   <t:dgCol title="头像地址" field="image"  hidden="false"></t:dgCol>
   <t:dgCol title="所属公司" field="ape_name"  query="true"></t:dgCol>
   <t:dgCol title="状态" field="status" replace="正常_,冻结_1" ></t:dgCol>
   <t:dgCol title="操作" field="opt" width="100"></t:dgCol>
   <t:dgDelOpt title="删除" url="sysagencyUserController.do?del&id={id}" />
   <t:dgToolBar title="录入" icon="icon-add" url="sysagencyUserController.do?addorupdate" funname="add"></t:dgToolBar>
   <t:dgToolBar title="编辑" icon="icon-edit" url="sysagencyUserController.do?addorupdate" funname="update"></t:dgToolBar>
   <t:dgToolBar title="查看" icon="icon-search" url="sysagencyUserController.do?addorupdate" funname="detail"></t:dgToolBar>
  </t:datagrid>
  </div>
 </div>
 <script type="text/javascript">
	$(document).ready(function(){
		alert("${ape_name}");
		agencyUserListsearchbox("${ape_name}", "ape_name");
	});
</script>