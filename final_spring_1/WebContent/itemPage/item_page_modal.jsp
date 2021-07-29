<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<!-- ============================= Modal Part ========================= -->

  	<!-- 게시물 삭제 재차 확인 -->
	<div>
	  <div class="modal fade" id="boardDelete" tabindex="-1" role="dialog" aria-labelledby="logIn" aria-hidden="true"><!-- 김은영작업 id변경 -->
	    <div class="modal-dialog modal-dialog-centered" role="document">
	      <div class="modal-content">
	        <div class="modal-header">
	          <h3 class="modal-title" id="exampleModalLongTitle" style="font-size : 20px; font-weight:bold">
	          <i class="fas fa-exclamation-triangle" style="color : red;"></i> 게시글 삭제</h3>
	          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	            <span aria-hidden="true">&times;</span>
	          </button>
	        </div>
	        <div class="modal-body text-center d-flex justify-content-center">
	          <div class="col-12 log__box d-flex flex-column justify-content-center">
	            <div>
	              <h4 class="col-12 d-flex justify-content-around" style="font-size : 20px; font-weight:bold">정말 삭제하시겠습니까?
	              </h4>
	            </div>
	          </div>
	        </div>
	        <div class="modal-footer">
	        	<form action="/item/deleteItem.nds" method="post">
					<input type="hidden" name="br_sel_buy" value='sel' />
					<input type="hidden" name="pr_bm_no" value=<%= BM_NO %> />
			        <button class="btn btn-primary">확인</button><!-- 김은영작업 id추가 -->
				</form>
	          <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
	        </div>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- ============================= Modal Part ========================= -->