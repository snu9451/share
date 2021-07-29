<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Pragma","no-cache");
response.setDateHeader("Expires",0);
%>
<%
		List<Map<String, Object>> walletRec = null;
		walletRec = (List<Map<String, Object>>) request.getAttribute("walletRec");
		String trans_date 		= null;
		String trans_content 	= null;
		String trans_price 		= null;
		String trans_remain 	= null;
		String trans_io			= null;
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<title>내동생 - 마이페이지 :: 내지갑보기</title>
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
			<div class="myinfo_top">
				<span class="cur_coin">
					<h4 class="coin">보유 코인 :</h4>
					<h4 class="coin1" id="remainCoin"><%=coin_remain %></h4>
					<h4 class="coin won">원</h4>
					<button type="button" data-toggle="modal" data-target="#coinCharge" class="h_coin btn btn-outline-warning">충전</button>
					<button type="button" data-toggle="modal" data-target="#coinWithdraw" class="btn btn-outline-warning">출금</button>
				</span>
			</div>
			<div class="myinfo_bottom">
				<table class="wallet_tb" id="products">
					<form action="" id="setRows">
						<input type="hidden" name="rowPerPage" value="8" id="rowPerPage">
					</form>
					<thead>
						<tr>
							<th scope="cols" width="30%">날짜</th>
							<th scope="cols" width="28%">거래내용</th>
							<th scope="cols" width="15%">거래금액</th>
							<th scope="cols" width="15%">거래 후 잔액</th>
							<th scope="cols" width="12%">입/출금</th>
						</tr>
					</thead>
					<tbody>
<%
	if(walletRec == null){
%>	
			<tr>
				<th colspan="5" style="text-align: center !important;">조회결과가 없습니다.</th>
			<tr>
<!-- 			<tr> -->
<!-- 				<td></td> -->
<!-- 				<td></td> -->
<!-- 				<td></td> -->
<!-- 				<td></td> -->
<!-- 				<td></td> -->
<!-- 			</tr>               -->
<%
	}else{
		for(int i=0; i<walletRec.size(); i++){
			trans_date 	  = walletRec.get(i).get("TRANS_DATE").toString();
			trans_content = walletRec.get(i).get("TRANS_CONTENT").toString();
			trans_price   = walletRec.get(i).get("TRANS_PRICE").toString();
			trans_remain  = walletRec.get(i).get("TRANS_REMAIN").toString();
			trans_io	  = walletRec.get(i).get("TRANS_IO").toString();
%>			
						<tr>
							<td><%=trans_date %></td>
							<td><%=trans_content %></td>
							<td><%=trans_price %>원</td>
							<td><%=trans_remain %>원</td>
							<td
<% if("입금".equals(trans_io)){ %> style="color: blue; font-weight: bold;"
<% } else if("출금".equals(trans_io)){ %> style="color: red; font-weight: bold;"
<% } %>
							><%=trans_io %></td>
						</tr>
<%
		}
	}
%>
					</tbody>
				</table>
			</div>
		</div>
	</div>






  <!-- /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\ ▼ ＭＯＤＡＬ　ＰＡＲＴ ▼ /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\ -->
<%-- <!-- CoinCharge 모달 --><%@ include file="../common/coinCharge.jsp" %> --%>
  <!-- \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/ ▼ ＭＯＤＡＬ　ＰＡＲＴ ▼ \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/ -->

  <!-- =============================================== ▼ ＳＣＲＩＰＴ  ▼ ================================================= -->
<%@ include file="../myPage/source_f.jsp" %>
  <!-- =============================================== ▲ ＳＣＲＩＰＴ ▲ ================================================= -->
</body>
</html>