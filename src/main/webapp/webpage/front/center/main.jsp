<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/context/context.jsp"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8" />
<base href="<%=basePath%>"/>
<title>${student.username}</title>
<meta name="description" content="" />
<meta name="keywords" content="${student.username}" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<link type="text/css" rel="stylesheet" href="/center/css/global-min.css" />
<!--[if lt IE 9]> <script src="http://stat.ablesky.cn/statb/js_optimize/lib/shiv/html5.js"></script> <![endif]-->
<link type="text/css" rel="stylesheet" href="http://stat1.ablesky.cn/statc/stylecss_optimize/sidebar.css?v=201309251541" />
<link type="text/css" rel="stylesheet" href="http://stat1.ablesky.cn/statc/stylecss_optimize/knowledge-base.css?v=201309251541" />
<link type="text/css" rel="stylesheet" href="/center/css/page-index.css" />
<style type="text/css">
</style>
</head>
<body>
<header id="J_siteNav" class="site-nav">
	<nav class="site-nav-bd clearfix">
		<p class="mobile"><a class="link" href="http://www.ablesky.com/eventsRedirect.do?action=subjects&amp;subject-page=toProductPage6">移动客户端</a></p>
		<div class="account">
			<a class="link" href="http://www.ablesky.com/jiangwei3457">${student.username}</a>
			<a class="link logout" href="stuCenter.do?logout">[退出]</a>
		</div>
		<ul class="site-nav-items">
			<li class="nav-item as-home"><a class="link nav-link" href="/">平台首页</a></li>
			<li class="nav-item study-center trigger-wrapper">
				<a class="link nav-link menu-trigger" href="http://www.ablesky.com/studyCenterRedirect.do?action=loadStudyCenterPage">学习中心<i class="aui-arrow-s"></i></a>
				<menu style="width: 80px;">
					<li><a class="link menu-item" href="">我的课程</a></li>
					<li><a class="link menu-item" href="">学习记录</a></li>
				</menu>
			</li>
			<li class="nav-item myoffice trigger-wrapper">
				<a class="link nav-link menu-trigger" href="">我的订单<i class="aui-arrow-s"></i></a>
				<menu>
					<li><a class="link menu-item" href="">已支付订单</a></li>
					<li><a class="link menu-item" href="">未支付订单</a></li>
				</menu>
			</li>
			<li class="nav-item myoffice trigger-wrapper">
				<a class="link nav-link menu-trigger" href="">我的帐户<i class="aui-arrow-s"></i></a>
				<menu>
					<li><a class="link menu-item" href="">充值</a></li>
					<li><a class="link menu-item" href="">学习卡</a></li>
					<li><a class="link menu-item" href="">提现</a></li>
					<li><a class="link menu-item" href="">设置</a></li>
					<li><a class="link menu-item" href="">账户明细</a></li>
				</menu>
			</li>
			<li class="nav-item cart">
				<a class="link nav-link" href="">选课包<i class="cart-num">0</i></a>
			</li>
			<li class="nav-item contact-cs trigger-wrapper" data-control-width="151">
				<a class="link nav-link menu-trigger" href="">联系我们<i class="aui-arrow-s"></i></a>
				<menu>
					<li>
						<p>客服热线: </p>
						<p><em>4006-800-025</em></p>
						<p>客服邮箱: <br>
							<a class="link cs-mail" href="mailto:service@ablesky.com">service@ablesky.com</a>
						</p>
						
						<div class="cs-info">
							<img src="http://stat2.ablesky.cn/statc/images/market/common/loading-32-32.gif" style="margin: 10px 0 0 45px;">
						</div>
					</li>
				</menu>
			</li>
		</ul>
	</nav>
</header>
<div id="wrapper" class="main-section clearfix">
<div class="category-main">
	<div class="cate-t"></div>
	<div class="cate-c clearfix">
	<div class="categorybar">
	<nav class="site-nav-bd clearfix">
