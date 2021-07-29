<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript">
$(document).ready(function(){

	$(function () {
	    var charge = false;
	    $("#inputCost").on("keyup", function () {
	    	charge = $("#inputCost").val().length > 3 ? true : false;
	    	console.log(charge);
	      $("#btn_coinCharge").attr("disabled", !charge);
	    });
	});
})




   IMP.init('iamport');
   $('#btn_coinCharge').on('click', () => {
 	   var amount = $('#inputCost').val();
	   var remainCoin = $("#remainCoin").val();
	   var email = $("#mem_email").val();
	   
	   remainCoin = (amount*1)+(remainCoin*1)
	   IMP.request_pay({
	   	pg: 'kakaopay',
	       pay_method: 'card',
	       merchant_uid: 'merchant_' + new Date().getTime(),
	       name: '내 동생 : 코인충전',  // 사용자측에서 보여지는 결제명이다.
	       amount: amount,
	       buyer_email: email,
	       /* buyer_name: '구매자이름',
	       buyer_tel: '010-8082-8353',
	       buyer_addr: '서울특별시 강남구 삼성동',
	       buyer_postcode: '123-456' */
	                // http://127.0.0.1:5500/landing.html
	    }, function (rsp) {
	        if (rsp.success) {
		        var msg = '결제가 완료되었습니다.';
		        msg += '결제 금액 : ' + rsp.paid_amount;
		    	$('#chargeResult').modal('show');
	        	$('#coinCharge').modal('hide');
		        $.ajax({
		        	 type: "POST",
		             url : "http://localhost:9696/member/chargeCoin.nds",
		             data: {coin_remain: remainCoin, trans_price: amount},
		             success : function(data) {
		            	 console.log("충전 성공");
						$('#remainCoin').val(data);
		             },
		             error : function(e) {
		            	 console.log("error="+e.toString());
		             }
		             
		          });
		        /* msg += '고유ID : ' + rsp.imp_uid; */
		        /* msg += '상점 거래ID : ' + rsp.merchant_uid; */
		        /* msg += '카드 승인번호 : ' + rsp.apply_num; */
	        } else {
	          var msg = '결제에 실패하였습니다.';
	          msg += '에러내용 : ' + rsp.error_msg;
	        }
	        console.log("msg ===> "+msg);
	    });
   });
</script>