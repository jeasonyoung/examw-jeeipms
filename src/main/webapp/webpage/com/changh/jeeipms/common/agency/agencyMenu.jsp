<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
 <head>
  <title>机构菜单</title>
  <t:base type="jquery,easyui,tools,DatePicker"></t:base>
 </head>
 <body style="overflow-y: hidden" scroll="no">
  <t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="table" action="sysagencyMenuController.do?save">
			<input id="id" name="id" type="hidden" value="${agencyMenuPage.id }">
			<table style="width: 600px;" cellpadding="0" cellspacing="1" class="formtable">
				<tr>
					<td align="right">
						<label class="Validform_label">
							中文名称:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="cnname" name="cnname" 
							   value="${agencyMenuPage.cnname}" datatype="*">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							英文名称:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="enname" name="enname" ignore="ignore"
							   value="${agencyMenuPage.enname}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							上级菜单:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="parentmenuid" name="parentmenuid" ignore="ignore"
							   value="${agencyMenuPage.parentmenuid}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							菜单地址:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="menuurl" name="menuurl" ignore="ignore"
							   value="${agencyMenuPage.menuurl}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							菜单图片:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="imageurl" name="imageurl" ignore="ignore"
							   value="${agencyMenuPage.imageurl}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							推荐排序:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="menuorder" name="menuorder" ignore="ignore"
							   value="${agencyMenuPage.menuorder}" datatype="n">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							菜单介绍:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="description" name="description" ignore="ignore"
							   value="${agencyMenuPage.description}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							添加时间:
						</label>
					</td>
					<td class="value">
						<input class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"  style="width: 150px" id="addtime" name="addtime" ignore="ignore"
							     value="<fmt:formatDate value='${agencyMenuPage.addtime}' type="date" pattern="yyyy-MM-dd hh:mm:ss"/>">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
			</table>
		</t:formvalid>
 </body>