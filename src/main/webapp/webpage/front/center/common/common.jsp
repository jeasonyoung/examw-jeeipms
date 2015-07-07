<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<link type="text/css" rel="stylesheet" href="/center/css/global-min.css" />
<!--[if lt IE 9]> <script src="http://stat.ablesky.cn/statb/js_optimize/lib/shiv/html5.js"></script> <![endif]-->
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
				<a class="link nav-link menu-trigger" href="">我的订单<i class="aui-arrow-s"></i></a>
				<menu>
					<li><a class="link menu-item" href="">已支付订单</a></li>
					<li><a class="link menu-item" href="">未支付订单</a></li>
				</menu>
			</li>
			<li class="nav-item myoffice trigger-wrapper">
				<a class="link nav-link menu-trigger" href="">我的帐户<i class="aui-arrow-s"></i></a>
				<menu>
					<li><a class="link menu-item" href="">现金充值</a></li>
					<li><a class="link menu-item" href="">学习卡充值</a></li>
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
<script type="text/javascript" src="/center/js/require-jquery.js"></script>
<script type="text/javascript" src="/center/js/common/site-nav.js"></script>
</body>
</html>