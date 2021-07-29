<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <!-- =============================================== ▼ 회원 신고 모달  ▼ ================================================= -->
	<div class="modal modal-center fade" id="report_user_modal" tabindex="-1" role="dialog" aria-labelledby="report_user_modal"aria-hidden="true">
		<div class="modal-dialog modal-center" role="document">
			<div class="modal-content" style="width: 650px;">
				<div class="modal-header">
					<div class="d-flex justify-content-center align-items-center">
						<i class="fas fa-exclamation-circle" style="font-size: 2rem; color: rgb(255, 39, 39);"></i>
						<h2 class="modal-title" id="exampleModalLongTitle">회원신고</h2>
					</div>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form id="report_content_user">
						<div class="form-group">
							<div class="form-row">
								<div class="col-5">
									<label class="mr-2">신고자:</label><span id="report_user">라이언</span>
								</div>
								<div class="col-5">
									<label class="mr-2">신고 대상:</label><span id="report_bad_user">무지</span>
								</div>
							</div>
							<div class="dropdown-divider"></div>
							<div class="form-group">
								<h4 style="font-weight: bold;">신고분류</h4>
								<select class="form-control custom-select"
									id="report_category_user">
									<option selected>분류</option>
									<option value="1">전문판매업자</option>
									<option value="2">비매너 사용자</option>
									<option value="3">욕설 및 성희롱</option>
									<option value="4">기타</option>
								</select>
							</div>
							<div class="form-group">
								<h4 style="font-weight: bold;">신고내용 상세 입력</h4>
								<div class="form-row">
									<div class="col-5">
										<label class="mr-2">신고날짜:</label><span id="report_date_user">2021-06-25</span>
									</div>
								</div>
								<textarea type="text" class="form-control" id="report_detail_user" placeholder="상세 내용을 입력해주세요." rows="5"></textarea>
							</div>
							<div class="input-group">
								<div class="input-group-prepend">
									<label class="input-group-text" for="report_file_user">Upload</label>
								</div>
								<div class="custom-file">
									<input type="file" class="report_file_user" id="report_file_user" aria-describedby="inputGroupFileAddon01">
									<label class="custom-file-label" id="report_file_name_user" for="report_file_user">파일은 최대 10MB까지 가능합니다. </label>
								</div>
							</div>
						</div>
					</form>
					<div class="modal-footer">
						<button type="button" id="report_btn_user" class="btn btn-primary sweet">신고하기</button>
						<button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- =============================================== ▲ 회원 신고 모달 ▲ ================================================= -->