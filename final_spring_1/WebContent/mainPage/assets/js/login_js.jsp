<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Pragma","no-cache");
response.setDateHeader("Expires",0);
%>

<%
			String mem_sessionid = null;
			// 쿠키에 저장된 NDS_SKEY 가져오기
			Cookie[] cookies = request.getCookies();
			if(cookies != null){
				for(int i=0; i<cookies.length; i++){
					if("NDS_SKEY".equals(cookies[i].getName())){
						mem_sessionid = cookies[i].getValue();
						break;
					}
				}
			}
		%>
<script type="text/javascript">
function reqLoginView(){
		/* 서블릿을 타서 아이디 저장 회원인지를 조회해야 한다. */
		let mem_sessionid = '<%=mem_sessionid%>';
		$.ajax({
			url: 'http://localhost:9696/member/reqLoginView.nds?mem_sessionid='+mem_sessionid,
			type: 'get',
			dataType: 'json',
			success: function(data){
				// data[0]: mem_email, data[1]: auth_range
				$('input[name=mem_email]').val(data[0]);
				// 아이디 저장 또는 자동 로그인 선택 회원인 경우
				if(data[0].length > 0){
					// 아이디 저장 회원인 경우
					if(data[1] == "S"){
						$('input[name=isSavedIdChecked]').prop('checked', true);						
					}
					// 자동로그인 선택 회원인 경우
					if(data[1] == "A"){
						$('input[name=isSavedIdChecked]').prop('checked', true);						
						$('input[name=isAutoLoginChecked]').prop('checked', true);						
					}
				}
			}		
		});
// 	});
}
$(document).ready(function(){
	
	<%
		String reqLoginView = (String)session.getAttribute("reqLoginView");
		if(reqLoginView != null){
	%>
			/* 로그인해야만 이용할 수 있는 페이지 접속 시 메인페이지로 이동하면서 로그인창 띄워줌 */
			$('#h_login').trigger('click');
<%-- 			alert('<%=reqLoginView%>'); --%>
	<%
			session.removeAttribute("reqLoginView");
		}
		reqLoginView = (String)session.getAttribute("reqLoginView");
	%>
		console.log('세션지워졌는지 체크: '+'<%=reqLoginView%>');
	
	/* 메인 화면에서 '로그인' 버튼이 클릭되었음 */
// 	$('#h_login').on('click', function(){
	// 괄호를 쓰면 호출함
// 	$('#h_login').on('click', reqLoginView);
	$('#h_login').on('click', reqLoginView);

	
	
	/* 로그인 모달에서 로그인 버튼이 클릭되었을 때 */
	$('#nds_login_button').on('click', doLogin);
			
			

	
	/* 비밀번호 잊으셨나요 글씨 클릭 시 */
	$('#issueTempPw').on('click',function(){
		$('#login_close').trigger('click');
// 		$('#logIn').modal('hide');
		swal("가입하신 이메일을 입력해주세요.", {
			  content: "input",
			  closeOnClickOutside: false
			})
			.then((value) => {
				/* 입력한 이메일의 존재여부를 확인하고 임시비번 발급 */
				let dt = "mem_email="+value.trim();
				$.ajax({
					url: 'http://localhost:9696/member/issueTempPw.nds',
					data: dt,
					type: 'post',
					dataType: 'html',
					success: function(data){
						if("fail" == data){
							swal("가입되어 있지 않은 이메일입니다.");
						} else if("success" == data){
							swal("임시 비밀번호가 발급되었습니다.", "보안을 위해 로그인 후 비밀번호를 변경해주세요.", "success", {
							  	button: "확인",
							});
						}
						$('#logIn').modal('show');
					}
				});
			});
	});
});
function doLogin(){
	let mem_email = $('input[name=mem_email]').val().trim();
	let mem_pw = $('input[name=mem_pw]').val().trim();
	let isSavedIdChecked = $('input[name=isSavedIdChecked]').is(':checked'); // 반환값: true/false
	let isAutoLoginChecked = $('input[name=isAutoLoginChecked]').is(':checked'); // 반환값: true/false
//		alert(mem_email+', '+mem_pw+', '+isSavedIdChecked+', '+isAutoLoginChecked);
	let dt = "mem_email="+mem_email+"&mem_pw="+mem_pw+"&isSavedIdChecked="+isSavedIdChecked+"&isAutoLoginChecked="+isAutoLoginChecked;
	$.ajax({
		url: 'http://localhost:9696/member/doLogin.nds',
		data: dt,
		type: 'post',
		dataType: 'json',
		success: function(data){
			/* 로그인에 실패한 경우 */
			/* ===================== 테스트 =======================*/
<%-- 				<% --%>
//				Map<String, Object> map = (Map<String, Object>)session.getAttribute("login");
//				String mem_nickname = "알수없음";
//				if(map != null){
//					mem_nickname = (String)map.get("MEM_NICKNAME");	
//				}
<%-- 				%> --%>
<%-- 				console.log("갱신전 세션에 저장된 정보 ==> "+'<%=mem_nickname%>') --%>
			/* ===================== 테스트 =======================*/
			console.log(data[0]);	// 성공여부
			console.log(data[1]);	// 닉네임
			if(data[0] == 0 || data[1] == null){
				swal("아이디 또는 비밀번호가 잘못되었습니다.").then(function(value){
//						location.reload();						
				});
				/* ============== [[ 공통코드: 폼 비워주기 ]] ============== */
				$('#f_login input').each(function(index){
					$('#f_login input').eq(index).val('');
				});
				/* 체크박스 체크 해제하기 */
				$('input[name=isSavedIdChecked]').prop('checked', false);
				$('input[name=isAutoLoginChecked]').prop('checked', false);
				
			}
			else {
				swal("환영합니다. "+data[1]+"님!")
					.then(function(value){
						/* 확인버튼 클릭 시 메인 페이지로 새로이 이동 */
						location.href = "http://localhost:9696/mainPage/main_page.nds"
					});
//					/* ============== [[ 공통코드: 폼 비워주기 ]] ============== */
//					$('#f_login input').each(function(index){
//						$('#f_login input').eq(index).val('');
//					});
//					/* 체크박스 체크 해제하기 */
//					$('input[name=isSavedIdChecked]').prop('checked', false);
//					$('input[name=isAutoLoginChecked]').prop('checked', false);
				
			}
		},
		error: function(xhrObject){
			alert(xhrObject.resposeText);
		}
		
	});
};
</script>