<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<!-- ============================= Modal Part ========================= -->

  	<!-- 구매내역(삭제하기) -->
	<div>
	  <div class="modal fade" id="selDelete" tabindex="-1" role="dialog" aria-labelledby="logIn" aria-hidden="true"><!-- 김은영작업 id변경 -->
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
	          <button type="button" id="errand_del_confirm" class="btn btn-primary" data-dismiss="modal">확인</button><!-- 김은영작업 id추가 -->
	          <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
	        </div>
	      </div>
	    </div>
	  </div>
	</div>
	<div>
	  <div class="modal fade" id="selDelete1" tabindex="-1" role="dialog" aria-labelledby="logIn" aria-hidden="true">
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
	          <button type="button" id="errand_del_confirm1" class="btn btn-primary" data-dismiss="modal">확인</button><!-- 김은영작업 id추가 -->
	          <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
	        </div>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- 심부름 완료 시 평점부여 모달 starRatingGrant-->
	<div>
	  <div class="modal fade" id="starRatingGrant" tabindex="-1" role="dialog" aria-labelledby="logIn" aria-hidden="true">
	    <div class="modal-dialog modal-dialog-centered" role="document">
	      <div class="modal-content">
	        <div class="modal-header">
	          <h3 class="modal-title" id="exampleModalLongTitle" style="font-size : 20px; font-weight:bold">
	          <i class="fas fa-info-circle" style="color : green"></i> 내 동생의 별점을 매겨주세요! </h3>
	          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	            <span aria-hidden="true">&times;</span>
	          </button>
	        </div>
	        <div class="modal-body text-center d-flex justify-content-center">
	          <div class="col-12 log__box d-flex flex-column justify-content-center">
	            <div>
		            <div class="col-12 d-flex flex-column">
		            	<div>
	                		<img class="img_upload" id="image_section" src="../myPage/assets/img/profile/<%=mem_img%>"/>
						</div>
		            	<div class="nickDiv">
   							<h4 class="con_nick" style="font-size : 30px; padding-top: 15px;"><%=mem_nickname%></h4>
						</div>
						<form id="starSubmit">
			          		<div class="star-rating space-x-4 mx-auto">
								<input type="hidden" name="mem_email"/>
								
								<input type="radio" id="5-stars" name="rating" value="5" v-model="ratings"/>
								<label for="5-stars" class="star"><i class="fas fa-star"></i></label>
								<input type="radio" id="4-stars" name="rating" value="4" v-model="ratings"/>
								<label for="4-stars" class="star"><i class="fas fa-star"></i></label>
								<input type="radio" id="3-stars" name="rating" value="3" v-model="ratings"/>
								<label for="3-stars" class="star"><i class="fas fa-star"></i></label>
								<input type="radio" id="2-stars" name="rating" value="2" v-model="ratings"/>
								<label for="2-stars" class="star"><i class="fas fa-star"></i></label>
								<input type="radio" id="1-star" name="rating" value="1" v-model="ratings" />
								<label for="1-star" class="star"><i class="fas fa-star"></i></label>
							</div>
						</form>
		            </div>
	            </div>
	          </div>
	        </div>
	        <div class="modal-footer">
	          <button type="button" class="btn btn-primary" disabled="true" id="btn_starGrant" data-dismiss="modal">확인</button>
	        </div>
	      </div>
	    </div>
	  </div>
	</div>
<body>
<script>
$('.star').on('click', function(){
	$('#btn_starGrant').attr('disabled', false);
});
$('#btn_starGrant').click(function(){
	let sdata =  $('#starSubmit').serialize();
	$.ajax({
		url : "http://localhost:9696/member/starRatingGrant.nds",
		type : "post",
		data: sdata,
		success : function(data) {
			console.log('별점반영');
		},
		error : function(e) {

		}
	});
});
</script>
</body>
	<!-- ============================= Modal Part ========================= -->
<style>
.star-rating {
  display: flex;
  padding-top : 25px;
  flex-direction: row-reverse;
  font-size: 50px;
  justify-content: center;
  text-align: center;
  width: 5em;
}
 
.star-rating input {
  display: none;
}
 
.star-rating label {
  -webkit-text-fill-color: transparent; /* Will override color (regardless of order) */
/*   -webkit-text-stroke-width: 0.3px; */
/*   -webkit-text-stroke-color: #2b2a29; */
  -webkit-text-fill-color: #cccccc;
  cursor: pointer;
}
 
.star-rating :checked ~ label {
  -webkit-text-fill-color: #ff9600;
}
 
.star-rating label:hover,
.star-rating label:hover ~ label {
  -webkit-text-fill-color: #ff9600;
}
</style>