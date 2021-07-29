!(function ($) {
  ("use strict");
  /*==========================================[[ Mine ]]==================================================*/

  //버튼 누르면 top으로 이동
  $(".back-to-top").click(function () {
    $("html, body").animate(
      {
        scrollTop: 0,
      },
      1500,
      "easeInOutExpo"
    );
    return false;
  });

  //버튼 클릭시 모달창 show
  $(".btnTest").click(function () {
    console.log("modal test");
    $("#report_user").modal("show");
  });

  //모달창 버튼 클릭시 이벤트
  $("#report_btn_user").click(function () {
    console.log("btn clicked");
    swal("Well Done!!", "심부름이 등록되었습니다 : )", "success").then(() => {
      $("#report_content_user").submit();
    });
  });

  /*==========================================[[ Not Mine ]]==================================================*/

  // Preloader
  $(window).on("load", function () {
    if ($("#preloader").length) {
      $("#preloader")
        .delay(100)
        .fadeOut("slow", function () {
          $(this).remove();
        });
    }
  });

  // Toggle .header-scrolled class to #header when page is scrolled
  // $(window).scroll(function () {
  //   if ($(this).scrollTop() > 100) {
  //     $("#header").addClass("header-scrolled");
  //     $("#topbar").addClass("topbar-scrolled");
  //   } else {
  //     $("#header").removeClass("header-scrolled");
  //     $("#topbar").removeClass("topbar-scrolled");
  //   }
  // });

  // if ($(window).scrollTop() > 100) {
  //   $("#header").addClass("header-scrolled");
  //   $("#topbar").addClass("topbar-scrolled");
  // }

  // Back to top button
  $(window).scroll(function () {
    if ($(this).scrollTop() > 100) {
      $(".back-to-top").fadeIn("slow");
    } else {
      $(".back-to-top").fadeOut("slow");
    }
  });

  // jQuery counterUp
  $('[data-toggle="counter-up"]').counterUp({
    delay: 10,
    time: 1000,
  });

  // Testimonials carousel (uses the Owl Carousel library)
  $(".testimonials-carousel").owlCarousel({
    autoplay: true,
    dots: true,
    loop: true,
    items: 1,
  });

  //Owl Carousel adapt
  $(".owl-carousel").owlCarousel({
    items: 1,
    loop: true,
    margin: 10,
    nav: true,
    navText: [
      [`<i class="fas fa-chevron-left"></i>`],
      [`<i class="fas fa-chevron-right"></i>`],
    ],
    responsive: {
      0: {
        items: 1,
      },
      600: {
        items: 1,
      },
      1000: {
        items: 1,
      },
    },
  });

  // Portfolio details carousel
  $(".portfolio-details-carousel").owlCarousel({
    autoplay: true,
    dots: true,
    loop: true,
    items: 1,
  });

  // Init AOS
  function aos_init() {
    AOS.init({
      duration: 1500,
      once: true,
    });
  }

  $(window).on("load", function () {
    aos_init();
  });
})(jQuery);
