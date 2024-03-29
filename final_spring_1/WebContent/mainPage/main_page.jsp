<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%
	String join_email = (String)request.getAttribute("join_email");

	List<Map<String, Object>> rankList = (List<Map<String, Object>>)request.getAttribute("rankList");
	
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <title>내동생 - 메인페이지</title>
  <meta content="" name="description">
  <meta content="" name="keywords">
  <!-- =============================================== ▼ ＳＣＲＩＰＴ  ▼ ================================================= -->
  <%@ include file="../mainPage/source_h.jsp" %>
  <!-- =============================================== ▲ ＳＣＲＩＰＴ ▲ ================================================= -->
  <!-- ＧＯＯＧＬＥ　ＭＡＰ -->
  <script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
  <script src="https://unpkg.com/@google/markerclustererplus@4.0.1/dist/markerclustererplus.min.js"></script>
  
  
  
  
</head>

<body>

  <!-- ========================================= ▼ ＨＥＡＤＥＲ　ＳＥＣＴＩＯＮ ▼ ========================================= -->
  <%@ include file="../common/header.jsp" %>
  <!-- ========================================= ▲ ＨＥＡＤＥＲ　ＳＥＣＴＩＯＮ ▲ ========================================= -->

<!-- 토스트 메세지창 -->
<%-- <%@ include file="../common/toast.jsp" %> --%>
  <!-- =========================================== ▼ ＭＡＰ　ＳＥＣＴＩＯＮ ▼ ============================================= -->
  <section id="Map" class="d-flex justify-content-center align-items-center">
    <div id="map" class="col-12 col-lg-12" style="width: 100%; height: 80vh;"></div>
  </section>
  <!-- =========================================== ▲ ＭＡＰ　ＳＥＣＴＩＯＮ ▲ ============================================= -->
  <!-- =========================================== ▼ ＭＡＩＮ　ＳＥＣＴＩＯＮ ▼ ============================================= -->
  <main id="main">
  <!-- ============================================== ▼ 중고거래 상품 ▼ ================================================ -->
		<section id="product" class="product">
			<!-- ▼ 검색순위 플로팅 시작 ▼ -->
			<div id="search__rank" style="opacity: 0;"
				class="position-absolute position-fixed">
					<h3 class="rankTitle">현재 검색 순위</h3>
				<div class="list">
					<div class="rankNumberList">
						<div><span class="rankNumber">1</span></div>
						<div><span class="rankNumber">2</span></div>
						<div><span class="rankNumber">3</span></div>
						<div><span class="rankNumber">4</span></div>	
						<div><span class="rankNumber">5</span></div>	
						<div><span class="rankNumber">6</span></div>	
						<div><span class="rankNumber">7</span></div>	
						<div><span class="rankNumber">8</span></div>	
						<div><span class="rankNumber">9</span></div>	
						<div><span class="rankNumber">10</span></div>
					</div>
					<div class="rankKeywordList">
						<div><span onClick="searchRank(this);"><%=rankList.get(0).get("KEYWORD") %></span></div>
						<div><span onClick="searchRank(this);"><%=rankList.get(1).get("KEYWORD") %></span></div>
						<div><span onClick="searchRank(this);"><%=rankList.get(2).get("KEYWORD") %></span></div>
						<div><span onClick="searchRank(this);"><%=rankList.get(3).get("KEYWORD") %></span></div>
						<div><span onClick="searchRank(this);"><%=rankList.get(4).get("KEYWORD") %></span></div>
						<div><span onClick="searchRank(this);"><%=rankList.get(5).get("KEYWORD") %></span></div>
						<div><span onClick="searchRank(this);"><%=rankList.get(6).get("KEYWORD") %></span></div>
						<div><span onClick="searchRank(this);"><%=rankList.get(7).get("KEYWORD") %></span></div>
						<div><span onClick="searchRank(this);"><%=rankList.get(8).get("KEYWORD") %></span></div>
						<div><span onClick="searchRank(this);"><%=rankList.get(9).get("KEYWORD") %></span></div>
					</div>
				</div>
			</div>
			<!-- ▲ 검색순위 플로팅 끝 ▲ -->
			<div class="container" data-aos="fade-up">
				<!-- ▼ 메인 타이틀 시작 ▼ -->
				<div
					class="product__title d-flex flex-column justify-content-center align-items-center mb-4">
					<h2>지금 거래중인</h2>
					<h3 class="mb-2">
						<span class="nds__title">내 동</span><span style="color: #444444;">네</span><span class="nds__title">생</span><span style="color: #444444;">활</span> <span>중고거래상품</span>
					</h3>
					<div
						class="product__search__box d-flex flex-column align-items-center">
						<div
							class="product__prefer d-flex justify-content-around align-items-center mb-4">
							<a id="like_rank" href="javascript:void(0);"
								onclick="allItemList(this)">인기상품순</a>
							<div class="divider"></div>
							<a id="new_rank" href="javascript:void(0);"
								onclick="allItemList(this)">최근상품순</a>
						</div>
						<!-- ▼ 검색창 시작 ▼ -->
						<div class="product__serach__bar">
							<div class="form-row justify-content-center align-items-center">
								<div class="col-2">
									<span class="search__bar__span">찾는상품</span>
								</div>
								<div class="col-7">
									<input id="f_autocompl" name="nds_search" type="text" onkeypress="javascript:if(event.keyCode==13){itemSearch(); hide_autocmpl(); $('input[name=nds_search]').blur();}" class="form-control text-center"
										placeholder="어떤 상품들이 거래되고 있을까요? : )" style="font-size: 20px;">
								</div>
								<div id="autocomplete" class="" style="position: absolute; z-index: 100;"></div>
								<div class="col-1">
									<button type="button" class="btn btn-outline-light btn-lg"
										onclick="itemSearch()">Search</button>
								</div>
							</div>
							<!-- ▲ 검색창 끝 ▲ -->
						</div>
					</div>
				</div>
				<!-- ▲ 메인 타이틀 끝 ▲ -->
