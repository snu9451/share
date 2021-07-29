<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<title>내동생 - 마이페이지 :: 내정보</title>
<meta content="" name="description">
<meta content="" name="keywords">
  <!-- =============================================== ▼ ＳＣＲＩＰＴ  ▼ ================================================= -->
<%@ include file="../myPage/source_h.jsp" %>
<%@ include file="../myPage/assets/js/myInfo_js.jsp" %>
  <!-- =============================================== ▲ ＳＣＲＩＰＴ ▲ ================================================= -->

</head>
<body>

  <!-- =========================================== ▼ ＣＯＭＭＯＮ　ＳＥＣＴＩＯＮ  ▼ ============================================= -->
<%@ include file="../common/header.jsp" %>
<%@ include file="../myPage/left_bar.jsp" %>
  <!-- =========================================== ▲ ＣＯＭＭＯＮ　ＳＥＣＴＩＯＮ ▲ ============================================= -->
<%
		Map<String, Object> memberMap = new HashMap<>();
		memberMap = (Map<String, Object>)request.getAttribute("memberMap");
		//out.print(memberMap);
		mem_nickname = memberMap.get("MEM_NICKNAME").toString();
		mem_star = Double.parseDouble(String.valueOf(memberMap.get("MEM_STAR")));
		mem_img = String.valueOf(memberMap.get("MEM_IMG"));
		coin_remain = Integer.parseInt(String.valueOf(memberMap.get("COIN_REMAIN")));
%>

  <!-- =========================================== ▼ ＭＡＩＮ　ＳＥＣＴＩＯＮ ▼ ============================================= -->
	<div class="col-12 col-lg-9 d-flex align-items-stretch mb-5 mb-lg-0">
		<div class="icon-box1" data-aos="fade-in" data-aos-delay="50">
			<div class="myinfo_top">
				<div class="profile">
					<form id="f_profile_picture" method="post" enctype="multipart/form-data" action="../member/updateImg.nds">
						<input type='file' name="change_img" id="imgInput" accept="image/*" style="display: none;"/>
	                	<div class="img_add">
<!-- 	                		<div style="width:200px; height: 200px; background-color:white;"></div> -->
							<div class="img_wrapper">
		                		<img class="img_upload" id="image_section" src="../myPage/assets/img/profile/<%=mem_img%>"/>
							</div>
							<label type="button" for="imgInput" class="btn btn-danger">사진변경</label>
							<button onclick="addAction()" type="button" class="btn btn-danger">저장</button>
		                </div>
					</form>
				</div>
               
			</div>
			<form id="f_myinfo">
			<div class="myinfo_bottom">
				<div class="myinfo_left">
					<div class="trust">
					<input type="hidden" class="ratingScore" value="<%=mem_star%>" id="ratingScore">
						<h4 class="con_title" style="background-color: #ffc37b">신뢰도</h4>
						<div class='RatingStar'>
							<div class='RatingScore'>
								<div class='outer-star'>
									<div class='inner-star'>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="email">
						<h4 class="con_title" style="background-color: #ffc37b">이메일</h4>
 						<h4 class="con_email" name="mem_email"><%=mem_email%></h4>
						<!-- <h4 class="con_email">whrltjf12345@naver.com</h4> -->
					</div>
					<div class="nickname">
						<h4 class="con_title" style="background-color: #ffc37b">닉네임</h4>
						<h4 class="con_nick"><%=mem_nickname%></h4>
					</div>
				</div>
				<div class="myinfo_right">
					<div class="pw_con">
						<div class="pw">
							<h4 class="con_title2" style="background-color: #ffefd1">현재 비밀번호</h4>
							<input type="password" id="mem_pw" name="mem_pw" value=""/>
						</div>
						<div class="pw">
							<h4 class="con_title2" style="background-color: #ffefd1">새 비밀번호</h4>
							<input type="password" class="new_pw" name="change_pw" value=""/>
						</div>
						<div class="pw">
							<h4 class="con_title2" style="background-color: #ffefd1">비밀번호 확인</h4>
							<input type="password" class="new_pw_confirm" value=""/>
						</div>
						<div class="pwchange_leave">
							<a data-toggle="modal" data-target="#nickChange">
								<button type="button" class="btn btn-warning">닉네임 변경</button>
							</a>
							<a onclick="pwChange()" data-toggle="modal">
								<button type="button" class="btn btn-success">비밀번호 변경</button>
							</a>
							<a data-toggle="modal" data-target="#leave">
								<button type="button" class="btn btn-danger">탈퇴하기</button>
							</a>
						</div>
					</div>
				</div>
			</div>
			</form>
		</div>
	</div>
  <!-- =========================================== ▲ ＭＡＩＮ　ＳＥＣＴＩＯＮ ▲ ============================================= -->





  <!-- /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\ ▼ ＭＯＤＡＬ　ＰＡＲＴ ▼ /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\ -->
<!-- myInfo 모달 --><%@ include file="../myPage/myInfo_modal.jsp" %>
  <!-- \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/ ▼ ＭＯＤＡＬ　ＰＡＲＴ ▼ \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/ -->





  <!-- =============================================== ▼ ＳＣＲＩＰＴ  ▼ ================================================= -->
<%@ include file="../myPage/source_f.jsp" %>
  <!-- =============================================== ▲ ＳＣＲＩＰＴ ▲ ================================================= -->
</body>
</html>