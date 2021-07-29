<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>  
<%
			Map<String, Object> memberMap = null;
			List<Map<String, Object>> errand = null;
			List<Map<String, Object>> sellList = null;
			memberMap = (Map<String, Object>)request.getAttribute("memberMap");
			errand = (List<Map<String, Object>>)request.getAttribute("errandSize");
			sellList = (List<Map<String, Object>>) request.getAttribute("sellList");
			//out.print(memberMap);
			String user_nickname = memberMap.get("MEM_NICKNAME").toString();
			String user_email = memberMap.get("MEM_EMAIL").toString();
			String user_img = memberMap.get("MEM_IMG").toString();
			Double user_star = Double.parseDouble(memberMap.get("MEM_STAR").toString());
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta content="width=device-width, initial-scale=1.0" name="viewport" />

<title>내동생 - 사용자 정보</title>
<meta content="" name="description" />
<meta content="" name="keywords" />
  <!-- =============================================== ▼ ＳＣＲＩＰＴ  ▼ ================================================= -->
  <%@ include file="../mainPage/source_h.jsp" %>
  <link href="../mainPage/assets/css/user_page.css" rel="stylesheet">
  <!-- =============================================== ▲ ＳＣＲＩＰＴ ▲ ================================================= -->
</head>

<body>
  <!-- ========================================= ▼ ＨＥＡＤＥＲ　ＳＥＣＴＩＯＮ ▼ ========================================= -->
  <%@ include file="../common/header.jsp" %>
  <!-- ========================================= ▲ ＨＥＡＤＥＲ　ＳＥＣＴＩＯＮ ▲ ========================================= -->
	<main class="pd__main" id="main">
		<section id="product" class="product__description col-12 col-lg-12">
			<div class="container mt-3" id="pd__top" data-aos="fade-up">
				<div class="top">
					<div class="top_left">
						<div>
		                	<img class="img_upload" id="image_section" src="../myPage/assets/img/profile/<%=user_img%>"/>
						</div>
					</div>
					<div class="top_right">
			            <div class="nickDiv">
	   						<h4 class="con_nick"><%=user_nickname%></h4>
						</div>
			            <div class="nickDiv1">
							<div class="trust">
							<input type="hidden" class="ratingScore" value="<%=user_star%>" id="ratingScore">
								<div class='RatingStar'>
									<div class='RatingScore'>
										<div class='outer-star'>
											<div class='inner-star'>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div>
							<a id="pd__seller__chat" onclick="openChat('<%= user_nickname %>')"> 대화하기 <i class="far fa-comments"></i></a>
						</div>
					</div>
				</div>
				<div class="top_bottom">
					<div class="top_bottom_left">
	                	<div>심부름 주문 횟수 <span class="errand_count"><%= errand.get(0).get("COUNT(ERRAND_STATUS)")%></span></div>
					</div>

					<div class="top_bottom_right">
	                	<div>심부름 완료 횟수 <span class="errand_count"><%= errand.get(1).get("COUNT(ERRAND_STATUS)")%></span></div>
					</div>
				</div>
				<div class="center">
					<div class="divbar"><span class="spanNick"><%=user_nickname%></span>님의 판매목록
					</div>
				</div>
				<div class="bottom" style="width:100%; margin-top:15px;">
<%
if(sellList != null){
	for(int i = 0 ; sellList.size() > i ; i++){
	String user_file = sellList.get(i).get("BI_FILE").toString();
	String user_title = sellList.get(i).get("BM_TITLE").toString();
	String user_price = sellList.get(i).get("BM_PRICE").toString();
	String user_no 	  = sellList.get(i).get("BM_NO").toString();
%>					<div style="width:20%; display:inline-block; margin : 5px;">
						<a style="text-decoration: none; color:black;" href="../item/selectItemDetail.nds?pr_bm_no=<%=user_no %>">
							<div class="card" style="height:300px; align-items: center; border-radius:20px;">
							  <img style="width:200px; height:200px; padding:10px; object-fit: contain; border-bottom: 1px solid lightgray;" src="../itemUpload/assets/img/itemupload/<%= user_file%>" class="card-img-top" alt="...">
							  <div class="card-body">
							    <h5 class="card-title" style="font-size:15px;"><%=user_title %></h5>
							  </div>
							  <div>
							    <p class="card-text" style="color: sienna; padding-bottom:15px;"><span style="font-weight:bold;"><%=user_price%></span>원</p>
							  </div>
							</div>
						</a>
					</div>
<%
	}
}
%>
				</div>
			</div>

		</section>
	</main>

	<div id="preloader"></div>
	<a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>

  <!-- =============================================== ▼ ＳＣＲＩＰＴ  ▼ ================================================= -->
　　<%@ include file="../itemPage/source_f.jsp" %>
	<script src="../myPage/assets/js/myInfo.js"></script>
	<script type="text/javascript">
		function openChat(dest_nickname){
			$.ajax({
				type:'post',
				url:'/member/jsonSelectMember.nds',
				data:{"mem_nickname":dest_nickname},
				dataType:'json',
				success:function(data){
					console.log("ajax success for "+data.MEM_NICKNAME);
					window.open('/mainPage/chatroom.jsp?dest_email='+data.MEM_EMAIL+'','','width=550px, height=701px');
				},
				error:function(e){
					console.log(e);
				}
			});
		}
	</script>
  <!-- =============================================== ▲ ＳＣＲＩＰＴ ▲ ================================================= -->
</body>
</html>
