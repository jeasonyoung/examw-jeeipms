<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
 <head>
  <title>机构课程</title>
  <t:base type="jquery,easyui,tools,DatePicker"></t:base>
 </head>
 <body style="overflow-y: hidden" scroll="no">
  <t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="table" action="syscourseController.do?save">
			<input id="id" name="id" type="hidden" value="${coursePage.id }">
			<input type="hidden" id="agency.id" name="agency.id" value="${coursePage.agency.id}"> 
			<input type="hidden" id="category.id" name="category.id" value="${coursePage.category.id}"> 
			<input type="hidden" id="city.id" name="city.id" value="${coursePage.city.id}"> 
			<table style="width: 600px;" cellpadding="0" cellspacing="1" class="formtable">
				<tr>
					<td align="right">
						<label class="Validform_label">
							课程名称:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="coursename" name="coursename" 
							   value="${coursePage.coursename}" datatype="*">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							是否免费:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="isfree" name="isfree" ignore="ignore"
							   value="${coursePage.isfree}" datatype="n">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							试听地址:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="audition" name="audition" ignore="ignore"
							   value="${coursePage.audition}">
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
						<input class="inputxt" id="price" name="price" ignore="ignore"
							   value="${coursePage.price}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							优惠价:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="favorableprice" name="favorableprice" ignore="ignore"
							   value="${coursePage.favorableprice}">
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
						<input class="inputxt" id="content" name="content" ignore="ignore"
							   value="${coursePage.content}">
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
						<input class="inputxt" id="status" name="status" ignore="ignore"
							   value="${coursePage.status}" datatype="n">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
			</table>
		</t:formvalid>
 </body>