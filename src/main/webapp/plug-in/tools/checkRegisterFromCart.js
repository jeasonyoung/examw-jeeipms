function ChangeColor1(id,msg, st) {
        if (st == 0)
        { $("#" + id).attr("class", "line1px_2");
          $("#" + id).html(msg);
        }
        else
        { $("#" + id).attr("class", "line1px"); }
    }
function CheckMail(obj, id) {
        var objval = $("#" + obj).val();
        if (!checkIsEmailNumber(objval) && objval != '') {
            $("#" + id).html("&nbsp;Emial格式错误！| 例：examw@163.com");
            $("#" + id).attr("class", "line1px_3");
        }
        else if (objval == '') {
            $("#" + id).html("&nbsp;邮件不能为空哦！| 例：examw@163.com");
            $("#" + id).attr("class", "line1px_3");
        }else if(checkIsEmailNumber(objval)&&objval!='')
        {
        	$.ajax({
        		async:true,
        		type:"POST",
        		url:"stuCenter.do?checkemail",
        		data:{"email":objval},
        		dataType:"json",
        		success:function(data)
        		{
        			if(data.success)
        			{
        				 $("#" + id).html('&nbsp;恭喜,可以使用');
        		         $("#" + id).attr("class", "line1px_4");
        			}else
        			{
        				$("#" + id).html('&nbsp;很遗憾已被使用');
       		         	$("#" + id).attr("class", "line1px_3");
        			}
        		},
        		error:function()
        		{
        			$("#" + id).html('&nbsp;系统异常,请刷新网页重试');
   		         	$("#" + id).attr("class", "line1px_3");
        		}
        	});
        }
    }

    function CheckNull(obj, msg, id, vmsg) {
        if ($("#" + obj).val() == '') {
            $("#" + id).html(msg);
            $("#" + id).attr("class", "line1px_3");
        }
        else {
            $("#" + id).html(vmsg);
            $("#" + id).attr("class", "line1px_4");
        }
    }
    function checkIsEmailNumber(strWord) {
        var reg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+/;
        if (reg.test(strWord))
            return true;
        else
            return false;
    }

    function CheckSafe(str) {
    	var reg = /^[0-9a-zA-z_]+$/;
    	return reg.test(str);
        /*var bads = "'&<>?% ,;:()`~!#$^*{}[]|+-=\"";
        for (var i = 0; i < bads.length; i++) {
            if (str.indexOf(bads.substring(i, i + 1)) != -1) {
                return false;
                break;
            }
        }
        return true;*/
    }

    function fopen(obj)
    { $("#" + obj).show(); }
    function fclose(obj)
    { $("#" + obj).hide(); }
    function ChangeColor(id, st) {
        if (st == 0)
        { $("#" + id).attr("class", "line1px_2"); }
        else
        { $("#" + id).attr("class", "line1px"); }
    }

    function CheckLength(obj, msg, id, sNum, mNum, cstyle) {
        if (obj.length >= sNum && obj.length < mNum) {
            $("#" + id).html(msg);
            $("#" + id).attr("class", cstyle);
        }
    }
