<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src ="/plug-in/player/jwplayer.min.js"></script>
<script type="text/javascript" src ="/agency/img/jquery-1.8.3.min.js"></script>
<script type="text/javascript">  
   var thePlayer;  //保存当前播放器以便操作
   var timer;  
   function test(){
	   thePlayer =   jwplayer("container").setup({
		    flashplayer: '/plug-in/player/youeclass.swf',			   
          	'file': "2013yjgcjjjjst.flv" ,
			controlbar: 'bottom',
			"skin":"/plug-in/player/stormtrooper.zip",	
			image:'/main/images/bg2.png',
			provider: 'http',
			repeat:"always",
			autostart: 'true'
       }); 
   }      

   $(function() {  
	   		test();
            //获取当前时间
    });  
   
   function userName() {
		return "11111";
   	 }
    </script>  
	</head>
<body>
	<div id="container"></div>  
</body>
</html>