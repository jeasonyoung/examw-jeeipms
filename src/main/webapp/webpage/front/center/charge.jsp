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
<link type="text/css" rel="stylesheet" href="/center/css/charge.css" />
<script type="text/javascript" src="/center/js/jquery-1.8.3.min.js"></script>
<title>${student.username}  账户充值</title>
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
<div>
<div class="con_box Showbox">
<div class="effect-title"><span class="ico4">现金充值</span></div>
<div class="effect-txt">
  <div class="content">
  <div class="all bordered">
  <form id="E_FORM" action="" method="post" name="E_FORM" target="_blank">
	<h2>
		<span class="czje">充值金额：</span>
		<input id="recharge_credit" name="money" type="text" class="mn_input" style="width:150px" value="请输入您要充值的金额" onfocus="if(this.value=='请输入您要充值的金额'){this.value='';this.style.color='#808080';}$(this).addClass('mn_inputa');" onblur="if(this.value==''){this.value='请输入您要充值的金额';this.style.color='#808080';}$(this).removeClass('mn_inputa');"><span class="px14">元</span>
   		<input id="v_oid" name="v_oid" type="hidden" value="">  
   		<input id="WebSource" name="WebSource" value="wenda" type="hidden">   
	</h2>
	<div id="czpop" class="poptip" style="width:210px;display:none">
	<table cellpadding="0" cellspacing="0">
		<tbody>
		<tr>
			<th class="top-l">
			</th><th class="top-c">
			</th><th class="top-r">
			</th>
		</tr>
		<tr>
		<td class="mid-l">
		</td><td class="mid-c">
		<div id="layerBox" class="layer-box" style="background-color: rgb(255, 255, 255);">
		<div style="width:auto;height:35px">
		<div class="poptip-info clearfix">
		<div class="arrow arrow8"></div>
		<div id="ts-card" class="ts-card">充值金额必须大于或等于100元。 </div>
		</div>
		</div>
		</div>
		</td>
		<td class="mid-r">
		</td>
	</tr>
		<tr>
		<td class="bottom-l">
		</td><td class="bottom-c">
		</td><td class="bottom-r">
		</td></tr>
		</tbody>
	</table>
	</div>
<h2 class="greena">
 <span class="czje">真实姓名：</span>
 <input id="trueName" name="trueName" type="text" class="mn_input" value="${student.realname}" onfocus="$(this).addClass('mn_inputa');" onblur="$(this).removeClass('mn_inputa');">
</h2>
<h2 class="greena">
<span class="czje">手机号码：</span>
 <input id="v_rcvmobile" name="v_rcvmobile" type="text" class="mn_input" value="${student.phone}" onfocus="$(this).addClass('mn_inputa');" onblur="$(this).removeClass('mn_inputa');">
<span class="cDRed">*</span>
</h2>
<script type="text/javascript">
    $("#recharge_credit").focus(function() {
        $("#czpop").hide();
        $("#czpop").css("top", "10px");
        $("#czpop").css("left", "310px");
        $("#ts-card").html("充值金额必须大于或等于100元。");
        $("#czpop").fadeIn("slow");


    });

    $("#recharge_credit").blur(function() {
        $("#czpop").fadeOut(2);
    });

    $("#v_rcvmobile").focus(function() {
        $("#czpop").hide();
        $("#czpop").css("top", "86px");
        $("#czpop").css("left", "274px");
        $("#ts-card").html("(必填项) 请填写有效的手机号码。");
        $("#czpop").fadeIn("slow");
    });

    $("#v_rcvmobile").blur(function() {
        $("#czpop").fadeOut(2);
    });
</script>
</form>
<h1>请选择支付方式 </h1>
<div class="Payment">
<ul>
<li><a class="wangyin" onclick="RechargePaySubmit(1);" href="javascript:;">网银在线</a></li>
<li class="w10">
</li><li><a class="zfb" onclick="RechargePaySubmit(2);" href="javascript:;">支付宝</a></li>
<li class="w10">
</li><li><a class="yinhang" onclick="showthebox('.remit-money');" href="javascript:;">银行汇款</a></li>
</ul>
</div>
</div>
<!-- 
<div id="yc" style="">
<h1>我的充值流水</h1>

