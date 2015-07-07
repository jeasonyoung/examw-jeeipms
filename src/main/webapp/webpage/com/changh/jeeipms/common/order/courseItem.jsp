<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
 <head>
  <title>订单详细</title>
  <t:base type="jquery,easyui,tools,DatePicker"></t:base>
 </head>
 <body style="overflow-y: hidden" scroll="no">
  <t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="table" action="syscourseItemController.do?save">
			<input id="id" name="id" type="hidden" value="${courseItemPage.id }">
			<table style="width: 600px;" cellpadding="0" cellspacing="1" class="formtable">
				<tr>
					<td align="right">
						<label class="Validform_label">
							所属订单:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="orderId" name="orderId" 
							   value="${courseItemPage.orderId}" datatype="*">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							课程:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="courseId" name="courseId" 
							   value="${courseItemPage.courseId}" datatype="*">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							课程名称:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="courseName" name="courseName" 
							   value="${courseItemPage.courseName}" datatype="*">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							原价:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="itemOprice" name="itemOprice" ignore="ignore"
							   value="${courseItemPage.itemOprice}" datatype="d">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							优惠价格:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="itemRprice" name="itemRprice" ignore="ignore"
							   value="${courseItemPage.itemRprice}" datatype="d">
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
						<input class="inputxt" id="itemContent" name="itemContent" ignore="ignore"
							   value="${courseItemPage.itemContent}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
			</table>
		</t:formvalid>
 </body>