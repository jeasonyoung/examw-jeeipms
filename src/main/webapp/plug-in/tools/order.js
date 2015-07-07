
function showAfterPayBox(){
    Paydialog = art.dialog({ id: "Paydialog", title: false, content: "<div id=\"wBox\" style=\"top: 50%!important;#top:expression(eval(document.documentElement.scrollTop));margin-left: -180px;#margin-top:-700px;margin-top: -150px!important;\"><div class=\"wBox_popup\"><table><tbody><tr><td class=\"wBox_tl\"></td><td class=\"wBox_b\"></td><td class=\"wBox_tr\"></td></tr><tr><td class=\"wBox_b\"><div style=\"width:10px;\">&nbsp;</div></td><td><div class=\"wBox_body\"><table class=\"wBox_title\"><tbody><tr><td class=\"wBox_dragTitle\" style=\"cursor: move;\"><div class=\"wBox_itemTitle\">在线支付提示</div></td><td width=\"20px\" title=\"关闭\"><div class=\"wBox_close\"></div></td></tr></tbody></table> <div id=\"wBoxContent\" class=\"wBox_content\"><div style=\"width:300px;\" class=\"cztx\"><div class=\"hb\">&nbsp;&nbsp;请在新开支付页面完成付款后选择：</div><div class=\"suc\"><ul><li><input type=\"button\" class=\"btn-b\" onclick=\"javascript:PayComplete();\" value=\"支付完成\"><input type=\"button\" class=\"btn-c\" onclick=\"javascript:window.location.reload();\" value=\"支付未完成\">&nbsp;&nbsp;</li><li> <a href=\"javascript:;\">客服热线：4000-086-044</a>&nbsp;&nbsp;&nbsp;&nbsp;</li></ul></div></div></div></div></td><td class=\"wBox_b\"><div style=\"width:10px;\">&nbsp;</div></td></tr><tr><td class=\"wBox_bl\"></td><td class=\"wBox_b\"></td><td class=\"wBox_br\"></td></tr></tbody></table></div></div>", zIndex: 18008, lock: true, resize: false, fixed: true });
    $(".aui_content").removeAttr("style");
}

