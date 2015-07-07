<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
	<div align="center" style="margin-top:20px;"><strong style="color:#F00">订单详情</strong></div>       
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
 		<tr>
    	<td valign="top"><br><br>
      	<table width="100%" border="0" cellspacing="2" cellpadding="6" bgcolor="#CDE2FC" align="center">
      	<tr bgcolor="#FFFFFF">
        <td width="70" height="30" ><div align="center">用户名</div></td>
        <td width="56" height="30" >${order.student.username } <a href="#" onclick="studetail('查看','sysstudentController.do?addorupdate','${order.student.id}')"><font color="#0000FF">会员详情</font></a></td>
        <td width="64" height="30" ><div align="center">订单号</div></td>
        <td width="116" height="30" >${order.orderCode }【<tags:status orderType='${order.orderType}'/>】</td>
        <td height="30" width="64"><div align="center">订单状态</div></td>
        <td width="64" height="30" ><tags:status orderStatus='${order.orderStatus}'/></td>
      </tr>
      <tr bgcolor="#FFFFFF">
        <td width="70" height="30"><div align="center">订单总价</div></td>
        <td height="30" colspan="1"><fmt:formatNumber value="${order.totalPrice}" pattern="###0.00" />&nbsp;元</td>
        <td height="30"><div align="center">订单返款</div></td>
        <td height="30"><fmt:formatNumber value="${order.returnPrice}" pattern="###0.00" />&nbsp;元 
        <c:if test="${order.orderStatus eq 0}">
		<a href="#" onclick="updatePrice('${order.id}')"><font color="#0000FF">修改</font></a>
		</c:if>
        </td>
        <td height="30" width="64" align="center">订单优惠价</td>
        <td height="30" colspan="1"><fmt:formatNumber value="${order.totalPrice-order.returnPrice}" pattern="###0.00" />&nbsp;元</td>
      </tr>
      <tr bgcolor="#FFFFFF">
        <td width="70"><div align="center">生成时间</div></td>
        <td height="30" colspan="1"><fmt:formatDate value="${order.orderAddtime }" type="both" pattern="yyyy-MM-dd HH:mm:ss" /></td>
        <td height="30" ><div align="center">付款时间</div></td>
        <td height="30" align="left"><fmt:formatDate value="${order.orderPaytime }" type="both" pattern="yyyy-MM-dd HH:mm:ss" /></td>
        <td height="30" width="64" align="center">付款金额:</td>
        <td height="30" colspan="1">
        	卡：<fmt:formatNumber value="${order.orderCards}" pattern="###0.00" />&nbsp;元<br>
        	钞：<fmt:formatNumber value="${order.orderCashmoney }" pattern="###0.00" />&nbsp;元
        </td>
        </td>
      </tr>
      <tr bgcolor="#FFFFFF">
        <td width="70" height="30"><div align="center">现金券</div></td>
        <td height="30" colspan="1"><font color="#FF0000" style="font-size:20px;"><fmt:formatNumber value="${order.student.cash }" pattern="#,##0.00" />元</font>
        <a href="#" onclick="chargecash('${order.student.id}')"><font color="#0000FF">充值/扣费</font></a></td>
        <td height="30"><div align="center">学习卡</div></td>
        <td height="30"><font color="#FF0000" style="font-size:20px;"><fmt:formatNumber value="${order.student.studycard}" pattern="###0.00" /> &nbsp; 元</font>
          <!--<a href="ModifyAdd.asp?username==UserName%>"><font color="#FF0000">修改</font></a>-->
        <td width="64" height="30" ><div align="center">支付方式</div></td>
        <td height="30" colspan="1">${order.orderPayment}<a href=""><font color="#FF0000"></font> </a> &nbsp;</td>
      </tr>
    </table></td>
  </tr>
</table>
<!--  订单的课程和考试宝典的列表-->
<c:if test="${order.orderType != 2}">
<table width="100%" border="0" cellpadding="1" cellspacing="1" bgcolor="#999999"  align="center" style="margin-top:20px;">
</table> 
<table width="100%" border="0" cellpadding="0" cellspacing="0">
 <tr>
    <td valign="top">
	<table width="100%" border="1" cellspacing="0" cellpadding="0"  align="center">
        <tr>  
            <td height="26"  align="center" colspan="11" ><strong style="color:#F00">条目详细</strong></td>
        </tr>
        <tr> 
            <td width="25%" height="26" class="ButtonListLeft"> <div align="center">课程名称</div></td>
            <td width="8%" height="26" class="ButtonListLeft"> <div align="center">课程原价</div></td>
            <td width="7%" class="ButtonList"> <div align="center">优惠价</div></td>
            <td width="10%" height="26" class="ButtonList"> <div align="center">订单状态</div></td> 
        </tr> 
       <c:forEach items="${itemList}" var="item">
		  <tr > 
			<td height="30" nowrap align="center">${item.courseName }</td>
			 <td nowrap> <div align="center"><fmt:formatNumber value="${item.itemOprice }" pattern="###0.00" /></div></td>
			 <td align="center" nowrap><fmt:formatNumber value="${item.itemRprice }" pattern="###0.00" /></td>
			 <td align="center" nowrap><tags:status orderStatus='${order.orderStatus}'/></td>	
			</td>
		  </tr>
		</c:forEach>
  </table>
</td>
  </tr>
</table>

<div align="center" style="margin-top:20px;">
	<c:if test="${order.orderStatus eq 0}">
		<input type="button" value="开通课程" onclick="payOrder('${order.id}')"/>
	</c:if>
		<input style="margin-left:10px;" type="button" onclick="orderdetail('${order.id}')" value="刷新"/>	
</div>
</c:if>
<script type="text/javascript">
	function chargecash(id){
		createwindow('充值', 'sysorderController.do?updateMoney&id=' + id);
	}
	function updatePrice(id){
		createwindow('修改返款', 'sysorderController.do?updatePrice&id=' + id);
	}
	function studetail(title,url, id) {
		if (!id) {
			tip('请选择查看项目');
			return;
		}
	    url += '&load=detail&id='+id;	 
		createdetailwindow(title,url);
	}
	function orderdetail(id){
		addOneTab('订单详情','sysorderController.do?orderDetail&id='+id,'pie');
	}
	
	function payOrder(id){
		$.ajax({
			async : false,
			cache : false,
			type : 'POST',
			url : 'sysorderController.do?openOrder&orderId='+id,// 请求的action路径
			error : function() {// 请求失败处理函数
			},
			success : function(d) {
				if (d.success) {
					var msg = d.msg;
					tip(msg);
					orderdetail(id);
				}else{
					tip(d.msg);
				}
			},
			dataType:'json'
		});
	}

</script>