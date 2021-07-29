<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<!-- ============================= Modal Part ========================= -->

  	<!-- 삭제하기 모달 시작 -->
	<div>
	  <div class="modal fade" id="delete" tabindex="-1" role="dialog" aria-labelledby="logIn" aria-hidden="true">
	    <div class="modal-dialog modal-dialog-centered " role="document">
	      <div class="modal-content">
	        <div class="modal-header">
	          <h3 class="modal-title" id="exampleModalLongTitle" style="font-size : 30px; font-weight:bold">
	          <i class="fas fa-exclamation-triangle" style="color : red; font-size=20px;"></i> 게시글 삭제</h3>
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
	          <button type="button" id="btn_delete" class="btn btn-primary" >확인</button>
	          <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
	        </div>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- 삭제하기 모달 끝 -->
	<!-- 수정하기 모달 시작 -->
	<div>
	  <div class="modal fade" id="edit" tabindex="-1" role="dialog" aria-labelledby="logIn" aria-hidden="true">
	    <div class="modal-dialog modal-dialog-centered" role="document">
	      <div class="modal-content">
	        <div class="modal-header">
	          <h3 class="modal-title" id="exampleModalLongTitle" style="font-size : 30px; font-weight:bold">
	          <i class="fas fa-edit" style="color : skyblue;"></i> 게시글 수정</h3>
	          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	            <span aria-hidden="true">&times;</span>
	          </button>
	        </div>
	        <div class="modal-body text-center d-flex justify-content-center">
	          <div class="col-12 log__box d-flex flex-column justify-content-center">
	            <div>
	              <h4 class="col-12 d-flex justify-content-around" style="font-size : 20px; font-weight:bold">게시글을 수정하시겠습니까?
	              </h4>
	            </div>
	          </div>
	        </div>
	        <div class="modal-footer">
	          <button type="button" id="btn_edit" class="btn btn-primary" >확인</button>
	          <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
	        </div>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- 수정하기 모달 끝 -->
	<!-- ============================= Modal Part ========================= -->
