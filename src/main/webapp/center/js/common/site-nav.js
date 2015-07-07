(function(F) {
	var K = F(".site-nav-items"),
		J = F(".trigger-wrapper", K);
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
                }, 100)
            }
        })
})(jQuery);
