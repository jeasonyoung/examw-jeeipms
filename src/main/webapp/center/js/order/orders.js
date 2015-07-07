//var orderlist = "";
var checklist = "";
//var voer = 0;//fufei
//var start = 0; //meifufei
//var ddopen = 0;
//var classid = 0;
//var order = ""; //要添加课程的订单
//var listmid = "";
//var h = 0;
//var youke = 0;
$(document).ready(function() {
    $("#wBox1").css("width", "100%");
    $("#wBox1").css("height", $(document).height());
    h = $(window).height();
    $("#bq").css("height", h - 200);
    $(".checkall").click(function() {
        if ($(this).attr("checked") == "checked") {
            $(".checkall").attr("checked", true);
            $(".checkorder").attr("checked", true);
            $(".checkorder").each(function(){
            	checklist+=$(this).val()+",";
            });   
        }
        else {
            $(".checkall").removeAttr("checked");
            $(".checkorder").removeAttr("checked");
            checklist = "";
        }
    });
    $("#hbfk").click(function() {
        if (checklist == ""){      	
            notice("请选择要合并的订单", 3);
        }
        else {
            art.dialog({
                title: "温馨提示",
                content: "<span style=\"font-size:14px;\">是否合并选择的订单？</span>",
                zIndex: 18008,
                icon: "question",
                width: 200,
                lock: true,
                resize: false,
                fixed: true,
                button: [{ name: "确定", callback: function() { MergeOrders(checklist.substring(0, checklist.length - 1)); } }, { name: "取消"}]
            });
        }
    });
    $(".checkorder").live("click", function() {
        if ($(this).attr("checked") == "checked") {
            $(this).attr("checked", true);
            checklist = checklist + $(this).val() + ",";
        }
        else {
            checklist = checklist.replace($(this).val() + ",", "");
            $(this).removeAttr("checked");
            $(".checkall").removeAttr("checked");
        }
    });

    $("#delCK").live("click", function() {
        if (checklist == "")
            notice("请选择要删除的订单", 3);
        else {
            art.dialog({
                title: "温馨提示",
                content: "<span style=\"font-size:14px;\">订单内所包含的课程也将被删除,确定删除所选的订单吗？</span>",
                zIndex: 18008,
                icon: "question",
                width: 300,
                lock: true,
                resize: false,
                fixed: true,
                button: [{ name: "确定", callback: function() { delselecedorders(checklist); } }, { name: "取消"}]
            });
        }
    });
    $(".delod").live("click", function() {
        var id = $(this).attr("oid") + ",";
        var cont = "";
        /*var hm = $(this).parents("ul").find("li").eq(3).html();
        if (hm.indexOf("已支付") >= 0)
            cont = "<span style=\"color:red;\">注意：该订单为未支付完成订单</span><br/>";*/
        art.dialog({
            title: "温馨提示",
            content: "<span style=\"font-size:14px;\">" + cont + "订单内所包含的课程也将被删除,确定删除所选的订单吗？</span>",
            zIndex: 18008,
            icon: "question",
            width: 300,
            lock: true,
            resize: false,
            fixed: true,
            button: [{ name: "确定", callback: function() { delselecedorders(id); } }, { name: "取消"}]
        });
    });
    $(".kc_delete").live("click", function() {
        var id = $(this).attr("oid");
        if ($("#od" + id).data("Cache") != "1") {
            var mid = $(this).attr("mid");
            var html = $(this).parents().parents().find("td").eq(0).html();
            art.dialog({
                title: "温馨提示",
                content: "<span style=\"font-size:14px;\">确定要从订单中删除《" + html + "》吗？</span>",
                zIndex: 18008,
                icon: "question",
                width: 350,
                lock: true,
                resize: false,
                fixed: true,
                button: [{ name: "确定", callback: function() { updorders(id, mid); } }, { name: "取消"}]
            });
        } else
            notice("不能修改已使用优惠劵的订单", 3);
    });
    $(".add-ex").live("click", function() {
        if ($(this).attr("oid") != null) {
            order = $(this).attr("oid");
            if ($("#od" + order).data("Cache") != "1") {
                listmid = $(this).attr("mid");
                classid = $("#d" + order).find("tr").eq(0).attr("cid");
                $("html,body").animate({ scrollTop: 0 }, 1000);
                $("#wBox1").css("display", "block");
                GetCidList(classid);
                $("#wBox").css("display", "block");
            }
            else {
                notice("不能修改已使用优惠劵的订单", 3);
            }
        }
    });
    $("#gbi").live("click", function() {
        $("#wBox").css("display", "none");
        $("#wBox1").css("display", "none");
    });
    $(".contbox a").live("click", function() {
        if ($(this).attr("cid") != null) {
            classid = $(this).attr("cid");
            GetCidList(classid);
        }
    });
    $(".selectbox-x").live("click", function() {
        if (youke == 0) {
            order = ""; listmid = "";
            $("html,body").animate({ scrollTop: 0 }, 1000);
            $("#wBox1").css("display", "block");
            $(".contbox").html("");
            $("#ind").clone().prependTo(".contbox");
            $("#wBox").css("display", "block");
        } else {
            ShowTLogin();
        }
    });
    //div 拖动
    var flag = false;
    var title = $(".cour-head");
    var m_div = $("#wBox");
    m_div.mousemove(function(event) {
        if (flag) {
            var myEvent = event || window.event;
            changeXY(m_div, myEvent);
        }
    });
    m_div.mouseup(function() {
        title.unbind("mousemove");
        flag = false;
    });
    title.mousedown(function(event) {
        var t = $(this);
        var myEvent = event || window.event;
        fx = myEvent.clientX;
        fy = myEvent.clientY;
        t.mousemove(function(event) {
            var myEvent = event || window.event;
            changeXY(m_div, myEvent);
            flag = true;
        });
    })

    title.mouseup(function() {
        title.unbind("mousemove");
        flag = false;
    })
    title.mouseout(function() {
        title.unbind("mousemove");
    })
});

