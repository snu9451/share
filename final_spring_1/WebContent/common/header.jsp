<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/작성자:신우형\/\/\/\/\/\/\/\/\/\/\/\/\/\/\ -->
  <script defer src="https://www.gstatic.com/firebasejs/8.6.8/firebase-app.js"></script>
  <script defer src="https://www.gstatic.com/firebasejs/8.6.8/firebase-database.js"></script>
  <script defer src="../common/init-firebase.js"></script>

  <!-- ========================================= ▼ ＨＥＡＤＥＲ ▼ ========================================= -->
  <header id="header" class="fixed-top d-flex align-items-end">
  	<!-- drop down 시작 -->
  	<div class="dropdown">
  		<button class="btn btn-secondary dropdown-toggle" type="button" id="category_drop" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
  			<i class="fas fa-bars"></i>
  		</button>
		<div class="dropdown-menu" aria-labelledby="category_drop">
        	<ul class="pl-0 mb-0" id="category_item">
         	</ul>
		</div>
	</div>
	<div style="width: 85%; padding-left: 50px;">
	<!-- drop down 끝 -->
<!-- 	<div class="container d-flex align-items-center"> -->
	<div class="d-flex align-items-center">
		<img class="myBro__logo mr-2" src="../common/assets/img/mybro_logo.png" alt="mybro_favicon">
		<h1 class="logo mr-auto main__title">
			<a href="http://localhost:9696/mainPage/main_page.nds">내 동생<span>.</span></a>
		</h1>
		<nav class="nav-menu d-none d-lg-block">
		<ul>
<%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Pragma","no-cache");
response.setDateHeader("Expires",0);
%>

<%
	// 로그인 중이 아닐 때
	Map<String, Object> login = new HashMap<>();
	//Map<String, Object> memberMap = new HashMap<>();
	String mem_nickname = null;	// 전역에서 사용되는 정보
	String mem_email = null;	// 전역에서 사용되는 정보
	String mem_img = null;	// 전역에서 사용되는 정보
	double mem_star = 0.0;		// 마이페이지에서 사용되는 정보
	int coin_remain = 0;		// 마이페이지에서 사용되는 정보
	if(session.getAttribute("login") == null){
%>
	<!-- 비회원 로그인시 나타나는 nav bar --><%@ include file="../mainPage/annNavbar.jsp" %>
<%
	// 로그인 중일 때
	} else if(session.getAttribute("login") != null){
		login = (Map<String, Object>)session.getAttribute("login");
		//memberMap = (Map<String, Object>)request.getAttribute("memberMap");
		//out.print(memberMap);
		mem_nickname = login.get("MEM_NICKNAME").toString();
		mem_email = login.get("MEM_EMAIL").toString();
		mem_star = Double.parseDouble(String.valueOf(login.get("MEM_STAR")));
		mem_img = String.valueOf(login.get("MEM_IMG"));
		coin_remain = Integer.parseInt(String.valueOf(login.get("COIN_REMAIN")));
		//mem_nickname = memberMap.get("MEM_NICKNAME").toString();
		//mem_star = Double.parseDouble(String.valueOf(memberMap.get("MEM_STAR")));
		//mem_img = String.valueOf(memberMap.get("MEM_IMG"));
		//coin_remain = Integer.parseInt(String.valueOf(memberMap.get("COIN_REMAIN")));
		
%>
	<!-- 회원 로그인시 나타나는 nav bar --><%@ include file="../mainPage/memNavbar.jsp" %>
<%
	}
%>
		</ul>
		</nav>
	</div>
	</div>
  </header>
  <!-- ========================================= ▲ ＨＥＡＤＥＲ ▲ ========================================= -->


					<!-- 여기까지 파이어베이스 구동에 필수적인 스크립트 -->
<!--   <script defer src="../common/alert.js"></script> -->
  <%@ include file="../common/toast.jsp" %>
  <%@ include file="../common/alert_js.jsp" %>
						<!-- 확인했으면 주석을 지우셔도 됩니다. -->
<!-- \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/ -->




  <!-- ====================================== ▼ HEADER에서 쓰이는 모달 ▼ ====================================== -->
  <!-- 로그인 모달 --><%@ include file="../mainPage/login_modal.jsp" %>
  <!-- 회원가입 모달 --><%@ include file="../common/join.jsp" %>
  <!-- 회원가입 모달 --><%@ include file="../common/assets/js/join_js.jsp" %>
  <!-- 회원가입 양식 모달 --><%@ include file="../common/joinForm.jsp" %>
  <!-- 코인충전 모달 --><%@ include file="../common/coinCharge.jsp" %>
  <!-- 코인출금 모달 --><%@ include file="../common/coinWithdraw.jsp" %>
  <!-- 심부름 모달 --><%@ include file="../mainPage/errand.jsp" %>
  <!-- ====================================== ▲ HEADER에서 쓰이는 모달 ▲ ====================================== -->