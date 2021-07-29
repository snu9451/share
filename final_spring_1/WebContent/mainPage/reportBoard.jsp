<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <!-- =============================================== ▼ 게시글 신고 모달  ▼ ================================================= -->
  <div class="modal modal-center fade" id="report_board" tabindex="-1" role="dialog" aria-labelledby="report_board"
    aria-hidden="true">
    <div class="modal-dialog modal-center" role="document">
      <div class="modal-content" style="width: 650px;">
        <div class="modal-header">
          <div class="d-flex justify-content-center align-items-center">
            <i class="fas fa-exclamation-circle" style="font-size: 2rem; color: rgb(255, 39, 39);"></i>
            <h2 class="modal-title" id="exampleModalLongTitle">게시물신고</h2>
          </div>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <form id="report_content_board"><!-- ▼ 신고창 | form 태그 시작 ▼ -->
            <div class="form-group">
              <h4 style="font-weight: bold;">신고분류</h4>
              <select class="form-control custom-select" name="report_type" id="report_category_board">
                <option selected="selected" value="default">분류</option>
                <option value="1">욕설 또는 비방</option>
                <option value="2">홍보 및 영리</option>
                <option value="3">불법 및 도박</option>
                <option value="4">음란 및 유해</option>
                <option value="5">도배</option>
                <option value="6">기타</option>
              </select>
            </div>
            <div class="form-group">
              <h4 style="font-weight: bold;">신고내용 상세 입력</h4>
              <div class="form-row">
                <div class="col-7">
                  <label class="mr-2">신고대상 게시글 번호:</label>
                  <span class="mr-2">No.</span><span id="report_num_board">100000</span>
                </div>
                <div class="col-5">
                  <label class="mr-2">신고날짜:</label><span id="report_date_board">2021-06-24</span>  
                </div>
              </div>
              <textarea name="report_msg" type="text" class="form-control" id="report_detail_board" placeholder="상세 내용을 입력해주세요." rows="5"></textarea>
            </div>
            <div class="input-group">
              <div class="input-group-prepend">
                <label class="input-group-text" for="report_file_board">Upload</label>
              </div>
              <div class="custom-file">
                <input type="file" class="report_file" id="report_file_board" aria-describedby="inputGroupFileAddon01">
                <label class="custom-file-label" id="report_file_name_board" for="report_file_board">파일은 최대 10MB까지 가능합니다.</label>
              </div>
            </div>
          </form><!-- ▲ 신고창 | form 태그 끝 ▲ -->
          <div class="modal-footer">
			<form action="join" method="post"  id="main__shape">
	            <button type="button" id="report_btn" class="btn btn-primary">신고하기</button>
			</form>
            <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- =============================================== ▲ 게시글 신고 모달 ▲ ================================================= -->