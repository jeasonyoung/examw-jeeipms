<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
 <head>
  <title>机构管理</title>
  <t:base type="jquery,area,easyui,tools,DatePicker"></t:base>
 </head>
 <body style="overflow-y: hidden" scroll="no">
  <t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="table" action="sysagencyController.do?save">
			<input id="id" name="id" type="hidden" value="${agencyPage.id }">
			<table style="width: 600px;" cellpadding="0" cellspacing="1" class="formtable">
				<tr>
					<td align="right">
						<label class="Validform_label">
							公司名称:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="name" name="name" ignore="ignore"
							   value="${agencyPage.name}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							公司简称:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="abbreviation" name="abbreviation" ignore="ignore"
							   value="${agencyPage.abbreviation}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
						选择地区:
						</label>
					</td>
					<td class="value">
						<span id="demo1"  style="display:inline-block"></span>
						<span class="Validform_checktip"></span>
						<input class="inputxt" id="provinceid" type="hidden" name="province.id"  value="${agencyPage.province.id}" datatype="*">
						<input class="inputxt" id="cityid" type="hidden" name="city.id" value="${agencyPage.city.id}" datatype="*">
						<input class="inputxt" id="areaid" name="area.id" type="hidden" value="${agencyPage.area.id}" datatype="*">
					</td>
			    </tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							关键字:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="keywords" name="keywords" ignore="ignore"
							   value="${agencyPage.keywords}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							培训类别:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="category" name="category" ignore="ignore"
							   value="${agencyPage.category}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							公司地址:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="address" name="address" ignore="ignore"
							   value="${agencyPage.address}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							办公电话:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="officephone" name="officephone" ignore="ignore"
							   value="${agencyPage.officephone}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							传真:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="fax" name="fax" ignore="ignore"
							   value="${agencyPage.fax}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							公司简介:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="introduction" name="introduction" ignore="ignore"
							   value="${agencyPage.introduction}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							注册时间:
						</label>
					</td>
					<td class="value">
						<input class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"  style="width: 150px" id="createTime" name="createTime" ignore="ignore"
							     value="<fmt:formatDate value='${agencyPage.createTime}' type="date" pattern="yyyy-MM-dd hh:mm:ss"/>">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							备注:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="content" name="content" ignore="ignore"
							   value="${agencyPage.content}" datatype="*">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							二级域名:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="secondDomain" name="secondDomain" ignore="ignore"
							   value="${agencyPage.secondDomain}" datatype="/[0-9a-z]{4,20}/" ajaxurl="sysagencyController.do?checkSecondDomain&value=${agencyPage.secondDomain}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
			</table>
		</t:formvalid>
	<script type="text/javascript">
		$("#demo1").chinaprovinces({
		province: "${agencyPage.province.id}",  //默认的省份<br />      
		city:'${agencyPage.city.id}',       //默认的城市<br />      
		area: '${agencyPage.area.id}',      //默认的区
		valueType:'id',
		change:function(province,city,area){
			$("#provinceid").val(province);
			$("#cityid").val(city);
			$("#areaid").val(area);
		}});
	</script>
 </body>