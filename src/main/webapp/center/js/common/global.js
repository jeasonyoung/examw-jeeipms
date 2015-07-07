/**导航栏*/
define(["module", "jquery", "sub/json2", "sub/jquery.cookie", "common/site-nav"], function(c, f, i, p, b) {
    var r = c.config();
    var j = window.AUI || {};
    if (!window.console) {
        window.console = {
            log: function() {}
        }
    }(function() {
        var y = navigator.userAgent.toLowerCase(),
            B = "",
            t = y.indexOf("firefox") > -1,
            s = y.indexOf("360se") > -1,
            C = y.indexOf("tencenttraveler") > -1,
            D = y.indexOf("maxthon") > -1,
            A = "",
            u = /msie/.test(y),
            z = /msie 6/.test(y),
            x = /msie 7/.test(y),
            w = /msie 8/.test(y),
            v = /msie 9.0/.test(y);
        if (s || C || D) {
            if (u) {
                if (z) {
                    A = " IE6"
                } else {
                    if (x) {
                        A = " IE7"
                    } else {
                        if (w) {
                            A = " IE8"
                        }
                    }
                }
            }
            if (s) {
                B = "360"
            } else {
                B = C ? "TT" : "Maxthon"
            }
            B = B + A
        } else {
            B = t ? "FireFox" : (z ? "IE6" : (x ? "IE7" : (w ? "IE8" : "other")))
        }
        j.UA = {
            isFF: t,
            isIE6: z,
            isIE7: x,
            isIE8: w,
            isIE9: v,
            isMaxthon: D,
            isTT: C,
            is360: s,
            browser: B
        }
    })();
    Array.remove = function(v, u, t) {
        var s = v.slice((t || u) + 1 || v.length);
        v.length = u < 0 ? v.length + u : u;
        return v.push.apply(v, s)
    };
    f.ajaxSetup({
        jsonp: "jsonp",
        cache: false,
        jsonpCallback: function() {
            return "ablesky_" + jQuery.now()
        }
    });
    var e = function(t) {
            var s, v = window.location.search,
                u = new RegExp("(?:[?|&]|^)" + t + "=([^&?]*)", "ig");
            return (s = u.exec(v)) ? s[1] : null
        };
    var o = function(t) {
            var s, v = r.staticURISearch,
                u = new RegExp("(?:[?|&]|^)" + t + "=([^&?]*)", "ig");
            return (s = u.exec(v)) ? s[1] : null
        };
    var g = function(t, v) {
            var u = navigator.userAgent,
                s = u.indexOf("opera") > -1;
            try {
                if (typeof(t) == "string") {
                    t = parseFloat(t).toFixed(v)
                } else {
                    if (typeof(t) == "number") {
                        if (t < 1 && !s && u.indexOf("msie") > -1) {
                            t = ((t + 1).toFixed(v) - 1).toFixed(v)
                        } else {
                            t = t.toFixed(v)
                        }
                    }
                }
            } catch (w) {
                t = 0
            }
            return t
        };
    var q = function(t) {
            var s = t ? t : window.location.hostname;
            var u = s.split(".");
            u.shift();
            return u.join(".")
        };
    var l = function(s) {
            return s === null || s === undefined || s === ""
        };
    j.curUserInfo = r.USER;
    j.getCurUserInfo = function(s, t) {
        var t = l(t) ? "" : t;
        if (j.curUserInfo.counter > 5) {
            return "GUEST"
        }
        if (j.curUserInfo.loaded && s != true) {
            return j.curUserInfo
        }
        var u = {};
        if (t) {
            u.ASUSS = t
        }
        try {
            f.ajax({
                url: "http://" + window.location.host + "/getCurrentUser.do" + (t ? ("?ASUSS=" + t) : ""),
                type: "GET",
                dataType: "json",
                async: false,
                cache: false
            }).done(function(w) {
                if (w && w.success == true) {
                    w.loaded = true;
                    w.counter = 0;
                    j.curUserInfo = w;
                    setTimeout(function() {
                        if (f("#J_top-tips").length > 0) {
                            return
                        }
                        var D = "",
                            C = "";
                        var x = HTTP_SERVER + "accountLoginRedirect.do?action=toMyAccount&tab=accountInfo&firstLogin=true";
                        var F = new RegExp("firstLogin=([^&?]*)", "ig");
                        var y = window.location.search.match(F);
                        var E = w.tip || 0;
                        var A = true ? "Ablesky" : "";
                        var B = w.username || "";
                        var z = j.cookie(false, B + "closeTip");
                        if (z) {
                            return
                        }
                        switch (E - 0) {
                        case 0:
                            return;
                        case 2:
                            D = "欢迎您加入" + A + "！请登录您的注册邮箱，查收我们的邮件，激活您的帐号！";
                            break;
                        case 3:
                            D = "欢迎您加入" + A + '！由于您的帐户由机构创建，为保证信息安全，请您<a href="' + x + '" style="color:#fff;text-decoration: underline;">立即修改密码</a>！';
                            break;
                        case 1:
                            D = "欢迎您加入" + A + '！由于您的帐户由机构创建，密码和邮箱尚未修改，为保证信息安全，请您<a href="' + x + '" style="color:#fff;text-decoration: underline;">立即修改帐户信息</a>！';
                            break;
                        default:
                            return
                        }
                        C = ['<div style="width:100%; height:35px;background-color: #3399FE;" id="J_top-tips">', '<p class="clearfix" style="margin: 0 auto; width: 1000px; color:#FFF; height:35px; line-height:35px;">', '<span style="display:block; float:left;">', D, "</span>", '<a href="javascript:void(0)" style="display:block; float:right; margin-top:6px; width:20px; height:20px;background: url(', IMG_PATH, '/market/head/close-blue.png) no-repeat right 0 transparent;"></a>', "</p></div>"].join("");
                        f("#J_top-tips a").live("click", function() {
                            f("#J_top-tips").hide();
                            j.cookie(false, B + "closeTip", 1)
                        });
                        f(document.body.firstChild).before(f(C))
                    }, 0)
                }
                return j.curUserInfo
            }).fail(function(w) {
                j.curUserInfo.counter++
            })
        } catch (v) {
            j.curUserInfo.counter++
        }
        return j.curUserInfo
    };
    j.checkIfLogin = function(t) {
        var s = true;
        if (t == true) {
            s = j.getCurUserInfo().username != "GUEST"
        } else {
            s = j.curUserInfo.isGuest
        }
        return !s
    };
    var m = function() {
            f.ajax({
                url: PASSPORT_SERVER + "check.do?action=check",
                dataType: "jsonp"
            }).done(function(t) {
                var u = t.success,
                    s = t.ASUSS;
                if (t.success && s != "" && s != "false") {
                    j.getCurUserInfo(true, s);
                    window.location.reload()
                }
            })
        };
    if (!true) {
        if (!j.checkIfLogin()) {
            m()
        }
    }
    f.ajax({
        url: PASSPORT_SERVER + "keep.do?action=keepChat",
        dataType: "jsonp"
    });
    window.setInterval(function() {
        if (j.curUserInfo.username != "GUEST") {
            f.ajax({
                url: PASSPORT_SERVER + "keep.do?action=chat",
                dataType: "jsonp"
            });
            var s = document.createDocumentFragment();
            var t = document.createElement("img");
            t.src = "s.gif?_=" + f.now();
            s.appendChild(t);
            f(t).load(function() {
                s.removeChild(t);
                s = t = null
            })
        }
    }, 9 * 60 * 1000);
    setTimeout(function() {
        var s = window.location.hostname,
            u = /www.ablesky.com/.test(s),
            t = /s.ablesky.com/.test(s);
        require(["common/ablesky-ga", "analytics/ableanalytics"])
    }, 0);
    var n = function(t) {
            var w = null,
                t = t || {},
                v = "J_footOpenTip" + n.uid,
                x = ['<div id="' + v + '" class="foot-system-tip" style="z-index:' + (n.uid++) + ';"><div class="foot-tip-container">', '<a class="close foot-tip-close" href="javascript:;">关闭</a>', (t.isCommonNotice ? t.noticeText : ("<h2>" + (true ? "AbleSky" : "") + "提示 :</h2><p>" + t.tipText + '</p><div class="foot-tip-action">' + (t.showButton ? ('<a class="bluebtn35 tip-button foot-tip-close" target="_blank" href="' + t.buttonLink + '"><span class="bluebtn35_text">' + t.buttonText + "</span></a>") : (true ? '<span class="poweredby">Powered by AbleSky</span>' : "")) + "</div>")), "</div></div>", '<input type="hidden" id="isClose" value="' + (t.closeData ? t.closeData : "") + '" />'].join("");
            f("body").append(x);
            var s = f("#" + v);
            var y = f(".foot-tip-close", s);
            var u = function() {
                    w = setTimeout(function() {
                        s.animate({
                            right: -400
                        }, 1500, function() {
                            s.remove()
                        })
                    }, 6 * 1000)
                };
            y.click(function() {
                t.closeCallback && t.closeCallback(f("#isClose").val());
                s.remove()
            });
            s.animate({
                right: 0
            }, 1500, function() {});
            s.bind({
                mouseover: function() {
                    clearTimeout(w);
                    s.stop();
                    s.animate({
                        right: 0
                    }, 0)
                },
                mouseout: function() {
                    if (t.isCommonNotice) {
                        u()
                    }
                }
            });
            if (t.isCommonNotice) {
                u()
            }
        };
    j.showFootTip = n;
    n.uid = 1400;
    setTimeout(function() {
        if (j.checkIfLogin()) {
            f.ajax({
                url: HTTP_SERVER + "taskTrigger.do",
                dataType: "jsonp"
            }).done(function(v, w, u) {
                if (v.isCompleted != null && v.notifyMessageList) {
                    for (var s = 0, t; t = v.notifyMessageList[s]; s++) {
                        if (t[0] === false) {
                            n({
                                tipText: t[2],
                                showButton: v.isCompleted,
                                buttonLink: (true ? HTTP_SERVER : "") + "studyCenterRedirect.do?action=loadStudyCenterPage",
                                buttonText: "立即前往学习中心",
                                closeData: t[1],
                                closeCallback: function(x) {
                                    f.ajax({
                                        url: HTTP_SERVER + "studyCenterRedirect.do?action=deleteLoadStudyCenterNotify&orgStudentId=" + x,
                                        dataType: "jsonp",
                                        success: function(z, A, y) {}
                                    })
                                }
                            })
                        }
                    }
                }
                if (v.success === true && v.notifyMessageList) {
                    for (var s = 0, t; t = v.notifyMessageList[s]; s++) {
                        if (t[0] === true) {
                            n({
                                isCommonNotice: true,
                                noticeText: t[2]
                            })
                        }
                    }
                }
            })
        }
        require(["lib/jquery/jquery.dialog"], function() {
            require(["accessory/webim"]);
            if (true) {
                require(["accessory/feedback"])
            }
        })
    }, 100);
    var k = function(v, s) {
            var t = parseFloat(v),
                u, y, w, x, B, A, z;
            var s = (arguments.length < 2) ? 2 : s;
            t = t.toFixed(s);
            y = String(t);
            w = y.split(".");
            y = w[0];
            z = w[1];
            x = y.length;
            if (x < 4) {
                return t
            }
            u = x % 3;
            B = u == 0 ? "" : y.slice(0, u) + ",";
            A = y.slice(u);
            A = A.replace(/(.{3})/g, "$1,");
            A = A.slice(0, -1);
            if (s === 0) {
                return B + A
            }
            return B + A + "." + z
        };
    var h = function() {
            require(["lib/jquery/jquery.poshytip"], function() {
                f(".ablesky-colortip").poshytip({
                    className: "poshytip",
                    alignTo: "target",
                    alignX: "center",
                    offsetY: 5,
                    slide: false,
                    liveEvents: true,
                    showTimeout: 50,
                    hideTimeout: 50,
                    showAniDuration: 200,
                    hideAniDuration: 150
                });
                f(".ablesky-colortip-left").poshytip({
                    className: "poshytip-left",
                    alignTo: "target",
                    alignX: "inner-left",
                    offsetX: 0,
                    offsetY: 5,
                    slide: false,
                    liveEvents: true,
                    showTimeout: 50,
                    hideTimeout: 50,
                    showAniDuration: 200,
                    hideAniDuration: 150
                });
                f(".ablesky-colortip-right").poshytip({
                    className: "poshytip-right",
                    alignTo: "target",
                    alignX: "inner-right",
                    offsetX: 0,
                    offsetY: 5,
                    slide: false,
                    liveEvents: true,
                    showTimeout: 50,
                    hideTimeout: 50,
                    showAniDuration: 200,
                    hideAniDuration: 150
                })
            })
        };
    var d = function(t, w) {
            var t = t || window.location.href;
            if (j.checkIfLogin()) {
                return true
            }
            if (!w) {
                if (!true) {
                    window.location.href = BASE_PATH + "login.do?fromurl=" + encodeURIComponent(t)
                } else {
                    window.location.href = HTTP_SERVER + "login.do?fromurl=" + encodeURIComponent(t)
                }
            } else {
                var s = Array.prototype.slice.call(arguments, 2);
                for (var u = 0; u < s.length; u++) {
                    s[u] = encodeURIComponent(s[u])
                }
                var v = "funName=" + w + "&params=" + s.join(",") + "&fromurl=" + encodeURIComponent(t);
                if (!true) {
                    window.location.href = BASE_PATH + "login.do?" + v
                } else {
                    window.location.href = HTTP_SERVER + "login.do?" + v
                }
            }
        };
    var a = function() {
            if (!j.checkIfLogin()) {
                return
            }
            var t = {};
            var u = j.cookie(false, "funName");
            var v = j.cookie(false, "params") || "";
            if (!u) {
                return
            }
            j.webim && (t.chatWithMe = j.webim.chatWithMe);
            t.popPrivateLetter = j.popPrivateLetter;
            v = v.split(",");
            for (var s = 0; s < v.length; s++) {
                v[s] = decodeURIComponent(v[s])
            }
            if (t[u]) {
                t[u].apply(this, v);
                j.cookie(false, "funName", null);
                j.cookie(false, "params", null)
            }
        };
    setTimeout(function() {
        a()
    }, 800);
    require(["foot/contacts"], function() {});
    j.cookie = function(s, u, x) {
        var v = {
            path: "/",
            domain: q()
        },
            y = "AUI_SC",
            w, t;
        if (arguments.length < 2) {
            throw new Error("Missing arguments")
        }
        switch (s) {
        case true:
            y = "AUI_EC";
            v.expires = 365;
            break;
        case false:
            y = "AUI_SC";
            break;
        default:
            throw new TypeError("The first argument must be Boolean")
        }
        if (typeof u != "string") {
            throw new TypeError("illegal name")
        }
        w = f.cookie(y) || "{}";
        t = JSON.parse(w);
        if (arguments.length == 2) {
            return t[u]
        }
        if (arguments.length > 2) {
            if (x === null || x === undefined) {
                t[u] = null;
                delete t[u]
            } else {
                t[u] = x
            }
            f.cookie(y, JSON.stringify(t), v)
        }
    };
    window.AbleSky = window.AUI = j;
    return {
        isEmpty: l,
        fixedNumber: g,
        queryString: e,
        queryStaticURIString: o,
        getFLDomain: q,
        initTip: h,
        formatNumber: k,
        switchToLoginPage: d,
        navigation: b
    }
});