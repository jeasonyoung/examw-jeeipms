<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
 <head>
  <title>地区管理</title>
  <t:base type="jquery,easyui,tools,DatePicker"></t:base>
 </head>
 <body style="overflow-y: hidden" scroll="no">
  <t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="table" action="areaController.do?save">
			<input id="id" name="id" type="hidden" value="${areaPage.id }">
			<table style="width: 600px;" cellpadding="0" cellspacing="1" class="formtable">
				<tr>
					<td align="right">
						<label class="Validform_label">
							地区编码:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="areaid" name="areaid" 
							   value="${areaPage.areaid}" datatype="n">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							地区名称:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="area" name="area" 
							   value="${areaPage.area}" datatype="*">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							所属城市:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="fatherid" name="fatherid" 
							   value="${areaPage.fatherid}" datatype="n">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
			</table>
		</t:formvalid>
 </body>