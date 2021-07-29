<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<title>내동생 - 마이페이지 :: 심부름 내역</title>
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
		<div class="errand_top">
			<span></span> <span></span> <span></span> <span></span> 
			<a class="total_errand request active" href="javascript:reqAction()">
				<span><h4 class="all_rec">내가 요청한 심부름</h4></span>
			</a>
			<span class="divider_rec"></span> 
			<a class="total_errand response" href="javascript:resAction()">
				<span><h4 class="all_rec">내가 수행한 심부름</h4></span>
			</a> 
			<span></span> <span></span> <span></span> <span></span>
		</div>
		<!-- FB 테이블 자리 마련 -->
		<div class="errand_FB"></div>
		<div class="errand_bottom req_errand_tb">
			<span class="total_rec coin2" > 전체 : <span id="allcnt"></span> </span>
			<table class="req_errand_tb errand_tb" id="products">
			<form action="" id="setRows">
				<input type="hidden" name="rowPerPage" value="8" id="rowPerPage">
			</form>
				<thead>
					<tr>
						<th scope="cols" width="9%">선택</th>
						<th scope="cols" width="12%">구분</th>
						<th scope="cols" width="18%">날짜</th>
						<th scope="cols" width="37%">제목</th>
						<th scope="cols" width="12%">가격</th>
						<th scope="cols" width="12%">닉네임</th>
					</tr>
				</thead>
				<tbody id="nds_tbody_req">
				<!-- DB에서 불러온 데이터가 들어갈 자리 -->
				</tbody>
			</table>
	      <div class="delete">
	            <a href="#" data-toggle="modal" data-target="#selDelete">
	               <button type="button" class="btn btn-danger">삭제</button>
	            </a>
	      </div>
      </div>
      <div class="errand_bottom nds_errand_tb">
         <span class="total_rec coin2" > 전체 : <span id="allcnt1"></span> </span>
         <table class="errand_tb" id="products">
         <form action="" id="setRows">
            <input type="hidden" name="rowPerPage" value="8" id="rowPerPage">
         </form>
            <thead>
               <tr>
                  <th scope="cols" width="9%">선택</th>
                  <th scope="cols" width="12%">구분</th>
                  <th scope="cols" width="18%">날짜</th>
                  <th scope="cols" width="37%">제목</th>
                  <th scope="cols" width="12%">가격</th>
                  <th scope="cols" width="12%">닉네임</th>
               </tr>
            </thead>
            <tbody id="nds_tbody_nds">
            <!-- DB에서 불러온 데이터가 들어갈 자리 -->
            </tbody>
         </table>
         <div class="delete">
            <a href="#" data-toggle="modal" data-target="#selDelete">
               <button type="button" class="btn btn-danger">삭제</button>
            </a>
         </div>
			</div>
		</div>
</div>






  <!-- /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\ ▼ ＭＯＤＡＬ　ＰＡＲＴ ▼ /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\ -->
<!-- myInfo 모달 --><%@ include file="../myPage/myErrand_modal.jsp" %>
  <!-- \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/ ▼ ＭＯＤＡＬ　ＰＡＲＴ ▼ \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/ -->







	
  <!-- =============================================== ▼ ＳＣＲＩＰＴ  ▼ ================================================= -->
<%@ include file="../myPage/source_f.jsp" %>
  <!-- =============================================== ▲ ＳＣＲＩＰＴ ▲ ================================================= -->
<script type="text/javascript">/* 김은영작업 - 추후에 include로 뺄 예쩡 */
	$(document).ready(function () {
		
		   reqAction();
	});
</script>
	
	
	
	
</body>
</html>