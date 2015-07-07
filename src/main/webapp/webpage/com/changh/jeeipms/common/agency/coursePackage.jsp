<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
 <head>
  <title>课程套餐</title>
  <t:base type="jquery,easyui,tools,DatePicker"></t:base>
 </head>
 <body style="overflow-y: hidden" scroll="no">
  <t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="table" action="syscoursePackageController.do?save">
			<input id="id" name="id" type="hidden" value="${coursePackagePage.id }">
			<table style="width: 600px;" cellpadding="0" cellspacing="1" class="formtable">
				<tr>
					<td align="right">
						<label class="Validform_label">
							协议:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="dealId" name="dealId" ignore="ignore"
							   value="${coursePackagePage.dealId}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							套餐名称:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="pkgName" name="pkgName" 
							   value="${coursePackagePage.pkgName}" datatype="*">
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
						<input class="inputxt" id="pkgPrice" name="pkgPrice" 
							   value="${coursePackagePage.pkgPrice}" datatype="d">
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
						<input class="inputxt" id="goodPrice" name="goodPrice" 
							   value="${coursePackagePage.goodPrice}" datatype="d">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							介绍:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="pkgDescri" name="pkgDescri" 
							   value="${coursePackagePage.pkgDescri}" datatype="*">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							课时:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="pkgTime" name="pkgTime" ignore="ignore"
							   value="${coursePackagePage.pkgTime}" datatype="n">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							到期时间:
						</label>
					</td>
					<td class="value">
						<input class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"  style="width: 150px" id="dueTime" name="dueTime" ignore="ignore"
							     value="<fmt:formatDate value='${coursePackagePage.dueTime}' type="date" pattern="yyyy-MM-dd hh:mm:ss"/>">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							修改时间:
						</label>
					</td>
					<td class="value">
						<input class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"  style="width: 150px" id="updatetime" name="updatetime" ignore="ignore"
							     value="<fmt:formatDate value='${coursePackagePage.updatetime}' type="date" pattern="yyyy-MM-dd hh:mm:ss"/>">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							添加时间:
						</label>
					</td>
					<td class="value">
						<input class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"  style="width: 150px" id="addtime" name="addtime" ignore="ignore"
							     value="<fmt:formatDate value='${coursePackagePage.addtime}' type="date" pattern="yyyy-MM-dd hh:mm:ss"/>">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							添加人:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="addby" name="addby" ignore="ignore"
							   value="${coursePackagePage.addby}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							修改人:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="updateby" name="updateby" ignore="ignore"
							   value="${coursePackagePage.updateby}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
			</table>
		</t:formvalid>
 </body>