$(document).ready(function(){
	/* 로그인 모달에서 로그인 버튼이 클릭되었을 때 */
	$('#nds_login_button').on('click',function(){
		let mem_email = $('input[name=mem_email]').val().trim();
		let mem_pw = $('input[name=mem_pw]').val().trim();
		let isSavedIdChecked = $('input[name=isSavedIdChecked]').is(':checked'); // 반환값: true/false
		let isAutoLoginChecked = $('input[name=isAutoLoginChecked]').is(':checked'); // 반환값: true/false
		alert(mem_email+', '+mem_pw+', '+isSavedIdChecked+', '+isAutoLoginChecked);
		let dt = "mem_email="+mem_email+"&mem_pw="+mem_pw+"&isSavedIdChecked="+isSavedIdChecked+"&isAutoLoginChecked="+isAutoLoginChecked;
		$.ajax({
			url: 'http://localhost:9696/member/doLogin.nds',
			data: dt,
			type: 'post',
			dataType: 'html',
			success: function(data){
				alert(data);
			},
			error: function(xhrObject){  
				alert(xhrObject.resposeText);
			}
			
		});
	});
});