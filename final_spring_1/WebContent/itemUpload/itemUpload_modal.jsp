<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <!-- ============================= Modal Part ========================= -->
  <!-- 상품 등록 취소 모달 -->
  <div>
    <div class="modal fade" id="itemCancel" tabindex="-1" role="dialog" aria-labelledby="logIn" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h3 class="modal-title" id="exampleModalLongTitle" style="font-size : 20px; font-weight:bold">
              <i class="fas fa-exclamation-triangle" style="color : red;"></i> 등록 취소</h3>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body text-center d-flex justify-content-center">
            <div class="col-12 log__box d-flex flex-column justify-content-center">
              <div>
                <div class="col-12 d-flex flex-column">
                  <h4 style="font-size : 20px; font-weight:bold">변경사항이 저장되지 않을 수 있습니다.</h4>
                </div>
              </div>
            </div>
          </div>
          <div class="modal-footer">
            <button type="button" onClick="location.href='http://localhost:9696/mainPage/main_page.nds'" class="btn btn-primary" data-dismiss="modal">확인</button>
            <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div>
    <div class="modal fade" id="itemBoard" tabindex="-1" role="dialog" aria-labelledby="logIn" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h3 class="modal-title" id="exampleModalLongTitle" style="font-size : 20px; font-weight:bold">
	          <i class="fas fa-question-circle" style="color : green"></i> 게시물 등록</h3>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body text-center d-flex justify-content-center">
            <div class="col-12 log__box d-flex flex-column justify-content-center">
              <div>
                <div class="col-12 d-flex flex-column">
                  <h4 style="font-size : 20px; font-weight:bold">게시물을 등록 하시겠습니까?</h4>
                </div>
              </div>
            </div>
          </div>
          <div class="modal-footer">
            <button type="button"  onclick="insAction()" class="btn btn-primary" data-dismiss="modal">확인</button>
            <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div>
    <div class="modal fade" id="itemBoardEdit" tabindex="-1" role="dialog" aria-labelledby="logIn" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h3 class="modal-title" id="exampleModalLongTitle" style="font-size : 20px; font-weight:bold">
	          <i class="fas fa-question-circle" style="color : green"></i> 게시물 수정</h3>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body text-center d-flex justify-content-center">
            <div class="col-12 log__box d-flex flex-column justify-content-center">
              <div>
                <div class="col-12 d-flex flex-column">
                  <h4 style="font-size : 20px; font-weight:bold">게시물을 수정 하시겠습니까?</h4>
                </div>
              </div>
            </div>
          </div>
          <div class="modal-footer">
            <button type="button"  onclick="insAction()" class="btn btn-primary" data-dismiss="modal">확인</button>
            <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
          </div>
        </div>
      </div>
    </div>
  </div>
