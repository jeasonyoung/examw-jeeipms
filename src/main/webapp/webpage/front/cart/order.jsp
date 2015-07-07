<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/context/context.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>订单管理</title>
<link href="/agency/img/top_footer.css" rel="stylesheet" type="text/css" />
<link href="/agency/img/style.css" rel="stylesheet" type="text/css" />
<link href="/agency/img/order.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
var Paydialog,Money=${student.cash+student.studycard},OMoney=Pice=${order.totalPrice-order.returnPrice},orderid="${order.id}" ,orderCode="${order.orderCode}", Complete=${order.orderStatus};
</script>
</head>
<body>
	<div class="topx">
	<div class="top">
	<div class="t1"><a href="/">首页</a> |  <a href="/course/" class="ks1">快速选课</a> |  <a href="/agency/" class="ks2">网校列表</a></div>
	<div class="t3"><a href="#">报名流程</a> | <a href="#">常见问题</a> | <a href="#">交易安全</a></div>
	<div class="t2" id="stu"></div>
	</div>
	</div>
	<div class="header" style="background-image: url(http://localhost/agency/img/bg1.gif) ">
	<div class="logo"><img src="/agency/img/logo.gif" width="224" height="79" /></div>
	<div class="search-box">
<div class="search">
<div id="J_SearchTab" class="search-triggers">
   <ul class="ks-switchable-nav" id="test1">
     <li class="J_SearchTab selected" data-searchtype="item"  data-defaultpage="/agencyfront.do?searchCourse" >
       <a href="#">课程</a>
     </li>
     <li class="J_SearchTab"  data-searchtype="item"  data-defaultpage="/agencyfront.do?searchAgency" >
       <a href="#">机构</a>
     </li>
   </ul>
   <i>
   <em></em>
   <span></span>
   </i>
</div>
<form action="/agencyfront.do?searchCourse" id="search_form" method="post">
<input name="keywords" type="text" class="search1" value="" />
<div class="ss" ><a href="#" id="search_button"></a></div></div>
</form>
</div>
	</div>
	<div class="blk10"></div>
	<div id="wapper">
        <div class="cont">
            <div class="bmlc">
                <ul class="lct lct2">
                    <li>购课车</li>
                    <li class="on">生成订单</li>
                    <li>付款</li>
                    <li>完成</li>
                </ul>
            </div>
            <div class="bmqd">
                <div class="title" id="title_ke">
                    <span class="flt2">订单详情</span></div>
                <div class="kclist">
                    <table width="100%" cellspacing="0" cellpadding="0" border="0" align="center" class="ca_tab3">
                        <tbody>                                                       
                        </tbody>
                    </table>
                    <div class="total_info">
                        <div class="checkout">${student.username}，您已完成报名！请记下您的订单号为：<strong>${order.orderCode}</strong></div>
                    	<div class="row_price">  您共购买<b>${fn:length(list)}</b>门课程，总计：<strong>${order.totalPrice-order.returnPrice}</strong>元</div>
                    </div>
                </div>              
                <div class="title" id="title_hang"><span class="flt2">支付方式</span></div>
                <div class="ui-form">
                    <h1>本次应付：<strong>￥${order.totalPrice-order.returnPrice}</strong>元</h1>
                  <!--   <a href="javascript:;" class="hire-purchase" style="display: block;">分笔付款</a><a href="javascript:;" class="wenhao" title="什么是分笔付款？" style="display: block;">问号</a><div class="hire-input" style="display:none;">请输入金额：<input type="text" style="width: 70px; height: 18px;"> 元</div> -->
                    <div class="tab-item">
                     账户（<em style="color: #2F91E3;font-style: normal;">${student.username}</em>）可支付余额：￥<strong id="myqian"><c:out value="${student.cash+student.studycard}" default="0" /></strong></div>
                    <div class="tab-item" id="yuefuk">
                       <input name="check" type="checkbox"/>
                        用账户余额支付 <strong style="color:Red;">￥0</strong> 元<span id="symoney">，剩余 <strong>￥0</strong> 元请选择其他支付方式：</span></div>
                    <div class="Pop-up" style="z-index: 999; left: 670px; top: 635px; display: none;"><div class="pop-box" style="width:200px;">分笔付款是专为金额较大订单支付所设。如支付金额比较大,超过网银单笔最大金额,请使用分笔付款！</div></div> 
                </div>
                <div class="pay">
                    <a href="javascript:;" id="wangyin" class=""><span class="wangyin">网银支付</span>
                        <form onsubmit="showAfterPayBox();" target="_blank" method="post" action="/webpage/pay/chinabank/Send.jsp" name="formbill_wy">
                            <input type="hidden" value="${student.username}" name="v_rcvname">
                            <input type="hidden" value="${student.realname}" name="v_ordername">
                            <input type="hidden" value="20130930279018" name="remark1">
                            <input type="hidden" value="${order.orderCode}" name="orderNo">
                            <input type="hidden" value="Course" name="remark2">
                            <input type="hidden" value="${order.totalPrice-order.returnPrice}" id="xy_v_amount" name="v_amount">
                        </form>
                    </a><a href="javascript:;" id="zfbfuk" class=""><span class="zfb">支付宝支付</span>
                        <form onsubmit="showAfterPayBox();" target="_blank" method="post" action="/orderController.do?zhifubaoPre" name="formbill_zfb">
                            <input type="hidden" value="${order.id}" name="orderId">
                        </form>
                    </a><a href="javascript:;" onclick="showboxyhhk()" class=""><span class="yinh">银行汇款</span></a>
                    <a href="javascript:;" onclick="showboxxxkzf()" class=""><span class="card">学习卡</span></a>
                    <p>
                        <em>购课提示：您在报名过程中有任何疑问，请咨询或拨打我们的服务热线：<strong>4000-086-044
                            </strong>（免长途费）</em></p>
                </div>
            </div>
            <br clear="all">
     </div>
