<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="/context/mytags.jsp"%> 
<%@page import="java.util.*" %>
<%@page import="com.changh.jeeipms.common.entity.agency.MenuEntity" %>  
<!DOCTYPE html>
<html>
 <head>
 <title>发布机构</title>
<t:base type="jquery,easyui,tools"></t:base>
<style type="text/css">
        center {margin-top:50px} 
 </style>
<script type="text/javascript">
 	var agencyid="${agencyid}";
 	var length = ${fn:length(menuList)};
 	var  menu=new   Array();
 	$(function(){	
 		var i=0
 		f_release(0);
 	});
 	function f_release(i){
 		$.post("${pageContext.request.contextPath}/agencyReleaseWith.do?release",{menuId:$("#"+i).val(),agencyId:agencyid},
          					function(data){
          						if(data.success==true){
          							$("center").html("正在发布<span style=\"color:green;\">"+$("#"+(i+1)).attr("name")+"</span>，共<span style=\"color:red;\">"+length+"</span>个栏目，已发布<span style=\"color:green;\">"+i+"</span>个栏目");
          							if(i==length-1){ 
          								$("center").html("<span style=\"color:green;\">发布完成，共发布<span style=\"color:red;\">"+length+"</span>个栏目");
          							}else{
          								f_release(i+1);
          							}

          						}else{
          							$("center").html("<span style=\"color:red;\">"+$("#"+i).attr("name")+"</span>"+data.msg+"。共<span style=\"color:red;\">"+length+"</span>个栏目");
          							
          						}
							},
							"json"
          					);
 	}
 </script>
</head>
<body>
	<c:forEach var="menu" items="${menuList}" varStatus="index">
    	<input type="hidden" value="${menu.id}" name="${menu.cnname}" id="${index.index}" >
	</c:forEach>
	<center>
		<span style="color: green">准备发布中.....</span>
	</center>
</body>
</html>