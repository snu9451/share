<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>  
<%
	Map<String,Object> itemContext =(Map<String,Object>)request.getAttribute("itemContext");
	int    BM_PRICE        = itemContext.get("BM_PRICE")!=null ? Integer.parseInt(itemContext.get("BM_PRICE").toString()):0;   //가격
	int    BM_NO           = itemContext.get("BM_NO")!=null ? Integer.parseInt(itemContext.get("BM_NO").toString()):0;    //번호
	String BM_TITLE        = itemContext.get("BM_TITLE")!=null ? itemContext.get("BM_TITLE").toString():"";       //제목
	String BM_CONTENT      = itemContext.get("BM_CONTENT")!=null ? itemContext.get("BM_CONTENT").toString():"";     //내용
	String SELLER_NICKNAME = itemContext.get("SELLER_NICKNAME")!=null ? itemContext.get("SELLER_NICKNAME").toString():"";//닉네임
	int    BM_LIKE         = itemContext.get("BM_LIKE")!= null ? Integer.parseInt(itemContext.get("BM_LIKE").toString()):0;   //찜수
	int    BM_HIT          = itemContext.get("BM_HIT")!= null ? Integer.parseInt(itemContext.get("BM_HIT").toString()):0;    //조회수
	String BM_DATE         = itemContext.get("BM_DATE")!= null ? itemContext.get("BM_DATE").toString():"";        //날짜
	String BM_STATUS       = itemContext.get("BM_STATUS")!= null ? itemContext.get("BM_STATUS").toString():"";     //팔린건지 상품의 상태
	int I_LIKE             = itemContext.get("I_LIKE")!= null ? Integer.parseInt(itemContext.get("I_LIKE").toString()):0;         //좋아요한상태인지 아닌지
	int seller_me 		   = itemContext.get("seller_me")!= null ? Integer.parseInt(itemContext.get("seller_me").toString()):0;         //1 이면 판매자와 내가 동일 인물임 0이면 아니고 
	//결과값[4.png] 사진
	List<String> imgs = (List<String>) request.getAttribute("itemImgs");
	//결과값 댓글 itemComments
	List<Map<String,Object>> itemComments = (List<Map<String,Object>>)request.getAttribute("itemComments");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta content="width=device-width, initial-scale=1.0" name="viewport" />

<title>내동생 - Detail Page</title>
<meta content="" name="description" />
<meta content="" name="keywords" />
  <!-- =============================================== ▼ ＳＣＲＩＰＴ  ▼ ================================================= -->
  <%@ include file="../mainPage/source_h.jsp" %>
  <!-- =============================================== ▲ ＳＣＲＩＰＴ ▲ ================================================= -->
</head>

<body>
  <!-- ========================================= ▼ ＨＥＡＤＥＲ　ＳＥＣＴＩＯＮ ▼ ========================================= -->
  <%@ include file="../common/header.jsp" %>
<script type="text/javascript">
	$(document).ready(function(){
		$('.owl-carousel').owlCarousel({
			loop:true,
			nav: true,
			margin: 10,
			navText: ['<i class="fas fa-backward"></i>', '<i class="fas fa-forward"></i>'],
			responsive:{
				234:{
					items:1
				}
			},
			autoplay: true,
			autoplayTimeout: 3000,
		});
	})
