<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<!-- ============================= Modal Part ========================= -->
	<!-- 프로필사진 변경 성공 -->
	<div>
	  <div class="modal fade" id="imgChangeSuccs" tabindex="-1" role="dialog" aria-labelledby="logIn" aria-hidden="true">
	    <div class="modal-dialog modal-dialog-centered" role="document">
	      <div class="modal-content">
	        <div class="modal-header">
	          <h3 class="modal-title" id="exampleModalLongTitle" style="font-size : 20px; font-weight:bold">
	          <i class="fas fa-question-circle" style="color : green"></i> 프로필 사진 변경 성공</h3>
	          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	            <span aria-hidden="true">&times;</span>
	          </button>
	        </div>
	        <div class="modal-body text-center d-flex justify-content-center">
	          <div class="col-12 log__box d-flex flex-column justify-content-center">
	            <div>
		            <div class="col-12 d-flex flex-column">
		          		<h4 style="font-size : 20px; font-weight:bold">프로필 사진이 저장되었습니다.</h4>
		            </div>
	            </div>
	          </div>
	        </div>
	        <div class="modal-footer">
	          <button type="button" class="btn btn-primary" id="btn_imgSucces" data-dismiss="modal">확인</button>
	        </div>
	      </div>
	    </div>
	  </div>
	</div>
  	<!-- 닉네임 변경하기 -->
	<div>
	  <div class="modal fade" id="nickChange" tabindex="-1" role="dialog" aria-labelledby="logIn" aria-hidden="true">
	    <div class="modal-dialog modal-dialog-centered" role="document">
	      <div class="modal-content">
	        <div class="modal-header">
	          <h3 class="modal-title" id="exampleModalLongTitle" style="font-size : 20px; font-weight:bold">
	          <i class="fas fa-question-circle" style="color : orange"></i> 닉네임 중복 확인</h3>
	          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	            <span aria-hidden="true">&times;</span>
	          </button>
	        </div>
	        <div class="modal-body text-center d-flex justify-content-center">
	          <div class="col-12 log__box d-flex flex-column justify-content-center">
	            <div>
		            <div class="col-10 d-flex flex-column">
		          		<h4 style="font-size : 20px; font-weight:bold">새 닉네임을 입력해주세요.</h4>
		            </div>
		            <div class="col-12 d-flex justify-content-around">
		            	<span class="col-1 d-flex flex-column"></span>
	                	<div class="col-8 d-flex flex-column">
	                		<form id="f_checknickname">
		                  		<input id="newNick" name="mem_nickname" class="form-control mb-2" type="text" style="padding:0px;">
		                  		<div id="nick_result" style="padding-top:10px"></div>
	                		</form>
	                	</div>
	                	<div class="col-3 d-flex flex-column">
			                <button onclick="nickSelect()" id="btn_checknickname" class="btn btn-dark btn-sm" style="margin-left : 0px;">중복확인</button>
	                	</div>
	              	</div>
	            </div>
	          </div>
	        </div>
	        <div class="modal-footer">
	          <button id="btn_nicksubmit" disabled="true" onclick="nickChange()" type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
	          <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
	        </div>
	      </div>
	    </div>
	  </div>
	</div>
  	<!-- 닉네임 변경 실패 -->
	<div>
	  <div class="modal fade" id="nickChangeFail" tabindex="-1" role="dialog" aria-labelledby="logIn" aria-hidden="true">
	    <div class="modal-dialog modal-dialog-centered" role="document">
	      <div class="modal-content">
	        <div class="modal-header">
	          <h3 class="modal-title" id="exampleModalLongTitle" style="font-size : 20px; font-weight:bold">
	          <i class="fas fa-question-circle" style="color : red"></i> 닉네임 변경 실패</h3>
	          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	            <span aria-hidden="true">&times;</span>
	          </button>
	        </div>
	        <div class="modal-body text-center d-flex justify-content-center">
	          <div class="col-12 log__box d-flex flex-column justify-content-center">
	            <div>
		            <div class="col-12 d-flex flex-column">
		          		<h4 style="font-size : 20px; color : red; font-weight:bold">닉네임 변경에 실패하였습니다.</h4>
		            </div>
	            </div>
	          </div>
	        </div>
	        <div class="modal-footer">
	          <button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
	        </div>
	      </div>
	    </div>
	  </div>
	</div>
  	<!-- 닉네임 변경 성공 -->
	<div>
	  <div class="modal fade" id="nickChangeSuccs" tabindex="-1" role="dialog" aria-labelledby="logIn" aria-hidden="true">
	    <div class="modal-dialog modal-dialog-centered" role="document">
	      <div class="modal-content">
	        <div class="modal-header">
	          <h3 class="modal-title" id="exampleModalLongTitle" style="font-size : 20px; font-weight:bold">
	          <i class="fas fa-question-circle" style="color : green"></i> 닉네임 변경 성공</h3>
	          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	            <span aria-hidden="true">&times;</span>
	          </button>
	        </div>
	        <div class="modal-body text-center d-flex justify-content-center">
	          <div class="col-12 log__box d-flex flex-column justify-content-center">
	            <div>
		            <div class="col-12 d-flex flex-column">
		          		<h4 style="font-size : 20px; font-weight:bold">닉네임 변경에 성공하였습니다.</h4>
		            </div>
	            </div>
	          </div>
	        </div>
	        <div class="modal-footer">
	          <button onClick="window.location.reload()" type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
	        </div>
	      </div>
	    </div>
	  </div>
	</div>
	
  	<!-- 비밀번호 변경하기 -->
	<div>
	  <div class="modal fade" id="pwChange" tabindex="-1" role="dialog" aria-labelledby="logIn" aria-hidden="true">
	    <div class="modal-dialog modal-dialog-centered" role="document">
	      <div class="modal-content">
	        <div class="modal-header">
	          <h3 class="modal-title" id="exampleModalLongTitle" style="font-size : 20px; font-weight:bold">
	          <i class="fas fa-question-circle" style="color : green"></i> 비밀번호 변경</h3>
	          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	            <span aria-hidden="true">&times;</span>
	          </button>
	        </div>
	        <div class="modal-body text-center d-flex justify-content-center">
	          <div class="col-12 log__box d-flex flex-column justify-content-center">
	            <div>
	              <h4 class="col-12 d-flex justify-content-around" style="font-size : 20px; font-weight:bold">정말 변경하시겠습니까?
	              </h4>
	            </div>
	          </div>
	        </div>
	        <div class="modal-footer">
	          <button type="button" class="btn btn-primary" onclick="ajaxPW()" data-dismiss="modal">확인</button>
	          <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
	        </div>
	      </div>
	    </div>
	  </div>
	</div>
  	<!-- 비밀번호 최종확인 -->
	<div>
	  <div class="modal fade" id="pwChangeLast" tabindex="-1" role="dialog" aria-labelledby="logIn" aria-hidden="true">
	    <div class="modal-dialog modal-dialog-centered" role="document">
	      <div class="modal-content">
	        <div class="modal-header">
	          <h3 class="modal-title" id="exampleModalLongTitle" style="font-size : 20px; font-weight:bold">
	          <i class="fas fa-question-circle" style="color : green"></i> 비밀번호 변경</h3>
	          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	            <span aria-hidden="true">&times;</span>
	          </button>
	        </div>
	        <div class="modal-body text-center d-flex justify-content-center">
	          <div class="col-12 log__box d-flex flex-column justify-content-center">
	            <div>
	            	<div id="pw_result" style="padding-top:10px"></div>
	            </div>
	          </div>
	        </div>
	        <div class="modal-footer">
	          <button onClick="window.location.reload()" type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
	        </div>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- 새 비밀번호 변경하기 -->
	<div>
	  <div class="modal fade" id="newPwChange" tabindex="-1" role="dialog" aria-labelledby="logIn" aria-hidden="true">
	    <div class="modal-dialog modal-dialog-centered" role="document">
	      <div class="modal-content">
	        <div class="modal-header">
	          <h3 class="modal-title" id="exampleModalLongTitle" style="font-size : 20px; font-weight:bold">
	          <i class="fas fa-exclamation-triangle" style="color : red;"></i> 비밀번호 변경 실패</h3>
	          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	            <span aria-hidden="true">&times;</span>
	          </button>
	        </div>
	        <div class="modal-body text-center d-flex justify-content-center">
	          <div class="col-12 log__box d-flex flex-column justify-content-center">
	            <div>
	              <h4 class="col-12 d-flex justify-content-around" style="font-size : 20px; font-weight:bold;">비밀번호를 확인해주세요.
	              </h4>
	            </div>
	          </div>
	        </div>
	        <div class="modal-footer">
	          <button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
	        </div>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- 현재 비밀번호 비교 확인 여부 -->
	<div>
	  <div class="modal fade" id="curPwChange" tabindex="-1" role="dialog" aria-labelledby="logIn" aria-hidden="true">
	    <div class="modal-dialog modal-dialog-centered" role="document">
	      <div class="modal-content">
	        <div class="modal-header">
	          <h3 class="modal-title" id="exampleModalLongTitle" style="font-size : 20px; font-weight:bold">
	          <i class="fas fa-exclamation-triangle" style="color : red;"></i> 비밀번호 변경 실패</h3>
	          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	            <span aria-hidden="true">&times;</span>
	          </button>
	        </div>
	        <div class="modal-body text-center d-flex justify-content-center">
	          <div class="col-12 log__box d-flex flex-column justify-content-center">
	            <div>
	              <h4 class="col-12 d-flex justify-content-around" style="font-size : 20px; font-weight:bold;">현재 비밀번호를 확인해주세요.
	              </h4>
	            </div>
	          </div>
	        </div>
	        <div class="modal-footer">
	          <button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
	        </div>
	      </div>
	    </div>
	  </div>
	</div>
	
  	<!-- 탈퇴하기 -->
	<div>
	  <div class="modal fade" id="leave" tabindex="-1" role="dialog" aria-labelledby="logIn" aria-hidden="true">
	    <div class="modal-dialog modal-dialog-centered" role="document">
	      <div class="modal-content">
	        <div class="modal-header">
	          <h3 class="modal-title" id="exampleModalLongTitle" style="font-size : 20px; font-weight:bold">
	          <i class="fas fa-exclamation-triangle" style="color : red;"></i> 탈퇴하기</h3>
	          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	            <span aria-hidden="true">&times;</span>
	          </button>
	        </div>
	        <div class="modal-body text-center d-flex justify-content-center">
	          <div class="col-12 log__box d-flex flex-column justify-content-center">
	            <div>
	              <h4 class="col-12 d-flex justify-content-around" style="font-size : 20px; font-weight:bold;">비밀번호를 입력해주세요.<br>
	              </h4>
	              <div style="color : red; margin-bottom : 15px; font-weight:bold;">(모든정보가 삭제됩니다.)</div>
              	  <div class="col-12 d-flex flex-column">
	              	  <form id="f_leave">
	                  	<input class="form-control mb-2" type="password" name="mem_pw">
	              	  </form>
               	  </div>
	            </div>
	          </div>
	        </div>
	        <div class="modal-footer">
	          <button onclick="leave()" type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
	          <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
	        </div>
	      </div>
	    </div>
	  </div>
	</div>
  	<!-- 탈퇴하기 -->
	<div>
	  <div class="modal fade" id="leaveLast" tabindex="-1" role="dialog" aria-labelledby="logIn" aria-hidden="true">
	    <div class="modal-dialog modal-dialog-centered" role="document">
	      <div class="modal-content">
	        <div class="modal-header">
	          <h3 class="modal-title" id="exampleModalLongTitle" style="font-size : 20px; font-weight:bold">
	          <i class="fas fa-exclamation-triangle" style="color : red;"></i> 탈퇴하기</h3>
	          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	            <span aria-hidden="true">&times;</span>
	          </button>
	        </div>
	        <div class="modal-body text-center d-flex justify-content-center">
	          <div class="col-12 log__box d-flex flex-column justify-content-center">
	            <div>
	              <div id="leave_result" style="padding-top:10px"></div>
	            </div>
	          </div>
	        </div>
	        <div class="modal-footer">
	          <button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
	        </div>
	      </div>
	    </div>
	  </div>
	</div>