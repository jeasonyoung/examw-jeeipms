(function(F) {
    var D = typeof define === "function" && define.amd && define.amd.jQuery,
        K = F("#J_siteNav"),
        B = F(".account", K),
        G = Boolean(F("#J_college").val()) || false,
        J = F(".trigger-wrapper", K);
    if (!K.get(0)) {
        return;
    }
    var I = function() {
            return K.height()
        };
    var H = function(M) {
            F.blockUI.defaults.fadeIn = 100;
            F.blockUI.defaults.fadeOut = 100;
            F.blockUI({
                message: '<div id="J_popPriLetter" class="overlay-letter"><div style="text-align: center; font-size: 16px; color: #FFF;">加载中...</div></div>',
                overlayCSS: {
                    backgroundColor: "#000",
                    opacity: 0.6,
                    cursor: "default",
                    zIndex: 10000
                },
                css: {
                    position: "fixed",
                    top: "16%",
                    left: "50%",
                    marginLeft: "-300px",
                    border: "none",
                    textAlign: "left",
                    backgroundColor: "none",
                    cursor: "auto",
                    zIndex: 10010
                }
            });
            if (D) {
                require(["common/module-letter"], function(N) {
                    N.init(M)
                })
            } else {
                AUI.letter.init(M)
            }
        };
    if (D) {
        if (G === true) {
            var C = encodeURIComponent(window.location.href);
            F(".account-register", B).attr("href", "collegeRedirect.do?action=toRegister&fromurl=" + C)
        } else {
            if (isAbleskyDomain) {
                require(["common/module-pop-register"], function(M) {
                    F(".account-register", B).click(function(N) {
                        N.preventDefault();
                        M.init()
                    })
                })
            } else {
                if (F(".account-login", B).length > 0) {
                    var C = encodeURIComponent(window.location.href);
                    F(".account-register", B).attr("href", "orgHomePageRedirect.do?action=domainRegisiter&fromurl=" + C)
                }
            }
        }
    } else {
        F(".account-register", B).click(function(M) {
            M.preventDefault();
            popUpCreateAccWin()
        })
    }(function() {
        J.on({
            mouseover: function() {
                clearTimeout(this._timeout);
                var P = F(this);
                var O = P.attr("data-control-width");
                var M = F("menu", P).siblings("a").innerWidth();
                var N = O ? O : M;
                P.addClass("trigger-wrapper-hover");
                F("menu", P).width(N)
            },
            mouseout: function() {
                var M = F(this);
                this._timeout = setTimeout(function() {
                    M.removeClass("trigger-wrapper-hover")
                }, 50)
            }
        })
    })();
    (function() {
        var Q = F(".contact-cs", K),
            P = F(".contact-cs menu", K),
            O;
        var M = function() {
                O = setTimeout(function() {
                    F(".cs-list-popwin", P).hide()
                }, 100)
            };
        var N = function() {
                F.ajax({
                    url: HTTP_SERVER + "online.do?action=hasAnySupportOnline",
                    dataType: "jsonp",
                    timeout: 10 * 1000,
                    success: function(R) {
                        var S = R.hasSupportOnline;
                        F(".cs-info", P).html(['<a class="link button ' + (S ? "" : "cs-offline") + ' show-cs-list" href="javascript:;">在线联系客服</a>', (isAbleskyDomain ? ('<a class="more" href="' + (isAbleskyDomain ? HTTP_SERVER : "") + 'commonRedirect.do?action=toContact">更多</a>') : "")].join(""));
                        F("a.show-cs-list", P).click(function() {
                            if (!AUI.checkIfLogin()) {
                                A();
                                return
                            }
                            F.ajax({
                                url: HTTP_SERVER + "online.do?action=assignOnlineSupport",
                                dataType: "jsonp",
                                timeout: 10 * 1000,
                                success: function(U) {
                                    var T = (U.supportUsername || "support1").toLowerCase(),
                                        V = U.isOnline;
                                    if (V === true) {
                                        AUI.webim.chatWithMe(T, T)
                                    } else {
                                        H(T)
                                    }
                                }
                            })
                        })
                    }
                })
            };
        Q.hover(function() {
            N()
        }, function() {
            return
        })
    })();
    var E = function(M) {
            F(".cart-num", K).show().text(M.totalCourseCnt)
        };
    if (D) {
        require(["course/module-cart"], function(M) {
            M.getItems()
        })
    } else {
        AUI.cart.getItems()
    }
    var L = {
        popLogin: A,
        getNavHeight: I,
        refreshCartInfo: E
    };
    if (D) {
        define(["jquery", "common/global"], function(N, M) {
            return L
        })
    } else {
        window.AUI = window.AUI || {};
        window.AUI.siteNav = L
    }
})(jQuery);