<!-- 						▼ 중고거래 상품 갤러리 ▼ -->

				<%@ include file="../itemPage/main_page_item.jsp"%>
<!-- 						▲ 중고거래 상품 갤러리 ▲ -->
						<!-- ============================================== ▲ 상품목록  끝 ▲ ================================================ -->
					</div>
				</section>
				<!-- ============================================== ▲ 중고거래 상품 ▲ ================================================ -->
	</main>
<style>
.list{
    width: 100%;
    display:flex;
    text-align: center;
    margin-bottom: 15px;
}
.rankNumberList{
	width: 15%;
    text-align: center;
    margin-left: 10px;
    font-weight: bold;
    font-style: italic;
    background-color: linen;
    border-radius: 5px;
}
.rankKeywordList{
	width: 85%;
	cursor : pointer;
}
.rankTitle{
	font-family: "WandohopeB";
	margin: 15px;
    text-align: center;
    background: #ffc37b;
    color: white;
    border-radius: 40px;
}
#search__rank {
	background-color: white;
    color: black;
    width: 300px;
    border-radius: 40px;
    border: 3px solid #627ea4;
    top: 300px;
    right: 3%;
    text-align: left;
    font-size: 23px;
}
</style>
  <!-- =========================================== ▲ ＭＡＩＮ　ＳＥＣＴＩＯＮ ▲ ============================================= -->
  <!-- =============================================== ▼ ＦＯＯＴＥＲ ▼ ================================================= -->
  <!-- <footer id="footer"></footer> -->
  <!-- =============================================== ▲ ＦＯＯＴＥＲ ▲ ================================================= -->
  <!-- =============================================== ▼ 맨 위로 가기  ▼ ================================================= -->
  <div id="preloader"></div>
  <a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>
  <!-- =============================================== ▲ 맨 위로 가기 ▲ ================================================= -->
  <!-- /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\ ▼ ＭＯＤＡＬ　ＰＡＲＴ ▼ /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\ -->
  <!-- 로그인 모달 있던 자리 -->
  <!-- 회원가입(이메일) 모달 있던 자리 -->
  <!-- 회원가입 양식 모달 있던 자리 -->
  <!-- 코인충전 모달 있던 자리 -->
  <!-- 심부름 모달 있던 자리 -->
  <!-- 게시글 신고 모달 --><%@ include file="../mainPage/reportBoard.jsp" %>
  <!-- 회원 신고 모달 --><%@ include file="../mainPage/reportMem.jsp" %>
  <!-- \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/ ▼ ＭＯＤＡＬ　ＰＡＲＴ ▼ \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/ -->
  <!-- =============================================== ▼ ＳＣＲＩＰＴ  ▼ ================================================= -->
　　<%@ include file="../mainPage/source_f.jsp" %>
<script type="text/javascript">
<% if(join_email != null){ %>
		$(document).ready(function(){
			$('#inputEmail').val("<%=join_email%>");
			$('#signUpModal').modal('show');
		});
<% } %>
function searchRank(item){
 	$('input[name=nds_search]').val(item.innerText);
 	itemSearch();
}
</script>
  <!-- =============================================== ▲ ＳＣＲＩＰＴ ▲ ================================================= -->
</body>
</html>