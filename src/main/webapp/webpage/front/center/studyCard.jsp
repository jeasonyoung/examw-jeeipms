<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/context/context.jsp"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="/center/css/top_footer.css" />
<link type="text/css" rel="stylesheet" href="/center/css/index.css" />
<link type="text/css" rel="stylesheet" href="/center/css/master.css" />
<link type="text/css" rel="stylesheet" href="/center/css/layout.css" />
<script type="text/javascript" src="/center/js/jquery-1.8.3.min.js"></script>
<title>${student.username}  已支付订单</title>
</head>
<body>
<%@include file="common/head.jsp"%>
<div class="h10 top_exam_margin" style="height: 25px; display: block;"></div>
<div>
<div class="Container" style="margin: 0px"> 
<div class="Main" style="border-bottom: 1px solid #dfe6ea;margin-top: 20px;">
<%@include file="common/left.jsp"%>
<div class="column_2 column_2bg">
<div class="rightside">
<h2 style="text-align: left;">我的学习卡</h2>
<div class="card_box">
<div class="cd_sub2" id="czbox">
<div class="Recharge">
<div class="re-img"></div>
<ul>
<li><h1>账户充值</h1></li>
<li><span class="lab">卡号：</span><input name="CardID" id="CardID" class="input1" type="text" tabindex="1" /></li>
<li><span class="lab">密码：</span><input name="cardpwd" id="cardpwd" class="input1" type="password" tabindex="2" /></li>
<li><span class="lab">金额：</span><input name="Jmoney" id="Jmoney" class="input1" maxlength="4" style="width:60px;" type="text"  tabindex="3" /><span style="margin-top:10px; margin-left:12px;">//不填为全部金额</span></li>
<li><input name="按钮" type="button" id="jsbt" class="cb_an" value="立即充值"  tabindex="4"/></li></ul>
</div>
<div class="Recharge">
<div class="re-img2"></div>
<ul>
<li><h1>学习卡余额查询</h1></li>
<li><span class="lab">卡号：</span><input name="cxCardID" id="cxCardID" class="input1" type="text" tabindex="1" /></li>
<li><span class="lab">密码：</span><input name="cxcardpwd" id="cxcardpwd" class="input1" type="password" tabindex="2" /></li>
<li><input name="jsbt" type="button" id="czbt" class="submit" value="查询"  tabindex="4"/></li>
<li><span class="ts" id="cxmsg"></span></li></ul>
</div>
</div>
<a href="pay.asp?OrdersID=" id="paybt" style="display:none" class="submit-y">立即去支付</a>
<div class="cd_sub3">
<div class="cd_title"><span>用户使用记录</span></div>
<div class="recordlist">
<table class=".bordered-table" width="100%" border="0">
  <tr class="li_h1">
    <td width="20%">操作时间</td>
    <td width="39%">操作内容</td>
    <td width="12%">操作金额（元）</td>
    <td width="17%" align="center">操作说明</td>
  </tr>
  <c:forEach items="${list}" var="record">
  <tr>
    <td width="20%">${record.useTime}</td>
    <td width="39%">${record.userContent}</td>
    <td width="12%">${record.recordValue}</td>
    <td width="17%" align="center">${record.recordContent}</td>
   </tr>
  </c:forEach>
</table>
</div>
</div>
</div>
</div>
<br clear="all" />
</div>
</div>
</div>
<%@include file="../../common/footer_about.jsp"%>
<style>
.column_1{margin-top:20px;}
.bordered-table{width:100%;float:left;text-align:center;line-height:30px;}
table {font-size:13px;margin-bottom: 18px;width: 100%;background:#ccc}
table tr{ background:#fff}
</style>
<script type="text/javascript" src ="/center/js/Promptbox.js"></script>
<script type="text/javascript">
$(function(){
	$("#left_studycard").addClass("cur");
	$("#left_studycard").siblings().removeClass("cur")
});
$(document).ready(function(){
	  	$("#jsbt").click(function(){
			var cidvar = $("#CardID").val();	
			var pwdvar = $("#cardpwd").val();
			var jmoneyvar = $("#Jmoney").val();
			var ckcid = /^[0-9a-zA-Z]{17}$/g;
			var jine = /^\d*$/g;
			if(ckcid.test(cidvar) && jine.test(jmoneyvar)){
				   $.post("/cstudyRecordController.do?recharge",{"cardNo":cidvar,"pwd":pwdvar,"money":jmoneyvar},function(result){											   
						   $("#jsbt").Promptbox({
							   pt_info:result.msg,
							   b_text1:"确定",
							   b_text2:"",
							   b1_link:""
                        });
						   if(result.success){setTimeout(function(){location.reload();}, 2000)}
					});	
			}else{
				   $("#jsbt").Promptbox({
						   pt_info:"请正确输入学习卡号和密码!",
						   b_text1:"确定",
						   b_text2:"",
						   b1_link:""
				  });
			}
		})
	  $("#czbt").click(function(){
			var cidvar = $("#cxCardID").val();	
			var pwdvar = $("#cxcardpwd").val();	
			var ckcid = /^[0-9a-zA-Z]{17}$/g;
			if(ckcid.test(cidvar)){
				   $.post("/cstudyRecordController.do?checkCard",{"cardNo":cidvar,"password":pwdvar},function(j){											   
                     $("#cxmsg").html(j.msg);
					});	
			}else{
				  $("#cxmsg").html("请正确输入学习卡号和密码!");			
			}
	   })
})
function showczcxbox(czxid){
	if(czxid==0){
	  $("#czbox").css("display","block");
	  $("#cxbox").css("display","none");
	}else{
	  $("#czbox").css("display","none");
	  $("#cxbox").css("display","block");		
	}
}

function notice(content,t)
{//提示框
	dianotice = art.dialog({id:"notice",content:content,icon:"succeed",lock:true,opacity:0.1,time:t,fixed:true});
}

</script>
</body>
</html>