<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
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
      
      // 검색창에 포커스
  	  $('input[name=nds_search]').focus();
      
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

// //지도 말풍선 클릭시 이벤트
// $(window).on("load", function () {
//   console.log(3, "window.onload");
//   if ($(".errand_regist").length) {
//     $(document).on("click", ".errand_regist", function () {
//       console.log("errand!!!!!!!");
//       const modal = document.querySelector("#errand_modal");
//       console.log(modal);
//       $(modal).modal("show");
//     });
//   }
// });

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
/*==============================================================*/
$('#addComment').click(function(){
	console.log('sadfdsf');
});



/*==========================================[[ 여기는 지혜영역 ]]==================================================*/
	//검색어를 입력하여 찾기
	function itemSearch(){
	// 	let search = {"pr_search":$('input[name=nds_search]').val()};
	    $.ajax({
	    	type: "GET",
	//     	data: search,
	    	url: "http://localhost:9696/item/selectBySearch.nds?pr_search="+$('input[name=nds_search]').val(),
	    	success:function(data){
	//     		alert(data);
				viewItemList(data);
	    	},
	    	error:function(e){
	    		alert("에러: "+e.responseText);
	    	}
	    });
	};

	//최근상품,인기상품 클릭 시 해당하는 정렬순서로 상품목록을 조회한다.
	function allItemList(pr_choice){
		let item = {"pr_choice":pr_choice.id};
	    $.ajax({
	    	type: "GET",
	    	url: "http://localhost:9696/item/selectItemList.nds",
			data: item,
	    	success:function(data){
				viewItemList(data);
	    	},
	    	error:function(e){
	    		alert("에러: "+e.responseText);
	    	}
	    });
	};
	
	function viewItemList(items){
		let itemAll = document.querySelector("#itemAll");
		if(items.length>0){
			itemAll.innerHTML = items;
		}
	
		else{
			itemAll.innerHTML= "<div style='display: block; width: 100%; text-align: center;'>조회결과가 없습니다<div>";
		}
	}
	
	//대댓글 달기
	function pdCommentBtn(pdComment){
		console.log("Dfdf");
		let pdCommentform ="";
		pdCommentform +="					<form action=''>";
		pdCommentform +="						<div class='input-group'>                                                                                             ";
		pdCommentform +="							<div class='input-group-prepend'>                                                                                 ";
		pdCommentform +="								<span class='input-group-text'>댓글 작성란</span>                                                             ";
		pdCommentform +="							</div>                                                                                                            ";
		pdCommentform +="							<textarea class='form-control' id='nds_comment' aria-label='댓글 작성란'></textarea>                              ";
		pdCommentform +="							<div class='input-group-prepend'>                                                                                 ";
		pdCommentform +="								<button type='button' class='btn btn-primary' onclick='insertComment(this)'>댓글등록</button>";
		pdCommentform +="							</div>                                                                                                            ";
		pdCommentform +="						</div>                                                                                                                ";
		pdCommentform +="					</form>                                                                                                                   ";
		pdComment.parentNode.parentNode.parentNode.parentNode.parentNode.innerHTML+=pdCommentform;
	}; 
	//댓글 수정
	function pdCommentupdateBtn(pdComment){
		let history = pdComment.parentNode.parentNode.parentNode.parentNode.nextElementSibling.innerText;
		let pdCommentform ="";
		pdCommentform +="					<form action=''>";
		pdCommentform +="							<textarea class='w-100' row='2'>"+history+"</textarea> ";
		pdCommentform +="							<div class='input-group-prepend'>                                                                                 ";
		pdCommentform +="								<button type='button' class='btn btn-primary' onclick='insertComment(this)'>댓글수정</button>";
		pdCommentform +="							</div> ";
		pdCommentform +="					</form>  ";
		pdComment.parentNode.parentNode.parentNode.parentNode.nextElementSibling.innerHTML=pdCommentform;
	};

	
	
	
	//상품 찜하기 클릭 시
	function likeItem(itemno){	
		let itemID = document.getElementById(itemno.id);
		let item = {"pr_bm_no":itemno.id};
	    $.ajax({
	    	type: "POST",
	    	url: "http://localhost:9696/item/likeItem.nds",
			data: item,
	    	success:function(data){
	    		if(data==1) {
					//찜 ok
					itemID.innerHTML="<i class= 'fas fa-heart'></i>";
				}else if(data==-1){
					//찜 no
					itemID.innerHTML="<i class= 'far fa-heart' style='color:grey'></i>";
				}else{
					alert("로그인 후 이용가능합니다!");
				}
	    	},
	    	error:function(e){
	    		alert("에러: "+e.responseText);
	    	}
	    });
	};
	
	//댓글 삭제하기
	function deleteComment(comment){	
		console.log('asdf');
		let p_comment_step = comment.id; //삭제할번호
	    $.ajax({
	    	type: "POST",
	    	url: "http://localhost:9696/item/deleteComment.nds",
			data: {"p_comment_step":p_comment_step},
	    	success:function(data){
	    		if(data=='true') {
					document.querySelector('.comment_num'+p_comment_step).remove();
				}
	    		else if(data=="false") {
					alert("삭제할 댓글이 없습니다.");				
				}
	    	},
	    	error:function(e){
	    		alert("에러: "+e.responseText);
	    	}
	    });
	};
	//댓글 작성하기
	function insertComment(comment){
		console.log(comment);
		let commentType_No = comment.id.split('-');//commentType_No[0]은 댓글인지 대댓글인지 확인(0이면 댓글/1이면 대댓글), commentType_No[1]은 게시물번호
		let commentgroup = commentType_No[0]==0 ? 0 : 1;//댓글이면 0, 대댓글이면 댓글의 그룹번호를 가져옴
	// 	let msg = document.querySelector(".form-control").value; //메세지 내용
		let msg = $('#nds_comment').val();
		
		let item = {"pr_comment_pos":commentType_No[0],"pr_comment_group":commentgroup,"pr_comment_msg":msg,"pr_bm_no":commentType_No[1]};
	    $.ajax({
	    	type: "POST",
	    	url: "http://localhost:9696/item/insertComment.nds",
			data: item,
	    	success:function(data){
	    		$('#pd__comment__list').append(data);
	    		$('#nds_comment').val("");
	// 			console.log(data);
	//     		if(data['result']=='true') {
	// 				//댓글이라면
	// 				if(data['COMMENT_POS']==0){
	// 					document.querySelector("#pd__comment__list").innerHTML=comment_make(data)+document.querySelector("#pd__comment__list").innerHTML;
	// 				}
	// 				//대댓글이라면
	// 				else{
	// 					console.log("e대댓글");
	// 				}		
	// 				document.querySelector(".form-control").value ="";
	// 			}
	//     		else if(data['result']=="itemFalse") {
	// 				alert("해당 글이 존재하지 않습니다.");				
	// 			}
	//     		else if(data['result']=="comentFalse") {
	// 				alert("댓글이 존재하지 않습니다.");					
	// 			}
	// 			else{
	// 				alert("로그인 후 이용가능합니다!");
	// 			}
	    	},
	    	error:function(e){
	    		alert("에러: "+e.responseText);
	    	}
	    });
	   
	};

/* ==================================== KEY ======================================== */

$(document).ready(function(){
	// 지도가 있다면 즉, 메인페이지라면 인기순위로 상품을 불러오자.	
	if($('#Map').length){
		let item = {"pr_choice":"like_rank"};
		$.ajax({
	    	type: "GET",
	    	url: "http://localhost:9696/item/selectItemList.nds",
			data: item,
	    	success:function(data){
				viewItemList(data);
	    	},
	    	error:function(e){
	    		alert("에러: "+e.responseText);
	    	}
	    });
	}
});





</script>