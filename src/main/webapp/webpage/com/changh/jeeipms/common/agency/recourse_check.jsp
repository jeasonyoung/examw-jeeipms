<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
 <head>
  <title>审核操作</title>
  <t:base type="jquery,easyui,tools"></t:base>
 </head>
 <body>
  <div >
 	${recourse.content}
  </div>
  <t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="table" action="sysrecourseController.do?save">
			<input id="id" name="id" type="hidden" value="${recourse.id }">
			<table style="width: 600px;" cellpadding="0" cellspacing="1" class="formtable">
				<tr>
					<td align="right" width="15%" nowrap>
						<label class="Validform_label">
							审核结果:
						</label>
					</td>
					<td class="value" width="85%">
						<select name="status" width="104">
							<option value="1" selected="selected">审核通过</option>
							<option value="2">审核未过</option>
						</select>
						<span class="Validform_checktip"></span>
					</td>
				</tr>
			</table>
		</t:formvalid>
 </body>