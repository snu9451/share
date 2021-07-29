<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>BizLand Bootstrap Template - Index</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="assets/img/favicon.png" rel="icon">
<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Roboto:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Jua&family=Sunflower:wght@300&display=swap"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="assets/vendor/icofont/icofont.min.css" rel="stylesheet">
<link href="assets/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link href="assets/vendor/owl.carousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link href="assets/vendor/venobox/venobox.css" rel="stylesheet">
<link href="assets/vendor/aos/aos.css" rel="stylesheet">

<!-- Template Main CSS File -->
<link href="assets/css/style.css" rel="stylesheet">
<script>
	function sellAction() {
		console.log("판매내역");
		$.ajax({
			url : "myTrade_sell_rec.jsp",
			success : function(data) {//@data-json,xml,html,text
				$(".trade_bottom").html(data);
				console.log("판매내역");
			},
			error : function(e) {//@param-XMLHttpRequest

			}
		});
	}
	function buyAction() {
		console.log("구매내역");
		$.ajax({
			url : "myTrade_buy_rec.jsp",
			success : function(data) {//@data-json,xml,html,text
				$(".trade_bottom").html(data);
				console.log("구매내역");
			},
			error : function(e) {//@param-XMLHttpRequest

			}
		});
	}
</script>
</head>

