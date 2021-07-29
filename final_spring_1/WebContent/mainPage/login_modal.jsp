<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <!-- ========================================= ▼ ＬＯＧＩＮ　ＭＯＤＡＬ ▼ ========================================= -->
  	<div class="modal fade" id="logIn" tabindex="-1" role="dialog"
		aria-labelledby="logIn" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="modal-title" id="exampleModalLongTitle">로그인</h3>
					<button id="login_close" type="button" class="close"
						data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body text-center d-flex justify-content-center">
					<div
						class="col-12 log__box d-flex flex-column justify-content-center">
						<form id="f_login" class="">
							<div class="form-row col-12 ">
								<div class="col-9 d-flex flex-column">
									<input name="mem_email" class="form-control mb-2 w-100"
										type="text" placeholder="id를 입력해주세요."> <input onkeyup="javascript:if(event.keyCode==13){doLogin();}"
										name="mem_pw" class="form-control mb-2 w-100" type="password"
										placeholder="password를 입력해주세요.">
								</div>
								<div class="col-3">
									<button id="nds_login_button"
										class="btn btn-primary ml-1 text-center h-100 w-100"
										type="button">로그인</button>
								</div>
							</div>
							<div class="form-row justify-content-center col-12">
								<div class="custom-control custom-checkbox col-4">
									<input name="isSavedIdChecked" type="checkbox"
										class="custom-control-input" id="saveId"> <label
										class="custom-control-label" for="saveId">ID 저장</label>
								</div>
								<div class="custom-control custom-checkbox col-4">
									<input name="isAutoLoginChecked" type="checkbox"
										class="custom-control-input" id="autoLogin"> <label
										class="custom-control-label" for="autoLogin">자동로그인</label>
								</div>
							</div>
						</form>
						<a id="issueTempPw" href="#" data-toggle="modal"
							data-target="#tempPW" class="col-12 mb-2">비밀번호를 잊으셨나요??</a>
						<button class="btn btn-info p-2">네이버로그인</button>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
  <!-- ========================================= ▲ ＬＯＧＩＮ　ＭＯＤＡＬ ▲ ========================================= -->