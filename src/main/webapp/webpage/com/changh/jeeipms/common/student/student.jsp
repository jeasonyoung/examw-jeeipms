<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
 <head>
  <title>学员管理</title>
  <t:base type="jquery,easyui,tools,DatePicker"></t:base>
 </head>
 <body style="overflow-y: hidden" scroll="no">
  <t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="table" action="sysstudentController.do?save">
			<input id="id" name="id" type="hidden" value="${studentPage.id }">
			<table style="width: 600px;" cellpadding="0" cellspacing="1" class="formtable">
				<tr>
					<td align="right">
						<label class="Validform_label">
							用户名:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="username" name="username" 
							   value="${studentPage.username}" datatype="*">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							密码:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="spassword" name="spassword" 
							   value="${studentPage.spassword}" datatype="*">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							真实姓名:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="realname" name="realname" ignore="ignore"
							   value="${studentPage.realname}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							性别:
						</label>
					</td>
					<td class="value">
						<input type="radio" name="gender" value="0" ${studentPage.gender=='0'?'checked':''} checked>男
						<input type="radio" name="gender" value="1" ${studentPage.gender=='1'?'checked':''}/> 女
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							状态:
						</label>
					</td>
					<td class="value">
						<input type="radio" name="status" value="0" ${studentPage.status=='0'?'checked':''}  checked>正常
						<input type="radio" name="status" value="1" ${studentPage.status=='1'?'checked':''}/> 冻结
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							注册时间:
						</label>
					</td>
					<td class="value">
						<input class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"  style="width: 150px" id="addtime" name="addtime" 
							     value="<fmt:formatDate value='${studentPage.addtime}' type="date" pattern="yyyy-MM-dd hh:mm:ss"/>" datatype="*">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							登陆次数:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="logintimes" name="logintimes" ignore="ignore"
							   value="${studentPage.logintimes}" datatype="n">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							最后登陆时间:
						</label>
					</td>
					<td class="value">
						<input class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"  style="width: 150px" id="lastlogintime" name="lastlogintime" ignore="ignore"
							     value="<fmt:formatDate value='${studentPage.lastlogintime}' type="date" pattern="yyyy-MM-dd hh:mm:ss"/>">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							最后登陆IP:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="lastloginip" name="lastloginip" ignore="ignore"
							   value="${studentPage.lastloginip}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							头像地址:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="imageurl" name="imageurl" ignore="ignore"
							   value="${studentPage.imageurl}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							电话号码:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="phone" name="phone" ignore="ignore"
							   value="${studentPage.phone}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							联系QQ:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="qq" name="qq" ignore="ignore"
							   value="${studentPage.qq}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							电子邮箱:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="email" name="email" ignore="ignore"
							   value="${studentPage.email}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							学员地址:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="address" name="address" ignore="ignore"
							   value="${studentPage.address}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							MSN:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="msn" name="msn" ignore="ignore"
							   value="${studentPage.msn}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
			</table>
		</t:formvalid>
 </body>