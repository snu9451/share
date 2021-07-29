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

</head>

<body>
	<jsp:include page="header.jsp"></jsp:include>
	<jsp:include page="left_bar.jsp"></jsp:include>

	<div class="col-12 col-lg-9 d-flex align-items-stretch mb-5 mb-lg-0">
		<div class="icon-box1" data-aos="fade-in" data-aos-delay="50">
			<span class="total_like coin"> 전체 : (inserthere) </span>
			<div class="like_bottom">
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
							<td class="divider"><i class="fas fa-heart likebutton"></i><br>글번호
								inserthere</td>
							<td class="divider_img"><a href="http://naver.com"
								style="color: black"><img id="item_image"
									src="./assets/img/item/inserthere"></a></td>
							<td class="divider_con"><a href="http://naver.com"
								style="color: black">inserthere</a></td>
							<td class="divider">등록일 inserthere<br>inserthere원
							</td>
						</tr>
						<tr>
							<td class="divider"><i class="fas fa-heart likebutton"></i><br>글번호
								1</td>
							<td class="divider_img"><img id="item_image"
								src="./assets/img/item/camera.jpg"></td>
							<td class="divider_con">카메라 팔아요.</td>
							<td class="divider">등록일 2021-06-20<br>70000원
							</td>
						</tr>
						<tr>
							<td class="divider"><i class="fas fa-heart likebutton"></i><br>글번호
								1</td>
							<td class="divider_img"><img id="item_image"
								src="./assets/img/item/camera.jpg"></td>
							<td class="divider_con">카메라 팔아요.</td>
							<td class="divider">등록일 2021-06-20<br>70000원
							</td>
						</tr>
						<tr>
							<td class="divider"><i class="fas fa-heart likebutton"></i><br>글번호
								1</td>
							<td class="divider_img"><img id="item_image"
								src="./assets/img/item/camera.jpg"></td>
							<td class="divider_con">카메라 팔아요.</td>
							<td class="divider">등록일 2021-06-20<br>70000원
							</td>
						</tr>
						<tr>
							<td class="divider"><i class="fas fa-heart likebutton"></i><br>글번호
								1</td>
							<td class="divider_img"><img id="item_image"
								src="./assets/img/item/camera.jpg"></td>
							<td class="divider_con">카메라 팔아요.</td>
							<td class="divider">등록일 2021-06-20<br>70000원
							</td>
						</tr>
						<tr>
							<td class="divider"><i class="fas fa-heart likebutton"></i><br>글번호
								1</td>
							<td class="divider_img"><img id="item_image"
								src="./assets/img/item/camera.jpg"></td>
							<td class="divider_con">카메라 팔아요.</td>
							<td class="divider">등록일 2021-06-20<br>70000원
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>

	<script>
	  ////////////////좋아요 버튼////////////////////
	  $(".likebutton").click(function () {
	    if ($(this).hasClass('active')) {
	    	console.log("좋아요")
	      $(this).removeClass('active');
	    } else {
	      $(this).addClass('active');
	    }
	  });
	</script>


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
	<script src="assets/js/main.js"></script>

</body>

</html>