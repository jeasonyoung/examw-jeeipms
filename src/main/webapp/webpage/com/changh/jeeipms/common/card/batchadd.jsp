<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
 <head>
  <title>批量添加</title>
  <t:base type="jquery,easyui,tools,DatePicker"></t:base>
 </head>
 <body style="overflow-y: hidden" scroll="no">
  <t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="table" action="sysstudyCardController.do?batchadd">
			<input id="id" name="id" type="hidden" value="${studyCardPage.id }">
			<table style="width: 600px;" cellpadding="0" cellspacing="1" class="formtable">
				<tr>
					<td align="right">
						<label class="Validform_label">
							面值:
						</label>
					</td>
					<td class="value">
						<select name="cardvalue" width="104"  onchange=”this.parentNode.nextSibling.value=this.value”>
							<option value="100">100</option>
							<option value="200">200</option>
							<option value="500" selected="selected">500</option>
							<option value="1000">1000</option>
							<option value="2000">2000</option>
							<option value="5000">5000</option>
							<option value="20000">20000</option>
						</select>
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							数量:
						</label>
					</td>
					<td class="value">
						<input class="inputxt"  name="number" ignore="ignore" "datatype="*">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							有效期限:
						</label>
					</td>
					<td class="value">
						<select name="expiration" width="104"  onchange=”this.parentNode.nextSibling.value=this.value”>
							<option value="3">三个月</option>
							<option value="6">半年</option>
							<option value="12">一年</option>
							<option value="24" selected="selected">两年</option>
							<option value="36">三年</option>
						</select>
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
						<input type="radio" name="isfree" value="0"  checked>收费
						<input type="radio" name="isfree" value="1"}/>免费
						<span class="Validform_checktip"></span>
					</td>
				</tr>
			</table>
		</t:formvalid>
 </body>