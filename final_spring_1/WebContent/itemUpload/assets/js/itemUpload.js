/**
 * Template Name: BizLand - v1.2.1
 * Template URL: https://bootstrapmade.com/bizland-bootstrap-business-template/
 * Author: BootstrapMade.com
 * License: https://bootstrapmade.com/license/
 */
!(function ($) {

/* 게시물 수정 후 확인 */
$(document).ready(function(){
	console.log('edit page');
	$("#itemBoardEdit").on('shown.bs.modal', function(){
		let item_editBtn = $("#item_editBtn");
		item_editBtn.click(function(){
			
		})
	})
})

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
  function readURL1(input) {
    console.log('1');
    if (input.files && input.files[0]) {
      var reader = new FileReader();
      console.log('2');
      reader.onload = function (e) {
        console.log('3');
        $('#image_section1').attr('src', e.target.result);
      }
      console.log('4');
      reader.readAsDataURL(input.files[0]);
    }
  }
  console.log('5');
  $("#imgInput1").change(function () {
    // console.log('6');
    readURL1(this);
    // console.log('7');
    $("#delPic1").css('visibility', 'visible');
  });
  console.log('8');

  function readURL2(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
      reader.onload = function (e) {
        $('#image_section2').attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }
  $("#imgInput2").change(function () {
    readURL2(this);
    $("#delPic2").css('visibility', 'visible');
  });
  function readURL3(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
      reader.onload = function (e) {
        $('#image_section3').attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }
  $("#imgInput3").change(function () {
    readURL3(this);
    $("#delPic3").css('visibility', 'visible');
  });
  function readURL4(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
      reader.onload = function (e) {
        $('#image_section4').attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }
  $("#imgInput4").change(function () {
    readURL4(this);
    $("#delPic4").css('visibility', 'visible');
  });
  function readURL5(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
      reader.onload = function (e) {
        $('#image_section5').attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }
  $("#imgInput5").change(function () {
    readURL5(this);
    $("#delPic5").css('visibility', 'visible');
  });

  $("#delPic1").click(function () {
    $('#image_section1').attr('src', "../itemUpload/assets/img/itemupload/default.png");
    $("#imgInput1").val("");
    $('#delPic1').css("visibility", "hidden");
  });
  $("#delPic2").click(function () {
    $('#image_section2').attr('src', "../itemUpload/assets/img/itemupload/default.png");
    $("#imgInput2").val("");
    $('#delPic2').css("visibility", "hidden");
  });
  $("#delPic3").click(function () {
    $('#image_section3').attr('src', "../itemUpload/assets/img/itemupload/default.png");
    $("#imgInput3").val("");
    $('#delPic3').css("visibility", "hidden");
  });
  $("#delPic4").click(function () {
    $('#image_section3').attr('src', "../itemUpload/assets/img/itemupload/default.png");
    $("#imgInput4").val("");
    $('#delPic4').css("visibility", "hidden");
  });
  $("#delPic5").click(function () {
    $('#image_section3').attr('src', "../itemUpload/assets/img/itemupload/default.png");
    $("#imgInput5").val("");
    $('#delPic5').css("visibility", "hidden");
  });



  /////////////////상세정보페이지 버튼 활성화//////////////

  $(function () {
//  	let val = $("#essential1").val();
//  	let val2 = $("#essential2").val();
//  	let val3 = $("#essential3").val();
//  	if(val != null || val2 != null || val3 != null){
//  		console.log(val);
//  		console.log(val2);
//  		console.log(val3);
//  		$("#btn-submit").attr("disabled", false);
//  	} else{
//  		$("#btn-submit").attr("disabled", true);
//  	}
	
    var flag1 = false;
    var flag2 = false;
    var flag3 = false;
    
   $("#essential3").on("click", function () {
     	flag3 = $("#essential3").val() != "카테고리 선택" ? true : false;
  		console.log(flag3);
    });
    $("#essential1, #essential2").on("propertychange change keyup paste input", function () {
        flag1 = $("#essential1").val().length > 0 ? true : false;
  		console.log(flag1);
        flag2 = $("#essential2").val().length > 0 ? true : false;
  		console.log(flag2);
     	flag3 = $("#essential3").val() != "카테고리 선택" ? true : false;
  		console.log(flag3);
	    $("#btn-submit").attr("disabled", !(flag1 && flag2 && flag3));
    });
  });



  ////////////신뢰도(별점)/////////////
  ratings = { RatingScore: 4.1 }//////<-별점 inserthere
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