</script>
  <!-- ========================================= ▲ ＨＥＡＤＥＲ　ＳＥＣＴＩＯＮ ▲ ========================================= -->
	<!-- ============================= Detail Section ========================= -->
	<main class="pd__main" id="main">
		<section id="product" class="product__description col-12 col-lg-12">
			<div class="container mt-3" id="pd__top" data-aos="fade-up">
				<div class="row h-100 justify-content-around p-2" id="pd__box">
					<!-- 상품 img div -->
					<div
						class="col-4 col-lg-4 d-flex justify-content-center align-items-center p-0"
						id="pd__img__box">
						<div class="owl-carousel text-center" id="pd__img__carousel" style="border : 5px solid #ffc37b; border-radius:12px; height:350px;">
							<% if("C".equals(BM_STATUS)) { %>
								<% for(int i=0;i<imgs.size();i++){ %>
									<div class="items " style="position: relative; ">
									   <img style="width: 100%; height: 100%; opacity: 0.1; border-radius:12px;" src="../itemUpload/assets/img/itemupload/<%= imgs.get(i) %>" alt="" />
<!-- 									    <div style='font-size: 3.5rem; width: 100%; position: absolute; top: 50%; text-align: center;'> 판매완료 </div> -->
									</div>	
							<% }}else if("S".equals(BM_STATUS)) { %>
								<% for(int i=0;i<imgs.size();i++){ %>
									<div class="items" style="position: relative;">
									   <img style="width: 100%; height: 100%; opacity: 0.1; border-radius:12px;" src="../itemUpload/assets/img/itemupload/<%= imgs.get(i) %>" alt="" />
									   <div style='font-size: 3.5rem; width: 100%; position: absolute; top: 50%; text-align: center;'> 거래중 </div>
									</div>	
							<% }}else{ %>
								<% for(int i=0;i<imgs.size();i++){ %>
									<div class="items" style="position: relative;">
									   <img style="width: 100%; height: 100%; border-radius:12px;" src="../itemUpload/assets/img/itemupload/<%= imgs.get(i) %>" alt="" />
<!-- 									   <img style="width: 100%; height: 100%" src="../itemUpload/assets/img/itemupload/1.png" alt="" /> -->
<!-- 									   <img style="width: 100%; height: 100%" src="../itemUpload/assets/img/itemupload/2.png" alt="" /> -->
									</div>	
								<% }} %>
						</div>
						
					</div>
					<!-- End 상품 img div -->
					<!-- 상품 설명 div -->
					<div
						class="col-8 col-lg-8 d-flex flex-column justify-content-between"
						id="pd__content">
						<div class="d-flex flex-column">
							<div class="d-flex justify-content-between align-items-end">
								<div class="d-flex align-items-end">
									<span class="" id="pd__title"><%= BM_TITLE %></span>
									
								</div>
								<div>
									<ul class="d-flex align-items-end mb-0">
									<% if(seller_me==1){%>
										<% if("N".equals(BM_STATUS)){%>
											<li>
												<form action="/item/updateItemConfirm.nds" method="post"  id="main__shape">
													<input type="hidden" name="pr_bm_no" value=<%= BM_NO %> />
													<button>판매처리하기</button>
												</form>
											</li>
										<% } %>
										<li>
											<form action="/item/editItem.nds" method="post"  id="main__shape">
												<input type="hidden" name="pr_bm_no" value=<%= BM_NO %> />
												<button>수정</button>
											</form>
										</li>
										<li>
											<button data-toggle="modal" data-target="#boardDelete">삭제</button>
										</li>
									<%}else{%>
										<li>
											<button data-toggle="modal" data-target="#report_board">
												게시물 신고 <i class="fas fa-exclamation warn"
													style="color: red; font-size: 20px; font-weight: bold;"></i>
											</button>
										</li>
									<% }%>
									<div>
										<span>조회수</span><span><%= BM_HIT %></span><span>회</span>
									</div>
									</ul>
								</div>
							</div>
							<div class="pd__divider"></div>
						</div>
						<div class="mt-3" id="pd__middle">
							<p><%= BM_CONTENT %></p>
						</div>
						<div class="position-relative">
							<div class="d-flex justify-content-between mt-3" id="pd__bottom">
								<div class="d-flex align-items-baseline">
									<h3>판매가격</h3>
								</div>
								<div class="d-flex align-items-baseline">
									<h2><%= BM_PRICE %></h2>
									<span>원</span>
								</div>
							</div>
							<div class="d-flex justify-content-between align-items-baseline"
								id="pd__bottom">
								<div class="d-flex justify-content-around align-items-baseline">
									<h3>판매자</h3>
									<div class="ml-3">
										<a class="" id="pd__seller" href="/member/selectUser.nds?mem_nickname=<%= SELLER_NICKNAME %>"><%= SELLER_NICKNAME %></a>
									</div>
									<div class="ml-3">
									<% if(seller_me==0){%>
										<a id="pd__seller__chat" onclick="openChat('<%= SELLER_NICKNAME %>')"> 대화하기 <i class="far fa-comments"></i>
										</a>
									<% } %>
									</div>
								</div>
								<div class="d-flex align-items-baseline">
									<h2>찜하기</h2>
									<button type="button" id="<%= BM_NO %>" onclick='likeItem(this)' style="color: red" class='likeBtn'>
									<%
										if(I_LIKE==0 || I_LIKE==1){
									%>
										<i class= 'fas fa-heart'></i> <!-- 꽉 찬 하트 -->
									<%
										} else{
									%>
										<i class="far fa-heart" style="color:grey"></i> <!-- 빈하트 -->
									<%
										}
									%>
									</button>
								</div>
							</div>
						</div>
					</div>
					<!-- End 상품 설명 div -->
				</div>
			</div>
			<!-- ============================= End Detail ========================= -->

			<!-- ============================= Comment Section ========================= -->
			<div class="container p-0">
				<div class="mt-3">
					<div class="row">
						<div class="col-lg-12 col-12">
							<span id="pd__comment__start">댓글</span>
							<div id="pd__comment__divider"></div>
						</div>
					</div>
					<div class="w-100" id="pd__comment__list">
							<% for(int i=0;i<itemComments.size();i++){ %>
						<div class="w-100 mt-3 comments comment_num<%= itemComments.get(i).get("COMMENT_STEP") %>" id="comment__box" style="border-top-left-radius: 10px;">
							<div class="d-flex justify-content-between align-items-end" style="padding-left: 10px; padding-right: 10px;" id="">
								<div>
									<span id="comment__user__origin"><%= itemComments.get(i).get("MEM_NICKNAME") %></span> <span
										id="comment__date"><%= itemComments.get(i).get("COMMENT_DATE") %></span>
								</div>
								<div>
									<ul class="d-flex align-items-end mb-0">
									<% if(Integer.parseInt(itemComments.get(i).get("COMMENT_POS").toString())==0){ %>
										 <li>                                                                                                         
             							    <button class="pd__comment__btn" id="" onclick="pdCommentBtn()">답글</button>                                                       
            							</li> 
									<% } %>
									<% if(Integer.parseInt(itemComments.get(i).get("COMMENT_ME").toString())==1){ %>
										<li>
											<button class="pd__comment__btn" id="" onclick="pdCommentupdateBtn(this)">수정</button>      
										</li>
										<li>
											<button class="pd__comment__btn" id="<%= itemComments.get(i).get("COMMENT_STEP") %>" onclick='deleteComment(this)' >삭제</button>
										</li>
									<% } else {%>
										<li>
											<button class="pd__comment__btn" id="" data-toggle="modal" data-target="#report_user_modal">
												회원신고 <i class="fas fa-exclamation warn"
													style="color: red; font-size: 20px; font-weight: bold;"></i>
											</button>
										</li>
									<% } %>
									</ul>
								</div>
							</div>
							<div id="comment_txt" style="padding-left: 10px; padding-right: 10px;">
							<% if(Integer.parseInt(itemComments.get(i).get("COMMENT_POS").toString())==1){ %>
								<p class="w-100" row="2" readonly>
<%-- 									&nbsp&nbsp&nbsp<i class="fas fa-angle-double-right"></i> <%= itemComments.get(i).get("COMMENT_MSG") %> --%>
									&nbsp&nbsp&nbsp&nbsp&nbsp<i class="fas fa-level-up-alt" style="transform:rotate(90deg);"></i>&nbsp&nbsp<%= itemComments.get(i).get("COMMENT_MSG") %>
								</p>
							<% } else {%>
								<p class="w-100" row="2" readonly>
									<%= itemComments.get(i).get("COMMENT_MSG") %>
								</p>
							<% } %>
							</div>
						</div>
								<% } %>
								<!-- 양식  -->
