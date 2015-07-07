<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>机构用户</title>
<t:base type="jquery,easyui,tools,DatePicker"></t:base>
<script type="text/javascript">
	
</script>
</head>
<body style="overflow-y: hidden" scroll="no">
	<t:formvalid formid="formobj" dialog="true" usePlugin="password"
		layout="table" action="sysagencyUserController.do?save">
		<input id="id" name="id" type="hidden" value="${agencyUserPage.id }">
		<table style="width: 600px;" cellpadding="0" cellspacing="1"
			class="formtable">
			<tr>
				<td align="right"><label class="Validform_label"> 真实姓名:
				</label></td>
				<td class="value"><input class="inputxt" id="realname"
					name="realname" ignore="ignore" value="${agencyUserPage.realname}">
					<span class="Validform_checktip"></span></td>
			</tr>
			<tr>
				<td align="right"><label class="Validform_label"> 用户名:
				</label></td>
				<td class="value"><input class="inputxt" id="username"
					name="username" ignore="ignore" value="${agencyUserPage.username}">
					<span class="Validform_checktip"></span></td>
			</tr>
			<tr>
				<td align="right"><label class="Validform_label"> 密码: </label>
				</td>
				<td class="value"><input class="inputxt" id="password"
					name="password" ignore="ignore" value="${agencyUserPage.password}">
					<span class="Validform_checktip"></span></td>
			</tr>
			<tr>
				<td align="right"><label class="Validform_label"> 手机号码:
				</label></td>
				<td class="value"><input class="inputxt" id="mobilephone"
					name="mobilephone" ignore="ignore"
					value="${agencyUserPage.mobilephone}"> <span
					class="Validform_checktip"></span></td>
			</tr>
			<tr>
				<td align="right"><label class="Validform_label"> 办公电话:
				</label></td>
				<td class="value"><input class="inputxt" id="officephone"
					name="officephone" ignore="ignore"
					value="${agencyUserPage.officephone}"> <span
					class="Validform_checktip"></span></td>
			</tr>
			<tr>
				<td align="right"><label class="Validform_label"> QQ: </label>
				</td>
				<td class="value"><input class="inputxt" id="qq" name="qq"
					ignore="ignore" value="${agencyUserPage.qq}"> <span
					class="Validform_checktip"></span></td>
			</tr>
			<tr>
				<td align="right"><label class="Validform_label"> 电子邮箱:
				</label></td>
				<td class="value"><input class="inputxt" id="email"
					name="email" ignore="ignore" value="${agencyUserPage.email}">
					<span class="Validform_checktip"></span></td>
			</tr>
			<tr>
				<td align="right"><label class="Validform_label"> 浏览器:
				</label></td>
				<td class="value"><input class="inputxt" id="browser"
					name="browser" ignore="ignore" value="${agencyUserPage.browser}">
					<span class="Validform_checktip"></span></td>
			</tr>
			<tr>
				<td align="right"><label class="Validform_label">
						0:正常1:冻结: </label></td>
				<td class="value"><input class="inputxt" id="status"
					name="status" ignore="ignore" value="${agencyUserPage.status}"
					datatype="n"> <span class="Validform_checktip"></span></td>
			</tr>
			<!-- 
			<tr>
				<td align="right"><label class="Validform_label"> 最近登陆:
				</label></td>
				<td class="value"><input class="Wdate"
					onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"
					style="width: 150px" id="lastlogintime" name="lastlogintime"
					ignore="ignore"
					value="<fmt:formatDate value='${agencyUserPage.lastlogintime}' type="date" pattern="yyyy-MM-dd hh:mm:ss"/>">
					<span class="Validform_checktip"></span></td>
			</tr>
			<tr>
				<td align="right"><label class="Validform_label"> 登陆次数:
				</label></td>
				<td class="value"><input class="inputxt" id="logincount"
					name="logincount" ignore="ignore"
					value="${agencyUserPage.logincount}" datatype="n"> <span
					class="Validform_checktip"></span></td>
			</tr>
			<tr>
				<td align="right"><label class="Validform_label"> 登陆IP:
				</label></td>
				<td class="value"><input class="inputxt" id="loginip"
					name="loginip" ignore="ignore" value="${agencyUserPage.loginip}">
					<span class="Validform_checktip"></span></td>
			</tr>
			 -->
			<tr>
				<td align="right"><label class="Validform_label"> 头像地址:
				</label></td>
				<td class="value"><input class="inputxt" id="image"
					name="image" ignore="ignore" value="${agencyUserPage.image}">
					<span class="Validform_checktip"></span></td>
			</tr>
			<tr>
				<td align="right"><label class="Validform_label"> 所属公司:
				</label></td>
				<td class="value"><select id="agencyid" name="ape.id"
					datatype="*">
						<c:forEach items="${agencyList}" var="ape">
							<option value="${ape.id }"
								<c:if test="${ape.id==agencyUserPage.ape.id || ape.id==ape_id}">selected="selected"</c:if>>
								${ape.name}</option>
						</c:forEach>
				</select> <span class="Validform_checktip"></span></td>
			</tr>
		</table>
	</t:formvalid>
</body>