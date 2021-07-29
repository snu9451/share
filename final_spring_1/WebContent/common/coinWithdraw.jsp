<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <!-- =============================================== ▼ 코인 출금 모달  ▼ ================================================= -->
  <div class="modal fade" id="coinWithdraw" tabindex="-1" role="dialog" aria-labelledby="coinCharge"
    aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" style="width:600px;" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <div class="d-flex flex-column">
            <h3 class="modal-title" id="exampleModalLongTitle" style="font-weight:bold">
            <i class="fas fa-hand-holding-usd" style="font-size: 30px; color: #34a848"></i>
            	코인출금
            </h3>
            <label>
	            <i class="fas fa-dollar-sign" style="color: #167326"></i>
	            	보유하신 코인을 내 계좌로 
	            <i class="fas fa-dollar-sign" style="color: #167326"></i>
            </label>
          </div>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
        	<!-- 현재 남은 코인 -->
          <div class="form-group ">
         	 <label>현재 남은 코인 : </label>
         	 <label id="currentCoin" style="font-size:30px; color : #ffc37b; font-weight:bold;">
         	 	<%=coin_remain %>
         	 </label>
         	 <label> 원</label> 
             <input type="hidden" value="<%=mem_email %>" id="mem_email"/> 
             <input type="hidden" value="<%=coin_remain %>" id="remainCoin"/>
             <!-- 츨금할 금액 입력 --> 
            <div class="form-group">
            	<input type="number" class="form-control doEmpty" id="input_withdrawCost" min="0" placeholder="출금하실 금액을 입력해주세요." disabled/>
            	<small class="p-3">
            		7% 수수료를 제외한 실제 출금 금액은: <label id="showCost" class="doEmpty" style="color: #ffc37b"></label> 
            	</small>
            </div>
            <!-- 계좌번호 입력 -->
            <div class="form-group withdrawData">
	            <input type="text" class="form-control doEmpty" id="input_account" placeholder="계좌번호 16자리를 입력해주세요."/>
	            <div id="account_digits_box">
	            	<small id="account_digits" class="p-3 doEmpty"></small>
	            </div>
            </div>
            
            <!-- 인증번호 입력 -->
<!--             <div class="form-inline justify-content-around">
            	<input type="text" class="form-control w-75 " id="input_SecurityCode" placeholder="인증번호를 입력해주세요."/>
            	<button type="button" class="btn btn-primary ml-2">확인</button>
            	<div>
            		<small id="safetyCodeChck"></small>
            	</div>
            	<small><a id="withdraw_safetyCode" href="#">[인증번호 발송]</a>을 클릭하시면 이메일로 인증번호를 보내드려요 : )</small>
            </div> -->
             <div class="form-row align-items-center">
              <div class="form-group col-md-12">
                <label for="withdraw_inputCellPhone">핸드폰 번호</label>
                <div class="form-row align-items-center justify-content-between">
                  <div class="form-group col-md-8 mb-0">
                    <input type="text" class="form-control doEmpty" id="withdraw_inputCellPhone" placeholder="(-) 없이 번호를 입력해주세요." required minlength="11">
                  </div>
                  <div class="form-group col-md-4 mb-0 text-right">
                    <button type="button" id="btn_withdraw_getCode" class="btn btn-primary">인증번호 받기</button>
                  </div>
                </div>
                <div class="invalid-feedback">핸드폰번호 11자리를 입력해주세요.</div>
              </div>
            </div>
            <div class="form-row align-items-center justify-content-between">
              <div class="form-group col-md-12">
                <label for="withdraw_inputSafetyCode">인증번호 입력</label>
                <div class="form-row align-items-center justify-content-between">
                  	<div class="form-group col-md-9 mb-0">
                    	<input type="text" class="form-control doEmpty" id="withdraw_inputSafetyCode" placeholder="인증번호를 입력해주세요." required minlength="6">
                    </div>
                    <div class="form-group col-md-3 mb-0 text-right">
                      <button type="button" id="btn_withdraw_codeChck" class="btn btn-primary">확인</button>
                    </div>
                </div>
              </div>
            </div>
          </div>
          <div class="modal-footer">
            <button disabled id="btn_coinWithdraw" class="btn btn-primary">출금하기</button>
            <button type="button" class="btn btn-danger" data-dismiss="modal">돌아가기</button>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- =============================================== ▲ 코인 출금 모달 ▲ ================================================= -->
  <%@ include file="../common/assets/js/coinWithdraw_js.jsp" %>