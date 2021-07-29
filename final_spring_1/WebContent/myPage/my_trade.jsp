<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<title>내동생 - 마이페이지 :: 중고거래 내역</title>
<meta content="" name="description">
<meta content="" name="keywords">
  <!-- =============================================== ▼ ＳＣＲＩＰＴ  ▼ ================================================= -->
<%@ include file="../myPage/source_h.jsp" %>
  <!-- =============================================== ▲ ＳＣＲＩＰＴ ▲ ================================================= -->
</head>
<body>


  <!-- =========================================== ▼ ＣＯＭＭＯＮ　ＳＥＣＴＩＯＮ  ▼ ============================================= -->
<%@ include file="../common/header.jsp" %>
<%@ include file="../myPage/left_bar.jsp" %>
  <!-- =========================================== ▲ ＣＯＭＭＯＮ　ＳＥＣＴＩＯＮ ▲ ============================================= -->



	<div class="col-12 col-lg-9 d-flex align-items-stretch mb-5 mb-lg-0">
		<div class="icon-box1" data-aos="fade-in" data-aos-delay="50">
			<div class="trade_top">
				<span></span> <span></span> <span></span> <span></span> 
				<a class="total_trade buy active" href="javascript:buyAction()"> <span><h4 class="all_rec">구매내역</h4></span></a> 
				<span class="divider_rec"></span> 
				<a class="total_trade sell" href="javascript:sellAction()"> <span><h4 class="all_rec">판매내역</h4></span></a> 
				<span></span> <span></span> <span></span><span></span>
			</div>
			<div class="d-flex flex-column align-content-center">
				<span id="itemCount" class="total_rec coin2">num</span>
				<div id="forNoRecord">
				</div>
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
					<tbody class="trade_bottom">

					</tbody>
				</table>				
			</div>
		</div>
	</div>







  <!-- /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\ ▼ ＭＯＤＡＬ　ＰＡＲＴ ▼ /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\ -->
<!-- myInfo 모달 --><%@ include file="../myPage/myTrade_modal.jsp" %>
  <!-- \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/ ▼ ＭＯＤＡＬ　ＰＡＲＴ ▼ \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/ -->








  <!-- =============================================== ▼ ＳＣＲＩＰＴ  ▼ ================================================= -->
<%@ include file="../myPage/source_f.jsp" %>
  <!-- =============================================== ▲ ＳＣＲＩＰＴ ▲ ================================================= -->
<script>
$(document).ready(function () {
	  /* ============================ 페이징처리 함수 시작 ====================================*/
	  let setRows = $("#setRows");
	  setRows.submit(function (e) {
	    e.preventDefault();
	    let rowPerPage = $("#rowPerPage").val() * 1;
	    // 1 을  곱하여 문자열을 숫자형로 변환

	    $("#nav").remove();
	    let $products = $("#products");

	    $products.after('<div id="nav">');

	    let $tr = $($products).find("tbody tr");
	    let rowTotals = $tr.length;

	    let pageTotal = Math.ceil(rowTotals / rowPerPage);
	    let i = 0;

	    for (; i < pageTotal; i++) {
	      $('<a href="#"></a>')
	        .attr("rel", i)
	        .html(i + 1)
	        .appendTo("#nav");
	    }
	    $tr.addClass("off-screen").slice(0, rowPerPage).removeClass("off-screen");

	    let $pagingLink = $("#nav a");
	    $pagingLink.on("click", function (evt) {
	      evt.preventDefault();
	      let $this = $(this);
	      if ($this.hasClass("active")) {
	        return;
	      }
	      $pagingLink.removeClass("active");
	      $this.addClass("active");
	      // 0 => 0(0*4), 4(0*4+4)
	      // 1 => 4(1*4), 8(1*4+4)
	      // 2 => 8(2*4), 12(2*4+4)
	      // 시작 행 = 페이지 번호 * 페이지당 행수
	      // 끝 행 = 시작 행 + 페이지당 행수

	      let currPage = $this.attr("rel");
	      let startItem = currPage * rowPerPage;
	      let endItem = startItem + rowPerPage;
	      $tr
	        .css("opacity", "0.0")
	        .addClass("off-screen")
	        .slice(startItem, endItem)
	        .removeClass("off-screen")
	        .animate(
	          {
	            opacity: 1,
	          },
	          300
	        );
	      console.log("5");
	    });

	    $pagingLink.filter(":first").addClass("active");
	  });

	  setRows.submit();
	  /* ============================ 페이징처리 함수 끝 ====================================*/
	  
	  //구매내역 조회
	  buyAction();
});
</script>
</body>

</html>