<table class="bordered-table" cellpadding="1" cellspacing="1">
<thead>
<tr>
<th width="22%">日期</th>
<th width="27%">单号</th>
<th width="21%">金额</th>
<th width="30%">状态</th>
</tr>
</thead>
<tbody id="List">
	<tr>
		<td>2013/10/15 11:44:12</td>
		<td>20131015114427984</td>
		<td> 100.00元</td>
		<td> 等待付款  <a href="javascript:RechargeUrl(2,'20131015114427984')" class="cRed">充值</a> </td>
	</tr>
	<tr>
		<td>2013/10/9 13:31:08</td>
		<td>20131009133125279</td>
		<td> 1000.00元</td>
		<td> 等待付款  <a href="javascript:RechargeUrl(1,'20131009133125279')" class="cRed">充值</a></td>
	</tr>
</tbody>
</table>
<div class="clearfix fy">
  <div class="pagination" id="PageStr"></div>
</div>
</div>
-->
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
<div class="remit-money" style="z-index: 9997; position: fixed; display: none;">
<div class="rt-top"><span>汇款方式</span><a href="javascript:;" onclick="javascript:$('.remit-money').fadeOut(300);" class="closes">× 关闭</a></div>
<div class="remit-box">
<table cellspacing="1" bgcolor="#dfdfdf" border="0">
<tbody><tr>
<td align="center" bgcolor="#f1f1f1" width="155"><strong>银 行 名 称</strong></td>
<td align="center" bgcolor="#f1f1f1" width="208"><strong>帐 号</strong></td>
<td align="center" bgcolor="#f1f1f1" width="186"><strong>开 户 行</strong></td>
<td align="center" bgcolor="#f1f1f1" width="158"><strong>姓 名</strong></td>
</tr><tr>
<td align="center" bgcolor="#FFFFFF"><span class="cDRed">工商银行</span>企业帐户</td>
 
<td align="left" bgcolor="#FFFFFF"><strong>1901 0040 0902 4534 328</strong></td>
<td bgcolor="#FFFFFF" width="181">中国工商银行长沙司门口支行</td>
<td align="center" bgcolor="#FFFFFF">长沙二三三网络科技有限公司</td>
</tr><tr>
<td align="center" bgcolor="#FFFFFF"><span class="cDRed">建设银行</span> [龙卡号]</td>
<td align="left" bgcolor="#FFFFFF"><strong>6227 0029 2005 0081 603</strong></td>
<td bgcolor="#FFFFFF">湖南省长沙定王台支行</td>
<td align="center" bgcolor="#FFFFFF" width="158">祝政</td>
 
</tr><tr>
<td align="center" bgcolor="#FFFFFF"><span class="cDRed">招商银行</span> [一卡通]</td>
<td align="left" bgcolor="#FFFFFF"><strong>6225 8873 1540 1717</strong></td>
<td bgcolor="#FFFFFF">湖南省长沙市分行</td>
<td align="center" bgcolor="#FFFFFF">祝政</td>
</tr><tr>
<td align="center" bgcolor="#FFFFFF"><span class="cDRed">农业银行</span> [金穗卡]</td>
<td align="left" bgcolor="#FFFFFF"><strong>6228 4810 9031 1782 619</strong></td>
 
<td bgcolor="#FFFFFF">湖南省长沙市解放路支行</td>
<td align="center" bgcolor="#FFFFFF">祝政</td>
</tr><tr>
<td align="center" bgcolor="#FFFFFF"><span class="cDRed">中国银行</span> [长城卡]</td>
<td align="left" bgcolor="#FFFFFF"><strong>4563 5175 0001 9530 813</strong></td>
<td bgcolor="#FFFFFF">长沙市平和堂支行</td>
<td align="center" bgcolor="#FFFFFF">祝政</td>
</tr><tr>
<td align="center" bgcolor="#FFFFFF"><span class="cDRed">工商银行</span> [灵通卡]</td>
 
<td align="left" bgcolor="#FFFFFF"><strong>6222 0219 0100 2092 979</strong></td>
<td bgcolor="#FFFFFF">长沙市司门口支行</td>
<td align="center" bgcolor="#FFFFFF">祝政</td>
</tr><tr>
<td align="center" bgcolor="#FFFFFF"><span class="cDRed">邮政储蓄</span> [存折号]</td>
<td align="left" bgcolor="#FFFFFF"><strong>6055 1003 8200 0604 83</strong></td>
<td bgcolor="#FFFFFF">长沙市星光大厦邮政储蓄点</td>
<td align="center" bgcolor="#FFFFFF">祝政</td>
 
</tr>
</tbody></table>
<div class="explain">
<ul>
<li><strong>1.</strong> 汇款时请多汇几元钱或者几角钱，如100.3元，可大幅提高您汇款入账速度</li>
<li><strong>2.</strong> 付款后填写<span class="cDRed">汇款确认</span>，说明汇款银行、金额以及你的详细要求！<a href="http://wx.233.com/search/UserCenter/paytf.asp"><div class="sp1"></div></a></li>
<li><strong>3.</strong> 您有任何问题，请在7×8小时内通过服务热线:4000-800-233</li>
 
