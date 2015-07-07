<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
 <head>
  <title>机构老师</title>
  <t:base type="jquery,easyui,tools,DatePicker"></t:base>
 </head>
 <body style="overflow-y: hidden" scroll="no">
  <t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="div" action="systeacherController.do?save">
		<input id="id" name="id" type="hidden" value="${teacherPage.id }">
		<fieldset class="step">
			<div class="form">
		      <label class="Validform_label">姓名:</label>
		      <input class="inputxt" id="realname" name="realname" 
					   value="${teacherPage.realname}" datatype="*">
		      <span class="Validform_checktip"></span>
		    </div>
			<div class="form">
		      <label class="Validform_label">所属机构:</label>
		      <input class="inputxt" id="agencyid" name="agencyid" 
					   value="${teacherPage.agencyid}" datatype="*">
		      <span class="Validform_checktip"></span>
		    </div>
			<div class="form">
		      <label class="Validform_label">头像:</label>
		      <input class="inputxt" id="imageurl" name="imageurl" ignore="ignore"
					   value="${teacherPage.imageurl}">
		      <span class="Validform_checktip"></span>
		    </div>
			<div class="form">
		      <label class="Validform_label">电话号码:</label>
		      <input class="inputxt" id="phone" name="phone" ignore="ignore"
					   value="${teacherPage.phone}">
		      <span class="Validform_checktip"></span>
		    </div>
			<div class="form">
		      <label class="Validform_label">联系QQ:</label>
		      <input class="inputxt" id="qq" name="qq" ignore="ignore"
					   value="${teacherPage.qq}">
		      <span class="Validform_checktip"></span>
		    </div>
			<div class="form">
		      <label class="Validform_label">电子邮箱:</label>
		      <input class="inputxt" id="email" name="email" ignore="ignore"
					   value="${teacherPage.email}">
		      <span class="Validform_checktip"></span>
		    </div>
			<div class="form">
		      <label class="Validform_label">推荐排序:</label>
		      <input class="inputxt" id="teacherorder" name="teacherorder" ignore="ignore"
					   value="${teacherPage.teacherorder}">
		      <span class="Validform_checktip"></span>
		    </div>
			<div class="form">
		      <label class="Validform_label">主要课程:</label>
		      <input class="inputxt" id="lessons" name="lessons" ignore="ignore"
					   value="${teacherPage.lessons}">
		      <span class="Validform_checktip"></span>
		    </div>
			<div class="form">
		      <label class="Validform_label">老师介绍:</label>
		      <input class="inputxt" id="description" name="description" ignore="ignore"
					   value="${teacherPage.description}">
		      <span class="Validform_checktip"></span>
		    </div>
			<div class="form">
		      <label class="Validform_label">添加时间:</label>
		      <input class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"  style="width: 150px" id="addtime" name="addtime" ignore="ignore"
					     value="<fmt:formatDate value='${teacherPage.addtime}' type="date" pattern="yyyy-MM-dd hh:mm:ss"/>">
		      <span class="Validform_checktip"></span>
		    </div>
	    </fieldset>
  </t:formvalid>
 </body>