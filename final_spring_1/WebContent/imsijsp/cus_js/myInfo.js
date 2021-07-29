$(document).ready(function(){
	$('#check_nickname').on('click',()=>{
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
});