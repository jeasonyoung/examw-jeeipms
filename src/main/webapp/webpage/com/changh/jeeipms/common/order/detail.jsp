<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
 <head>
  <title>订单信息</title>
  <t:base type="jquery,easyui,tools,DatePicker"></t:base>
 </head>
 <script type="text/javascript">
  //初始化下标
	function resetTrNum(tableId) {
		$tbody = $("#"+tableId+"");
		$tbody.find('>tr').each(function(i){
			$(':input, select', this).each(function(){
				var $this = $(this), name = $this.attr('name'), val = $this.val();
				if(name!=null){
					if (name.indexOf("#index#") >= 0){
						$this.attr("name",name.replace('#index#',i));
					}else{
						var s = name.indexOf("[");
						var e = name.indexOf("]");
						var new_name = name.substring(s+1,e);
						$this.attr("name",name.replace(new_name,i));
					}
				}
			});
		});
	}
 </script>
 <body>
 <t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="div" action="courseOrderController.do?save">
		<input id="id" name="id" type="hidden" value="${courseOrderPage.id }">
		<fieldset class="step">
			<div class="form">
		      <label class="Validform_label">订单号:</label>
		      <input class="inputxt" id="orderCode" name="orderCode" 
					   value="${courseOrderPage.orderCode}" datatype="*">
		      <span class="Validform_checktip"></span>
		    </div>
			<div class="form">
		      <label class="Validform_label">订单类型:</label>
		      <input class="inputxt" id="orderType" name="orderType" ignore="ignore"
					   value="${courseOrderPage.orderType}" datatype="n">
		      <span class="Validform_checktip"></span>
		    </div>
			<div class="form">
		      <label class="Validform_label">订单状态:</label>
		      <input class="inputxt" id="orderStatus" name="orderStatus" 
					   value="${courseOrderPage.orderStatus}" datatype="n">
		      <span class="Validform_checktip"></span>
		    </div>
			<div class="form">
		      <label class="Validform_label">学员:</label>
		      <input class="inputxt" id="stuId" name="stuId" 
					   value="${courseOrderPage.stuId}" datatype="*">
		      <span class="Validform_checktip"></span>
		    </div>
			<div class="form">
		      <label class="Validform_label">支付现金:</label>
		      <input class="inputxt" id="orderCashmoney" name="orderCashmoney" ignore="ignore"
					   value="${courseOrderPage.orderCashmoney}" datatype="n">
		      <span class="Validform_checktip"></span>
		    </div>
			<div class="form">
		      <label class="Validform_label">支付学习卡:</label>
		      <input class="inputxt" id="orderCards" name="orderCards" ignore="ignore"
					   value="${courseOrderPage.orderCards}" datatype="n">
		      <span class="Validform_checktip"></span>
		    </div>
			<div class="form">
		      <label class="Validform_label">下单时间:</label>
		      <input class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"  style="width: 150px" id="orderAddtime" name="orderAddtime" 
					     value="<fmt:formatDate value='${courseOrderPage.orderAddtime}' type="date" pattern="yyyy-MM-dd hh:mm:ss"/>" datatype="*">
		      <span class="Validform_checktip"></span>
		    </div>
			<div class="form">
		      <label class="Validform_label">支付时间:</label>
		      <input class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"  style="width: 150px" id="orderPaytime" name="orderPaytime" ignore="ignore"
					     value="<fmt:formatDate value='${courseOrderPage.orderPaytime}' type="date" pattern="yyyy-MM-dd hh:mm:ss"/>">
		      <span class="Validform_checktip"></span>
		    </div>
			<div class="form">
		      <label class="Validform_label">联系人:</label>
		      <input class="inputxt" id="contactName" name="contactName" 
					   value="${courseOrderPage.contactName}" datatype="*">
		      <span class="Validform_checktip"></span>
		    </div>
			<div class="form">
		      <label class="Validform_label">手机:</label>
		      <input class="inputxt" id="telphone" name="telphone" ignore="ignore"
					   value="${courseOrderPage.telphone}">
		      <span class="Validform_checktip"></span>
		    </div>
			<div class="form">
		      <label class="Validform_label">总价(不含返款):</label>
		      <input class="inputxt" id="totalPrice" name="totalPrice" 
					   value="${courseOrderPage.totalPrice}" datatype="d">
		      <span class="Validform_checktip"></span>
		    </div>
			<div class="form">
		      <label class="Validform_label">返款:</label>
		      <input class="inputxt" id="returnPrice" name="returnPrice" ignore="ignore"
					   value="${courseOrderPage.returnPrice}" datatype="d">
		      <span class="Validform_checktip"></span>
		    </div>
			<div class="form">
		      <label class="Validform_label">备注:</label>
		      <input class="inputxt" id="orderContent" name="orderContent" ignore="ignore"
					   value="${courseOrderPage.orderContent}">
		      <span class="Validform_checktip"></span>
		    </div>
			<div class="form">
		      <label class="Validform_label">修改人:</label>
		      <input class="inputxt" id="modifier" name="modifier" ignore="ignore"
					   value="${courseOrderPage.modifier}">
		      <span class="Validform_checktip"></span>
		    </div>
			<div class="form">
		      <label class="Validform_label">修改人名字:</label>
		      <input class="inputxt" id="modifierName" name="modifierName" ignore="ignore"
					   value="${courseOrderPage.modifierName}">
		      <span class="Validform_checktip"></span>
		    </div>
			<div class="form">
		      <label class="Validform_label">修改时间:</label>
		      <input class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"  style="width: 150px" id="modifyDt" name="modifyDt" ignore="ignore"
					     value="<fmt:formatDate value='${courseOrderPage.modifyDt}' type="date" pattern="yyyy-MM-dd hh:mm:ss"/>">
		      <span class="Validform_checktip"></span>
		    </div>
			<div class="form">
		      <label class="Validform_label">删除标记:</label>
		      <input class="inputxt" id="delflag" name="delflag" ignore="ignore"
					   value="${courseOrderPage.delflag}" datatype="n">
		      <span class="Validform_checktip"></span>
		    </div>
			<div class="form">
		      <label class="Validform_label">删除时间:</label>
		      <input class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"  style="width: 150px" id="delDt" name="delDt" ignore="ignore"
					     value="<fmt:formatDate value='${courseOrderPage.delDt}' type="date" pattern="yyyy-MM-dd hh:mm:ss"/>">
		      <span class="Validform_checktip"></span>
		    </div>
	    </fieldset>
  </t:formvalid>
  <t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="table" tiptype="1" action="jeecgOrderMainController.do?save">
			<input id="id" name="id" type="hidden" value="${jeecgOrderMainPage.id }">
			<table  cellpadding="0" cellspacing="1" class="formtable">
				<tr>
					<td align="right">
						<label class="Validform_label">
							订单号:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="goOrderCode" name="goOrderCode" datatype="*"
							   value="${jeecgOrderMainPage.goOrderCode}">						
					</td>
					<td align="right">
						<label class="Validform_label">
							订单类型:
						</label>
					</td>
					<td class="value">
						<t:dictSelect field="goderType" typeGroupCode="order" hasLabel="false" defaultVal="${jeecgOrderMainPage.goderType}"></t:dictSelect>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							顾客类型 
						</label>
					</td>
					<td class="value">
						<t:dictSelect field="usertype" typeGroupCode="custom" hasLabel="false" defaultVal="${jeecgOrderMainPage.usertype}"></t:dictSelect>
					</td>
					<td align="right">
						<label class="Validform_label">
							联系人:
						</label>
					</td>
					<td class="value">
						<input nullmsg="联系人不能为空" errormsg="联系人格式不对" class="inputxt" id="goContactName" name="goContactName" 
							   value="${jeecgOrderMainPage.goContactName}" datatype="*">
						
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							手机:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="goTelphone" name="goTelphone" 
							   value="${jeecgOrderMainPage.goTelphone}" datatype="m" errormsg="手机号码不正确!"
							ignore="ignore">
						
					</td>
					<td align="right">
						<label class="Validform_label">
							订单人数:
						</label>
					</td>
					<td class="value">
						<input nullmsg="订单人数不能为空" errormsg="订单人数必须为数字" class="inputxt" id="goOrderCount" name="goOrderCount" 
							   value="${jeecgOrderMainPage.goOrderCount}" datatype="n">
						
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							总价(不含返款):
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="goAllPrice" name="goAllPrice" 
							   value="${jeecgOrderMainPage.goAllPrice}" datatype="d">
						
					</td>
					<td align="right">
						<label class="Validform_label">
							返款:
						</label>
					</td>
					<td class="value">
						<input nullmsg="返款不能为空" errormsg="返款格式不对" class="inputxt" id="goReturnPrice" name="goReturnPrice" 
							   value="${jeecgOrderMainPage.goReturnPrice}" datatype="d">
						
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							备注:
						</label>
					</td>
					<td class="value" colspan="3">
						<input class="inputxt" id="goContent" name="goContent" 
							   value="${jeecgOrderMainPage.goContent}">
						
					</td>
				</tr>
			</table>
			<div style="width: auto;height: 200px;">
				<%-- 增加一个div，用于调节页面大小，否则默认太小 --%>
				<div style="width:690px;height:1px;"></div>
				<t:tabs id="tt" iframe="false" tabPosition="top" fit="false">
				 <t:tab href="jeecgOrderMainController.do?jeecgOrderProductList&goOrderCode=${jeecgOrderMainPage.goOrderCode}" icon="icon-search" title="产品明细" id="Product"></t:tab>
				 <t:tab href="jeecgOrderMainController.do?jeecgOrderCustomList&goOrderCode=${jeecgOrderMainPage.goOrderCode}" icon="icon-search" title="客户明细" id="Custom"></t:tab>
				</t:tabs>
			</div>
		</t:formvalid>
		<!-- 添加 产品明细 模版 -->
		<table style="display:none">
		<tbody id="add_jeecgOrderProduct_table_template">
			<tr>
			 <td align="center"><input style="width:20px;" type="checkbox" name="ck"/></td>
			 <td align="left"><input nullmsg="请输入订单产品明细的产品名称！" datatype="s6-10"
							errormsg="订单产品明细的产品名称应该为6到10位" name="jeecgOrderProductList[#index#].gopProductName" maxlength="100" type="text" style="width:220px;"></td>
			 <td align="left"><input name="jeecgOrderProductList[#index#].gopCount" maxlength="" type="text" style="width:120px;"></td>
			 <td align="left">