<body>
	<jsp:include page="header.jsp"></jsp:include>
	<jsp:include page="left_bar.jsp"></jsp:include>

	<div class="col-12 col-lg-9 d-flex align-items-stretch mb-5 mb-lg-0">
		<div class="icon-box1" data-aos="fade-in" data-aos-delay="50">
			<div class="trade_top">
				<span></span> <span></span> <span></span> <span></span> 
				<a class="total_trade buy active" href="javascript:buyAction()"> <span><h4 class="all_rec">구매내역</h4></span></a> 
				<span class="divider_rec"></span> 
				<a class="total_trade sell" href="javascript:sellAction()"> <span><h4 class="all_rec">판매내역</h4></span></a> 
				<span></span> <span></span> <span></span><span></span>
			</div>
			<div class="trade_bottom">
				<span class="total_rec coin2"> 전체 : (inserthere) </span>
				<table class="like_tb" id="products">
					<form action="" id="setRows">
						<input type="hidden" name="rowPerPage" value="4" id="rowPerPage">
					</form>
					<thead>
						<tr>
							<th scope="cols" width="15%"></th>
							<th scope="cols" width="25%"></th>
							<th scope="cols" width="35%"></th>
							<th scope="cols" width="25%"></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="divider">글번호 inserthere</td>
							<td class="divider_img"><a href="http://naver.com"
								style="color: black"><img id="item_image"
									src="./assets/img/item/inserthere"></a></td>
							<td class="divider_con"><a href="http://naver.com"
								style="color: black">inserthere</a></td>
							<td class="divider">등록일 inserthere<br>inserthere원<br>
								<a href="#" data-toggle="modal" data-target="#delete">
									<button type="button" class="btn btn-danger btn-sm">삭제하기</button>
								</a>
							</td>
						</tr>
						<tr>
							<td class="divider">글번호 inserthere</td>
							<td class="divider_img"><a href="http://naver.com"
								style="color: black"><img id="item_image"
									src="./assets/img/item/inserthere"></a></td>
							<td class="divider_con"><a href="http://naver.com"
								style="color: black">inserthere</a></td>
							<td class="divider">등록일 inserthere<br>inserthere원<br>
								<a href="#" data-toggle="modal" data-target="#delete">
									<button type="button" class="btn btn-danger btn-sm">삭제하기</button>
								</a>
							</td>
						</tr>
						<tr>
							<td class="divider">글번호 inserthere</td>
							<td class="divider_img"><a href="http://naver.com"
								style="color: black"><img id="item_image"
									src="./assets/img/item/inserthere"></a></td>
							<td class="divider_con"><a href="http://naver.com"
								style="color: black">inserthere</a></td>
							<td class="divider">등록일 inserthere<br>inserthere원<br>
								<a href="#" data-toggle="modal" data-target="#delete">
									<button type="button" class="btn btn-danger btn-sm">삭제하기</button>
								</a>
							</td>
						</tr>
						<tr>
							<td class="divider">글번호 inserthere</td>
							<td class="divider_img"><a href="http://naver.com"
								style="color: black"><img id="item_image"
									src="./assets/img/item/inserthere"></a></td>
							<td class="divider_con"><a href="http://naver.com"
								style="color: black">inserthere</a></td>
							<td class="divider">등록일 inserthere<br>inserthere원<br>
								<a href="#" data-toggle="modal" data-target="#delete">
									<button type="button" class="btn btn-danger btn-sm">삭제하기</button>
								</a>
							</td>
						</tr>
					</tbody>
				</table>
				
			</div>
		</div>
	</div>
	<!-- ============================= Modal Part ========================= -->

  	<!-- 구매내역(삭제하기) -->
	<div>
	  <div class="modal fade" id="delete" tabindex="-1" role="dialog" aria-labelledby="logIn" aria-hidden="true">
	    <div class="modal-dialog modal-dialog-centered " role="document">
	      <div class="modal-content">
	        <div class="modal-header">
	          <h3 class="modal-title" id="exampleModalLongTitle" style="font-size : 20px; font-weight:bold">
	          <i class="fas fa-exclamation-triangle" style="color : red;"></i> 게시글 삭제</h3>
	          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	            <span aria-hidden="true">&times;</span>
	          </button>
	        </div>
	        <div class="modal-body text-center d-flex justify-content-center">
	          <div class="col-12 log__box d-flex flex-column justify-content-center">
	            <div>
	              <h4 class="col-12 d-flex justify-content-around" style="font-size : 20px; font-weight:bold">정말 삭제하시겠습니까?
	              </h4>
	            </div>
	          </div>
	        </div>
	        <div class="modal-footer">
	          <button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
	          <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
	        </div>
	      </div>
	    </div>
	  </div>
	</div>
	<div>
	  <div class="modal fade" id="modify" tabindex="-1" role="dialog" aria-labelledby="logIn" aria-hidden="true">
	    <div class="modal-dialog modal-dialog-centered" role="document">
	      <div class="modal-content">
	        <div class="modal-header">
	          <h3 class="modal-title" id="exampleModalLongTitle" style="font-size : 20px; font-weight:bold">
	          <i class="fas fa-edit" style="color : skyblue;"></i> 게시글 수정</h3>
	          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	            <span aria-hidden="true">&times;</span>
	          </button>
	        </div>
	        <div class="modal-body text-center d-flex justify-content-center">
	          <div class="col-12 log__box d-flex flex-column justify-content-center">
	            <div>
	              <h4 class="col-12 d-flex justify-content-around" style="font-size : 20px; font-weight:bold">게시글을 수정하시겠습니까?
	              </h4>
	            </div>
	          </div>
	        </div>
	        <div class="modal-footer">
	          <button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
	          <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
	        </div>
	      </div>
	    </div>
	  </div>
	</div>

	<!-- 중고거래 내역보기(구매내역 테이블) -->







	<!-- ver 4.0 v -->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>

	<!-- Vendor JS Files -->
	<!--
    <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  -->
	<script src="assets/vendor/jquery/jquery.min.js"></script>
	<script src="assets/vendor/jquery.easing/jquery.easing.min.js"></script>
	<script src="assets/vendor/php-email-form/validate.js"></script>
	<script src="assets/vendor/waypoints/jquery.waypoints.min.js"></script>
	<script src="assets/vendor/counterup/counterup.min.js"></script>
	<script src="assets/vendor/owl.carousel/owl.carousel.min.js"></script>
	<script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
	<script src="assets/vendor/venobox/venobox.min.js"></script>
	<script src="assets/vendor/aos/aos.js"></script>

	<!-- Template Main JS File -->
	<script>
		var $setRows = $('#setRows');

		$setRows.submit(function(e) {
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
				$('<a href="#"></a>').attr('rel', i).html(i + 1).appendTo(
						'#nav');
			}
			$tr.addClass('off-screen').slice(0, rowPerPage).removeClass(
					'off-screen');

			var $pagingLink = $('#nav a');
			$pagingLink.on('click', function(evt) {
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
				$tr.css('opacity', '0.0').addClass('off-screen').slice(
						startItem, endItem).removeClass('off-screen').animate({
					opacity : 1
				}, 300);
				console.log("5");
			});

			$pagingLink.filter(':first').addClass('active');

		});

		$setRows.submit();
	</script>
</body>

</html>