function showboxxxkzf(){
    Paydialog = art.dialog({ id: "Paydialog", title: false, content: "<div id=\"wBox\" style=\"top: 50%!important;#top:expression(eval(document.documentElement.scrollTop));margin-left: -308px;#margin-top:-600px;margin-top:-231px!important;\"><div class=\"wBox_popup\"><table><tbody><tr><td class=\"wBox_tl\"></td><td class=\"wBox_b\"></td><td class=\"wBox_tr\"></td></tr><tr><td class=\"wBox_b\"><div style=\"width:10px;\">&nbsp;</div></td><td><div class=\"wBox_body\"><table class=\"wBox_title\"><tbody><tr><td class=\"wBox_dragTitle\" style=\"cursor: move;\"><div class=\"wBox_itemTitle\">学习卡支付</div></td><td width=\"20px\" title=\"关闭\"><div class=\"wBox_close\"></div></td></tr></tbody></table> <div id=\"wBoxContent\" class=\"wBox_content\"><div class=\"login\"><div class=\"loglf\"><ul><table width=\"563\" height=\"295\" cellspacing=\"1\" cellpadding=\"0\" bgcolor=\"#eeeeee\" align=\"center\" class=\"ft14\"><tbody><tr><th height=\"30\" bgcolor=\"#f1f1f1\" align=\"center\" class=\"bttitle\">学习卡支付</th></tr><tr><th width=\"654\" height=\"30\" bgcolor=\"#FFFFFF\" align=\"center\" class=\"ft12\">当前帐户的余额为 <span class=\"ft15\">"+Money+"</span>元，请在下面输入学习卡卡号、密码对您当前的帐户充值</th></tr><tr><td height=\"35\" bgcolor=\"#FFFFFF\" align=\"center\" class=\"ft142\">卡 号：<input onblur=\"this.style.borderColor='#A3BFA8'\" onfocus=\"this.style.borderColor='#f60'\" class=\"input\" name=\"CardID\" id=\"CardID\"></td></tr><tr><td height=\"35\" bgcolor=\"#FFFFFF\" align=\"center\"> <span class=\"ft142\">密 码: </span><input type=\"password\" onblur=\"this.style.borderColor='#A3BFA8'\" onfocus=\"this.style.borderColor='#f60'\" class=\"input\" name=\"cardpwd\" value=\"\" id=\"cardpwd\"></td></tr><tr><td height=\"35\" bgcolor=\"#FFFFFF\" align=\"center\"><span class=\"ft142\">金 额：</span><input onblur=\"this.style.borderColor='#A3BFA8'\" onfocus=\"this.style.borderColor='#f60'\" class=\"input\" name=\"money\" id=\"money\"></td></tr><tr><td height=\"35\" bgcolor=\"#FFFFFF\" align=\"center\"><input type=\"hidden\" name=\"Action\" value=\"ok\"><input width=\"114\" type=\"button\" height=\"28\" border=\"0\" class=\"chongz\" value=\"充值并支付\" id=\"jsbt_cz\" name=\"jsbt_cz\"></td></tr><tr><td height=\"35\" bgcolor=\"#FFFFFF\" align=\"center\"><strong>注意</strong>：每张卡只能对一个帐户充值。 <a target=\"_blank\" href=\"/card/\"><strong class=\"cDRed\">我要购卡》</strong></a></td></tr></tbody></table></ul></div></div></div></div></td><td class=\"wBox_b\"><div style=\"width:10px;\">&nbsp;</div></td></tr><tr><td class=\"wBox_bl\"></td><td class=\"wBox_b\"></td><td class=\"wBox_br\"></td></tr></tbody></table></div></div>", zIndex: 18008, lock: true, resize: false, fixed: true });
    $(".aui_content").removeAttr("style");
}
function AddComplete(hm,diffmoney){
    $(".total_info,.coupon,.address-list,.pay,.ui-form,#title_hang,.flt2,.kclist").remove();
    var diffcount="",fuk="";
    if(diffmoney==0){
        diffcount="课程已开通；请登录会员中心“<a class=\"view-more\" title=\"\" href=\"/cstudyRecordController.do?myclass\">我的课堂</a>”开始学习，<a class=\"view-more\" title=\"\" href=\"/cstudyRecordController.do?myclass\">>>点击进入</a> | <a class=\"view-more\" href=\"/cstudyRecordController.do?order\">查看订单详情</a>";            
    }else{
        diffcount="还需支付<em class=\"highlight\">"+diffmoney+".00</em>元！";
        fuk="<a href=\"\" class=\"hire-purchase\">继续付款</a>";
    }

    var html = "<div class=\"trade-info\"><span class=\"cgbz\">成功</span><div class=\"cgxx\">"+hm+"<div class=\"operate\">您的订单<strong>"+orderCode+"</strong>"+diffcount+"</div><div class=\"operate\">"+fuk+"</div><div class=\"other\">友情提示：如果在购课中遇到问题，您可以致电<strong style=\"font-size: 16px;\">4000-086-044</strong>联系客服。</div></div></div>";
    $(html).insertBefore($("#title_ke"));
    $(".bmlc ul").removeClass("lct2").addClass("lct4");
    $(".bmlc ul li").removeClass("on").eq(3).addClass("on");
}
function OpenCoures(ID){
    $.ajax({
        type: "GET",
        url: "/orderController.do?payorder",
        data: {orderId: ID },
        dataType: "json",
        success: function(result) {
            if (result.success == false) {
                art.dialog({id: "notice",icon: "warning",title: "温馨提示",content: "<span style=\"font-size:14px;\">"+result.msg+"</span>",zIndex: 18008,lock: true,resize: false,fixed: true,time:3,button:[{name:"确定"}]});
            }
            if (result.success == true) {                               
                AddComplete("<div class=\"status\">您已成功付款<em class=\"highlight\">"+result.msg+".00</em>元！</div>",0);                            
            }
        }
    });
}

