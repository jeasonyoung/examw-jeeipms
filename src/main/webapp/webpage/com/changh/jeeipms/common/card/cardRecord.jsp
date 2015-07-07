<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
 <head>
  <title>学习卡流水</title>
  <t:base type="jquery,easyui,tools,DatePicker"></t:base>
 </head>
 <body style="overflow-y: hidden" scroll="no">
  <t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="table" action="syscardRecordController.do?save">
			<input id="id" name="id" type="hidden" value="${cardRecordPage.id }">
			<table style="width: 600px;" cellpadding="0" cellspacing="1" class="formtable">
				<tr>
					<td align="right">
						<label class="Validform_label">
							学员:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="stuId" name="stuId" ignore="ignore"
							   value="${cardRecordPage.stuId}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							卡号:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="cardId" name="cardId" 
							   value="${cardRecordPage.cardId}" datatype="*">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							涉及金额:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="recordValue" name="recordValue" 
							   value="${cardRecordPage.recordValue}" datatype="d">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							操作时间:
						</label>
					</td>
					<td class="value">
						<input class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"  style="width: 150px" id="useTime" name="useTime" ignore="ignore"
							     value="<fmt:formatDate value='${cardRecordPage.useTime}' type="date" pattern="yyyy-MM-dd hh:mm:ss"/>">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							操作内容:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="userContent" name="userContent" ignore="ignore"
							   value="${cardRecordPage.userContent}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							备注:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="recordContent" name="recordContent" ignore="ignore"
							   value="${cardRecordPage.recordContent}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
			</table>
		</t:formvalid>
 </body>