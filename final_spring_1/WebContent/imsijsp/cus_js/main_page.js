$(document).ready(function(){
	$('.btn-primary').on('click',()=>{
		alert("클릭");
		let dt = $('#f_check_nickname').serialize();
		$.ajax({
				url: '/member/selectNickName.nds',
				type: 'post',
				data: dt,
				dataType: "html",
				success: function(data){
					alert("전송완료");
					$('#result_check_nickname').html(data);
				}
		});
	});
	
	// 로그인 버튼 클릭 시
	
	
	
	
});