function GetOrders(id) {
    var _html = "";
    var pricecount = 0;
    var price = 0;
    var oldpic = 0;
    $(".ca_tab3 tr").remove();
    $(".ca_tab3").append("<tr id=\"load\" class=\"shoplist\"><td align=\"left\" colspan=\"5\"><img src=\"http://img.233.com/wx/artDialog/skins/icons/loading.blue.gif\"/></td></tr>");
    $.ajax({
        type: "GET",
        url: "/orderController.do?itemList",
        data: {orderId:id },
        dataType: "json",
        cache: false,
        success: function(result) {
            if (!result.success) {
                art.dialog({id: "notice",icon: "warning",title: "温馨提示",content: "<span style=\"font-size:14px;\">"+result.msg+",2秒后自动跳转到我的订单</span>",zIndex: 18008,lock: true,resize: false,fixed: true,time:2});
                setTimeout(function() {window.location.href="/search/UserCenter/play/Orders/";}, 2500);                    
            }
            if (result.success) {
                if(result.state==1){
                    Complete=1;
                    Pice=0;
                    AddComplete("<div class=\"status\">该订单已付款完成</div>",0);
                }              
                if(Complete==0)
                    _html += "<tr><th width=\"427\" height=\"34\">课程名称</th><th width=\"136\">原价</th><th width=\"129\">现价</th><th width=\"106\">立即节省</th><th width=\"83\">操作</th></tr> ";
                else
                    _html += "<tr><th width=\"427\" height=\"34\">课程名称</th><th width=\"136\">价格</th><th width=\"129\">状态</th><th colspan=\"2\">操作</th></tr>";
                var ClassID = "", table = ""; 
                if (result.list.length > 0) {
                    for (var i = 0; i < result.list.length; i++) {
                        var StateTF="未付款";
                        if(Complete==0){
                            _html += "<tr class=\"shoplist\"><td align=\"center\"><a class=\"noday7\" href=\"javascript:;\">" + unescape(result.list[i].courseName) + "</a></td><td align=\"center\"><s><strong>￥</strong>" + result.list[i].itemOprice + "</s></td><td align=\"center\"><span class=\"tc1\"><strong id=\"couse_price_9581\">￥" + result.list[i].itemRprice + "</strong></span></td><td align=\"center\">￥" + (result.list[i].itemOprice-result.list[i].itemRprice) + ".00元</td><td width=\"72\" align=\"center\">"+StateTF+"</td></tr>";
                        }else{
                        	State="付款成功";
                        	StateTF = "<a href=\"/search/UserCenter/play/?mid="+result.list[i].courseName+"\" target=\"_blank\" class=\"hire-purchase\">马上学习<\a>";
                            _html += "<tr><td align=\"center\"><a class=\"noday7\" href=\"javascript:;\">" + unescape(result.list[i].courseName) + "</a></td><td align=\"center\"><span class=\"tc1\"><strong id=\"couse_price_9581\">￥" + result.list[i].itemRprice + "</strong></span></td><td align=\"center\">"+State+"</td><td width=\"106\" align=\"center\">"+Operation+"</td><td width=\"83\" align=\"center\">"+StateTF+"</td></tr>";
                        }
                    }
                }
                $(".ca_tab3").append(_html);
                $(".row_price b").html(result.list.length);
                $("#load").css("display","none");
                addhtml();
                $(".ui-form h1").html("本次应付：<strong>￥"+Pice+"</strong>元");        
                
                if(Pice==0)
                    $("#yuefuk input").removeAttr("disabled");   
                
                if(Pice<=Money){
                    $("#symoney").css("display","none");
                }
                if(Complete==1)
                    $("#title_ke span").html("课程详情");
            }
        }
    });
}    
function addhtml() {
    $("#pay_price").html(Pice);
    $(".row_price strong").html(OMoney);
    $("#wangyin").find("form").find("input").eq(4).val(Pice);
    $("#zfbfuk").find("form").find("input").eq(1).val(Pice);
    $("#yh_price").html("￥" + OMoney + "元");
    if(Pice<=Money){
        $("#yuefuk").find("strong").eq(0).html("￥" +Pice);
        $("#yuefuk").find("strong").eq(1).html("￥0");
    }else{
        $("#yuefuk").find("strong").eq(0).html("￥" +Money);
        $("#yuefuk").find("strong").eq(1).html("￥" +(Pice-Money));
    }
    $("#myqian").html(Money);
    if(Pice>500){
        $(".hire-purchase,.wenhao").css("display","block");            
    }
    
    if(Money==0&&Pice!=0){
        $("#yuefuk").html("请选择其他支付方式：");
    }
}

function PayComplete(){
    GetOrders(orderid);
    Paydialog.close();
}
