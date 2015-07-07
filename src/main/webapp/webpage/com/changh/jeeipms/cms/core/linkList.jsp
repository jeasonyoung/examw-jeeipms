<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
 <head>
  <title>友情链接</title>
  <t:base type="jquery,easyui,tools,DatePicker"></t:base>
 </head>
 <body style="overflow-y: hidden" scroll="no">
  <t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="table" action="syslinkListController.do?save">
			<input id="id" name="id" type="hidden" value="${linkListPage.id }">
			<table style="width: 600px;" cellpadding="0" cellspacing="1" class="formtable">
				<tr>
					<td align="right">
						<label class="Validform_label">
							链接名称:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="linkname" name="linkname" 
							   value="${linkListPage.linkname}" datatype="*" >
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							链接地址:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="inurl" name="inurl" 
							   value="${linkListPage.inurl}" datatype="*">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							栏目:
						</label>
					</td>
					 <td class="value">
				      <select id="menu.id"  name="menu.id"  datatype="*">
				       <c:forEach items="${menuList}" var="menu">
				        <option value="${menu.id}" <c:if test="${menu.id==linkListPage.menu.id}">selected="selected"</c:if>>
				         ${menu.cnname}
				        </option>
				       </c:forEach>
				      </select>
				      <span class="Validform_checktip">请选择部门</span>
				    </td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							联系QQ:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="qq" name="qq" ignore="ignore" datatype="n"
							   value="${linkListPage.qq}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							排序:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="orderid" name="orderid" ignore="ignore"
							   value="${linkListPage.orderid}" datatype="n">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
			</table>
		</t:formvalid>
 </body>