<%--			 <input name="jeecgOrderProductList[#index#].gopProductType" maxlength="3" type="text" style="width:120px;">--%>
			 <t:dictSelect field="jeecgOrderProductList[#index#].gopProductType" typeGroupCode="service" hasLabel="false" ></t:dictSelect>
			 </td>
			 <td align="left"><input name="jeecgOrderProductList[#index#].gopOnePrice" maxlength="" type="text" style="width:120px;"></td>
			 <td align="left"><input name="jeecgOrderProductList[#index#].gopSumPrice" maxlength="" type="text" style="width:120px;"></td>
			 <td align="left"><input name="jeecgOrderProductList[#index#].gopContent" maxlength="200" type="text" style="width:120px;"></td>
			</tr>
		 </tbody>
		 <tbody id="add_jeecgOrderCustom_table_template">
			<tr>
				<td align="center"><input  style="width:20px;" type="checkbox" name="ck"/></td>
				<td align="left"><input name="jeecgOrderCustomList[#index#].gocCusName" maxlength="50" type="text"  style="width:220px;" ></td>
				<td align="left">
<%--				<input name="jeecgOrderCustomList[#index#].gocSex" maxlength="2" type="text"  style="width:120px;"/>--%>
				<t:dictSelect field="jeecgOrderCustomList[#index#].gocSex" typeGroupCode="sex" hasLabel="false" ></t:dictSelect>
				</td>
	            <td align="left"><input name="jeecgOrderCustomList[#index#].gocIdcard" maxlength="32" type="text"  style="width:120px;" ></td>
				<td align="left"><input name="jeecgOrderCustomList[#index#].gocPassportCode" maxlength="32" type="text"  style="width:120px;" ></td>
				<td align="left"><input name="jeecgOrderCustomList[#index#].gocBussContent" maxlength="100" type="text"  style="width:120px;" ></td>
				<td align="left"><input name="jeecgOrderCustomList[#index#].gocContent" maxlength="200" type="text"  style="width:120px;" ></td>
   			</tr>
		 </tbody>
		</table>
		
 </body>