<div class="category-top">
		<span class="cateitem-icon icon-work">&nbsp;</span>
		<span class="catename">工作</span>
		</div>
		<ul class="category-list">
			<li class="category-2sec  clearfix">
					<a class="categ-link" href="http://www.ablesky.com/s/kecheng/list_Course_3003">
						<span class="categ-name">资格认证</span>
						<span class="categ-expand"></span>
					</a>
			</li>
			<li class="category-2sec  clearfix">
					<a class="categ-link" href="http://www.ablesky.com/s/kecheng/list_Course_3003">
						<span class="categ-name">资格认证</span>
						<span class="categ-expand"></span>
					</a>
			</li>
			<li class="category-2sec  clearfix">
					<a class="categ-link" href="http://www.ablesky.com/s/kecheng/list_Course_3003">
						<span class="categ-name">资格认证</span>
						<span class="categ-expand"></span>
					</a>
			</li>
			<li class="category-2sec  clearfix">
					<a class="categ-link" href="http://www.ablesky.com/s/kecheng/list_Course_3099">
						<span class="categ-name">其他技能</span>
						<span class="categ-expand"></span>
					</a>
			</li>
		</ul>
	<div class="category-top">
			<span class="cateitem-icon icon-study">&nbsp;</span>
			<span class="catename">学习</span>
		</div>
		<ul class="category-list">
			<li class="category-2sec  clearfix">
					<a class="categ-link" href="http://www.ablesky.com/s/kecheng/list_Course_3101">
						<span class="categ-name">考研</span>
						<span class="categ-expand"></span>
					</a>
					</li>
			<li class="category-2sec  clearfix">
					<a class="categ-link" href="http://www.ablesky.com/s/kecheng/list_Course_3102">
						<span class="categ-name">语言考试</span>
						<span class="categ-expand"></span>
					</a>
					</li>
			<li class="category-2sec  clearfix">
					<a class="categ-link" href="http://www.ablesky.com/s/kecheng/list_Course_3103">
						<span class="categ-name">基础教育</span>
						<span class="categ-expand"></span>
					</a>
					</li>
			<li class="category-2sec  clearfix">
					<a class="categ-link" href="http://www.ablesky.com/s/kecheng/list_Course_3104">
						<span class="categ-name">成人教育</span>
						<span class="categ-expand"></span>
					</a>
					</li>
			<li class="category-2sec  clearfix">
					<a class="categ-link" href="http://www.ablesky.com/s/kecheng/list_Course_3106">
						<span class="categ-name">IT网络</span>
						<span class="categ-expand"></span>
						</a>
					</li>
			<li class="category-2sec  clearfix">
					<a class="categ-link" href="http://www.ablesky.com/s/kecheng/list_Course_3199">
						<span class="categ-name">科普</span>
						<span class="categ-expand"></span>
						</a>
					</li>
			</ul>
	<div class="category-top">
			<span class="cateitem-icon icon-life">&nbsp;</span>
			<span class="catename">生活</span>
		</div>
		<ul class="category-list">
			<li class="category-2sec  clearfix" >
					<a class="categ-link" href="http://www.ablesky.com/s/kecheng/list_Course_3201">
						<span class="categ-name">文化</span>
						<span class="categ-expand"></span>
						</a>
					</li>
			<li class="category-2sec  clearfix">
					<a class="categ-link" href="http://www.ablesky.com/s/kecheng/list_Course_3202">
						<span class="categ-name">时尚</span>
						<span class="categ-expand"></span>
						</a>
					</li>
			<li class="category-2sec  clearfix">
					<a class="categ-link" href="http://www.ablesky.com/s/kecheng/list_Course_3203">
						<span class="categ-name">居家休闲</span>
						<span class="categ-expand"></span>
						</a>
					</li>
			<li class="category-2sec  clearfix">
					<a class="categ-link" href="http://www.ablesky.com/s/kecheng/list_Course_3204">
						<span class="categ-name">娱乐</span>
						<span class="categ-expand"></span>
					</a>
					</li>
			<li class="category-2sec  clearfix">
					<a class="categ-link" href="http://www.ablesky.com/s/kecheng/list_Course_3299">
						<span class="categ-name">其他</span>
						</a>
					</li>
			</ul>
	</div> <!-- .categorybar END -->
