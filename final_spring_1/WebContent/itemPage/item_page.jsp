<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<Map<String, Object>> itemList = (List<Map<String, Object>>)request.getAttribute("itemList");
	String pr_choice = (String)request.getAttribute("pr_choice");
	for(int i=0; i<itemList.size(); i++){
		double opacity = 1;
		String bm_status = null;
		String descript = "";
		// 거래중, 거래완료이면 opacity를 0.1로
		if(!"N".equals(String.valueOf(itemList.get(i).get("BM_STATUS")))){
			opacity = 0.1;
		}
// 		System.out.println(itemList.get(i));
// 		System.out.println(itemList.get(i).get("BM_CONTENT"));
// 		System.out.println(String.valueOf(itemList.get(i).get("BM_CONTENT")).length());
// 		System.out.println(itemList.get(i));
		bm_status = "C".equals(String.valueOf(itemList.get(i).get("BM_STATUS"))) ? "거래완료" : "S".equals(String.valueOf(itemList.get(i).get("BM_STATUS"))) ? "거래중" : null; 
// 		System.out.println(bm_status);
		// 상품설명이 10자 이상이면 ...으로 후략
		if(String.valueOf(itemList.get(i).get("BM_CONTENT")).length() > 10){
			descript = (String.valueOf(itemList.get(i).get("BM_CONTENT"))).substring(0, 10) + "...";
		}
		
%>
<!-- =================================================================== [[ HTML 영역 시작 ]] ================================================================== -->
	<div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4 mt-md-0" style="margin-bottom: 20px;" data-aos="zoom-in" data-aos-delay="50">
<%
	if("like_rank".equals(pr_choice)){
		if(i<3){
%>
		<a class="position-absolute text-decoration-none ml-1" href="#">
			<span class="position-absolute translate-middle badge rounded-pill bg-light" style="font-size:20px; color:red; z-index:1;">
			<i id="top__rank" class="fas fa-crown" style="font-size:20px; z-index:2;"></i>  인기상품 Top<%=i+1 %></span>
		</a>
<%
		}/////////////////end of inner if
	}/////////////////////end of outer if
	else {
%>
		<a class="position-absolute text-decoration-none ml-1" href="#">
			<span class="position-absolute translate-middle badge rounded-pill bg-light text-dark"><%=itemList.get(i).get("BM_DATE") %></span>
		</a>
<%
	}/////////end of else
%>
		<div class="product__box" onclick="location.href='http://localhost:9696/item/selectItemDetail.nds?pr_bm_no=<%=itemList.get(i).get("BM_NO")%>';" style="border-radius:10px;">
			<div class="card rounded-0 mb-2">
				<div class="pImgBox img-fluid d-flex flex-column justify-content-center align-items-lg-stretch" style="overflow: hidden;">
					<img id="pimg" class="card-img rounded-0 img-fluid" src="../itemUpload/assets/img/itemupload/<%=itemList.get(i).get("BI_FILE")%>"
					style= "width: 100%; opacity: <%=opacity%>; ">
				</div>
<%
				if(bm_status != null){
%>
					<div style="font-size: 3.5rem; width: 100%; position: absolute; top: 50%; text-align: center;"><%=bm_status %></div>
<%
				}/////////////end of if
%>
				<button type="button" id="<%=itemList.get(i).get("BM_NO") %>" class="likeBtn btn-sm text-danger position-absolute"  onclick="likeItem(this)">
<%
// 				if(Integer.parseInt(String.valueOf(itemList.get(i).get("I_LIKE"))) == 0){
%>
<!-- 					<i class="far fa-heart"></i> -->
<%
// 				} else {
%>
<!-- 					<i class= "fas fa-heart"></i> -->
<%
// 				}/////////////end of if
%>
				</button>
			</div>
			<div class="p-3 text-left">
				<h3>
					<a id="pTitle" name="pr_bm_no" href="http://localhost:9696/item/selectItemDetail.nds?pr_bm_no=<%=itemList.get(i).get("BM_NO")%>"><%=itemList.get(i).get("BM_TITLE") %></a>
				</h3>
				<p id="pDescrip"><%=descript %></p>
				<div class="row d-flex justify-content-between align-items-center mt-3">
					<div class="col-lg-auto d-flex align-items-baseline">
						<h2 id="pPrice"><%=itemList.get(i).get("BM_PRICE")%></h2>
						<span>원</span>
					</div>
					<label id="pCategory" for="" class="col-lg-auto">*<%=itemList.get(i).get("CATEGORY_NAME") %></label>
				</div>
			</div>
		</div>
	</div>

<%
	}////////////end of for
%>