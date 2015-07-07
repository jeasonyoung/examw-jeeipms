<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
 <head>
  <title>账户明细</title>
  <t:base type="jquery,easyui,tools,DatePicker"></t:base>
 </head>
 <body style="overflow-y: hidden" scroll="no">
  <t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="table" action="systradeController.do?save">
			<input id="id" name="id" type="hidden" value="${tradePage.id }">
			<table style="width: 600px;" cellpadding="0" cellspacing="1" class="formtable">
				<tr>
					<td align="right">
						<label class="Validform_label">
							学员:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="stuId" name="stuId" ignore="ignore"
							   value="${tradePage.student.username}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							收入:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="income" name="income" ignore="ignore"
							   value="${tradePage.income}" datatype="d">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							支出:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="outlay" name="outlay" ignore="ignore"
							   value="${tradePage.outlay}" datatype="d">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							交易时间:
						</label>
					</td>
					<td class="value">
						<input class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"  style="width: 150px" id="tradeTime" name="tradeTime" ignore="ignore"
							     value="<fmt:formatDate value='${tradePage.tradeTime}' type="date" pattern="yyyy-MM-dd hh:mm:ss"/>">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							交易IP:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="tradeIp" name="tradeIp" ignore="ignore"
							   value="${tradePage.tradeIp}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							币种:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="tradeCurrency" name="tradeCurrency" ignore="ignore"
							   value="${tradePage.tradeCurrency}" datatype="n">
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
						<input class="inputxt" id="tradeContent" name="tradeContent" ignore="ignore"
							   value="${tradePage.tradeContent}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							现金结余:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="cashBalance" name="cashBalance" ignore="ignore"
							   value="${tradePage.cashBalance}" datatype="d">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							学习卡结余:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="cardBalance" name="cardBalance" ignore="ignore"
							   value="${tradePage.cardBalance}" datatype="d">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
			</table>
		</t:formvalid>
 </body>