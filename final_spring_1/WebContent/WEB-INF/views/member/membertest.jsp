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
<%-- 		let rr = '<%=(String)request.getParameter("showModal")%>'; --%>
// 			console.log(rr);
		let rr1 = '<%=(String)request.getAttribute("showModal")%>';
			console.log(rr1);
		// 회원가입 링크로 접속 시 모달창을 띄워줌 (js로 처리)
		if(rr1 != null){
			$('#ex').fadeIn(1000);
		}
// 		$('#in').blur(function(){
		$('#bt').on('click',function(){
			console.log('안ㄴ녕ㅇ');
			$.ajax({
// 				url: '${pageContext.request.contextPath}http://localhost:9696/member/issueTempPw.nds?mem_email=snu9451',				
// 				url: "${pageContext.request.contextPath}http://localhost:9696/member/reqLoginView.nds",				
// 				url: 'http://localhost:9696/member/ajaxHtml.nds',
				url: 'http://localhost:9696/member/leave.nds',
				type: 'get',
				dataType: "html",
				success: function(data){
					// 위에서 적은 url 요청의 결과로 받아오는 data
					// pase 작업이 필요하다. (그냥 꺼내 쓸 수 없음)
// 					let data1 = JSON.parse(data);
// 					console.log(data1.data);
// 					$('.ajax').text(data1.data);
// 					console.log("출력===>"+$('#ex > p').text());
					// ===================[[ ▼ contentType이 json인 data 받아서 처리하기 ]]
// 					let imsi = JSON.parse(data);
// 					console.log(imsi[0].name);
					alert(data);
					$('#myButton').html(data);
					// ===================[[ ▲ contentType이 json인 data 받아서 처리하기 ]]
// 					alert(data);
				}
			})
		})

	})
</script>
	<script type="text/javascript">
		function send(){
			alert("전송버튼");
			let arr = "";
			$('#p_div p').each(function(index){
				arr = arr + $('#p_div p').eq(index).text() + "*";
			});
			alert(arr);
			$('#myform > input').val(arr);
			alert($('#myform > input').val());
			$('#myform').submit();
			alert("Afs");	// submit으로 제출한 form은 서블릿에서(자바/Back) getAttribute가 아닌 getParameter로 받아와야 한다!!!
// 			let arr1 = JSON.stringify(arr);
// 			let mydt = JSON.parse(arr1);
// 			document.write(mydt);
		}
	</script>
<style>
.modal {
	color: black;
	position: fixed;
	top: 50%;
}
</style>
</head>
<body style="background-color:orange;">
	<div id="p_div">
		<p>안녕하세요</p>
		<p>반갑습니다</p>
		<p>감사합니다</p>
	</div>	

	<form id="myform" action="http://localhost:9696/member/ajaxHtml.nds?mylist112=afafvs">
		<input type="text" name="mylist112" value="임시">
	</form>
	<button id="sendButton" onclick="javascript:send()">전송</button>
	<h1 class="ajax">환경 구축 테스트 페이지입니다.</h1>
	<input id="in" type="text" />
	<div id="ex" class="modal" style="width: 300px; height: 100px;">
		<p>회원가입창입니다.</p>
		<a>Close</a>
	</div>
	<div id="myButton" style="width: 500px; height: fit-content;"><button id="bt">버튼 누르면 메일전송</button></div>
</body>
</html>