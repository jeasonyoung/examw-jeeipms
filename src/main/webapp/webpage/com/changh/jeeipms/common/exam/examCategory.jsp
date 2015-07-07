<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
 <head>
  <title>考试类别</title>
  <t:base type="jquery,easyui,tools,DatePicker"></t:base>
 </head>
 <body style="overflow-y: hidden" scroll="no">
  <t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="div" action="sysexamCategoryController.do?save">
		<input id="id" name="id" type="hidden" value="${examCategoryPage.id }">
		<fieldset class="step">
			<div class="form">
		      <label class="Validform_label">考试类别:</label>
		      <input class="inputxt" id="classId" name="classId" 
					   value="${examCategoryPage.classId}" datatype="*">
		      <span class="Validform_checktip"></span>
		    </div>
			<div class="form">
		      <label class="Validform_label">考试英文名:</label>
		      <input class="inputxt" id="examEname" name="examEname" ignore="ignore"
					   value="${examCategoryPage.examEname}">
		      <span class="Validform_checktip"></span>
		    </div>
			<div class="form">
		      <label class="Validform_label">考试中文名:</label>
		      <input class="inputxt" id="examCname" name="examCname" ignore="ignore"
					   value="${examCategoryPage.examCname}">
		      <span class="Validform_checktip"></span>
		    </div>
			<div class="form">
		      <label class="Validform_label">上级考试:</label>
		      <input class="inputxt" id="parentId" name="parentId" ignore="ignore"
					   value="${examCategoryPage.parentId}">
		      <span class="Validform_checktip"></span>
		    </div>
			<div class="form">
		      <label class="Validform_label">下级数量:</label>
		      <input class="inputxt" id="childNum" name="childNum" ignore="ignore"
					   value="${examCategoryPage.childNum}" datatype="n">
		      <span class="Validform_checktip"></span>
		    </div>
			<div class="form">
		      <label class="Validform_label">删除标记:</label>
		      <input class="inputxt" id="delFlag" name="delFlag" ignore="ignore"
					   value="${examCategoryPage.delFlag}" datatype="n">
		      <span class="Validform_checktip"></span>
		    </div>
			<div class="form">
		      <label class="Validform_label">添加时间:</label>
		      <input class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"  style="width: 150px" id="addTime" name="addTime" 
					     value="<fmt:formatDate value='${examCategoryPage.addTime}' type="date" pattern="yyyy-MM-dd hh:mm:ss"/>" datatype="*">
		      <span class="Validform_checktip"></span>
		    </div>
			<div class="form">
		      <label class="Validform_label">排序:</label>
		      <input class="inputxt" id="orderId" name="orderId" ignore="ignore"
					   value="${examCategoryPage.orderId}" datatype="n">
		      <span class="Validform_checktip"></span>
		    </div>
			<div class="form">
		      <label class="Validform_label">描述:</label>
		      <input class="inputxt" id="examDesc" name="examDesc" ignore="ignore"
					   value="${examCategoryPage.examDesc}">
		      <span class="Validform_checktip"></span>
		    </div>
			<div class="form">
		      <label class="Validform_label">标题:</label>
		      <input class="inputxt" id="examTitle" name="examTitle" ignore="ignore"
					   value="${examCategoryPage.examTitle}">
		      <span class="Validform_checktip"></span>
		    </div>
			<div class="form">
		      <label class="Validform_label">关键字:</label>
		      <input class="inputxt" id="examKeywords" name="examKeywords" ignore="ignore"
					   value="${examCategoryPage.examKeywords}">
		      <span class="Validform_checktip"></span>
		    </div>
	    </fieldset>
  </t:formvalid>
 </body>