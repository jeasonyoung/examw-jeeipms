<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%@ page import="org.jeecgframework.core.constant.*" %>
<jsp:useBean id="MD5" scope="request" class="beartool.MD5"/>
<%
//***********************************************
//初始化定义参数
String v_mid,key,v_url,v_oid,v_amount,v_moneytype,v_md5info;  //定义必须传递的参数变量

	v_mid = "22919466";			                 	          // 商户号，这里为测试商户号1001，替换为自己的商户号(老版商户号为4位或5位,新版为8位)即可
	//v_url = "http://115.28.51.163/webpage/pay/chinabank/Receive.jsp";     // 商户自定义返回接收支付结果的页面
	v_url =Globals.getConfig("domain")+"/orderController.do?chinaBank&encoding=UTF-8";
	key = "2dsfa9023Dfsd00vmba562";									      // 如果您还没有设置MD5密钥请登陆我们为您提供商户后台，地址：https://merchant3.chinabank.com.cn/
													      // 登陆后在上面的导航栏里可能找到“B2C”，在二级导航栏里有“MD5密钥设置”
													      // 建议您设置一个16位以上的密钥或更高，密钥最多64位，但设置16位已经足够了
//**********************************************
//以上三项必须修改		
	  if(request.getAttribute("orderNo")!=null && !request.getAttribute("orderNo").equals(""))  //判断是否有传递订单号
	  {
		  v_oid=(String)request.getAttribute("orderNo");
	  }
		else                         
	  {
		  Date currTime = new Date();
		  SimpleDateFormat sf = new SimpleDateFormat("yyyyMMdd-"+v_mid+"-hhmmss",Locale.US);
		  v_oid=sf.format(currTime);                        // 推荐订单号构成格式为 年月日-商户号-小时分钟秒
	  }                                                  
	v_amount=(String)request.getAttribute("v_amount");// 订单金额
		v_moneytype ="CNY";	                  				// 币种
		v_md5info = "";										// 对拼凑串MD5私钥加密后的值

	String text = v_amount+v_moneytype+v_oid+v_mid+v_url+key;   // 拼凑加密串
	v_md5info = MD5.getMD5ofStr(text);                          // 网银支付平台对MD5值只认大写字符串，所以小写的MD5值得转换为大写

	String remark1,remark2,v_orderemail;

		remark1 = (String)request.getAttribute("remark1");               //备注字段1
		remark2 = (String)request.getAttribute("remark2");               //备注字段2
		
		v_orderemail = (String)request.getAttribute("email");  // 订货人邮件
		if(v_orderemail==null||v_orderemail.equals(""))
		{
			v_orderemail="xxxxxx@163.com";
		}
	%>

<!--以下信息为标准的 HTML 格式 + ASP 语言 拼凑而成的 网银在线 支付接口标准演示页面 无需修改-->

<html>
<body onLoad="javascript:document.E_FORM.submit()">
<!-- <body> -->
<form action="https://pay3.chinabank.com.cn/PayGate" method="POST" name="E_FORM">
<input type="hidden" name="v_md5info"    value="<%=v_md5info%>" size="100">
<input type="hidden" name="v_mid"        value="<%=v_mid%>">
<input type="hidden" name="v_oid"        value="<%=v_oid%>">
<input type="hidden" name="v_amount"     value="<%=v_amount%>">
<input type="hidden" name="v_moneytype"  value="<%=v_moneytype%>">
<input type="hidden" name="v_url"        value="<%=v_url%>"> 
<!--以下几项项为网上支付完成后，随支付反馈信息一同传给信息接收页 -->
<input type="hidden"  name="remark1" value="<%=remark1%>">
<input type="hidden"  name="remark2" value="<%=remark2%>">
<input type="hidden"  name="v_orderemail"   value="<%=v_orderemail%>">
</form>
</body>
</html>
