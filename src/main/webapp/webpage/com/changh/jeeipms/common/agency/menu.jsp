<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
 <head>
  <title>机构菜单</title>
  <t:base type="jquery,easyui,tools,DatePicker"></t:base>
 </head>
 <body style="overflow-y: hidden" scroll="no">
  <t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="div" action="sysmenuController.do?save">
		<input id="id" name="id" type="hidden" value="${menuPage.id }">
		<fieldset class="step">
			<div class="form">
		      <label class="Validform_label">中文名称:</label>
		      <input class="inputxt" id="cnname" name="cnname" 
					   value="${menuPage.cnname}" datatype="*">
		      <span class="Validform_checktip"></span>
		    </div>
			<div class="form">
		      <label class="Validform_label">英文名称:</label>
		      <input class="inputxt" id="enname" name="enname" ignore="ignore"
					   value="${menuPage.enname}">
		      <span class="Validform_checktip"></span>
		    </div>
			<div class="form">
		      <label class="Validform_label">上级菜单:</label>
		      <input class="inputxt" id="parentmenuid" name="parentmenuid" ignore="ignore"
					   value="${menuPage.parentmenuid}">
		      <span class="Validform_checktip"></span>
		    </div>
			<div class="form">
		      <label class="Validform_label">菜单地址:</label>
		      <input class="inputxt" id="menuurl" name="menuurl" ignore="ignore"
					   value="${menuPage.menuurl}">
		      <span class="Validform_checktip"></span>
		    </div>
			<div class="form">
		      <label class="Validform_label">菜单图片:</label>
		      <input class="inputxt" id="imageurl" name="imageurl" ignore="ignore"
					   value="${menuPage.imageurl}">
		      <span class="Validform_checktip"></span>
		    </div>
			<div class="form">
		      <label class="Validform_label">推荐排序:</label>
		      <input class="inputxt" id="menuorder" name="menuorder" ignore="ignore"
					   value="${menuPage.menuorder}" datatype="n">
		      <span class="Validform_checktip"></span>
		    </div>
			<div class="form">
		      <label class="Validform_label">菜单介绍:</label>
		      <input class="inputxt" id="description" name="description" ignore="ignore"
					   value="${menuPage.description}">
		      <span class="Validform_checktip"></span>
		    </div>
			<div class="form">
		      <label class="Validform_label">添加时间:</label>
		      <input class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"  style="width: 150px" id="addtime" name="addtime" ignore="ignore"
					     value="<fmt:formatDate value='${menuPage.addtime}' type="date" pattern="yyyy-MM-dd hh:mm:ss"/>">
		      <span class="Validform_checktip"></span>
		    </div>
	    </fieldset>
  </t:formvalid>
 </body>