/**
 * Template Name: BizLand - v1.2.1
 * Template URL: https://bootstrapmade.com/bizland-bootstrap-business-template/
 * Author: BootstrapMade.com
 * License: https://bootstrapmade.com/license/
 */
!(function ($) {



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

  // Smooth scroll for the navigation menu and links with .scrollto classes
  var scrolltoOffset = $("#header").outerHeight() - 21;
  if (window.matchMedia("(max-width: 991px)").matches) {
    scrolltoOffset += 20;
  }
  $(document).on(
    "click",
    ".nav-menu a, .mobile-nav a, .scrollto",
    function (e) {
      if (
        location.pathname.replace(/^\//, "") ==
        this.pathname.replace(/^\//, "") &&
        location.hostname == this.hostname
      ) {
        var target = $(this.hash);
        if (target.length) {
          e.preventDefault();

          var scrollto = target.offset().top - scrolltoOffset;

          if ($(this).attr("href") == "#header") {
            scrollto = 0;
          }

          $("html, body").animate(
            {
              scrollTop: scrollto,
            },
            1500,
            "easeInOutExpo"
          );

          if ($(this).parents(".nav-menu, .mobile-nav").length) {
            $(".nav-menu .active, .mobile-nav .active").removeClass("active");
            $(this).closest("li").addClass("active");
          }

          if ($("body").hasClass("mobile-nav-active")) {
            $("body").removeClass("mobile-nav-active");
            $(".mobile-nav-toggle i").toggleClass(
              "icofont-navigation-menu icofont-close"
            );
            $(".mobile-nav-overly").fadeOut();
          }
          return false;
        }
      }
    }
  );


  // Activate smooth scroll on page load with hash links in the url
  $(document).ready(function () {
 	var subPage = new Array;
	subPage[0] = "selectMember";
	subPage[1] = "myWallet";
	subPage[2] = "myLike";
	subPage[3] = "myTrade";
	subPage[4] = "myErrand";
	var url = location.href;
	var getAr0 = url.indexOf(subPage[0]);
	var getAr1 = url.indexOf(subPage[1]);
	var getAr2 = url.indexOf(subPage[2]);
	var getAr3 = url.indexOf(subPage[3]);
	var getAr4 = url.indexOf(subPage[4]);
	if (getAr0 != -1) {
		$("#each1").addClass("active");
	}
	;
	if (getAr1 != -1) {
		$("#each2").addClass("active");
	}
	;
	if (getAr2 != -1) {
		$("#each3").addClass("active");
	}
	;
	if (getAr3 != -1) {
		$("#each4").addClass("active");
	}
	;
	if (getAr4 != -1) {
		$("#each5").addClass("active");
	}
	;
    if (window.location.hash) {
      var initial_nav = window.location.hash;
      if ($(initial_nav).length) {
        var scrollto = $(initial_nav).offset().top - scrolltoOffset;
        $("html, body").animate(
          {
            scrollTop: scrollto,
          },
          1500,
          "easeInOutExpo"
        );
      }
    }
  });

  // Navigation active state on scroll
  // var nav_sections = $('section');
  // var main_nav = $('.nav-menu, .mobile-nav');

  // $(window).on('scroll', function () {
  //   var cur_pos = $(this).scrollTop() + 200;

  //   nav_sections.each(function () {
  //     var top = $(this).offset().top,
  //       bottom = top + $(this).outerHeight();

  //     if (cur_pos >= top && cur_pos <= bottom) {
  //       if (cur_pos <= bottom) {
  //         main_nav.find('li').removeClass('active');
  //       }
  //       main_nav.find('a[href="#' + $(this).attr('id') + '"]').parent('li').addClass('active');
  //     }
  //     if (cur_pos < 300) {
  //       $(".nav-menu ul:first li:first, .mobile-menu ul:first li:first").addClass('active');
  //     }
  //   });
  // });

  // Mobile Navigation
  if ($(".nav-menu").length) {
    var $mobile_nav = $(".nav-menu").clone().prop({
      class: "mobile-nav d-lg-none",
    });
    $("body").append($mobile_nav);
    $("body").prepend(
      '<button type="button" class="mobile-nav-toggle d-lg-none"><i class="icofont-navigation-menu"></i></button>'
    );
    $("body").append('<div class="mobile-nav-overly"></div>');

    $(document).on("click", ".mobile-nav-toggle", function (e) {
      $("body").toggleClass("mobile-nav-active");
      $(".mobile-nav-toggle i").toggleClass(
        "icofont-navigation-menu icofont-close"
      );
      $(".mobile-nav-overly").toggle();
    });

    $(document).on("click", ".mobile-nav .drop-down > a", function (e) {
      e.preventDefault();
      $(this).next().slideToggle(300);
      $(this).parent().toggleClass("active");
    });

    $(document).click(function (e) {
      var container = $(".mobile-nav, .mobile-nav-toggle");
      if (!container.is(e.target) && container.has(e.target).length === 0) {
        if ($("body").hasClass("mobile-nav-active")) {
          $("body").removeClass("mobile-nav-active");
          $(".mobile-nav-toggle i").toggleClass(
            "icofont-navigation-menu icofont-close"
          );
          $(".mobile-nav-overly").fadeOut();
        }
      }
    });
  } else if ($(".mobile-nav, .mobile-nav-toggle").length) {
    $(".mobile-nav, .mobile-nav-toggle").hide();
  }

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

  // Skills section
  $(".skills-content").waypoint(
    function () {
      $(".progress .progress-bar").each(function () {
        $(this).css("width", $(this).attr("aria-valuenow") + "%");
      });
    },
    {
      offset: "80%",
    }
  );

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

  // Porfolio isotope and filter
  $(window).on("load", function () {
    var portfolioIsotope = $(".portfolio-container").isotope({
      itemSelector: ".portfolio-item",
    });

    $("#portfolio-flters li").on("click", function () {
      $("#portfolio-flters li").removeClass("filter-active");
      $(this).addClass("filter-active");

      portfolioIsotope.isotope({
        filter: $(this).data("filter"),
      });
      aos_init();
    });

    // Initiate venobox (lightbox feature used in portofilo)
    $(document).ready(function () {
      $(".venobox").venobox();
    });
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
      duration: 1000,
      once: true,
    });
  }
  $(window).on("load", function () {
    aos_init();
  });
  ///////////////////////////////////////////////////////



  ///////////프로필 사진////////////////////
  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
      reader.onload = function (e) {
        $('#image_section').attr('src', e.target.result);
        console.log(e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }

  // 이벤트를 바인딩해서 input에 파일이 올라올때 위의 함수를 this context로 실행합니다.
  $("#imgInput").change(function () {
    readURL(this);
  });




  /////////내 지갑보기 페이징처리////////
  var $setRows = $('#setRows');

  $setRows.submit(function (e) {
    e.preventDefault();
    var rowPerPage = $('#rowPerPage').val() * 1;
    // 1 을  곱하여 문자열을 숫자형로 변환


    $('#nav').remove();
    var $products = $('#products');

    $products.after('<div id="nav">');


    var $tr = $($products).find('tbody tr');
    var rowTotals = $tr.length;

    var pageTotal = Math.ceil(rowTotals / rowPerPage);
    var i = 0;

    for (; i < pageTotal; i++) {
      $('<a href="#"></a>')
        .attr('rel', i)
        .html(i + 1)
        .appendTo('#nav');
    }
    $tr.addClass('off-screen')
      .slice(0, rowPerPage)
      .removeClass('off-screen');

    var $pagingLink = $('#nav a');
    $pagingLink.on('click', function (evt) {
      evt.preventDefault();
      var $this = $(this);
      if ($this.hasClass('active')) {
        return;
      }
      $pagingLink.removeClass('active');
      $this.addClass('active');
      // 0 => 0(0*4), 4(0*4+4)
      // 1 => 4(1*4), 8(1*4+4)
      // 2 => 8(2*4), 12(2*4+4)
      // 시작 행 = 페이지 번호 * 페이지당 행수
      // 끝 행 = 시작 행 + 페이지당 행수

      var currPage = $this.attr('rel');
      var startItem = currPage * rowPerPage;
      var endItem = startItem + rowPerPage;
      $tr.css('opacity', '0.0')
        .addClass('off-screen')
        .slice(startItem, endItem)
        .removeClass('off-screen')
        .animate({ opacity: 1 }, 300);
      console.log("5");
    });

    $pagingLink.filter(':first').addClass('active');

  });

  $setRows.submit();


  /////////////////구매내역 판매내역 active///////////////
  $(".buy").click(function () {
    $(".sell").removeClass('active');
    $(this).addClass('active');
  });
  $(".sell").click(function () {
    $(".buy").removeClass('active');
    $(this).addClass('active');
  });


  /////////////////심부름 내역 active///////////////
  $(".request").click(function () {
    $(".response").removeClass('active');
    $(this).addClass('active');
  });
  $(".response").click(function () {
    $(".request").removeClass('active');
    $(this).addClass('active');
  });


  
  
  
  ////////////신뢰도(별점)/////////////
  ratings = { RatingScore: $("#ratingScore").val()*1 }//////<-별점 inserthere
  totalRating = 5;
  table = document.querySelector('.RatingStar');
  function rateIt() {
    for (rating in ratings) {
      ratingPercentage = ratings[rating] / totalRating * 100;
      ratingRounded = Math.round(ratingPercentage / 10) * 10 + '%';
      star = table.querySelector(`.${rating} .inner-star`);
      numberRating = table.querySelector(`.${rating} .numberRating`);
      star.style.width = ratingRounded;
    }
  }
  rateIt()
  
})(jQuery);