</div>
<div class="cate-b"></div>
</div> <!-- #categorybar END -->
<div class="content">
			<div id="J_courseListContent" class="datatable-course clearfix">
				<div class="right_diva" style="position:relative;">
	            	<ul>
	                	<li class="diva_left">
	                    	<dl>
	                        	<dt><a href="account/Face.aspx" title="点击修改头像"><img id="imgFace" class="tupan" src="/images/user/user-default-0.png" style="height:125px;width:125px;"></a><div class="touxiang"><a href="#">修改头像</a></div></dt>
	                            <dd class="dd_2">
	                            	<h2>欢迎您 ${student.username}，中华考试网校祝您学习愉快！</h2>
	                                <span class="pcdt_xx">我的学号：<em>8699115</em></span><span class="pcdt_xx">我的学分：<em>21分</em></span>
	                                
	                                
	                                <span id="ctl00_cp1_shoppingStatus3" class="pcdt_xxa"><em><a href="/classlist.asp" target="_blank">立即报名&gt;&gt;</a></em>您还没有开通课程</span>
	                            </dd>
	                        </dl>
	                    <span class="pcdt_xxb">
	                	<span>系统消息：<a href="msg/sys.aspx"><b>0</b></a></span><span>学习提醒：<a href="msg/sys.aspx"><b>0</b></a></span><span>答疑回复：<a href="question/myquestion.aspx?r=1"><b>0</b></a></span></span>
	                
	                    </li>
	                    <li class="diva_right">	
	                    	<div class="diva_right_a center">
	                            
	                            <span><em><a href="money/card.aspx" style="font-weight:bold;color:#0396ff">充值</a></em>学习卡账户余额 <var style="font-weight:bold">￥0.00</var></span>
	                            <span><em></em>试卷账户余额&nbsp;&nbsp;&nbsp;<var style="font-weight:bold">￥0.00</var></span>
	                        </div>
	                        <span class="daka"><a href="javascript:;" onclick="signIn()" id="btnSignIn"></a></span>
	                        <span class="daka_xx" style="padding-left:15px;"><span>积&nbsp;分：<em id="integral" style="font-weight:bold">330</em></span><span>等&nbsp;级：<em>有学而志</em></span></span>
	                        <span class="daka_xz">下一等级：500分，还差170分</span>
	                    </li>
	                </ul>
	              
	            	</div>
				<div class="recommend">		
				<div class="rBtit">
				<div class="rBbtn1" id="si_1" onmouseover="switchTag('si_','bd',1,2,'rBbtn1','rBbtn2');"><a href="#">学习记录</a></div>
				<div class="rBbtn2" id="si_2" onmouseover="switchTag('si_','bd',2,2,'rBbtn1','rBbtn2');"><a href="#">推荐课程</a></div>
				</div>
				<div class="bd" id="bd1">	
					<section class="course clearfix">
						<div class="user-head">
							<a target="_blank" href="jiangwei3457"><img src="http://img2.ablesky.cn/content/pic/accountphoto/2011-11-29/user-default-1.png" alt="head"></a>
						</div>
						<div class="dynamic clearfix">
							<div class="user-action"><a target="_blank" href="jiangwei3457">jiangwei3457</a><span>观看课程:</span></div>
							<div class="content clearfix"><div class="course-title"><a target="_blank" title="查看课程详情" href="kecheng/detail_232027">申论模块 32节课</a></div>
							<div class="course-desc"></div><div class="course-triviality"><span>时长25:33</span><span>观看2534</span><span>课件32</span><span class="slide-up">收起</span></div>
							<div class="course-preview"><div class="course-img"><img src="http://img2.ablesky.cn/content/pic/coursecontentphoto/2013-02-28/cfeae049-cb48-4a89-a670-0fab5f7a640a.jpg" alt="course thumbnail"><span class="play-btn" data-courseid="232027"></span></div>
							<div class="course-nopreview">暂时无法预览,去看看<a href="kecheng/detail_232027" target="_blank">课程详情</a>吧</div>
							<div id="J_courseVideo0" class="course-video course-loading"></div>
							</div></div><div class="pub-date">09:39</div>
						</div>
					</section>		
				</div>
				<div class="bd" id="bd2" style="display: none;">
					<ul>
						<li class="clearfix">
							<div class="course-pic">
								<a href="kecheng/detail_272610" target="_blank">
									<img src="http://img5.ablesky.cn/content/pic/recommendcoursephoto/2013-09-22/07756f27-a38f-479f-b3f8-0c6d1779c3a1.png">
									<span class="round-mask"></span>
									<span class="course-typebg"></span>
									<span class="course-type threewin"></span>
									<span class="timelong">
										<span class="l"></span>
										<span class="c">01:00</span>
										<span class="r"></span>
									</span>
									<span class="hover-pic">开始学习</span>
								</a>
							</div>
							<div class="course-info">
								<h2><a target="_blank" href="kecheng/detail_272610">2013年司法考试专题讲座三国法</a></h2>
								<p>2013年司法考试专题讲座三国法杨帆第1节：国际公法</p>
								<div class="statics">
									<a class="view-count ablesky-colortip" title="学习数" href="javascript:;">&nbsp;</a>
									<strong>144</strong>
									<a class="video-count ablesky-colortip" title="课件数" href="javascript:;">&nbsp;</a>
									<strong>1</strong> 
								</div>
								<div class="owner">
									<img class="ablesky-colortip-left" data-tipclass="poshytip-left" title="好评：100.00%" src="http://img5.ablesky.cn/content/pic/organizationphoto/2011-05-07/9f202462-e7b7-4407-ac82-8869bd5e241f.jpg">
									<a href="sikaoline" title="独角兽司法考试网" target="_blank">独角兽司法考试网</a>
									<span>发布</span>
									<span class="date">2013-07-31</span>
								</div>
							</div> <!-- .course-info END -->
						</li>
						<li class="clearfix">
							<div class="course-pic">
								<a href="kecheng/detail_272610" target="_blank">
									<img src="http://img5.ablesky.cn/content/pic/recommendcoursephoto/2013-09-22/07756f27-a38f-479f-b3f8-0c6d1779c3a1.png">
									<span class="round-mask"></span>
									<span class="course-typebg"></span>
									<span class="course-type threewin"></span>
									<span class="timelong">
										<span class="l"></span>
										<span class="c">01:00</span>
										<span class="r"></span>
									</span>
									<span class="hover-pic">开始学习</span>
								</a>
							</div>
							<div class="course-info">
								<h2><a target="_blank" href="kecheng/detail_272610">2013年司法考试专题讲座三国法</a></h2>
								<p>2013年司法考试专题讲座三国法杨帆第1节：国际公法</p>
								<div class="statics">
									<a class="view-count ablesky-colortip" title="学习数" href="javascript:;">&nbsp;</a>
									<strong>144</strong>
									<a class="video-count ablesky-colortip" title="课件数" href="javascript:;">&nbsp;</a>
									<strong>1</strong> 
								</div>
								<div class="owner">
									<img class="ablesky-colortip-left" data-tipclass="poshytip-left" title="好评：100.00%" src="http://img5.ablesky.cn/content/pic/organizationphoto/2011-05-07/9f202462-e7b7-4407-ac82-8869bd5e241f.jpg">
									<a href="sikaoline" title="独角兽司法考试网" target="_blank">独角兽司法考试网</a>
									<span>发布</span>
									<span class="date">2013-07-31</span>
								</div>
							</div> <!-- .course-info END -->
						</li>
						</ul>
				</div>
			</div>
			</div><!-- .datatble-course END -->
			<section class="content-holder"></section>
		</div>
</div><!-- .wrapper END -->
<script type="text/javascript" src="/center/js/require-jquery.js"></script>
<script type="text/javascript" src="/center/js/common/site-nav.js"></script>
<script type="text/javascript">
function switchTag(tag,content,k,n,stylea,styleb){	 
	   for(var i=1; i <=n; i++){if (i==k){
	      document.getElementById(tag+i).className=stylea;
		  document.getElementById(content+i).style.display="block";;
		  }else{
		     document.getElementById(tag+i).className=styleb;
		     document.getElementById(content+i).style.display="none";;
			 }
		}
};
</script>
</body>
</html>