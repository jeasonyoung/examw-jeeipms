<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
 <head>
  <title>导航菜单</title>
  <t:base type="jquery,easyui,tools,DatePicker"></t:base>
 </head>
 <body style="overflow-y: hidden" scroll="no">
  <t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="div" action="sysfrontMenuController.do?save">
		<input id="id" name="id" type="hidden" value="${frontMenuPage.id }">
		<fieldset class="step">
			<div class="form">
		      <label class="Validform_label">中文名称:</label>
		      <input class="inputxt" id="cnname" name="cnname" 
					   value="${frontMenuPage.cnname}" datatype="*">
		      <span class="Validform_checktip"></span>
		    </div>
			<div class="form">
		      <label class="Validform_label">英文名称:</label>
		      <input class="inputxt" id="enname" name="enname" ignore="ignore"
					   value="${frontMenuPage.enname}">
		      <span class="Validform_checktip"></span>
		    </div>
			<div class="form">
		      <label class="Validform_label">上级菜单:</label>
		      <input class="inputxt" id="parentmenuid" name="parentmenuid" ignore="ignore"
					   value="${frontMenuPage.parentmenuid}">
		      <span class="Validform_checktip"></span>
		    </div>
			<div class="form">
		      <label class="Validform_label">菜单地址:</label>
		      <input class="inputxt" id="menuurl" name="menuurl" ignore="ignore"
					   value="${frontMenuPage.menuurl}">
		      <span class="Validform_checktip"></span>
		    </div>
			<div class="form">
		      <label class="Validform_label">菜单图片:</label>
		      <input class="inputxt" id="imageurl" name="imageurl" ignore="ignore"
					   value="${frontMenuPage.imageurl}">
		      <span class="Validform_checktip"></span>
		    </div>
			<div class="form">
		      <label class="Validform_label">推荐排序:</label>
		      <input class="inputxt" id="menuorder" name="menuorder" ignore="ignore"
					   value="${frontMenuPage.menuorder}" datatype="n">
		      <span class="Validform_checktip"></span>
		    </div>
			<div class="form">
		      <label class="Validform_label">0:显示1:不显示:</label>
		      <input class="inputxt" id="status" name="status" ignore="ignore"
					   value="${frontMenuPage.status}" datatype="n">
		      <span class="Validform_checktip"></span>
		    </div>
			<div class="form">
		      <label class="Validform_label">菜单介绍:</label>
		      <input class="inputxt" id="description" name="description" ignore="ignore"
					   value="${frontMenuPage.description}">
		      <span class="Validform_checktip"></span>
		    </div>
			<div class="form">
		      <label class="Validform_label">添加时间:</label>
		      <input class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"  style="width: 150px" id="addtime" name="addtime" ignore="ignore"
					     value="<fmt:formatDate value='${frontMenuPage.addtime}' type="date" pattern="yyyy-MM-dd hh:mm:ss"/>">
		      <span class="Validform_checktip"></span>
		    </div>
	    </fieldset>
  </t:formvalid>
 </body>