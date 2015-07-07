<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
 <head>
  <title>修改返款</title>
  <t:base type="jquery,easyui,tools"></t:base>
 </head>
 <style type="text/css"> 
	.SearchBtnStyle {
	border: 1px solid #000000;
	}
	.menu {
		position:absolute;
		background: menu;
		border-top: 1px solid buttonhighlight;
		border-left: 1px solid buttonhighlight;
		border-bottom: 2px solid buttonshadow;
		border-right: 2px solid buttonshadow;
		padding: 2px;
		font: menu;
		cursor:default;
		font-size:9pt;
		width:90pt;
		visibility: hidden;
		z-index: 2;
		overflow: visible;
	}
	.menushow {
		position:absolute;
		visibility:visible;
		background:#EFEFEF;
		border-top: 1px solid #000000;
		border-left: 1px solid #000000;
		border-bottom: 1px solid #000000;
		border-right: 1px solid #000000;
		padding:0px;
		font: 9pt "menu";
		cursor:default;
		width:50pt;	
	}
	.x_table   {border-top:solid 1px #ccc;border-left:solid 1px #ccc;}
	.x_table .xtr{ font-weight:bold;background:url(bg_list01_th.gif) repeat-x bottom;height:26px;line-height:26px; text-align:center;}
	.x_table .xtr02{font-weight:bold;background:url(bg_list01_th.gif) repeat-x bottom; text-align:left;font-size:14px;line-height:30px;}
	.x_table td{border-bottom:solid 1px #ccc; border-right:solid 1px #ccc; padding:0 5px; font-size:12px; line-height:22px;}
	.x_table .tdbg{background:#fff;}
	.x_table .tdbgmouseover{background:#f4f4f4;}
	.red{ color:#F00; font:bold}
</style>
 <body style="overflow-y: hidden" scroll="no">
  <t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="table" action="/sysorderController.do?update">
	<table width="400" height="200" border='0' cellpadding='2' cellspacing='1' class='x_table'>
	  <tr>
	    <td height="36" colspan="2" align="center" bgcolor="#F4F4F4"><strong style="font-size:14px">修改订单返款（优惠金额）</strong></td>
	  </tr>
	  <tr>
	    <td height="36" align="right"><strong>订单号：</strong></td>
	    <td>&nbsp;<b style="color:red;">${order.orderCode }</b>&nbsp;&nbsp; </td>
	  </tr>
	  <tr>
	    <td width="35%" height="36" align="right"><strong>订单总金额：</strong></td>
	    <td > <font class="red">${order.totalPrice}</font> 元 </td>
	  </tr>
	  <tr>
	    <td height="36" align="right"><strong>优惠金额：</strong></td>
	    <td><input id="money" type="text" name="returnPrice"   value="${order.returnPrice}"  style="border:1px solid #dcdcdc;" onblur="checkMoney()" >
	    	<span id="msg" style="color:red"></span>
	    </td>
	    <input type="hidden" value="${order.id }" name="id">
	  </tr>
	</table>
</t:formvalid>
<script type="text/javascript">
	function checkMoney()
	{
		var money = $("#money").val();
		if(!money||!$.trim(money))
		{
			$("#msg").html("请输入充值金额");
			return false;
		}
		if(/^[0-9]+[.]?[0-9]{0,2}$/.test(money))
		{
			if(Number(money)==0)
			{
				$("#msg").html("不要只输入0");
				return false;
			}
			//加一些限制逻辑
			return true;
		}else
		{
			return false;
		}
	}
</script>
</body>
</html> 

