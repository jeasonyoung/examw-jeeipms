<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
 <head>
  <title>学习卡管理</title>
  <t:base type="jquery,easyui,tools,DatePicker"></t:base>
 </head>
 <body style="overflow-y: hidden" scroll="no">
  <t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="table" action="sysstudyCardController.do?save">
			<input id="id" name="id" type="hidden" value="${studyCardPage.id }">
			<table style="width: 600px;" cellpadding="0" cellspacing="1" class="formtable">
				<tr>
					<td align="right">
						<label class="Validform_label">
							卡号:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="cardNum" disabled="disabled"  name="cardNum" 
							   value="${studyCardPage.cardNum}" datatype="*">
						<input class="inputxt" type="hidden" id="stuId" name="stuId" ignore="ignore"
							   value="${studyCardPage.stuId}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							类型:
						</label>
					</td>
					<td class="value">
						<input type="radio" name="isfree" value="0" ${studyCardPage.isfree=='0'?'checked':''} checked>收费
						<input type="radio" name="isfree" value="1"} ${studyCardPage.isfree=='1'?'checked':''}/>免费
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
						<input class="inputxt" id="cardPassword" name="cardPassword" 
							   value="${studyCardPage.cardPassword}" datatype="*">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							面值:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="cardValue" name="cardValue" 
							   value="${studyCardPage.cardValue}" datatype="d">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							结余:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="cardBalance" name="cardBalance" ignore="ignore"
							   value="${studyCardPage.cardBalance}" datatype="d">
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
						<input class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"  style="width: 150px" id="addtime" name="addtime" 
							     value="<fmt:formatDate value='${studyCardPage.addtime}' type="date" pattern="yyyy-MM-dd hh:mm:ss"/>" datatype="*">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							过期时间:
						</label>
					</td>
					<td class="value">
						<input class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"  style="width: 150px" id="overtime" name="overtime" 
							     value="<fmt:formatDate value='${studyCardPage.overtime}' type="date" pattern="yyyy-MM-dd hh:mm:ss"/>" datatype="*">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							使用时间:
						</label>
					</td>
					<td class="value">
						<input class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"  style="width: 150px" id="usetime" name="usetime" ignore="ignore"
							     value="<fmt:formatDate value='${studyCardPage.usetime}' type="date" pattern="yyyy-MM-dd hh:mm:ss"/>">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
			</table>
		</t:formvalid>
 </body>