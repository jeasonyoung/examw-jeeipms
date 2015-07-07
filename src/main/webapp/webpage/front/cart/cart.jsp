<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/context/context.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>购物车</title>
<link href="/agency/img/top_footer.css" rel="stylesheet" type="text/css" />
<link href="/agency/img/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="topx">
<div class="top">
<div class="t1"><a href="/">首页</a> |  <a href="/course/" class="ks1">快速选课</a> |  <a href="/agency/" class="ks2">网校列表</a></div>
<div class="t3"><a href="#">报名流程</a> | <a href="#">常见问题</a> | <a href="#">交易安全</a></div>
<div class="t2" id="stu"></div>
</div>
</div>
<div class="header">
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
<div class="nav">
<ul>
<li class="cur"><a href="#">首页</a></li>
<li><a href="#">课程大全</a></li>
<li><a href="#">培训机构</a></li>
</ul>
</div>
<div class="blk10"></div>
<!--主体部分-->
<div class="contentx">
<c:if test="${!empty cart}">
<table cellspacing="0" cellpadding="0" class="order-table">
		<thead>
			<tr>
				<th width="6%" class="s-chk"><label for="J_SelectAll"><input id="check_all_top"  onclick="check_all(this)" type="checkbox"  checked />全选</label></th>
				<th width="50%" class="s-title tc"></th>
				<th width="11%" class="s-price">单价(元)</th>
				<th width="11%" class="s-agio">优惠</th>
				<th width="15%" class="s-total">小计(元)</th>
				<th width="7%" class="s-del"></th>
			</tr>
		</thead>
			<c:forEach items="${cart}" var="map" varStatus="index">
			<tbody class="J_Order" id="business_bar_${index.index}">
	    	<tr class="J_ItemHead shop">
	        	<td colspan="3">
				<input type="checkbox"  checked  name="myBusiness"  id="check_all_business_${index.index}" onclick="check_business_all('${index.index}');"  class="J_forShop J_MakePoint"  />                                        									
								<span class="seller">
									机构：<a href="#" target="_blank">${map.key.name}</a> <em class="icon"><img src="/agency/img/vip.png"/></em>
								</span>
								<span class="J_WangWang" data-items="18981009694" data-nick="${map.key.name}" data-display="inline"></span>
				</td> 
	    		<td colspan="3" class="promo-info"></td>
	      	</tr>
			<c:forEach items="${map.value}" var="course">										 			  
   			<tr class="bgblue" id="course_${course.id}">
	    		<td class="s-chk"  > <input type="checkbox" class="J_CheckBoxItem J_MakePoint" id="check_cashticket_${course.id }" onclick="check_cashticket('${course.id }','${index.index}');"    name="cartIds" data-point-name="tbcart.1.14" value="${course.id}"  checked="checked" /></td>
		    	<td class="s-title"><a href="#" class="cBlue">${course.coursename}</a></td>
				<td class="s-price  "><em class="J_Price" tabindex="0">￥${course.price}</em></td>
   		        <td class="s-agio"> 		￥${course.price-course.favorableprice}</td><td class="s-total">￥<em class="bold cRed" id="price_${course.id}" name="course_${index.index}">${course.favorableprice}</em></td>
   		        <td class="s-del"><a href="javascript:;" onclick="delete_course('${course.id}')">删除</a></td>
		 	</tr>	
		 	</c:forEach>	
			</tbody>
			</c:forEach>	
 	    </table>
        
<div class="float-bar">
<span class="mg-left"><input type="checkbox" id="check_all_foot" onclick="check_all(this);" checked="checked">全选</span>
<button class="btn"  onclick="create_order()">结　算</button><span class="total-price">商品总价(不含运费)：<span>&yen;</span><em class="total" id="total"></em></span>
</div>   
</c:if>
<c:if test="${empty cart}">
	<div class="kclist"><span class="empty-img"></span><div class="empty-txt"><strong>您的购课车是空的，赶快行动吧！您可以：</strong><br>马上去<a href="http://115.28.51.163/" target="_blank">选课</a></div></div>
</c:if>
</div>
<!--尾部-->
<div class="blk10"></div>
<%@include file="../../common/footer_about.jsp"%>

