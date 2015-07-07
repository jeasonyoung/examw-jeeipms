<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
 <head>
  <title>考试宝典</title>
  <t:base type="jquery,easyui,tools,DatePicker"></t:base>
 </head>
 <body style="overflow-y: hidden" scroll="no">
  <t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="div" action="syskSBDController.do?save">
		<input id="id" name="id" type="hidden" value="${kSBDPage.id }">
		<fieldset class="step">
			<div class="form">
		      <label class="Validform_label">考试类别:</label>
		      <input class="inputxt" id="classId" name="classId" 
					   value="${kSBDPage.classId}" datatype="*">
		      <span class="Validform_checktip"></span>
		    </div>
			<div class="form">
		      <label class="Validform_label">宝典英文名:</label>
		      <input class="inputxt" id="ksbdEname" name="ksbdEname" ignore="ignore"
					   value="${kSBDPage.ksbdEname}">
		      <span class="Validform_checktip"></span>
		    </div>
			<div class="form">
		      <label class="Validform_label">宝典中文名:</label>
		      <input class="inputxt" id="ksbdCname" name="ksbdCname" ignore="ignore"
					   value="${kSBDPage.ksbdCname}">
		      <span class="Validform_checktip"></span>
		    </div>
			<div class="form">
		      <label class="Validform_label">价格:</label>
		      <input class="inputxt" id="price" name="price" ignore="ignore"
					   value="${kSBDPage.price}" datatype="d">
		      <span class="Validform_checktip"></span>
		    </div>
			<div class="form">
		      <label class="Validform_label">版本:</label>
		      <input class="inputxt" id="ksbdVersion" name="ksbdVersion" ignore="ignore"
					   value="${kSBDPage.ksbdVersion}">
		      <span class="Validform_checktip"></span>
		    </div>
			<div class="form">
		      <label class="Validform_label">优惠价:</label>
		      <input class="inputxt" id="goodPrice" name="goodPrice" ignore="ignore"
					   value="${kSBDPage.goodPrice}" datatype="d">
		      <span class="Validform_checktip"></span>
		    </div>
			<div class="form">
		      <label class="Validform_label">保存路径:</label>
		      <input class="inputxt" id="savepath" name="savepath" 
					   value="${kSBDPage.savepath}" datatype="*">
		      <span class="Validform_checktip"></span>
		    </div>
			<div class="form">
		      <label class="Validform_label">试题数:</label>
		      <input class="inputxt" id="questionNum" name="questionNum" ignore="ignore"
					   value="${kSBDPage.questionNum}" datatype="n">
		      <span class="Validform_checktip"></span>
		    </div>
			<div class="form">
		      <label class="Validform_label">下载次数:</label>
		      <input class="inputxt" id="downNum" name="downNum" ignore="ignore"
					   value="${kSBDPage.downNum}" datatype="n">
		      <span class="Validform_checktip"></span>
		    </div>
			<div class="form">
		      <label class="Validform_label">更新时间:</label>
		      <input class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"  style="width: 150px" id="updateTime" name="updateTime" 
					     value="<fmt:formatDate value='${kSBDPage.updateTime}' type="date" pattern="yyyy-MM-dd hh:mm:ss"/>" datatype="*">
		      <span class="Validform_checktip"></span>
		    </div>
			<div class="form">
		      <label class="Validform_label">电信下载:</label>
		      <input class="inputxt" id="dxUrl" name="dxUrl" ignore="ignore"
					   value="${kSBDPage.dxUrl}">
		      <span class="Validform_checktip"></span>
		    </div>
			<div class="form">
		      <label class="Validform_label">网通下载:</label>
		      <input class="inputxt" id="wtUrl" name="wtUrl" ignore="ignore"
					   value="${kSBDPage.wtUrl}">
		      <span class="Validform_checktip"></span>
		    </div>
			<div class="form">
		      <label class="Validform_label">宝典简介:</label>
		      <input class="inputxt" id="ksbdDescr" name="ksbdDescr" ignore="ignore"
					   value="${kSBDPage.ksbdDescr}">
		      <span class="Validform_checktip"></span>
		    </div>
			<div class="form">
		      <label class="Validform_label">宝典介绍:</label>
		      <input class="inputxt" id="ksbdIntro" name="ksbdIntro" ignore="ignore"
					   value="${kSBDPage.ksbdIntro}">
		      <span class="Validform_checktip"></span>
		    </div>
			<div class="form">
		      <label class="Validform_label">关键字:</label>
		      <input class="inputxt" id="keywords" name="keywords" ignore="ignore"
					   value="${kSBDPage.keywords}">
		      <span class="Validform_checktip"></span>
		    </div>
			<div class="form">
		      <label class="Validform_label">模板:</label>
		      <input class="inputxt" id="ksbdTemp" name="ksbdTemp" ignore="ignore"
					   value="${kSBDPage.ksbdTemp}">
		      <span class="Validform_checktip"></span>
		    </div>
			<div class="form">
		      <label class="Validform_label">添加时间:</label>
		      <input class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"  style="width: 150px" id="addTime" name="addTime" 
					     value="<fmt:formatDate value='${kSBDPage.addTime}' type="date" pattern="yyyy-MM-dd hh:mm:ss"/>" datatype="*">
		      <span class="Validform_checktip"></span>
		    </div>
			<div class="form">
		      <label class="Validform_label">标题:</label>
		      <input class="inputxt" id="ksbdTitle" name="ksbdTitle" 
					   value="${kSBDPage.ksbdTitle}" datatype="*">
		      <span class="Validform_checktip"></span>
		    </div>
			<div class="form">
		      <label class="Validform_label">历年真题:</label>
		      <input class="inputxt" id="realQuestion" name="realQuestion" ignore="ignore"
					   value="${kSBDPage.realQuestion}" datatype="n">
		      <span class="Validform_checktip"></span>
		    </div>
			<div class="form">
		      <label class="Validform_label">是否解析:</label>
		      <input class="inputxt" id="ifAnalysis" name="ifAnalysis" ignore="ignore"
					   value="${kSBDPage.ifAnalysis}" datatype="n">
		      <span class="Validform_checktip"></span>
		    </div>
			<div class="form">
		      <label class="Validform_label">图片地址:</label>
		      <input class="inputxt" id="imgUrl" name="imgUrl" ignore="ignore"
					   value="${kSBDPage.imgUrl}">
		      <span class="Validform_checktip"></span>
		    </div>
			<div class="form">
		      <label class="Validform_label">域名:</label>
		      <input class="inputxt" id="ksbdDomain" name="ksbdDomain" ignore="ignore"
					   value="${kSBDPage.ksbdDomain}">
		      <span class="Validform_checktip"></span>
		    </div>
	    </fieldset>
  </t:formvalid>
 </body>