</div>
<div class="blk10"></div>
<%@include file="../../common/footer_about.jsp"%>
<script type="text/javascript" src="plug-in/jquery/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src ="/plug-in/agencycms/js/common.js"></script>
<script type="text/javascript" src="plug-in/artDiglog/jquery.artDialog.js?skin=default"></script>
<script type="text/javascript" src="/plug-in/tools/order.js"></script>
<script type="text/javascript">
$(function(){
	 // addhtml();
	  GetOrders(orderid);
	  $("#wangyin").live("click", function() {
         var fenqifk = $(".hire-input").find("input").val();
         if (fenqifk >= 100)
             fenqifk = 100;
         if (fenqifk != "") {
             $("#wangyin").find("form").find("input").eq(4).val(fenqifk);
             $("#zfbfuk").find("form").find("input").eq(1).val(fenqifk);
         }
         $("#wangyin").find("form").submit();
         $(".bmlc ul").removeClass("lct2").addClass("lct3");
         $(".bmlc ul li").removeClass("on").eq(2).addClass("on");
     });
	  $("#zfbfuk").live("click", function() {
		  $("#zfbfuk").find("form").submit();
	      $(".bmlc ul").removeClass("lct2").addClass("lct3");
	      $(".bmlc ul li").removeClass("on").eq(2).addClass("on");
	  });
	  $(".wBox_close").live("click", function() {
         Paydialog.close();
     });
	  $("#yuefuk input").click(function() {
	      if ($("#yuefuk").find("input").attr("checked") == "checked" && (parseInt(Money) > 0 || Pice == 0)) {
	          var PM = Money;
	          if (Pice <= Money) {
	              PM = Pice;
	          }
	          art.dialog({
	              id: "quest",
	              icon: "question",
	              title: "温馨提示",
	              content: "<span style=\"font-size:14px;\">确定从账户余额中扣除" + PM + "元 来支付订单吗？</span>",
	              zIndex: 18008,
	              lock: true,
	              resize: false,
	              fixed: true,
	              button: [{
	                  name: "确定",
	                  callback: function() {
	                      if (Pice <= Money) {
	                          OpenCoures(orderid);
	                      } else {
	                          BuyCourse(Money);
	                      }
	                  }
	              }, { name: "取消", callback: function() { $("#yuefuk").find("input").removeAttr("checked"); addhtml(); } }]
	          });
	      }
	  });
	  $(".hire-purchase").click(function() {
	      if ($(".hire-input").css("display") == "block") {
	          $(".hire-input").css("display", "none");
	          $(".hire-input").find("input").val("");
	      } else
	          $(".hire-input").css("display", "block");
	  });
	  $("#jsbt_cz").live("click", function() {
	      var CardID = $("#CardID").val();
	      var cardpwd = $("#cardpwd").val();
	      var Jmoney = $("#money").val();
	      if (CardID == "") {
	          alert("请输入学习卡账号");
	          return;
	      }
	      if (cardpwd == "") {
	          alert("请输入学习卡密码");
	          return;
	      }
	      dataoption = {
	    	 "cardNo":CardID,"pwd":cardpwd,"money":Jmoney
	      };
	      $.post("/cstudyRecordController.do?recharge", dataoption, function(result) {
	          if (result.success) {
	        	  alert(result.msg);
	        	  location.reload();
	          } else {
	              alert(result.msg);
	          }
	      });
	  });
});
</script>
</body>
</html>