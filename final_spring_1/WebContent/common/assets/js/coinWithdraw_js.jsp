<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">

//출금 모달창이 나타났을때 실행되는 함수
$("#coinWithdraw").on('shown.bs.modal', function() {
	console.log('shown modal');
	//input 값 리셋
	$(".doEmpty").each(function(){
		console.log($(this));
		$(this).val("");
		$(this).text("");
	});
	//계좌 유효성 검사 결과 부분
	$("#account_digits_box").empty();
	
	//유효성 검사를 위한 변수 선언
	let inputCoin = false;
	let inputAccount = false;
	let inputSecurityCode = false;
	
	//현재 소지 코인 String -> Num 형변환
	let currentCoin = Number($("#currentCoin").text());
	
	//[출금하기] 버튼 
	let btn_coinWithdraw = $("#btn_coinWithdraw");
	
	//출금 가능 금액 나타내주는 <label>
	let getCost = $("#showCost");
	
	//계좌번호
	let input_account;
	
	//출금하기 버튼 비활성화
	btn_coinWithdraw.attr("disabled", true);
	
		//현재 소지 코인이 0보다 클 때
		if (currentCoin > 0){
			//출금 금액 input 부분 활성화
			$("#input_withdrawCost").attr("disabled", false);
			
			$("#input_withdrawCost").on('keyup change', function(){
				//출금 금액 입력값
		 		let input_withdrawCost = $("#input_withdrawCost").val();
				
				//수수료 7%를 제외한 출금 가능 금액 나타내주기
				let result = Math.floor(input_withdrawCost * 0.93);
				getCost.text("");
				getCost.text(result);
				
				//현재 소지 코인보다 높은 출금금액 입력시 alert창 띄우기
				if(input_withdrawCost > currentCoin){
					swal("현재 소지하신 코인 이상으로 입력하실 수 없습니다.", "다시 입력해주세요", "warning")
					.then(()=> {
						//출금 금액 입력 <input> 초기화
						$("#input_withdrawCost").val("");
						getCost.text("");
					})
				}
				else {
					//출금하기 <input>에 값이 있을 때
					if(input_withdrawCost.length > 0){
						console.log('exist');
						inputCoin = true;
					} else {
						consoel.log('none');
						inputCoin = false;
					}
				}
			});/////////////////////// end of keyup function
						
		}
		//현재 소지 코인이 0보다 작을때
		else if(currentCoin < 0){
			console.log('=== 0');
			$("#input_withdrawCost").attr("disabled", true);
			btn_coinWithdraw.attr("disabled", true);
		}
		
		/********* 계좌번호가 입력됐을 때 ***********/
		$("#input_account").on('keyup change', function(){
		//계좌번호
		input_account = $("#input_account").val();
			//계좌번호 입력칸
			console.log(input_account.length);
			if(input_account.length === 16){
				$("#account_digits_box").empty();
				$("#account_digits_box").html(
				"<small id='account_digits' class='p-3 doEmpty' style='color: green; font-weight: bold;'>16자리 확인되었습니다.</small>"		
				);
				inputAccount = true;
			} else {
				inputAccount = false;
			}
		});////////////////////// end of #input_account function
		
	    //인증번호 값을 담을 변수 선언
	    let safetyCode;
	    //[[인증번호받기]] 클릭시 이벤트.
	    $("#btn_withdraw_getCode").click(function () {
	      //핸드폰번호 입력값
	      let inputCellPhone = $("#withdraw_inputCellPhone").val();
	      //핸드폰 번호가 입력되지 않은 경우
	      if (inputCellPhone.length < 0 || inputCellPhone.length == 0) {
	        swal("핸드폰 번호를 입력해주세요!", "", "info");
	        return;
	      }
	      //핸드폰 번호가 입력된경우
	      else {
	        let phoneNum = "mem_phone=" + inputCellPhone;
	        console.log(inputCellPhone);
	        //핸드폰 번호를 Controller로 보냄
	        $.ajax({
	          type: "post",
	          data: phoneNum,
	          url: "http://localhost:9696/member/sendSMSCode.nds",
	          success: function (data) {
	        	console.log(data);
	        	//Controller에서 넘어온 반환값(인증번호)
	            safetyCode = data;
	          },
	        });
	      }
	    });		
		
	    //유효성 검사 function
	    function validChck(){
			//모든 <input> 태그에 값이 있을 때, [출금하기] 버튼 활성화
			if(inputCoin && inputAccount && inputSecurityCode) {
				console.log('disabled');
				console.log(inputCoin+","+inputAccount+","+inputSecurityCode);
				btn_coinWithdraw.attr("disabled", false);
			}
			else {
				console.log('abled');
				console.log(inputCoin+","+inputAccount+","+inputSecurityCode);
				btn_coinWithdraw.attr("disabled", true);
			}
	    }
	    
		//인증번호 확인
		$("#btn_withdraw_codeChck").on('click', function(){
		      let safetyCodeChck__box = $("#safetyCodeChck__box");
		      let withdraw_inputSafetyCode = $("#withdraw_inputSafetyCode").val();
		      if (withdraw_inputSafetyCode.length > 0) {
		        if (withdraw_inputSafetyCode === safetyCode) {
		        	//sweetAlert API사용
		        	swal("인증번호 일치", "", "success").then(()=>{
		        		inputSecurityCode = true;
		        		$("#btn_withdraw_codeChck").attr("disabled", "true");
		        		validChck();
		        	});
		        } else {
		        	swal("인증번호 불일치", "", "warning").then(()=>{
			        	inputSecurityCode = false;
		        	});
		        }
		      } else {
		        swal("인증번호를 입력해주세요!!", "", "warning");
		        inputSecurityCode = false;
		      }
		    });
		
		//출금모달에 변화가 있을때 마다 동작하는 함수
 		$("#coinWithdraw").on("change", validChck);
 		
 		//[출금하기] 눌렀을 때 이벤트
 		btn_coinWithdraw.click(function(){
 			let cost = getCost.text();
 			let account = input_account;
 			let input_code = Number($("#withdraw_inputSafetyCode").val());
			let data = "getCost="+cost+"&account="+input_account+"&input_code="+input_code;
			swal("출금하시겠습니까??","", "info",{
				  buttons: {
					  	//확인버튼
					    confirm: {
							text: "확인",
							value:"confirm",
					    },
					    //취소버튼
					    cancel: "취소",
					  },
					}).then((value) => {
						switch(value) {
						
						case "confirm":
							console.log('confirm');
 							$.ajax({
								type:"post",
								data: data,
								url:"/member/withdrawCoin.nds",
								success: function(){
									location.reload();
								}
							});
							break;
						default:
							console.log('cancel');
						$("#coinWithdraw").modal('hide');
							break;
						}
					});
 		});
		
});/////////////////////////////////// end of shown modal function

 	    //회원가입 모달창이 사라졌을 때 이벤트
	    $("#coinWithdraw").on("hidden.bs.modal", function () {
	      console.log("modal hidden");
	      //$("#btn_withdraw_codeChck").attr("disabled", "false");
	      location.reload();
	    });
</script>	