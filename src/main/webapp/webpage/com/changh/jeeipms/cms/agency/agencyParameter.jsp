<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
 <head>
  <title>机构统计</title>
  <t:base type="jquery,easyui,tools,DatePicker"></t:base>
 </head>
 <body style="overflow-y: hidden" scroll="no">
  <t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="table" action="sysagencyParameterController.do?save">
			<input id="id" name="id" type="hidden" value="${agencyParameterPage.id }">
			<input class="inputxt" id="provinceid" type="hidden" name="province.id"  value="${agencyParameterPage.province.id}" >
			<input class="inputxt" id="cityid" type="hidden" name="city.id" value="${agencyParameterPage.city.id}" >
			<input class="inputxt" id="areaid" name="area.id" type="hidden" value="${agencyParameterPage.area.id}" >
			<table style="width: 600px;" cellpadding="0" cellspacing="1" class="formtable">
				<tr>
					<td align="right">
						<label class="Validform_label">
							公司名称:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="name" name="name" ignore="ignore"
							   value="${agencyParameterPage.name}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							推荐度:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="recommend" name="recommend" ignore="ignore"
							   value="${agencyParameterPage.recommend}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							活跃度:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="liveness" name="liveness" ignore="ignore"
							   value="${agencyParameterPage.liveness}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							访问量:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="pageview" name="pageview" ignore="ignore"
							   value="${agencyParameterPage.pageview}">
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
						<input class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"  style="width: 150px" id="expirationdate" name="expirationdate" ignore="ignore"
							     value="<fmt:formatDate value='${agencyParameterPage.expirationdate}' type="date" pattern="yyyy-MM-dd hh:mm:ss"/>">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							0:普通用户1:会员:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="vip" name="vip" ignore="ignore"
							   value="${agencyParameterPage.vip}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							等级:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="grade" name="grade" ignore="ignore"
							   value="${agencyParameterPage.grade}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							积分:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="score" name="score" ignore="ignore"
							   value="${agencyParameterPage.score}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							金币:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="currency" name="currency" ignore="ignore"
							   value="${agencyParameterPage.currency}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
			</table>
		</t:formvalid>
 </body>