<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
 <head>
  <title>合作网校</title>
  <t:base type="jquery,easyui,tools,DatePicker"></t:base>
 </head>
 <body style="overflow-y: hidden" scroll="no">
  <t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="table" action="sysschoolController.do?save">
			<input id="id" name="id" type="hidden" value="${schoolPage.id }">
			<table style="width: 600px;" cellpadding="0" cellspacing="1" class="formtable">
				<tr>
					<td align="right">
						<label class="Validform_label">
							密钥:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="scKey" name="scKey" 
							   value="${schoolPage.scKey}" datatype="*">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							网址:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="scUrl" name="scUrl" 
							   value="${schoolPage.scUrl}" datatype="*">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							接口:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="scInterface" name="scInterface" 
							   value="${schoolPage.scInterface}" datatype="*">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							网站名称:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="scName" name="scName" ignore="ignore"
							   value="${schoolPage.scName}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							修改时间:
						</label>
					</td>
					<td class="value">
						<input class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"  style="width: 150px" id="updatetime" name="updatetime" ignore="ignore"
							     value="<fmt:formatDate value='${schoolPage.updatetime}' type="date" pattern="yyyy-MM-dd hh:mm:ss"/>">
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
							     value="<fmt:formatDate value='${schoolPage.addtime}' type="date" pattern="yyyy-MM-dd hh:mm:ss"/>">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							添加人:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="addby" name="addby" ignore="ignore"
							   value="${schoolPage.addby}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							修改人:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="updateby" name="updateby" ignore="ignore"
							   value="${schoolPage.updateby}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
			</table>
		</t:formvalid>
 </body>