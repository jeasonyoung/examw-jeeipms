<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@include file="/context/context.jsp"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>"/>
<title>面授课程</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />	
<style type="text/css">
.sort{color:#0663A2;cursor:pointer;}
</style>
</head>
<body>
	<%@include file="common/head.jsp"%>
<div id="content">
   <div class="container-fluid">
	 <div class="row-fluid">
        <div class="span8">
			<h3 class="heading">Calendar</h3>
			<div id="calendar"></div>
        </div>
        <div class="span4" id="user-list">
			<h3 class="heading">Users <small>last 24 hours</small></h3>
			<div class="row-fluid">
				<div class="input-prepend">
					<span class="add-on ad-on-icon"><i class="icon-user"></i></span><input type="text" class="user-list-search search" placeholder="Search user" />
				</div>
				<ul class="nav nav-pills line_sep">
					<li class="dropdown">
						<a class="dropdown-toggle" data-toggle="dropdown" href="#">Sort by <b class="caret"></b></a>
						<ul class="dropdown-menu sort-by">
							<li><a href="javascript:void(0)" class="sort" data-sort="sl_name">by name</a></li>
							<li><a href="javascript:void(0)" class="sort" data-sort="sl_status">by status</a></li>
						</ul>
					</li>
					<li class="dropdown">
						<a class="dropdown-toggle" data-toggle="dropdown" href="#">Show <b class="caret"></b></a>
						<ul class="dropdown-menu filter">
							<li class="active"><a href="javascript:void(0)" id="filter-none">All</a></li>
							<li><a href="javascript:void(0)" id="filter-online">Online</a></li>
							<li><a href="javascript:void(0)" id="filter-offline">Offline</a></li>
						</ul>
					</li>
				</ul>
			</div>
			<ul class="list user_list">
				<li>
					<span class="label label-success pull-right sl_status">online</span>
					<a href="#" class="sl_name">John Doe</a><br />
					<small class="s_color sl_email">johnd@example1.com</small>
				</li>
				<li>
					<span class="label label-success pull-right sl_status">online</span>
					<a href="#" class="sl_name">Kate Miller</a><br />
					<small class="s_color sl_email">kmiller@example1.com</small>
				</li>
				<li>
					<span class="label label-important pull-right sl_status">offline</span>
					<a href="#" class="sl_name">James Vandenberg</a><br />
					<small class="s_color sl_email">jamesv@example2.com</small>
				</li>
				<li>
					<span class="label label-important pull-right sl_status">offline</span>
					<a href="#" class="sl_name">Donna Doerr</a><br />
					<small class="s_color sl_email">donnad@example3.com</small>
				</li>
				<li>
					<span class="label label-important pull-right sl_status">offline</span>
					<a href="#" class="sl_name">Perry Weitzel</a><br />
					<small class="s_color sl_email">perryw@example2.com</small>
				</li>
				<li>
					<span class="label label-success pull-right sl_status">online</span>
					<a href="#" class="sl_name">Charles Bledsoe</a><br />
					<small class="s_color sl_email">charlesb@example3.com</small>
				</li>
				<li>
					<span class="label label-important pull-right sl_status">offline</span>
					<a href="#" class="sl_name">Wendy Proto</a><br />
					<small class="s_color sl_email">wnedyp@example1.com</small>
				</li>
				<li>
					<span class="label label-success pull-right sl_status">online</span>
					<a href="#" class="sl_name">Nancy Ibrahim</a><br />
					<small class="s_color sl_email">nancyi@example2.com</small>
				</li>
				<li>
					<span class="label label-important pull-right sl_status">offline</span>
					<a href="#" class="sl_name">Eric Cantrell</a><br />
					<small class="s_color sl_email">ericc@example4.com</small>
				</li>
				<li>
					<span class="label label-success pull-right sl_status">online</span>
					<a href="#" class="sl_name">Andre Hill</a><br />
					<small class="s_color sl_email">andreh@example2.com</small>
				</li>
				<li>
					<span class="label label-success pull-right sl_status">online</span>
					<a href="#" class="sl_name">Laura Taggart</a><br />
					<small class="s_color sl_email">laurat@example3.com</small>
				</li>
				<li>
					<span class="label label-important pull-right sl_status">offline</span>
					<a href="#" class="sl_name">Doug Singer</a><br />
					<small class="s_color sl_email">dougs@example2.com</small>
				</li>
				<li>
					<span class="label label-success pull-right sl_status">online</span>
					<a href="#" class="sl_name">Douglas Arnott</a><br />
					<small class="s_color sl_email">douglasa@example1.com</small>
				</li>
				<li>
					<span class="label label-important pull-right sl_status">offline</span>
					<a href="#" class="sl_name">Lauren Henley</a><br />
					<small class="s_color sl_email">laurenh@example3.com</small>
				</li>
				<li>
					<span class="label label-important pull-right sl_status">offline</span>
					<a href="#" class="sl_name">William Jardine</a><br />
					<small class="s_color sl_email">williamj@example4.com</small>
				</li>
				<li>
					<span class="label label-success pull-right sl_status">online</span>
					<a href="#" class="sl_name">Yves Ouellet</a><br />
					<small class="s_color sl_email">yveso@example2.com</small>
				</li>
			</ul>
			<div class="pagination"><ul class="paging bottomPaging"></ul></div>
        </div>
       </div>
     </div>
   </div>
</body>
<link rel="stylesheet" href="plug-in/fullcalendar/fullcalendar_gebo.css"  />
<link rel="stylesheet" href="plug-in/fullcalendar/imps.css"  />
<script type="text/javascript" src="plug-in/fullcalendar/fullcalendar.min.js"></script>
<script type="text/javascript" src="plug-in/fullcalendar/gcal.js"></script>
<script type="text/javascript" src="plug-in/fullcalendar/gebo_dashboard.js"></script>
<script type="text/javascript">
</script>
</html>