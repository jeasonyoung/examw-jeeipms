<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
 <head>
  <title>机构管理</title>
  <t:base type="jquery,easyui,tools"></t:base>
 </head>
 <body style="overflow-y: hidden" scroll="no">
  <t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="table" action="/systradeController.do?save">
			<table style="width: 600px;" cellpadding="0" cellspacing="1" class="formtable">
				<input type="hidden" value="${stu.id}" name="student.id">
				<input type="hidden" value="0" name="tradeCurrency">
			<table width="500px" height="200" border='0' cellpadding='2' cellspacing='1' class='x_table'>
			   <tr>
			    <td height="36" colspan="2" align="center" bgcolor="#F4F4F4"><strong style="font-size:14px; color:#F00">充值现金券&nbsp;&nbsp;注：充值输入正数,扣费输入负数</strong ></td>
			   </tr>
			  <tr>
			    <td height="36" align="right"><strong>会员信息：</strong></td>
			    <td>&nbsp;<b style="color:red;">${stu.username}</b>&nbsp;&nbsp; </td>
			  </tr>
			  <tr>
			    <td width="35%" height="36" align="right"><strong>帐户余额：</strong></td>
			    <td >现金券 <font class="red"><fmt:formatNumber value="${stu.cash}" pattern="####.00" /></font> 元
			    </td>
			  </tr>
			  <tr>
			    <td height="36" align="right"><strong style="font-size:14px">添加</strong><strong>现金券：</strong></td>
			    <td>
			    	<input id="money" type="text" name="income"  style="border:1px solid #0000BB;width: 100px;"  onblur="checkMoney()">元 
			    	<span id="msg" style="color:red">充值输入正数,扣费输入负数</span>
			    </td>
			  </tr>
			  <tr>
			  	<td height="36" align="right"><strong>备注：</strong></td>
			  	<td><textarea id="content" type="text" name="tradeContent"   style="width:300px;border:1px solid #0000BB;"></textarea></td>
			  </tr>
			</table>
			</table>
		</t:formvalid>
 </body>
<style type="text/css"> 
<!--
.x_table   {border-top:solid 1px #ccc;border-left:solid 1px #ccc;}
.x_table .xtr{ font-weight:bold;background:url(bg_list01_th.gif) repeat-x bottom;height:26px;line-height:26px; text-align:center;}
.x_table .xtr02{font-weight:bold;background:url(bg_list01_th.gif) repeat-x bottom; text-align:left;font-size:14px;line-height:30px;}
.x_table td{border-bottom:solid 1px #ccc; border-right:solid 1px #ccc; padding:0 5px; font-size:12px; line-height:22px;}
.x_table .tdbg{background:#fff;}
.x_table .tdbgmouseover{background:#f4f4f4;}
.red{ color:#F00; font:bold}
-->
</style>
<script type="text/javascript">
	function checkMoney()
	{
		var money = $("#money").val();
		if(!money||!$.trim(money))
		{
			$("#msg").html("请输入充值金额");
			return false;
		}
		if(/^[-]?[0-9]+[.]?[0-9]{0,2}$/.test(money))
		{
			if(Number(money)==0)
			{
				$("#msg").html("不要只输入0");
				return false;
			}
			if(Number(money)+Number("${stu.cash}")<0)
			{
				$("#msg").html("没那多钱扣");
				return flase;
			}
			$("#msg").html("");
			return true;
		}else
		{
			return false;
		}
		
	}
</script>
