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
<script type="text/javascript" src="/center/js/jquery-1.8.3.min.js"></script>
<title>我的首页-${student.username}</title>
</head>
<body>
<%@include file="common/head.jsp"%>
<div class="h10 top_exam_margin" style="height: 25px; display: block;"></div>
<div>
<div id="loading_div" class="kc_list" style="display: none;">
    <dl class="Record_five" style="height: 280px">
        <dd class="ddone k_ddone1">
            <span class="lding" style="padding-top: 15px; padding-bottom: 15px; font-size: 12px; color: #999; vertical-align: middle; text-align: center; width: 100%">
                <img src="http://img.233.com/wx/img/usercenter/82.gif">
                正在努力加载数据... </span>
        </dd>
    </dl>
</div>
<div class="Container" style="margin: 0px">
<div class="Main" style="background: none;">
    <div class="column_top">
        <div class="cltop_lf">
            <ul>
                <li class="f14">
                    <span><strong>全学好平台</strong>（${student.username}）</span>
                    <span>
                            <a href="/search/UserCenter/vip.asp" class="icon_vip_no">VIP</a>
                            <a href="/search/UserCenter/vip.asp" class="icon_zhe_no">折扣</a>
                    </span>
                </li>
                <li><a href="/cstudyRecordController.do?order"><strong>待付款</strong>：(<b class="cDRed">${nopay}</b>)</a>  </li>
                <li><a href="/search/UserCenter/kc.asp"><strong>我的课程</strong>：(<b>0</b>)</a></li>
                <li>
                    <span style="margin: 0"><strong>安全等级</strong>： </span>
                    <span>
                            <a href="#" title="邮箱未认证"><em class="icon_Email" title="邮箱未认证"></em>未认证</a>
                    </span>
                    <span>
                            <a href="#" title="手机未认证"><em class="icon_Tel" title="手机未认证"></em>未认证</a>
                    </span>
                    <span>
                        <a href="/cstudyRecordController.do?order"><em class="icon_jiaoyi" title="最近交易记录"></em>最近交易记录</a>
                    </span>
                </li>
            </ul>
            <span class="p144">&nbsp;</span>
        </div>
        <div class="cltop_rg">
            <ul>
                <li class="f14">&nbsp;&nbsp;&nbsp;账户余额：<strong class="Cred"><c:out value="${student.cash+student.studycard}" default="0" /></strong> <em>元</em></li>
                <li>
                    <span>金&nbsp;&nbsp;&nbsp;&nbsp;钱：<strong><c:out value="${student.cash}" default="0" /></strong> 元</span>
                    <span>学习卡：<strong><c:out value="${student.studycard}" default="0" /></strong> 元</span>
                </li>
            </ul>
            <div class="rgbg"></div>
        </div>
    </div>
</div>
<div class="Main" style="border-bottom: 1px solid #dfe6ea">
<%@include file="common/left.jsp"%>
<div class="column_2 column_2bg">
<div class="column_lf">
                <div class="cont_box">
                    <ul class="box_list ui-sortable" id="examda_message_table">
                            <li class="on" position="0">
                                <a id="a_loads" data-ajax="true" data-ajax-begin="ExamMessage_Ajax_Star" data-ajax-mode="replace" data-ajax-update="#examda_message_list" href="/cstudyRecordController.do?list"><em class="icon wx"></em>学习记录</a>
                            </li>
                            <li position="1">
                                <a data-ajax="true" data-ajax-begin="ExamMessage_Ajax_Star" data-ajax-mode="replace" data-ajax-update="#examda_message_list" href="/cstudyRecordController.do?recommend"><em class="icon wx"></em>推荐课程</a>
                            </li>
                    </ul>
<div id="examda_message_list">
</div>
<br class="cl">
<br class="cl">
</div>
</div>
<div class="column_rg">
<div class="user_box">
    <div class="my-user">
        <img alt="当前头像" src="${student.imageurl}" onerror="this.src='http://img.233.com/wx/img/uc/Avatar.png'" width="80" height="80">
        <div class="Upload"><a target="_blank" href="/cstudyRecordController.do?head">上传</a></div>
    </div>
    <div class="user_name">
            <h2 style="font-size:12px">${student.username}</h2>
            <span class="dengji">1</span>
            <div class="pu-privilege" style="float: left; margin-left: 0px; width:100%"><a class="icon-identity student" style="cursor:pointer;"></a></div>
            <div class="dji" style="display: none">
                <div class="dji_sj">
                    <input type="hidden" id="currentintegral" value="5">
                    <input type="hidden" id="nextintegral" value="200">
                    <input type="hidden" id="integralDiffer" value="195">
                    <div style="width: 2%" class="bar"></div>
                    <span class="W_num l1 left"></span>
                    <span class="W_num l2 right"></span>
                </div>
                <div class="dji_jy">升级还需<a id="Differ">195</a>分,去<a href="/search/UserCenter/taskCenter/" class="cDRed">任务中心》</a></div>
                <em class="jtou">&nbsp;</em>
            </div>
    </div>
    <em class="left_jtou">&nbsp;</em>
</div>
<br class="cl">
</div>
</div>
</div>
</div>
</div>
<%@include file="../../common/footer_about.jsp"%>
<script type="text/javascript">
	function ExamMessage_Ajax_Star() {
    	$("#examda_message_list").html($("#loading_div").clone().show());
	}
	function NexusMessage_Ajax_Star() {
    	$("#nexus_message_list").html($("#loading_div").clone().show());
	}
	$(function(){
		$("#left_index").addClass("cur");
		$("#left_index").siblings().removeClass("cur")
	});
</script>
<script type="text/javascript" src="/center/js/jquery.unobtrusive-ajax.min.js"></script>
</body>
</html>