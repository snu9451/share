<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <!-- =========================================== ▼ 회원가입(이메일) 모달 ▼ ============================================= -->
  <div class="modal modal-center fade" id="signIn" tabindex="-1" role="dialog" aria-labelledby="signIn" aria-hidden="false">
    <div class="modal-dialog modal-center" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title" id="exampleModalLongTitle"><b>이메일</b>로 회원가입 양식을 보내드립니다.</h4>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <form class="form-row justify-content-center align-items-center"><!-- ▼ 회원가입(이메일) | form 태그 시작 ▼ -->
            <div class="form-group" style="min-width: 440px !important;">
              <label for="exampleInputEmail1">Email address</label>
              <input type="email" class="form-control w-100" style="min-width:80% !important;" id="exampleInputEmail1" aria-describedby="emailHelp"
                placeholder="이메일을 입력해주세요 : )">
            </div>
            <p style="font-size:0.7rem; color: #b8b8b8">────────── 또는 ──────────</p>
<!--             <div> -->
<!--               <button id="btn_reqJoinForm" class="btn btn-primary ml-2 h-75 p-3">확인</button> -->
<!--             </div> -->
          </form><!-- ▲ 회원가입(이메일)| form 태그 끝 ▲ -->
          <div class="d-flex flex-column w-100">
            <label for="naverLogin">네이버 아이디로 회원가입</label>
            <button class="btn btn-info p-2">네이버 회원가입</button>
          </div>
        </div>
        <div class="modal-footer">
          <button id="btn_reqJoinForm" class="btn btn-primary" data-dismiss="modal">확인</button>
          <button class="btn btn-danger" data-dismiss="modal">취소</button>
        </div>
      </div>
    </div>
  </div>
  <!-- =========================================== ▲ 회원가입(이메일) 모달 ▲ ============================================= -->