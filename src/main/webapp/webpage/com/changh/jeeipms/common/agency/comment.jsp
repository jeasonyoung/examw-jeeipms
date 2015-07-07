<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
 <head>
  <title>课程评论</title>
  <t:base type="jquery,easyui,tools,DatePicker"></t:base>
 </head>
 <body style="overflow-y: hidden" scroll="no">
  <t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="div" action="syscommentController.do?save">
		<input id="id" name="id" type="hidden" value="${commentPage.id }">
		<fieldset class="step">
			<div class="form">
		      <label class="Validform_label">评论内容:</label>
		      <input class="inputxt" id="content" name="content" 
					   value="${commentPage.content}" datatype="*">
		      <span class="Validform_checktip"></span>
		    </div>
			<div class="form">
		      <label class="Validform_label">评论课程:</label>
		      <input class="inputxt" id="courseid" name="courseid" 
					   value="${commentPage.courseid}" datatype="*">
		      <span class="Validform_checktip"></span>
		    </div>
			<div class="form">
		      <label class="Validform_label">评分:</label>
		      <input class="inputxt" id="coursescore" name="coursescore" 
					   value="${commentPage.coursescore}" datatype="d">
		      <span class="Validform_checktip"></span>
		    </div>
			<div class="form">
		      <label class="Validform_label">状态:</label>
		      <input class="inputxt" id="status" name="status" ignore="ignore"
					   value="${commentPage.status}" datatype="n">
		      <span class="Validform_checktip"></span>
		    </div>
			<div class="form">
		      <label class="Validform_label">排序:</label>
		      <input class="inputxt" id="commentorder" name="commentorder" ignore="ignore"
					   value="${commentPage.commentorder}" datatype="n">
		      <span class="Validform_checktip"></span>
		    </div>
			<div class="form">
		      <label class="Validform_label">时间:</label>
		      <input class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"  style="width: 150px" id="addtime" name="addtime" ignore="ignore"
					     value="<fmt:formatDate value='${commentPage.addtime}' type="date" pattern="yyyy-MM-dd hh:mm:ss"/>">
		      <span class="Validform_checktip"></span>
		    </div>
			<div class="form">
		      <label class="Validform_label">评论人ID:</label>
		      <input class="inputxt" id="stuid" name="stuid" ignore="ignore"
					   value="${commentPage.stuid}">
		      <span class="Validform_checktip"></span>
		    </div>
			<div class="form">
		      <label class="Validform_label">评论人姓名:</label>
		      <input class="inputxt" id="stuname" name="stuname" ignore="ignore"
					   value="${commentPage.stuname}">
		      <span class="Validform_checktip"></span>
		    </div>
			<div class="form">
		      <label class="Validform_label">IP地址:</label>
		      <input class="inputxt" id="ip" name="ip" ignore="ignore"
					   value="${commentPage.ip}">
		      <span class="Validform_checktip"></span>
		    </div>
	    </fieldset>
  </t:formvalid>
 </body>