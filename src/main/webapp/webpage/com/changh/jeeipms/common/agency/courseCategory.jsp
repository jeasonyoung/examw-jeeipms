<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
 <head>
  <title>课程分类</title>
  <t:base type="jquery,easyui,tools"></t:base>
   <script type="text/javascript">
	$(function() {
		$('#category').combotree({
			url : 'syscourseCategoryController.do?setPcourse'
		});
	});
</script>
 </head>
 <body style="overflow-y: hidden" scroll="no">
  <t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="div" action="syscourseCategoryController.do?save">
		<input id="id" name="id" type="hidden" value="${courseCategoryPage.id }">
		<fieldset class="step">
			<div class="form">
		      <label class="Validform_label">课程名称:</label>
		      <input class="inputxt" id="categoryname" name="categoryname" 
					   value="${courseCategoryPage.categoryname}" datatype="s2-10">
		     <span class="Validform_checktip">课程名称在2~10位字符</span>
		    </div>
		    <div class="form">
			  <label class="Validform_label">上级课程:</label>
			   <input class="inputxt" id="category" name="category.id" value="${courseCategoryPage.category.id}">
			 </div>
			<div class="form">
		      <label class="Validform_label">图标:</label>
		      <input class="inputxt" id="image" name="image" ignore="ignore"
					   value="${courseCategoryPage.image}">
		      <span class="Validform_checktip"></span>
		    </div>
			<div class="form">
		      <label class="Validform_label">链接地址:</label>
		      <input class="inputxt" id="href" name="href" ignore="ignore"
					   value="${courseCategoryPage.href}">
		      <span class="Validform_checktip"></span>
		    </div>
			<div class="form">
		      <label class="Validform_label">目标:</label>
		      <input class="inputxt" id="target" name="target" ignore="ignore"
					   value="${courseCategoryPage.target}">
		      <span class="Validform_checktip"></span>
		    </div>
			<div class="form">
		      <label class="Validform_label">首页显示:</label>
		      <input class="inputxt" id="inmenu" name="inmenu" ignore="ignore"
					   value="${courseCategoryPage.inmenu}" datatype="n">
		      <span class="Validform_checktip"></span>
		    </div>
			<div class="form">
		      <label class="Validform_label">备注:</label>
		      <input class="inputxt" id="content" name="content" ignore="ignore"
					   value="${courseCategoryPage.content}">
		      <span class="Validform_checktip"></span>
		    </div>
			<div class="form">
		      <label class="Validform_label">排序:</label>
		      <input class="inputxt" id="categoryorder" name="categoryorder" ignore="ignore"
					   value="${courseCategoryPage.categoryorder}">
		      <span class="Validform_checktip"></span>
		    </div>
	    </fieldset>
  </t:formvalid>
 </body>