<!-- 						<div class="w-100 mt-3" id="comment__box"> -->
<!-- 							<div class="d-flex justify-content-between align-items-end" style="padding-left: 10px; padding-right: 10px;" id=""> -->
<!-- 								<div> -->
<!-- 									<span id="comment__user__origin">우아한남매들</span> <span -->
<!-- 										id="comment__date">2021-06-26</span> <span id="comment__time">17:25:55</span> -->
<!-- 								</div> -->
<!-- 								<div> -->
<!-- 									<ul class="d-flex align-items-end mb-0"> -->
<!-- 										<li> -->
<!-- 											<button class="pd__comment__btn" id="">답글</button> -->
<!-- 										</li> -->
<!-- 										<li> -->
<!-- 											<button class="pd__comment__btn" id="">수정</button> -->
<!-- 										</li> -->
<!-- 										<li> -->
<!-- 											<button class="pd__comment__btn" id="">삭제</button> -->
<!-- 										</li> -->
<!-- 										<li> -->
<!-- 											<button class="pd__comment__btn" id=""> -->
<!-- 												유저신고 <i class="fas fa-exclamation warn" -->
<!-- 													style="color: red; font-size: 20px; font-weight: bold;"></i> -->
<!-- 											</button> -->
<!-- 										</li> -->
<!-- 									</ul> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 							<div id="comment_txt" style="padding-left: 10px; padding-right: 10px;"> -->
<!-- 								<p class="w-100" row="2" readonly> -->
								
<!-- 								"여기 댓글 내용 들어간당" -->
<!-- 								</p> -->
<!-- 							</div> -->
<!-- 						</div> -->
								<!-- 양식 -->
					</div>
					<div class="mt-3">
						<form action="">
							<div class="input-group">
								<div class="input-group-prepend">
									<span class="input-group-text">댓글 작성란</span>
								</div>
								<textarea class="form-control" id="nds_comment" aria-label="댓글 작성란"></textarea>
								<div class="input-group-prepend">
									<button type="button" class="btn btn-primary" id="0-<%= BM_NO %>" onclick='insertComment(this)'>댓글등록</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
			<!-- ============================= End Comment ========================= -->
		</section>
	</main>
	<!-- ============================= End main ========================= -->

	<div id="preloader"></div>
	<a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>

  <!-- =============================================== ▼ ＳＣＲＩＰＴ  ▼ ================================================= -->
　　<%@ include file="../itemPage/source_f.jsp" %>
　　<%@ include file="../itemPage/item_page_modal.jsp" %>
　　<%@ include file="../mainPage/reportBoard.jsp" %>
　　<%@ include file="../mainPage/reportMem.jsp" %>
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
	<!-- <script src="../itemPage/assets/js/main_page2.js"></script> -->
  <!-- =============================================== ▲ ＳＣＲＩＰＴ ▲ ================================================= -->
</body>
</html>