function CheckUserName(obj, id) {
        var objvalue,flag=false;
        objvalue = $("#" + obj).val();
        if (!CheckSafe(objvalue)||objvalue.length < 4 || objvalue.length > 16) {
            $("#" + id).html('&nbsp;用户名只能是数字字母下划线，4-16位');
            $("#" + id).attr("class", "line1px_3");
            return false;
        }
        if (objvalue != '') {
            if (objvalue.length >= 4 && objvalue.length <= 16 && /^[0-9a-zA-Z_]+$/.test(objvalue))
            {
            	$.ajax({
            		async:false,
            		type:"POST",
            		url:"stuCenter.do?checkusername",
            		data:{"username":objvalue},
            		dataType:"json",
            		success:function(data)
            		{
            			if(data.success)
            			{
            				 $("#" + id).html('&nbsp;恭喜,可以使用');
            		         $("#" + id).attr("class", "line1px_4");
            				flag=true;
            			}else
            			{
            				$("#" + id).html('&nbsp;很遗憾已被使用');
           		         	$("#" + id).attr("class", "line1px_3");
            				flag=false;
            			}
            		},
            		error:function()
            		{
            			$("#" + id).html('&nbsp;系统异常,请刷新网页重试');
       		         	$("#" + id).attr("class", "line1px_3");
        				flag=false;
            		}
            	});
            	return flag;
            }
            else
            { //CheckLength(objvalue, '&nbsp;用户名格式错误请在4－16位之间！', id, 2, 16, 'line1px_3'); 
            	 $("#" + id).html('&nbsp;用户名不合法');
                 $("#" + id).attr("class", "line1px_3");
                 return false;
            }
        }
        else {
            $("#" + id).html('&nbsp;此项为必填项，用户名不能为空！');
            $("#" + id).attr("class", "line1px_3");
            return false;
        }
    }
    function CheckTrueName(obj, id) {
        var objvalue;
        objvalue = $.trim($("#" + obj).val());
        //真实姓名这里做了修改
        if (objvalue != '') {
            if (objvalue.length >= 2 && objvalue.length <= 16 &&/^[\u4E00-\u9FA5]{2,5}$/.test(objvalue)) {
                $("#" + id).html('&nbsp;真实姓名格式正确！');
                $("#" + id).attr("class", "line1px_4");
                return true;
            }
            else {
            	$("#" + id).html('&nbsp;真实姓名不合法哦！');
                $("#" + id).attr("class", "line1px_3");
                return false;
            }
        }
        else {
        	$("#" + id).html('&nbsp;此项为必填项，真实姓名不能为空哦！');
            $("#" + id).attr("class", "line1px_3");
            return false;
        }
    }
    function isPosInteger(number) {
        var regex = /^\d+$/;
        if (regex.test(number))
            return true;
        else
            return false;
    }
    function CheckTelNum(obj, id) {
        var objval = $("#" + obj).val();
        if (objval == '') {
            $("#" + id).html('&nbsp;此项为必填项，手机号码不能为空哦！');
            $("#" + id).attr("class", "line1px_3");
        }
        else {
            if (checkTel(objval))
            { setstyle(id, 'block', 'line1px_4', '&nbsp;手机号码格式正确！'); }
            else
            { setstyle(id, 'block', 'line1px_3', '&nbsp;手机号码格式不正确！'); }
        }

    }
    function checkTel(TelNum) {
        var mobile = TelNum;
        var reg0 = /^13\d{9}$/;
        var reg1 = /^15\d{9}$/;
        var reg2 = /^18\d{9}$/;
        var reg3 = /^14\d{9}$/;
        var my = false;
        if (reg0.test(mobile)) my = true;
        if (reg1.test(mobile)) my = true;
        if (reg2.test(mobile)) my = true;
        if (reg3.test(mobile)) my = true;
        if (!my) {
            return false;
        } else {
            return true;
        }
    }
    function CheckPassWord(obj, id) {
        var objval = $("#" + obj).val();
        if (objval != '') {
            if (/^[0-9A-Za-z_]+$/.test(objval) && objval.length >= 6 && objval.length < 16) {
                $("#" + id).html('&nbsp;格式正确可以使用！');
                $("#" + id).attr("class", "line1px_4");
            }
            else {
                //CheckLength(objval, '&nbsp;密码格式错误请在6-16位之间！', id, 6, 16, 'line1px_3');
            	$("#" + id).html('&nbsp;密码可以是数字字母下划线,6-16位');
                $("#" + id).attr("class", "line1px_3");
            }
        }
        else {
            $("#" + id).html('&nbsp;此项为必填项，密码不能为空！');
            $("#" + id).attr("class", "line1px_3");
        }
    }
    function PasswordEquals(obj1, obj2, id) {
        var objval1 = $("#" + obj1).val();
        var objval2 = $("#" + obj2).val();
        if (objval1 != '') {
            if (objval2.length >= 6 && objval2.length < 16) {
                if (objval1 != objval2) {
                    $("#" + id).html('&nbsp;重复密码与原密码不一致！');
                    $("#" + id).attr("class", "line1px_3");
                }
                else {
                    $("#" + id).html('&nbsp;格式正确可以使用！');
                    $("#" + id).attr("class", "line1px_4");
                }
            }
            else {
                CheckLength(objval1, '&nbsp;密码格式错误请在6-16位之间！', id, 6, 16, 'line1px_3');
            }
        }
        else {
            $("#" + id).html('&nbsp;此项为必填项，重复密码不能为空哦！');
            $("#" + id).attr("class", "line1px_3");
        }
    }
    //-----------------------------------------------------------------------------------------------
    function CheckAllForms(obj) {
        var A = new Array(4);
        var B = new Array(4);
        for (var i = 0; i < A.length; i++)
            A[i] = true;
        B[0] = "setstyle('reg_nc_msg','block','line1px_3','&nbsp;用户名只能是数字字母下划线，4-16位')";
        B[1] = "setstyle('reg_pwd_msg','block','line1px_3','&nbsp;密码可以是数字字母下划线，6-16位');";
        B[2] = "setstyle('reg_tname_msg','block','line1px_3','&nbsp;真实姓名填写错误！')";
        B[3] = "setstyle('telNum_info','block','line1px_3','&nbsp;联系电话格式错误！')";
		B[4] = "setstyle('reg_mail_msg','block','line1px_3','&nbsp;邮件地址格式错误！')";
        var sUser = $("#reg_nc").val();
        var sPass = $("#reg_pwd").val();
        var name = $("#reg_tname").val();
        var tel = $("#telNum").val();
		var email = $("#reg_mail").val();
        if (sUser == '' || !CheckSafe(sUser))
        { A[0] = false; }
        else {
            if (sUser.length >= 2 && sUser.length < 16)
                A[0] = true;
            else
                A[0] = false;
        }

        if (sPass == '' || !$.trim(sPass))
        { A[1] = false; }
        else {
            if (sPass.length >= 6 && sPass.length < 16 &&CheckSafe(sPass))
                A[1] = true;
            else
                A[1] = false;
        }
        if (!CheckTrueName('reg_tname','reg_tname_msg'))//!!!!!!!!!!!!!!!!!!
            A[2] = false;
        if (!checkTel(tel))
            A[3] = false;
        if(email==''||!checkIsEmailNumber(email))
        	A[4]=false;
        var flag = true;
        for (var i = 0; i < A.length; i++)
        { if (!A[i]) flag = false; }
        if (!flag) {
            for (var j = 0; j < A.length; j++)
            { if (!A[j]) eval(B[j]); }
            $('#reg_err_msg').html('请正确填写带 * 项的注册信息');
            $('#reg_err_msg').css("display", "block");
            $('#reg_err_msg').attr("class", "line1px_3");
            return false;
        }
        else {
            userRegister(obj);
            return true;
        }
    }
    function userRegister(obj) {
    	var total = $("#total").text();
        var logMsg="用户名或email被占用";
        var TpLogName = $("#reg_nc").val();
       // var freewx = $("#freetype").val();
        var truename=$("#reg_tname").val();
        var telp=$("#telNum").val();
        var email=$("#reg_mail").val();
        var options = { "username": TpLogName, "spassword": $("#reg_pwd").val(), "phone": telp, "realname": truename, "email": email};
        $('#btzc').html("<img src='http://img.233.com/wx/img/bm/loading.gif' />");
        var url = "stuCenter.do?save";
        $.ajax({
            type: "POST",
            //contentType: "text/html;gb2312",
            url: url,
            data: options,
            dataType: 'json',
            success: function(data) {
                if (data) {
                    $('#wBox').remove();
                    $('#wBox_overlay').remove();
                    if (logup==1){//$("tr[class='shopp']").length==0 || $(".ca_tab1").html() == null) {
                         art.dialog({ id: "artdialog", title: "注册成功", icon: "loading", content: "<div class=\"aui-boxt\" style=\"width:240px;font-size:16px;\"><div>注册成功,正在加载购课车数据...</div></div>", zIndex: 18008, lock: true, time: 2, resize: false, fixed: true });
                         window.setTimeout(function() {window.location.reload();}, 2000);
                    } else {
                         art.dialog({ id: "artdialog", title: "注册成功", icon: "succeed", content: "<div class=\"aui-boxt\" style=\"width:150px;\"><div><span id=\"timer\">(3)</span> 秒后自动生成订单</div></div>", zIndex: 18008, lock: true, time: 3, resize: false, fixed: true });
                         var wait = 3 * 1000;
                         for(var i = 1; i <= 3; i++) {
                               window.setTimeout("update('#timer'," + i + "," + wait + ",'')", i * 1000);
                         } 
                         window.setTimeout(function() { CreateOrder(total); }, 3500);
                        }
                }
                else {
                    $("#reg_err_msg").attr("class", "line1px_3").html("注册失败，" + logMsg);
                    $('#btzc').html("<span class=\"zcbn\" onclick=\"CheckAllForms(this);\">注册报名</span>");
                }
            },
            error: function() {
                $('#btzc').html("<span class=\"zcbn\" onclick=\"CheckAllForms(this);\">注册报名</span>");
            }
        });
    }
    function setstyle(obj, show, css, msg) {
        $("#" + obj).html(msg);
        $("#" + obj).attr("class", css);
    }