<div style="display: none">
        <div class="wBox_hide wBox_overlayBG" id="wBox_overlay">
        </div>
        <div id="wBox">
            <div class="wBox_popup">
                <table>
                    <tbody>
                        <tr>
                            <td class="wBox_tl">
                            </td>
                            <td class="wBox_b">
                            </td>
                            <td class="wBox_tr">
                            </td>
                        </tr>
                        <tr>
                            <td class="wBox_b">
                                <div style="width: 10px;">
                                    &nbsp;</div>
                            </td>
                            <td>
                                <div class="wBox_body">
                                    <table class="wBox_title">
                                        <tbody>
                                            <tr>
                                                <td class="wBox_dragTitle" style="cursor: move;">
                                                    <div class="wBox_itemTitle">
                                                        注册或登录</div>
                                                </td>
                                                <td width="20px" title="关闭">
                                                    <div class="wBox_close" >
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <div id="wBoxContent" class="wBox_content">
                                        <div class="loginbox">
                                            <div class="loglf">
                                                <table width="550" height="350" cellspacing="0" cellpadding="5" border="0">
                                                    <tbody>
                                                        <tr height="20">
                                                            <td height="35" align="center" colspan="3">
                                                                <span class="ftitle">新会员报名注册</span><input type="hidden" value="" id="freetype" name="freetype">
                                                            </td>
                                                        </tr>
                                                        <tr height="20">
                                                            <td width="110" height="30" align="right" class="ft14">
                                                                <div align="right">
                                                                    <font color="red">*</font> 用&nbsp;户&nbsp;名:</div>
                                                            </td>
                                                            <td width="168" height="30" align="left">
                                                                <input type="text" maxlength="16" onblur="this.style.borderColor='#A3BFA8';ChangeColor('reg_nc_msg',1);CheckUserName('reg_nc','reg_nc_msg');"
                                                                    onfocus="this.style.borderColor='#99E300';this.select();ChangeColor1('reg_nc_msg','请输入用户名',0)" id="reg_nc"
                                                                    class="INPUT" tabindex="1" name="reg_nc" style="border-color: rgb(163, 191, 168);" />
                                                            </td>
                                                            <td width="242" height="30">
                                                                <div id="reg_nc_msg" class="line1px">
                                                                    &nbsp;用户名只能是数字字母下划线，4-16位</div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td width="110" height="30" align="right" class="ft14">
                                                                <div align="right">
                                                                    <font color="red">*</font> 输入密码:</div>
                                                            </td>
                                                            <td width="168" height="30" align="left">
                                                                <input type="password" maxlength="32" onblur="this.style.borderColor='#A3BFA8';ChangeColor('reg_pwd_msg',1);CheckPassWord('reg_pwd','reg_pwd_msg');"
                                                                    onfocus="this.style.borderColor='#99E300';ChangeColor('reg_pwd_msg',0)" id="reg_pwd"
                                                                    class="INPUT" tabindex="2" name="reg_pwd" style="border-color: rgb(163, 191, 168);">
                                                            </td>
                                                            <td height="30">
                                                                <div id="reg_pwd_msg" class="line1px">
                                                                    &nbsp;6~16个字符，包括字母、数字、下划线，区分大小写</div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td width="110" height="30" align="right" class="ft14">
                                                                <div align="right">
                                                                    <font color="red">*</font> 确认密码:</div>
                                                            </td>
                                                            <td width="168" height="30" align="left">
                                                                <input type="password" onblur="this.style.borderColor='#A3BFA8';ChangeColor('re_pwd_msg',1);PasswordEquals('reg_pwd','re_pwd','re_pwd_msg')"
                                                                    onfocus="this.style.borderColor='#99E300';ChangeColor('re_pwd_msg',0)" class="INPUT"
                                                                    maxlength="32" id="re_pwd" tabindex="3" name="re_pwd" style="border-color: rgb(163, 191, 168);">
                                                            </td>
                                                            <td height="30">
                                                                <div id="re_pwd_msg" class="line1px">
                                                                    &nbsp;请再输入一遍您上面输入的密码</div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td width="110" height="30" align="right" class="ft14">
                                                                <div align="right">
                                                                    <font color="red">*</font> 真实姓名:</div>
                                                            </td>
                                                            <td width="168" height="30" align="left">
                                                                <input type="text" maxlength="30" onblur="this.style.borderColor='#A3BFA8';ChangeColor('reg_tname_msg',1);CheckTrueName('reg_tname','reg_tname_msg')"
                                                                    onfocus="this.style.borderColor='#99E300';ChangeColor('reg_tname_msg',0)" id="reg_tname"
                                                                    class="INPUT" tabindex="4" name="reg_tname" style="border-color: rgb(163, 191, 168);">
                                                            </td>
                                                            <td height="30">
                                                                <div id="reg_tname_msg" class="line1px">
                                                                    &nbsp;便于客服短时间内确认您的订单和汇款</div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td width="110" height="30" align="right" class="ft14">
                                                                <div align="right">
                                                                    <font color="red">*</font> 手机号码:</div>
                                                            </td>
                                                            <td width="168" height="30" align="left">
                                                                <input maxlength="30" onblur="this.style.borderColor='#A3BFA8';ChangeColor('telNum_info',1);CheckTelNum('telNum','telNum_info')"
                                                                    onfocus="this.style.borderColor='#99E300';ChangeColor('telNum_info',0)" id="telNum"
                                                                    class="INPUT" tabindex="5" name="telNum" style="border-color: rgb(163, 191, 168);">
                                                            </td>
                                                            <td height="30">
                                                                <div class="line1px" id="telNum_info">
                                                                    &nbsp;课程开通后,我们将以手机短信通知您</div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td width="110" height="30" align="right" class="ft14">
                                                                <div align="right">
                                                                    <font color="red">*</font> 电子邮件:</div>
                                                            </td>
                                                            <td height="30" align="left">
                                                                <input type="text" maxlength="30" onblur="this.style.borderColor='#A3BFA8';ChangeColor('reg_mail_msg',1);CheckNull('reg_mail','&nbsp;邮件为空！','reg_mail_msg','&nbsp;Email格式正确！');CheckMail('reg_mail','reg_mail_msg')"
                                                                    onfocus="this.style.borderColor='#99E300';ChangeColor('reg_mail_msg',0)" id="reg_mail"
                                                                    class="INPUT" name="reg_mail" style="border-color: rgb(163, 191, 168);">
                                                            </td>
                                                            <td height="30">
                                                                <div id="reg_mail_msg" class="line1px">
                                                                    &nbsp;请填写邮件地址,有消息会邮件给您</div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td height="30" align="center">
                                                            </td>
                                                            <td height="30" align="center" id="btzc">
                                                                <span class="zcbn" onclick="CheckAllForms(this);">注册报名</span>
                                                            </td>
                                                            <td height="30">
                                                                <div id="reg_err_msg" class="line1px">
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="logrt">
                                                <table width="300" cellspacing="0" cellpadding="5" border="0">
                                                    <tbody>
                                                        <tr height="20">
                                                            <td width="300" height="35" align="center" class="ft18" colspan="2">
                                                                <span class="ftitle">已注册会员报名登录</span>
                                                            </td>
                                                        </tr>
                                                        <tr height="20">
                                                            <td width="90" height="35" align="right" class="ft14">
                                                                <div style="width: 90px;">
                                                                    用户名:</div>
                                                            </td>
                                                            <td width="190" height="35" align="left">
                                                                <input type="text" maxlength="30" size="21" onblur="this.style.borderColor='#A3BFA8';"
                                                                    onfocus="this.style.borderColor='#99E300'" class="INPUT" id="log_un" name="log_un"
                                                                    style="border-color: rgb(163, 191, 168);">
                                                            </td>
                                                        </tr>
                                                        <tr height="20">
                                                            <td width="90" height="35" align="right" class="ft14">
                                                                <div style="width: 90px;">
                                                                    密码:</div>
                                                            </td>
                                                            <td width="190" height="35" align="left">
                                                                <input type="password" maxlength="32" size="21" onblur="this.style.borderColor='#A3BFA8';"
                                                                    onfocus="this.style.borderColor='#99E300'" class="INPUT" id="log_pwd" name="log_pwd"
                                                                    style="border-color: rgb(163, 191, 168);">
                                                            </td>
                                                        </tr>
                                                         <tr style="display: none; height: 20px; line-height: 20px;" id="log_un_Tip">
                                                            <td width="300" valign="middle" align="center" style="font-size: 12px; background: #e2f5ff;" colspan="2">
                                                                <div class="line1px_5" id="log_tip_o"></div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td width="90" height="25" align="right" class="ft14">
                                                                &nbsp;
                                                            </td>
                                                            <td width="190" height="25" align="center" id="btdl">
                                                                <span onclick="CheckLogForms(this)" class="zcbn">登录报名</span>
                                                            </td>
                                                        </tr>
                                                       
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </td>
                            <td class="wBox_b">
                                <div style="width: 10px;">
                                    &nbsp;</div>
                            </td>
                        </tr>
                        <tr>
                            <td class="wBox_bl">
                            </td>
                            <td class="wBox_b">
                            </td>
                            <td class="wBox_br">
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
      </div>
</div>
<script type="text/javascript" src="/plug-in/jquery/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="/plug-in/artDiglog/jquery.artDialog.js?skin=default"></script>
<script type="text/javascript" src="/plug-in/tools/checkRegisterFromCart.js"></script>
<script type="text/javascript" src="/plug-in/tools/cart.js"></script>
<script type="text/javascript" src ="/plug-in/agencycms/js/common.js"></script>
<script type="text/javascript">
var studentid ="${student.username}";
var ids ="";
var logup=1;
$(function(){
	count();
	$(".wBox_close").live("click", function() {
        $($("#wBox").parents("div")[0]).css("display", "none");
	});
});
</script>
</body>
</html>
