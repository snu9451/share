<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
$(document).ready(function(){
    $("#errandItem, #errandItemPr, #errandCost").on("propertychange change keyup paste input", function () {
        flag1 = $("#errandItem").val().length > 0 ? true : false;
  		console.log(flag1);
        flag2 = $("#errandItemPr").val().length > 0 ? true : false;
  		console.log(flag2);
        flag3 = $("#errandCost").val().length > 3 ? true : false;
  		console.log(flag2);
	    $("#errandBtn").attr("disabled", !(flag1 && flag2 && flag3));
    });
});
</script>
  <!-- =============================================== ▼ 심부름 모달 ▼ ================================================= -->
  <div class="modal modal-center fade" id="errand_modal" tabindex="-1" role="dialog" aria-labelledby="errand_modal"
    aria-hidden="true">
    <div class="modal-dialog modal-center" role="document">
      <div class="modal-content" style="width: 700px;">
        <div class="modal-header">
          <div class="d-flex flex-column">
            <h3 class="modal-title" id="exampleModalLongTitle">심부름 등록</h3>
            <label>어떤 심부름을 등록하실 건가요?? 상세 정보를 입력해주세요 : )</label>
          </div>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
            <div class="form-group">
              <h5 for="errandItem" style="font-weight: bold;">심부름 아이템</h5>
              <input type="text" class="form-control" id="errandItem" placeholder="어떤 심부름을 원하시나요??">
            </div>
            <div class="form-inline justify-content-end align-items-center mb-2">
              <h4 class="col-auto text-center mb-0" style="font-weight: bold;">금액 제안:</h4>
              <input type="text" class="form-control col-8" id="errandItemPr" placeholder="예상 금액을 입력해주세요."><span
                class="col-auto">원</span>
            </div>
            <div class="form-inline justify-content-end align-items-center mb-2">
              <h4 class="col-auto text-center mb-0" style="font-weight: bold;">심부름금액:</h4>
              <input type="text" class="form-control col-8" id="errandCost"
                placeholder="심부름 금액은 최소 1,000원부터 입니다 : )"><span class="col-auto">원</span>
            </div>
            <hr>
            <div class="form-group">
              <label for="">심부름 상세 내용 입력</label>
              <textarea type="text" class="form-control" id="errandDetail" placeholder="상세 내용을 입력해주세요."></textarea>
            </div>
            <div class="form-inline justify-content-between align-items-center mb-2">
              <label class="col-auto text-center">
                <i class="fas fa-map-marker-alt mr-1" style="color: rgb(0, 89, 255); font-size: 20px;"></i>
                현재 나의 위치:
              </label>
              <input type="text" class="col-6 form-control" id="errandAddr" placeholder="주소를 입력해주세요.">
              <button type="button" id="searchAddr" class="col-3 btn btn-primary">주소검색</button>
            </div>
            <div class="form-row justify-content-center mb-1">
              <span class="mr-1"><i class="fas fa-exclamation warn"
                  style="color: red; font-size: 20px; font-weight: bold;"></i></span>
              <small class="text-center">
                <span>심부름 요청은 등록 후 <span class="warn" style="color: red; font-weight: bold;">30분간 유지되며</span>
                  30분동안 심부름이 매칭되지 않았을 때,<br>
                  <span class="warn" style="color: red; font-weight: bold;">자동으로 등록이 취소됩니다.</span>
                </span>
              </small>
            </div>
            <div class="form-inline justify-content-end align-items-center mb-2">
              <h2 class="col-auto text-center mb-0" style="font-weight: bold;">총금액:</h2>
              <div class="col-9 d-flex justify-content-end align-items-baseline">
                <h3 id="totalCost" class="col-auto">total price</h3><span class="col-auto">원</span>
              </div>
            </div>
            <div class="modal-footer">
              <button type="submit" disabled="true" id="errandBtn" class="btn btn-primary" data-dismiss="modal">심부름 등록하기</button>
              <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
            </div>
        </div>
      </div>
    </div>
  </div>
<!-- /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/작성자:신우형\/\/\/\/\/\/\/\/\/\/\/\/\/\/\ -->
			<!-- 기존에 있던 미완성 모달창 대신 새로운 모달창으로 갈아끼움 -->
  <!-- 심부름 확인 모달 시작 -->
  <div class="modal modal-center fade" id="errand_check_modal" tabindex="-1" role="dialog" aria-labelledby="errand_check_modal"
    aria-hidden="true">
    <div class="modal-dialog modal-center" role="document">
      <div class="modal-content" style="width: 700px;">
        <div class="modal-header">
          <div class="d-flex flex-column">
            <h3 class="modal-title" id="exampleModalLongTitle">심부름 확인</h3>
          </div>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body pb-0">
            <div class="row justify-content-between align-items-center">
              <div class="col-lg-3 w-100 h-100 d-flex flex-column align-items-center" id="profileBox">
                <div class="profileImg" id="profileImg">
                  <img class="w-100" src="./assets/img/muji.png" alt="profileImg" width=150px height=150px style="border-radius: 25%">
                </div>
                <div>
                  <h5 class="mt-3" id="profileName">
                    무지라이언
                  </h5>
                </div>
              </div>
              <div class="col-lg-9 d-flex flex-column" id="errandInfoBox">
                <div class="w-100 text-center" id="errandInfo_item">
                  <h1>"심부름 아이템"</h1>
                </div>
                <div class="w-100 row">
                  <div class="d-flex align-items-end">
                    <span class="text-center">
                      <i class="fas fa-map-marker-alt" style="color: rgb(0, 89, 255); font-size: 20px;"></i>
                      요청자님의 위치:
                    </span>
                    <span class="ml-4" id="errandInfo_addr">서울시 금천구 가산동 </span>
                  </div>
                </div>
                <div class="mt-2 d-flex flex-column align-items-center">
                  <div class="d-inline-flex">
                    <h4 id="errandInfo_user" style="font-weight: bold;">무지라이언<h4><span class="ml-1">님의 요구사항입니다.</span>
                  </div>
                  <textarea class="" id="errandInfo_mainContent" readonly>
                    "심부름 상세사항 들어갈 공간"
                    스벅 아메리카노 1잔 아이스 적게여~
                    빨리오시면 심부름값 x 2 배로 드릴게여~
                  </textarea>
                </div>
                <div class="mt-3">
                  <div class="d-flex justify-content-between">
                    <h4 class="text-center mb-0" style="font-weight: bold;">제안된 금액:</h4>
                    <div class="d-flex align-items-baseline">
                      <h4 class="" id="errandInfo_itemPr">5,000</h4><span class="">원</span>
                    </div>
                  </div>
                  <div class="d-flex justify-content-between" >
                    <h4 class="text-center mb-0" style="font-weight: bold;">심부름금액:</h4>
                    <div class="d-flex align-items-baseline">
                      <h4 class="" id="errandInfo_cost">1,000</h4><span class="">원</span>
                    </div>
                  </div>
                  <div class="d-flex justify-content-between">
                    <h3 class="text-center mb-0" style="font-weight: bold; color: rgb(255, 59, 59);">총금액:</h3>
                    <div class="d-flex align-items-baseline">
                      <h3 class="" id="errandInfo_total">6,000</h3><span class="">원</span>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="modal-footer">
            <button type="button" id="" class="btn btn-primary" data-dismiss="modal">심부름하기</button>
            <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
          </div>
      </div>
    </div>
  </div>
  <!-- 심부름 확인 모달 끝 -->
						<!-- 확인했으면 주석을 지우셔도 됩니다. -->
<!-- \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/ -->
  <!-- =============================================== ▲ 심부름 모달 ▲ ================================================= -->