function MyClassIDCookieTF(mid) {
    if (("," + MyClassIDCookie + ",").indexOf("," + mid + ",") == -1) {
        return false
    } else {
        return true
    }
}
function MergeOrders(list) {
    $.ajax({
        type: "get",
        url: "/orderController.do?mergeOrder",
        data: {'orderCode': list },
        dataType: 'json',
        success: function(result) {
            if (result.success) {
                succeed(result.msg, 2);
                window.setTimeout(function() {location.reload()}, 1000);
            }
            else {
                notice(result.msg, 2);
            }
        },
        error: function(e) { /*错误处理*/ },
        cache: false
    });
}
function delselecedorders(id) {
    $.ajax({
        type: "POST",
        async: true,
        dataType: "json",
        url: "/orderController.do?delete",
        data: {'orderCode': id },
        success: function(json) {
            if (json.success ){
                succeed("删除订单成功", 3);
                window.setTimeout(function() {location.reload()}, 1000);
            }else
                notice("删除订单失败", 3);
        }
    });
}
function updorders(id, mid) {
    $.ajax({
        type: "POST",
        async: true,
        dataType: "json",
        url: "/orderController.do?update",
        data: {'id':id,'courseid':mid},
        success: function(j) {
        	if(j.success){
        		 succeed("取消成功", 3);
        		 window.setTimeout(function() {location.reload()}, 1000);
        	}else{
        		notice(j.msg, 3);
        	}
        }
    });
}
function notice(content, t) {//提示框
    dianotice = art.dialog({ id: "face-sad", width: 250, title: "温馨提示", icon: "face-sad", content: "<div class=\"aui-boxt\" style=\"font-size:14px;\"><div>" + content + "</div></div>", zIndex: 18008, lock: true, time: t, resize: false, fixed: true, button: [{ name: "确定(" + t + ")"}] });
    var wait = t * 1000;
    for (i = 1; i <= t; i++) {
        window.setTimeout("update('.aui_buttons button'," + i + "," + wait + ",'确定')", i * 1000);
    }  
}
function succeed(content, t) {
    artdialog = art.dialog({ id: "artdialog", width: 250, title: "温馨提示", icon: "succeed", content: "<div class=\"aui-boxt\" style=\"font-size:14px;\"><div>" + content + "</div></div>", zIndex: 18008, lock: true, time: t, resize: false, fixed: true, button: [{ name: "确定(" + t + ")"}] });
    var wait = t * 1000;
    for (i = 1; i <= t; i++) {
        window.setTimeout("update('.aui_buttons button'," + i + "," + wait + ",'确定')", i * 1000);
    }  
}
function loading(content) {
    artdialog = art.dialog({ id: "loading123", width: 250, title: "加载中", icon: "loading", content: "<div class=\"aui-boxt\" style=\"font-size:14px;\"><div>" + content + "</div></div>", zIndex: 18008, lock: true, resize: false, fixed: true });
}
function update(obj, num, wait, value) {
    if (num == (wait / 1000)) {
        $(obj).html(value);
    } else {
        printnr = (wait / 1000) - num;
        $(obj).html(value + "(" + printnr + ")");
    }
}
function changeXY(m_div, myEvent) {
    if (fx > myEvent.clientX) {
        var change_top_x = parseInt(m_div.css("left")) - (fx - myEvent.clientX);
        m_div.css("left", change_top_x + "px");
        fx = myEvent.clientX;
    }
    if (fx < myEvent.clientX) {
        var change_top_x = parseInt(m_div.css("left")) + (myEvent.clientX - fx);
        m_div.css("left", change_top_x + "px");
        fx = myEvent.clientX;
    }
    if (fy > myEvent.clientY) {
        var change_top_y = parseInt(m_div.css("top")) - (fy - myEvent.clientY)
        m_div.css("top", change_top_y + "px");
        fy = myEvent.clientY;
    }
    if (fy < myEvent.clientY) {
        var change_top_y = parseInt(m_div.css("top")) + (myEvent.clientY - fy);
        m_div.css("top", change_top_y + "px");
        fy = myEvent.clientY;
    }
}
function getCookie(name) {
    var cookieValue = "";
    var search = name + "=";
    if (document.cookie.length > 0) {
        offset = document.cookie.indexOf(search);
        if (offset != -1) {
            offset += search.length;
            end = document.cookie.indexOf(";", offset);
            if (end == -1) end = document.cookie.length;
            cookieValue = unescape(document.cookie.substring(offset, end))
        }
    }
    return cookieValue;
}
function getSubCookie(name, subname) {
    var allcookie = getCookie(name);
    var cookieValue = "";
    var search = subname + "=";
    if (allcookie.length > 0) {
        offset = allcookie.indexOf(search);
        if (offset != -1) {
            offset += search.length;
            end = allcookie.indexOf("&", offset);
            if (end == -1) end = allcookie.length;
            cookieValue = allcookie.substring(offset, end);
        }
    }
    return cookieValue;
}
function setCookie(cookieName, cookieValue, DayValue) {
    var expire = "";
    var day_value = 1;
    if (DayValue != null) {
        day_value = DayValue;
    }
    expire = new Date((new Date()).getTime() + day_value * 86400000);
    expire = "; expires=" + expire.toGMTString();
    document.cookie = cookieName + "=" + escape(cookieValue) + ";path=/" + expire;
}