(function(window) {
  "use strict";
  class Airy {
    constructor(config) {
      this.config = config;
      this.init();
    }
    init() {
      // 代码高亮
      hljs.initHighlightingOnLoad();

      // 代码高亮
      if (this.config.toc) {
        this.scrollToc();
      }
    }

    scrollToc() {
      var SPACING = 20;
      var $toc = $(".post-toc");
      var $footer = $(".footer");

      if ($toc.length) {
        var minScrollTop = $toc.offset().top;
        var maxScrollTop = $footer.offset().top - $toc.height() - SPACING;

        var tocState = {
          start: {
            position: "absolute",
            top: minScrollTop,
            width: "240px"
          },
          process: {
            position: "fixed",
            top: SPACING,
            width: "240px"
          },
          end: {
            position: "absolute",
            top: maxScrollTop,
            width: "240px"
          }
        };

        $(window).scroll(function() {
          var scrollTop = $(window).scrollTop();

          if (scrollTop < minScrollTop) {
            $toc.css(tocState.start);
          } else if (scrollTop > maxScrollTop) {
            $toc.css(tocState.end);
          } else {
            $toc.css(tocState.process);
          }
        });
      }
    }
  }

  var config = window.config;
  var even = new Airy(config);
})(window);
