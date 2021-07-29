<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String ss = (String)session.getAttribute("login");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test - WebContent</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>

<!-- jQuery Modal -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<script type="text/javascript">
	/* AJAX 기능 테스트용 코드 */
	$(document).ready(function(){
		console.log("완료");
		let rr = <%=(String)request.getParameter("showModal")%>;
		let rr1 = <%=(String)request.getAttribute("showModal")%>;
			console.log(rr);
			console.log(rr1);
			$('#ex').fadeIn(300);
		$('#in').blur(function(){
			console.log('안ㄴ녕ㅇ');
			$.ajax({
// 				url: '${pageContext.request.contextPath}http://localhost:9696/member/issueTempPw.nds?mem_email=snu9451',
				url: '${pageContext.request.contextPath}http://localhost:9696/member/ajaxTest.nds',
				type: 'get',
				success: function(data){
					console.log(data);
					///////////////////////////////////////////////
					// 위에서 적은 url 요청의 결과로 받아오는 data
					// pase 작업이 필요하다. (그냥 꺼내 쓸 수 없음)
// 					let data1 = JSON.parse(data);
// 					console.log(data1.data);
// 					$('.ajax').text(data1.data);
// 					console.log("출력===>"+$('#ex > p').text());
					///////////////////////////////////////////////

					alert(data);
				}
			})
		})

	})
</script>
<style>
.modal {
	color: black;
	position: fixed;
	top: 50%;
}
</style>
</head>
<body>
	<h1 class="ajax">환경 구축 테스트 페이지입니다.</h1>
	<input id="in" type="text" />
	<div id="ex" class="modal" style="width: 300px; height: 100px;">
		<p>회원가입창입니다.</p>
		<a>Close</a>
	</div>
</body>
</html>