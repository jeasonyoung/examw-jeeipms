<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<script type="text/javascript">
	$(function(){
		$.ajax({
			url:"/cstudyRecordController.do?askcount",
			type:"POST",
			dataType:"json",
			success:function(d){
				var info = "<em class='navicon dingdan'>&nbsp;</em>我的答疑";
				if(d.success)
				{
					$("#qCountInfo").html(info+"<em style='color:red'>["+d.obj+"]</em>");
				}else
				{
					$("#qCountInfo").html(info);
				}
			}
		});
	});
</script>
<div class="column_1">
    <ul class="Nav">
        <li id="left_index"><a href="/stuCenter.do?index" title="我的首页" class="heyingy myblock"><em class="navicon index_m">&nbsp;</em>我的首页</a></li>
        <li id="left_myclass"><a href="/cstudyRecordController.do?myclass" title="我的课堂" ><em class="navicon ketan">&nbsp;</em>我的课堂</a> </li>
        <li id="left_note"><a href="cstudyRecordController.do?getNote&page=1" title="学习笔记"><em class="navicon dingdan">&nbsp;</em>学习笔记</a></li>
        <li id="left_order"><a href="/cstudyRecordController.do?order" title="我的订单"><em class="navicon dingdan">&nbsp;</em>我的订单</a></li>
        <li id="left_course"><a href="/course/" title="选课中心"><em class="navicon xuanke">&nbsp;</em>选课中心</a></li>
        <li id="left_ask"><a href="/cstudyRecordController.do?getAsk&page=1" title="我的答疑" id="qCountInfo"><em class="navicon dingdan">&nbsp;</em>我的答疑</a></li>    
        <div class="linep"></div>
        <li id="left_"><a href="javascript:;" title="服务中心" class="myblock"><em class="navicon Examc"></em>服务中心</a></li>
        <li id="left_info"><a href="/cstudyRecordController.do?info" title="个人信息"><em class="navicon Chapter">&nbsp;</em>个人信息</a></li>
        <li id="left_studycard"><a href="/cstudyRecordController.do?studycard" title="学习卡充值"><em class="navicon Texam">&nbsp;</em>学习卡充值</a></li>
        <li id="left_cash"><a href="/cstudyRecordController.do?cash" title="现金充值"><em class="navicon moli">&nbsp;</em>现金充值</a></li>
        <li id="left_help"s><a href="/help/" title="帮助中心"><em class="navicon moli">&nbsp;</em>帮助中心</a></li>
    </ul>
</div>