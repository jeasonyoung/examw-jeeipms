	function check_all(obj){
		var smObj = document.getElementsByTagName("input");
		if (obj.checked == false) {
	         for (var i = 0; i < smObj.length; i++)
	             smObj[i].checked = false;
	    }else{
	    	 for (var i = 0; i < smObj.length; i++)
	             smObj[i].checked = true;
	    }
		count();
	}
	/**
	 * 机构选择框
	 * @param id
	 */
	function check_business_all(id) {
		var money =0;
	    if (id == null || id == "") {
	        alert("请选择");
	    } else {
	        if($("#check_all_business_"+id).attr("checked") == "checked"){
	            $("#business_bar_"+id+" :checkbox").each(function(i) {
	                $(this).attr("checked","checked");
	            });
	        }else{
	            $("#business_bar_"+id+" :checkbox").each(function(i) {
	                $(this).attr("checked",false);
	            });
	        }
	        var flag = false;
	        $("input[name='myBusiness']").each(function(i) {
	            if($(this).attr("checked") == "checked"){
	                flag = true;
	            }else{
	                flag = false;
	                return false; 
	            }
	        });
	        if(flag){
	            $("#check_all_top").attr("checked","checked");
	            $("#check_all_foot").attr("checked","checked");
	        }else{
	            $("#check_all_top").attr("checked",false);
	            $("#check_all_foot").attr("checked",false);
	        }
	        count();
	    }
	};

	/**
	 *课程选择
	 * @param id
	 */
	function check_cashticket(id, b_id) {
	    if (id == null || id == "" || b_id == null || b_id == "") {
	        alert("请选择");
	    } else {
	        var flag = false;
	        $("#business_bar_"+b_id+" tr[id] :checkbox").each(function(i) {
	            if($(this).attr("checked") == "checked"){
	                flag = true;
	            }else{
	                flag = false;
	                return false; 
	            }
	        });
	        if(flag){
	            $("#check_all_business_"+b_id).attr("checked","checked");
	        }else{
	            $("#check_all_business_"+b_id).attr("checked",false);
	        }
	        
	        //重新初始化flag
	        flag = false;
	        
	        $("input[name='myBusiness']").each(function(i) {
	            if($(this).attr("checked") == "checked"){
	                flag = true;
	            }else{
	                flag = false;
	                return false; 
	            }
	        });
	        if(flag){
	            $("#check_all_top").attr("checked","checked");
	            $("#check_all_foot").attr("checked","checked");
	        }else{
	            $("#check_all_top").attr("checked",false);
	            $("#check_all_foot").attr("checked",false);
	        }
	        count();
	    }
	};
	/**
	 *总价统计
	 */
	
	 function count(){
		 var count=0;
		 //先清空ids
		 ids="";
		 $("[name='cartIds']:checked").each(function(){
			 var id =$(this).attr("id").substring(17);
			 ids+=id+","; 
			 count+=parseFloat($("#price_"+id).text())
		 });
		 $("#total").text(count);
	 };
	 
	 /**
	  * 删除
      */
     function delete_course(courseId){
		var course= getCookie("course").replace(courseId+",","");
		setCookie('course',course);
		
		//$("#course_"+courseId).remove();
		window.location="/cartController.do?cartList";  
	 }
	 
	 /**
	  *生成订单
	  */
	  function CreateOrder(total) {
          $.ajax({
              type: "POST",
              async: true,
              dataType: "json",
              beforeSend: function() { loading("正在订单提交"); },
              complete: function() { dialoading.close(); },
              url: "orderController.do?order",
              data: {"total":total,"ids":ids},
              success: function(data) {
                  if (data.success){
                	  location.replace("orderController.do?showOrder");
                  }else
                  	notice("订单生成失败！",2,100);
              },
              error:function()
              {
              	notice("系统异常,请刷新重试！",2,100);
              }
          });
      } 
	 function create_order(){
		var total = $("#total").text();
        if (total!=0) {
            if (!studentid) {
                LoginDisplay(0);
            }else {
               	CreateOrder(total);
             }
          }else{
        	  notice("请选择要购买的课程", 2,180);
          } 
	 }
	 
	   function CheckLogForms(obj) {
	        var log_un = $("#log_un").val();
	        var log_pwd = $("#log_pwd").val();
	        if ((log_un.length < 2) || (log_un.length > 32)) {
	            $("#log_un_Tip").css("display", "block");
	            $("#log_tip_o").html("请正确填写用户名");
	            return false;
	        }
	        else if (!CheckSafe(log_un)) {
	            $("#log_un_Tip").css("display", "block");
	            $("#log_tip_o").html("用户名不能含以下字符:'&<>?%,;:()`~!#$^*{}[]|+-=\"");
	            return false;
	        }

	        if (log_pwd.length < 4 || log_pwd.length > 64) {
	            $("#log_un_Tip").css("display", "block");
	            $("#log_tip_o").html("密码长度不正确");
	            return false;
	        }
	        userLogin(obj);
	    }
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
	     
	     function userLogin(obj) {
	 		var log_un = $("#log_un").val();
	        var log_pwd = $("#log_pwd").val();
	        var total =$("#total").text();
	        var options = { "username": log_un, "spassword":log_pwd};
	        var url = "stuCenter.do?login";
	        $.ajax({
	             type: "POST",
	             url: url,
	             data: options,
	             dataType: 'json',
	             success: function(data) {
	                         if (data.success) {
	                         	$('#wBox').remove();
	                     		$('#wBox_overlay').remove();
	                     		if(logup==1)
	                     		{
	                     			art.dialog({ id: "artdialog", title: "登录成功", icon: "loading", content: "<div class=\"aui-boxt\" style=\"width:240px;font-size:16px;\"><div>登录成功,正在加载购课车数据...</div></div>", zIndex: 18008, lock: true, time: 2, resize: false, fixed: true });
	                             	window.setTimeout(function() {window.location.reload();}, 2000);
	                     		}else{
	                             	art.dialog({ id: "artdialog", title: "登录成功", icon: "succeed", content: "<div class=\"aui-boxt\" style=\"width:150px;\"><div><span id=\"timer\">(3)</span> 秒后自动生成订单</div></div>", zIndex: 18008, lock: true, time: 3, resize: false, fixed: true });
	                             	var wait = 3 * 1000;
	                             	for(var i = 1; i <= 3; i++) {
	                                 	window.setTimeout("update('#timer'," + i + "," + wait + ",'')", i * 1000);
	                             	} 
	                             	window.setTimeout(function() { CreateOrder(total); }, 3500);
	                             }
	                         }else
	                         {
	                         	$("#log_un_Tip").css("display", "block");
	                 			$("#log_tip_o").html("登录失败,请查检您的用户名与密码");
	                 			$('#btdl').html("<span class=\"zcbn\"><a target=_self href=\"javascript:CheckLogForms(this);\">登 录</a></span>");
	                         }
	             },
	             error: function() {
	                 $("#log_un_Tip").css("display", "block");
	                 $("#log_tip_o").html("登录失败,请查检您的用户名与密码");
	                 $('#btdl').html("<span class=\"zcbn\"><a target=_self href=\"javascript:CheckLogForms(this);\">登 录</a></span>");
	             }
	         });
	     }
	     function update(obj,num, wait,value) {
	         if(num == (wait/1000)) {
	             $(obj).html(value);
	         } else {
	             printnr = (wait / 1000) - num;
	             $(obj).html(value+"(" + printnr + ")");
	         }
	     }
	 //用户登陆
	 function LoginDisplay(index) {
	     $("#wBox").parents("div").css("display", "block");
	     logup=index;
	 }
	 function loading(content) {//加载
	     dialoading = art.dialog({ id: "loading123", content: content, icon: "loading",lock: true, cancel: false, title: false, fixed: true });
	 }
	 function notice(content, t) {//提示框
		 dianotice = jQuery.dialog({ id: "notice", content: content, icon: "warning", lock: true, opacity: 0.1, time: t, title: false, fixed: true });
	 }
	 function succeed(content, t) {
		 artdialog = jQuery.dialog({ id: "artdialog", content: content, icon: "succeed", lock: true, opacity: 0.1, time: t, fixed: true, title: false });
	 }

     function  setCookie(name,value)  
     {  
         var Days = 30;   //此cookie将被保存30天  
         var exp = new Date(); 
         exp.setTime(exp.getTime() + Days*24*60*60*1000);  
         document.cookie = name + "=" + escape(value) 
    		+ ";expires=" + exp.toGMTString();  
     }  
     function getCookie(name)  
     {  
         var arr,reg=new RegExp("(^|)"+name+"=([^;]*)(;|$)");  
         if(arr=document.cookie.match(reg))
    	return unescape(arr[2]);  
         else
    	return null;  
     }  
     function delCookie(name)  
     {  
         var exp = new Date();  
         exp.setTime(exp.getTime() - 1);  
         var cval=getCookie(name);  
         if(cval!=null) {
    	document.cookie= name + "="+cval
    		+";expires="+exp.toGMTString();
    	}
     }