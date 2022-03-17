$(document).ready(function () {
  $('[data-bs-toggle="tooltip"]').tooltip();
});

$(document).ready(function () {
  $('input[maxlength]').maxlength({
    alwaysShow: true,
    threshold: 10,
    warningClass: "badge badge-success",
    limitReachedClass: "badge badge-danger",
    message: '%charsTyped% / %charsTotal%',
    validate: true
  });
});

$(document).ready(function () {
  $('[data-bs-toggle="popover"]')
    .popover({
      trigger: "manual",
      html: true,
    })
    .on("mouseenter", function () {
      var _this = this;
      $(this).popover("show");
      $(".popover").on("mouseleave", function () {
        $(_this).popover("hide");
      });
    })
    .on("mouseleave", function () {
      var _this = this;
      setTimeout(function () {
        if (!$(".popover:hover").length) {
          $(_this).popover("hide");
        }
      }, 100);
    });
});

if ($(".settings-dropdown").length) {
  $(".settings-dropdown .dropdown-menu .dropdown-item select").click(function (
    e
  ) {
    e.stopPropagation();
  });
  $(".settings-dropdown .dropdown-menu .dropdown-item .switchery").click(
    function (e) {
      e.stopPropagation();
    }
  );
}

if ($(".sidebar").length) {
  $(".nav-icon").addClass("fa-fw");
  $(".nav-icon").removeClass("nav-icon");

  let sidebarState = sessionStorage.getItem("sidebar");
  $(".sidebar").toggleClass(sidebarState);

  $("#sidebarToggle, #sidebarToggleTop").on("click", function (e) {
    $("body").toggleClass("sidebar-toggled");
    $(".sidebar").toggleClass("toggled");
    if ($(".sidebar").hasClass("toggled")) {
      sessionStorage.setItem("sidebar", "toggled");
      $(".sidebar .collapse").collapse("hide");
    } else {
      sessionStorage.setItem("sidebar", "");
    }
  });

  if ($(window).width() < 768) {
    $(".sidebar").addClass("toggled");
  }
}

!(function (s) {
  "use strict";
  s(window).resize(function () {
      s(window).width() < 768 && s(".sidebar .collapse").collapse("hide"),
        s(window).width() < 480 &&
        !s(".sidebar").hasClass("toggled") &&
        (s("body").addClass("sidebar-toggled"),
          s(".sidebar").addClass("toggled"),
          s(".sidebar .collapse").collapse("hide"));
    }),
    s("body.fixed-nav .sidebar").on("mousewheel DOMMouseScroll wheel",
      function (e) {
        if (768 < s(window).width()) {
          var o = e.originalEvent,
            l = o.wheelDelta || -o.detail;
          (this.scrollTop += 30 * (l < 0 ? 1 : -1)), e.preventDefault();
        }
      }
    );
})(jQuery);