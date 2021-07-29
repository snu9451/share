<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

  <!-- =============================================== ▼ 코인 충전 모달  ▼ ================================================= -->
  <div class="modal fade" id="coinCharge" tabindex="-1" role="dialog" aria-labelledby="coinCharge"
    aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" style="width:600px;" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <div class="d-flex flex-column">
            <h3 class="modal-title" id="exampleModalLongTitle" style="font-weight:bold"><i class="fas fa-coins" style="font-size:30px; color:orange;"></i>&nbsp코인충전</h3>
            <label>코인을 사용해서 안전하게 거래하세요 <i class="far fa-smile"></i></label>
          </div>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <div class="form-group">
         	 <label>현재 남은 코인 :&nbsp</label><label style="font-size:30px; color : #ffc37b; font-weight:bold;"><%=coin_remain %></label><label> 원</label> 
             <input type="hidden" value="<%=mem_email %>" id="mem_email"/> 
             <input type="hidden" value="<%=coin_remain %>" id="remainCoin"/> 
            <input type="number" class="form-control" id="inputCost" min="0" placeholder="최소 충전 금액은 1,000원 입니다 : )"/>
          </div>
          <div class="modal-footer">
            <button disabled="true" id="btn_coinCharge" class="btn btn-primary">충전하기</button>
            <button type="button" class="btn btn-danger" data-dismiss="modal">돌아가기</button>
          </div>
        </div>
      </div>
    </div>
  </div>

  
  <!-- =============================================== ▼ 코인 충전 완료 모달  ▼ ================================================= -->
  <div class="modal fade" id="chargeResult" tabindex="-1" role="dialog" aria-labelledby="chargeResult"
    aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" style="width: 600px;" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <div class="d-flex flex-column">
            <h3 class="modal-title" id="exampleModalLongTitle"><i class="fas fa-coins" style="font-size:30px; color:orange;"></i> 코인충전</h3>
          </div>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <div class="form-group">
            <label style="font-weight : bold; font-size: 20px;">코인 충전이 완료되었습니다. <i class="far fa-smile"></i></label>
          </div>
          <div class="modal-footer">
            <button onclick="window.location.reload(true)" class="btn btn-primary">확인</button>
          </div>
        </div>
      </div>
    </div>
  </div>
<!-- =============================================== ▲ 코인 충전 완료 모달 ▲ ================================================= -->
  
  
  <%@ include file="../common/assets/js/coinCharge_js.jsp" %>