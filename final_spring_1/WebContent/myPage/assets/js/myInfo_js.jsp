<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
// $(document).ready(function () {
// 	if($("#ratingScore").val()==0){
// 		$(".outer-star").hide();
// 		$(".noScore").show();
// 	}else{
// 		$(".noScore").hide();
// 	}
// });

function ajaxPW(){
//	let ch_pw = $(".new_pw").val();
//	let pw = $("#mem_pw").val();
	let mydata =  $('#f_myinfo').serialize();
	$.ajax({
		url : "http://localhost:9696/member/updatePw.nds",
// 		url : "/ndshttp://localhost:9696/member/updatePw.nds?mem_email=banana@good.com&mem_pw="+pw+"&change_pw="+ch_pw,
		type : "post",
		data: mydata,
// 		data: { mem_email: banana@good.com, mem_pw: pw , change_pw: ch_pw}
		success : function(data) {//@data-json,xml,html,text
			//alert(data);
			$('#pwChangeLast').modal('show');
			$('#pw_result').html(data);
		},
		error : function(e) {//@param-XMLHttpRequest

		}
	});
}
function pwChange(){
	
	if($(".new_pw_confirm").val().length < 1 || $(".new_pw").val().length < 1){
	    $("#newPwChange").modal("show");
	}else if($(".new_pw_confirm").val().length < 8 || $(".new_pw_confirm").val().length > 20){
	    $("#newPwChange").modal("show");
	}else if($(".new_pw_confirm").val().length < 1 || $(".new_pw").val().length < 1){
	    $("#newPwChange").modal("show");
    }else if($(".new_pw").val() != $(".new_pw_confirm").val()){
	    $("#newPwChange").modal("show");
	}else if ($(".new_pw").val() == $(".new_pw_confirm").val()) {
	    $("#pwChange").modal("show");
    }
};

function nickSelect(){
	let mynick = $('#f_checknickname').serialize();
	$.ajax({
		url: "http://localhost:9696/member/selectNickName.nds",
		type : "post",
		data: mynick,
		success : function(data) {//@data-json,xml,html,text
		      /* flag = $("#mem_pw").val().length > 0 ? true : false;
		      $("#btn_nicksubmit").attr("disabled", flag); */
		    if($("#newNick").val().length < 2 || $("#newNick").val().length > 15){
				$('#nick_result').html("<h4 style=\"font-size : 15px; color : red; font-weight:bold\">닉네임은 2~15글자이어야 합니다.</h4>");
				$("#btn_nicksubmit").attr("disabled", true);
		    }else{
				if(data.indexOf("가능한") > -1){
		    	console.log($("#newNick").val().length);
					$('#nick_result').html(data);
			    	$("#btn_nicksubmit").attr("disabled", false);
				}else{
					$('#nick_result').html(data);
					$("#btn_nicksubmit").attr("disabled", true);
				}
		    }
		},
		error : function(e) {//@param-XMLHttpRequest
		}
	});
};
function nickChange(){
	let mynick = $('#f_checknickname').serialize();
	$.ajax({
		url: "http://localhost:9696/member/updateNickName.nds",
		type : "post",
		data: mynick,
		success : function(data) {//@data-json,xml,html,text
			if(data == 1){
				// 성공한 경우
				$("#nickChangeSuccs").modal('show');

			} else {
				$("#nickChangeFail").modal('show');
			}
		},
		error : function(e) {//@param-XMLHttpRequest
		}
	});
};
function leave(){
	let myleave =  $('#f_leave').serialize();
	$.ajax({
		url : "http://localhost:9696/member/leave.nds",
		type : "post",
		data: myleave,
		success : function(data) {
			//alert(data);
			$('#leaveLast').modal('show');
			$('#leave_result').html(data);
		},
		error : function(e) {//@param-XMLHttpRequest

		}
	});
};
function addAction(){
	$('#imgChangeSuccs').modal('show');
	$('#btn_imgSucces').click(function(){
		$('#f_profile_picture').submit();
	});
}
</script>