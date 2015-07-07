<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
 <head>
  <title>课程类别</title>
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
			 	<div class="form">
			     <label class="Validform_label">
			      上级课程:
			     </label>
			    <input class="inputxt" id="category" name="category.id" value="${courseCategoryPage.category.id}">
			    </div>
			   <fieldset class="step">
			    <div class="form">
			     <label class="Validform_label">
			      课程名称:
			     </label>
			     <input name="categoryname" class="inputxt" value="${courseCategoryPage.categoryname}" datatype="s3-10">
			     <span class="Validform_checktip">课程名称在3~10位字符</span>
			    </div>
			    <div class="form">
			      <label class="Validform_label">
			      课程描述:
			     </label>
			     <input name="content" class="inputxt" value="${courseCategoryPage.content }">
			    </div>
			    <div class="form">
			      <label class="Validform_label">
			      课程排序:
			     </label>
			     <input name="categoryorder" class="inputxt" value="${courseCategoryPage.categoryorder }">
			      <span class="Validform_checktip">课程排序，越小越靠前</span>
			    </div>
			   </fieldset>
		</t:formvalid>
 </body>