<li><strong>4.</strong> 您对服务人员的服务不满意，请投诉到：examda800#163.com(请手动将其中的“#”替换成“@”)</li>
</ul>
</div>
</div>
</div>
<%@include file="../../common/footer_about.jsp"%>
<style>
.column_1{margin-top:0px;}
</style>
<script type="text/javascript" src="/plug-in/artDiglog/jquery.artDialog.js?skin=blue" ></script>
<script type="text/javascript">
$(function(){
	$("#left_cash").addClass("cur");
	$("#left_cash").siblings().removeClass("cur")
});
function CheckSafe(str) {
    var bads = "'&<>?%,;:()`~!#$^*{}[]|+-=\"";
    for (var i = 0; i < bads.length; i++) {
        if (str.indexOf(bads.substring(i, i + 1)) != -1) {
            return false;
            break;
        }
    }
    return true;
}
function checkTel(mobile) {
    if (/^1[3458]\d{9}$/.test(mobile)) return true;
    else return false;
}
function CheckNamePhone() {
    var trueName = $("#trueName").val();
    var v_rcvmobile = $("#v_rcvmobile").val();
    var temp = true;
    if (trueName.length > 0) {
        if (trueName.length < 2 || trueName.length > 16) {

            notice("请认真填写真实姓名", 5);

            temp = false; return temp;
        }
        else if (!CheckSafe(trueName)) {

            notice("真实姓名不能含以下字符:'&<>?%,;:()`~!#$^*{}[]|+-=\"", 5);
            temp = false; return temp;
        }
    }

    if (v_rcvmobile.length == 0) {

        notice("请填写您的手机号码,充值成功后,我们将以手机短信通知您！", 5);
        temp = false; return temp;
    }
    if (!checkTel(v_rcvmobile)) {

        notice("请填写正确的手机号码", 5);
        temp = false; return temp;
    }

    return temp;
}
function RechargePaySubmit(t) {
    document.getElementById("v_oid").value = "";
    var money = document.getElementById("recharge_credit").value;
    var myreg = /^(-)?(([1-9]{1}\d*)|([0]{1}))(\.(\d){1,2})?$/;
    if (money != "" && money != "请输入您要充值的金额") {
            if (myreg.test(money)) {
                if (money >= 100) {
                    if (money <= 5000) {
                        if (CheckNamePhone()) {
                            switch (t) {
                                case 1:
                                    $("#E_FORM")[0].action = "/orderController.do?cashRecharge&type=wy";
                                    $("#E_FORM")[0].submit(); break;
                                case 2:
                                    $("#E_FORM")[0].action = "/orderController.do?cashRecharge&type=zfb";
                                    $("#E_FORM").attr("accept-charset", "utf-8");
                                    $("#E_FORM")[0].submit(); break;
                            }

                        }
                    }
                    else {
                        $("#recharge_credit").val("5000");
                        notice("建议单笔充值金额不要超过5000元", 3);
                    }
                }
                else {
                    notice("您充值的金额低于100元！", 3);
                }
            }
            else {
                notice("您输入的金额不合法，保留两位小数或正整数！", 3);
            }
        }
        else {
            notice("请输入您要充值的金额！", 3);
        }
}
function test(t)
{
	switch (t) {
    case 1:
        $("#E_FORM")[0].action = "/orderController.do?cashRecharge&type=wy";
        $("#E_FORM")[0].submit(); break;
    case 2:
        $("#E_FORM")[0].action = "/orderController.do?cashRecharge&type=zfb";
        $("#E_FORM").attr("accept-charset", "utf-8");
        $("#E_FORM")[0].submit(); break;
}
}

function showthebox(obj) {
    $(obj).fadeIn(300);
}
function notice(content, t) {//提示框
    dianotice = art.dialog({ id: "notice", content: content, icon: "warning", lock: true, opacity: 0.1, time: t, title: false, fixed: true, zIndex: 9998 });
}

function loading(content) {//提示框
    dialoading = art.dialog({ id: "loading123", content: content, icon: "loading", cancel: false, title: false, fixed: true, zIndex: 9998 });
}

function succeed(content, t) {
    artdialog = art.dialog({ id: "artdialog", content: content, icon: "succeed", lock: true, opacity: 0.1, time: t, fixed: true, title: false, zIndex: 9998 });
}



</script>
</body>
</html>