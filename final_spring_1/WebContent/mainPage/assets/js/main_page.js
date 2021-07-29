/**
 * Template Name: BizLand - v1.2.1
 * Template URL: https://bootstrapmade.com/bizland-bootstrap-business-template/
 * Author: BootstrapMade.com
 * License: https://bootstrapmade.com/license/
 */
!(function ($) {
  ("use strict");
  /*==========================================[[ Mine ]]==================================================*/

  // Search__Rank Visible Controll
  $(document).ready(function () {
    const product = document.querySelector("#product");

    //스크롤 이동시 이벤트
    $(window).scroll(function () {
      //중고상품 섹션 top 위치값
      let product_top = product.getBoundingClientRect().top;
      //현재 스크롤 위치값
      let scroll_top = $(window).scrollTop();

      //현재 스크롤 위치가 상품 섹션보다 내려갔을 때
      if (product_top < scroll_top) {
        $("#search__rank").addClass("search__visible");
        $("#search__rank").removeClass("search__invisible");
      } else {
        $("#search__rank").removeClass("search__visible");
        $("#search__rank").addClass("search__invisible");
      }
    });

    //회원가입 - 입력창 유효값 확인 이벤트
    const form = document.querySelector(".needs-validation");
    form.addEventListener(
      "submit",
      function (event) {
        if (form.checkValidity() == false) {
          event.preventDefault();
          event.stopPropagation();
          form.classList.add("was-validated");
        }

        // 서버 연동 처리
      },
      false
    );
  });

  //회원가입 모달창 이벤트들
  $(document).ready(function () {
    
  });

//  //지도 말풍선 클릭시 이벤트
//  $(window).on("load", function () {
//    console.log(3, "window.onload");
//    if ($(".errand_regist").length) {
//      $(document).on("click", ".errand_regist", function () {
//        console.log("errand!!!!!!!");
//        const modal = document.querySelector("#errand_modal");
//        console.log(modal);
//        $(modal).modal("show");
//      });
//    }
//  });

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

  //파일 이름 가져오기 & 파일용량 제한
  $(document).ready(function () {
    console.log($(".report_file_user"));
    $(".report_file_user").on("change", function () {
      const file = $(this)[0].files[0];
      const fileName = $(this)[0].files[0].name;
      if (file) {
        console.log(file);
        const fileSize = file.size;
        if (fileSize > 1024 * 1024 * 10) {
          alert("10MB 이하 파일만 등록할 수 있습니다.");
          $(".report_file_user").next()[0].innerHTML = "Choose file";
          return;
        }
      }
      $(".report_file_user").next()[0].innerHTML = fileName;
    });
  });

  //버튼 클릭시 모달창 show
  $(".btnTest").click(function () {
    console.log("modal test");
    $("#report_board").modal("show");
  });

  //모달창 버튼 클릭시 이벤트
  $("#report_btn_user").click(function () {
    console.log("btn clicked");
    swal("Well Done!!", "심부름이 등록되었습니다 : )", "success").then(() => {
      $("#report_content_user").submit();
    });
  });

  //drop down toggle
  $('.dropdown-toggle').dropdown('toggle');

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
