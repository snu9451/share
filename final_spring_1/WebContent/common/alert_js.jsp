<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	

if(session.getAttribute("login") != null){
	int indexOfDot = mem_email.indexOf(".");
	if(indexOfDot>=0){
		mem_email = mem_email.substring(0,indexOfDot);
	}
}
%>
<style>
.outer-star::before, .inner-star::before {
    content: "\f005 \f005 \f005 \f005 \f005";
    font-family: "Font Awesome 5 free";
    font-weight: 900;
}
.inner-star::before {
    color: #ff9600;
}
.inner-star {
    position: absolute;
    left: 0;
    top: 0;
    width: 0%;
    overflow: hidden;
    white-space: nowrap;
}
.outer-star {
    position: relative;
    display: inline-block;
    color: #cccccc;
}

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
<script type="text/javascript">
let roomKey = "null";
// let refErrand = "";//errand테이블 접근할 주소
let refArea = "";//rider테이블 접근할 주소
let refAlert = "";//alert테이블 접근할 주소
let my_lat = 1.0;//현재 자신의 위도
let my_lng = 1.0;//현재 자신의 경도
const lat_st = 38.45;
const lat_en = 33.1;
const lat_50m = 0.00045;
const lng_st = 125.0;
const lng_en = 132.0;
const lng_50m = 0.00056
const lng_rows = Math.ceil((lng_en-lng_st)/lng_50m);
let mem_email = "<%=mem_email%>";//현재 접속자의 이메일
let myArea;
class Stack {
	  constructor() {
	    this._arr = [];
	  }
	  push(item) {
	    this._arr.push(item);
	  }
	  pop() {
	    return this._arr.pop();
	  }
	  peek() {
	    return this._arr[this._arr.length - 1];
	  }
	  isEmpty() {
		  if(this._arr.length == 0)
			  return true;
		  else
			  return false;
	  }
}
const stack = new Stack();
$(document).ready(function() {
//   refErrand = firebase.database().ref("errand");
  refArea = firebase.database().ref("area");
  refAlert = firebase.database().ref("alert/"+mem_email);
  initAlert();
});

//////////////////////////////////////////시간
  //현재 시간을 YYYY-MM-DD HH:mm:SS 형식으로 반환
    function getTime(){
    let today = new Date();

    let year = today.getFullYear();
    let month = ('0' + (today.getMonth() + 1)).slice(-2);
    let day = ('0' + today.getDate()).slice(-2);

    let hours = ('0' + today.getHours()).slice(-2); 
    let minutes = ('0' + today.getMinutes()).slice(-2);
    let seconds = ('0' + today.getSeconds()).slice(-2); 

    let dateString = year + '-' + month  + '-' + day;
    let timeString = hours + ':' + minutes  + ':' + seconds;
    let rstTime = dateString+" "+timeString;
    return rstTime;
  }

//////////////////////////////////////////위치
  //접속자의 현재 위치를 my_lat, my_lng 전역변수에 저장
  function getLoc() {
    let watchID = navigator.geolocation.getCurrentPosition(function(position) {
      my_lat = position.coords.latitude;
      my_lng = position.coords.longitude;
      console.log(position.coords.latitude, position.coords.longitude);
      myArea = lng_rows*Math.floor((lat_st-my_lat)/lat_50m)+Math.floor((my_lng-lng_st)/lng_50m);
    });
  }

//////////////////////////////////////////채팅
  //채팅방 목록 보기
  function chatroomList(){
    let nickname = $('#nickname').val();
    if(nickname==null || nickname=="")
      alert("자신의 닉네임을 입력해주세요.");
    else
      $("#chat").submit();
  }

//////////////////////////////////////////알림
  //alert테이블에서 사용자의 이메일로 검색,
  //해당 사용자에 대한 테이블이 없으면(처음 사용한다면) 빈 값을 넣어 테이블을 생성 
  function initAlert() {
	if(mem_email==null)
		return;
    let findRefAlert = firebase.database().ref("alert").orderByKey().equalTo(mem_email);
    findRefAlert.once('value', function(snapshot) {
      if (snapshot.val() == null) {
        let alertData = {
          content: "",
          type: "init",
          timestamp : getTime(),
          active : 0
        };
        firebase.database().ref("alert/"+mem_email).push().update(alertData);
      }
      runAlert();
    });
  }
  //일반적인 알림창(내용과 확인버튼밖에 없는 단순한 창)
  function justOK(key, content){
    makeModal(key, content);
    $("#"+key).find(".btn-primary").click(function(){
      refAlert.child(key).remove();
//       refAlert.child(key).update({ active : 0 });
    });
    $("#"+key).modal("show");
  }
  //새로운 알림이 오는 것을 감지, 알림의 종류에 맞는 함수를 실행
  function runAlert() {
    refAlert.on('child_added',function(snapshot){
      let snapVal = snapshot.val();
      let type = snapshot.val().type;
      if(snapVal.active == 1) {
        if(type=="insertErrand") {
          justOK(snapshot.key, snapVal.content);
        }
        else if(type=="acceptErrand") {
          justOK(snapshot.key, snapVal.content);
        }
        else if(type=="acceptedErrand") {
          justOK(snapshot.key, snapVal.content);
        }
        else if(type=="refuseErrand") {
          justOK(snapshot.key, snapVal.content);
        }
        else if(type=="refusedErrand") {
          justOK(snapshot.key, snapVal.content);
        }
        else if(type=="doErrand") {
          justOK(snapshot.key, snapVal.content);
        }
        else if(type=="getErrand") {
          $.ajax({
        	 type:'post',
        	 url:'/member/jsonSelectMember.nds',
        	 data:{"mem_email":snapVal.rider},
        	 success:function(data){
	         	acceptRefuseModal(snapshot.key, snapVal.errand_item, data.MEM_NICKNAME, data.MEM_IMG, data.MEM_STAR, data.MEM_GENDER);
	            $("#"+snapshot.key).find(".btn-primary").click(function(){
	    			getRoomKey(snapshot.key, snapVal.errandKey, snapVal.rider, snapVal.area_no);
	              });
	              $("#"+snapshot.key).find(".btn-danger").removeAttr("data-dismiss");
	              $("#"+snapshot.key).find(".btn-danger").click(function(){
	    			  $("#"+snapshot.key).find("#refuseNotice").removeAttr("style");
	    			  $("#"+snapshot.key).find("#refuse_detail").removeAttr("style");
	    			  $("#"+snapshot.key).find(".btn-danger").text("제출");
	                  $("#"+snapshot.key).find(".btn-danger").click(function(){
	              	  	$("#"+snapshot.key).find(".btn-danger").attr("data-dismiss","modal");
	    	            $.ajax({
	    					type:'post',
	    					url:'/errand/insertErrandDenied.nds',
	    					data:{
	    							"errandKey":snapshot.key,
	    		                    "errand_denied_date":getTime(),
	    		                    "errand_deny_msg":$("#"+snapshot.key).find("#refuse_detail").val()
	    					},
	    					success:function(data){
	    						console.log("ajax success");
	    			            refuseErrand(snapVal.errandKey, snapVal.rider, snapVal.area_no);
	    			            refAlert.child(snapshot.key).remove();
//	     			            refAlert.child(snapshot.key).update({ active : 0 });
	    					},
	    					error:function(e){
	    						console.log(e);
	    					}
	    	            });
	    			  });
	              });
	              $("#"+snapshot.key).modal("show");
        	 },
        	 error:function(e){
        		 console.log(e);
        	 }
          });
        }
        else if(type=="doneReq") {
        	$.ajax({
	           	 type:'post',
	           	 url:'/member/jsonSelectMember.nds',
	           	 data:{"mem_email":snapVal.rider},
	           	 success:function(data){
	             	starRatingModal(snapshot.key, data.MEM_EMAIL, data.MEM_NICKNAME, data.MEM_IMG);
	    			$('.star').off('click').on('click', function(){
		  				  $('#btn_starGrant').attr('disabled', false);
		  			});
		  			$('#btn_starGrant').off('click').click(function(){
		  			  let sdata =  $('#starSubmit').serialize();
		  			  $.ajax({
		  			     url : "/member/starRatingGrant.nds",
		  			     type : "post",
		  			     data: sdata,
		  			     success : function(data) {
		  			     	 makeModal("starRatingComplete", "별점이 반영되었습니다.");
			  			     $("#starRatingComplete").modal("show");
		  			     },
		  			     error : function(e) {
		  			
		  			     }
		  			  });
		  			});
		  		    $("#"+snapshot.key).find(".btn-primary").click(function(){
		  		      refAlert.child(snapshot.key).remove();
		  		    });
		  			$("#"+snapshot.key).find("#image_section").css({
		  			  'width': '200px',
			  		  'height': '200px',
			  		  'border-radius': '50%',
			  		  'border': '2px solid #ffc37b',
			  		  'margin': 'auto'
		  			});
		  			$("#"+snapshot.key).modal("show");
	           	 },
	           	 error:function(e){
	           		 console.log(e);
	           	 }
            });
        }
        else if(type=="doneNds") {
            justOK(snapshot.key, snapVal.content);
        }
        else
          console.log("nothing");
      }
    });
  }
  //알림 모달 창 생성하는 함수
  function makeModal(alertKey, content, hasCancel = 0, btn_ok = "확인", btn_cancel = "취소", title = "알림"){
    let html =
    //"<form f_id=\""+alertKey+"\" method=\"post\" target=\"chatroom\" action=\"/mainPage/chatroom.jsp\" onsubmit=\"window.open('/mainPage/chatroom.jsp','chatroom','width=550px, height=701px');\">"
      "<div class=\"modal fade\" id=\""+alertKey+"\" tabindex=\"-1\" role=\"dialog\" data-backdrop=\"static\" data-keyboard=\"false\">"
        +"<div class=\"modal-dialog modal-dialog-centered\" role=\"document\">"
          +"<div class=\"modal-content\">"
            +"<div class=\"modal-header\">"
              +"<h3 class=\"modal-title\" id=\"exampleModalLongTitle\">"
                +title
              +"</h3>"
            +"</div>"
            +"<div class=\"modal-body\">"
              +"<div class=\"col-12 log__box d-flex flex-column justify-content-center\">"
                +content
              +"</div>"
// 				+"<div id=\"refuseNotice\"class=\"col-12 log__box d-flex flex-column justify-content-center\" style=\"display:none!important;\">거절 사유를 알려주세요.</div>"
// 				+"<textarea name=\"refuse_msg\" type=\"text\" class=\"form-control\" id=\"refuse_detail\" placeholder=\"상세 내용을 입력해주세요.\" rows=\"5\" style=\"display:none;\"></textarea>"
            +"</div>"
            +"<div class=\"modal-footer\">"
              +"<button type=\"button\" class=\"btn btn-primary\" data-dismiss=\"modal\">"
                +btn_ok
              +"</button>";
    if(hasCancel==1) {
      html += 
              "<button type=\"button\" class=\"btn btn-danger\" data-dismiss=\"modal\">"
                +btn_cancel
              +"</button>";
    }
    html += 
            "</div>"
          +"</div>"
        +"</div>"
      +"</div>";
     //"</form>";
    $("body").append(html);
  }
  //심부름 배달요청 수락/거절하는 모달창
  function acceptRefuseModal(alertKey, errand_item, dest_nickname, dest_img, dest_star, dest_gender){
    let html =
    //"<form f_id=\""+alertKey+"\" method=\"post\" target=\"chatroom\" action=\"/mainPage/chatroom.jsp\" onsubmit=\"window.open('/mainPage/chatroom.jsp','chatroom','width=550px, height=701px');\">"
      "<div class=\"modal modal-center fade\" id=\""+alertKey+"\" tabindex=\"-1\" role=\"dialog\" data-backdrop=\"static\" data-keyboard=\"false\">"
        +"<div class=\"modal-dialog modal-center\" role=\"document\">"
          +"<div class=\"modal-content\" style=\"width: 700px;\">"
            +"<div class=\"modal-header\">"
              +"<h3 class=\"modal-title\" id=\"exampleModalLongTitle\">알림</h3>"
            +"</div>"
            +"<div class=\"modal-body pb-0\">"
	            +"<div class=\"row justify-content-between align-items-center\">"
	              +"<div class=\"col-lg-3 w-100 h-100 d-flex flex-column align-items-center\" id=\"profileBox\">"
	                +"<div class=\"profileImg\" id=\"profileImg\">"
	                  +"<img class=\"w-100\" src=\"/myPage/assets/img/profile/"+dest_img+"\" alt=\"profileImg\" width=150px height=150px style=\"border-radius: 25%\">"
	                +"</div>"
	                +"<div>"
	                  +"<h5 class=\"mt-3\" id=\"profileName\">"
	                  	+dest_nickname
	                  +"</h5>"
	                +"</div>"
	                +"<input type=\"hidden\" id=\"destratingScore\" class=\"ratingScore\" value=\""+dest_star+"\">"
	                +"<div id=\"destRatingStar\" class=\"RatingStar\">"
						+"<div id=\"destRatingScore\" class=\"ratingScore\">"
							+"<div class=\"outer-star\">"
								+"<div class=\"inner-star\" style=\"width: 0%;\">"
								+"</div>"
							+"</div>"
						+"</div>"
					+"</div>"
	              +"</div>"
	              +"<div class=\"col-lg-9 d-flex flex-column\" id=\"errandInfoBox\">"
		              +"<div class=\"mt-2 d-flex flex-column align-items-center\">"
		                +"<div class=\"d-inline-flex\">"
		                  +"<span class=\"ml-1\"><b>"
		                  	+dest_nickname
	                  	  +"</b>님이 <b>"
	                  	  	+errand_item
	                  	  +"</b> 심부름 배달을 요청하셨습니다.<br>수락하시겠습니까?</span>"
		                +"</div>"
						+"<div id=\"refuseNotice\"class=\"col-12 log__box d-flex flex-column justify-content-center\" style=\"display:none!important;\">거절 사유를 알려주세요.</div>"
						+"<textarea name=\"refuse_msg\" type=\"text\" class=\"form-control\" id=\"refuse_detail\" placeholder=\"상세 내용을 입력해주세요.\" rows=\"5\" style=\"display:none;\"></textarea>"
		              +"</div>"
	              +"</div>"
	            +"</div>"
            +"</div>"
            +"<div class=\"modal-footer\">"
              +"<button type=\"button\" class=\"btn btn-primary\" data-dismiss=\"modal\">수락</button>"
              +"<button type=\"button\" class=\"btn btn-danger\" data-dismiss=\"modal\">거절</button>"
    		+"</div>"
          +"</div>"
        +"</div>"
      +"</div>";
     //"</form>";
    $("body").append(html);
    rateIt();
  }
  
  //심부름 완료 시 평점부여 모달 starRatingGrant
function starRatingModal(alertKey, dest_email, dest_nickname, dest_img){
	  let html = 
			  "<div>"
			    +"<div class=\"modal fade\" id=\""+alertKey+"\" tabindex=\"-1\" role=\"dialog\" aria-labelledby=\"logIn\" aria-hidden=\"true\" data-backdrop=\"static\" data-keyboard=\"false\">"
			      +"<div class=\"modal-dialog modal-dialog-centered\" role=\"document\">"
			        +"<div class=\"modal-content\">"
			          +"<div class=\"modal-header\">"
			            +"<h3 class=\"modal-title\" id=\"exampleModalLongTitle\" style=\"font-size : 20px; font-weight:bold\">"
			            +"<i class=\"fas fa-info-circle\" style=\"color : green\"></i> 내 동생의 별점을 매겨주세요! </h3>"
			            +"</button>"
			          +"</div>"
			          +"<div class=\"modal-body text-center d-flex justify-content-center\">"
			            +"<div class=\"col-12 log__box d-flex flex-column justify-content-center\">"
			              +"<div>"
			                 +"<div class=\"col-12 d-flex flex-column\">"
			                    +"<div>"
			                        +"<img class=\"img_upload\" id=\"image_section\" src=\"/myPage/assets/img/profile/"+dest_img+"\"/>"
			                 +"</div>"
			                    +"<div class=\"nickDiv\">"
			                       +"<h4 class=\"con_nick\" style=\"font-size : 30px; padding-top: 15px;\">"+dest_nickname+"</h4>"
			                 +"</div>"
			                 +"<form id=\"starSubmit\">"
			                        +"<div class=\"star-rating space-x-4 mx-auto\">"
			                       +"<input type=\"hidden\" name=\"mem_email\" value=\""+dest_email+"\"/>"
			                       +"<input type=\"radio\" id=\"5-stars\" name=\"rating\" value=\"5\" v-model=\"ratings\"/>"
			                       +"<label for=\"5-stars\" class=\"star\"><i class=\"fas fa-star\"></i></label>"
			                       +"<input type=\"radio\" id=\"4-stars\" name=\"rating\" value=\"4\" v-model=\"ratings\"/>"
			                       +"<label for=\"4-stars\" class=\"star\"><i class=\"fas fa-star\"></i></label>"
			                       +"<input type=\"radio\" id=\"3-stars\" name=\"rating\" value=\"3\" v-model=\"ratings\"/>"
			                       +"<label for=\"3-stars\" class=\"star\"><i class=\"fas fa-star\"></i></label>"
			                       +"<input type=\"radio\" id=\"2-stars\" name=\"rating\" value=\"2\" v-model=\"ratings\"/>"
			                       +"<label for=\"2-stars\" class=\"star\"><i class=\"fas fa-star\"></i></label>"
			                       +"<input type=\"radio\" id=\"1-star\" name=\"rating\" value=\"1\" v-model=\"ratings\" />"
			                       +"<label for=\"1-star\" class=\"star\"><i class=\"fas fa-star\"></i></label>"
			                    +"</div>"
			                 +"</form>"
			                 +"</div>"
			              +"</div>"
			            +"</div>"
			          +"</div>"
			          +"<div class=\"modal-footer\">"
			            +"<button type=\"button\" class=\"btn btn-primary\" disabled=\"true\" id=\"btn_starGrant\" data-dismiss=\"modal\">확인</button>"
			          +"</div>"
			        +"</div>"
			      +"</div>"
			    +"</div>"
			  +"</div>";
	    $("body").append(html);
}
  
  function rateIt() {
	  ratings = { destRatingScore: $("#destratingScore").val()*1 }//////<-별점 inserthere
	  totalRating = 5;
	  table = document.querySelector('#destRatingStar');
    for (rating in ratings) {
      ratingPercentage = ratings[rating] / totalRating * 100;
      ratingRounded = Math.round(ratingPercentage / 10) * 10 + '%';
      star = table.querySelector("#"+rating+" .inner-star");
      console.log(rating);
      numberRating = table.querySelector("#"+rating+" .numberRating");
      star.style.width = ratingRounded;
    }
    console.log("endfor");
  }
//////////////////////////////////////////심부름
//현재 접속중인 유저의 채팅방 검색
  function getRoomKey(alertKey, errandKey, dest_email, area_no){
	  let checkRoom = firebase.database().ref("chatrooms").orderByChild("users/"+mem_email).equalTo(true);
		let cnt = 0;
		checkRoom.once('value', function(data){
			if(data.val()==null) {
				sendMsg(alertKey, errandKey, dest_email, area_no);
			}
		});
		checkRoom.once('child_added', function(data){
			cnt++;
		});
		let checkDest;
		checkRoom.once('child_added', function(data){
			if(data.val()!=null) {
				checkDest = firebase.database().ref("chatrooms/"+data.key+"/users/"+dest_email);
				checkDest.once('value', function(snapshot){
					//1.이미 대화한 적 있는 상대지만 채팅리스트가 아닌 제품상세페이지에서 대화하기 버튼 or 심부름 수행 버튼을 눌러 채팅방을 열 경우
					if(snapshot.val()!=null && roomKey=="null") {
						//createRoom(); 메세지를 보낼 때 대화방을 생성하는걸로 변경
						roomKey = data.key;
						sendMsg(alertKey, errandKey, dest_email, area_no);
						checkDest.off();
						checkRoom.off();
					}
					//2.처음 대화하는 상대라 채팅방을 새로 개설할 경우
					else if(--cnt==0) {
						console.log("new User");
						sendMsg(alertKey, errandKey, dest_email, area_no);
					}
				});
			}
			//채팅방이 하나도 없을 때(채팅이 처음인 유저)
			else
				sendMsg(alertKey, errandKey, dest_email, area_no);
		});	
  }
  //심부름 시작할 때 메세지 보내는 함수
  function sendMsg(alertKey, errandKey, dest_email, area_no) {
	  console.log("sendMSg");
		if(roomKey=="null")
			createRoom(dest_email);
		//메세지를 파이어베이스에 저장
		let reading = firebase.database().ref("chatrooms/" + roomKey + "/comments");
		reading.push().set({
			message : "[심부름이 시작되었습니다]",
			timestamp : getTime(),
			uid : mem_email,
			read : 1
		}, function(error){
			if (error) {
			   console.log('Data could not be saved.' + error);
			 } else {
					refArea.child(area_no).child("errand").child(errandKey).once('value', function(snapshot){
						let data = snapshot.val();
						$.ajax({
							type:'post',
							url:'/member/jsonSelectMember.nds',
							data:{"mem_email":mem_email},
							dataType:'json',
							success:function(data2){
								console.log("mem_email_full="+data2.MEM_EMAIL);
								let mem_email_full = data2.MEM_EMAIL;
								$.ajax({
									type:'post',
									url:'/member/jsonSelectMember.nds',
									data:{"mem_email":dest_email},
									dataType:'json',
									success:function(data3){
										console.log("dest_email_full="+data3.MEM_EMAIL);
										let dest_email_full = data3.MEM_EMAIL;
							            $.ajax({
											type:'post',
											url:'/errand/insertErrand.nds',
											data:{
													"errandKey":errandKey,
								                    "errand_item":data.errand_item,
								                    "errand_request_date":data.errand_request_date,
								                    "errand_start_date":getTime(),
								                    "errand_item_price_req":data.errand_item_price_req,
								                    "errand_price":data.errand_price,
								                    "errand_total_price":data.errand_total_price,
								                    "errand_content":data.errand_content,
								                    "errand_status":"P",
								                    "mem_email_req":mem_email_full,
								                    "mem_email_nds":dest_email_full,
								                    "errand_lat":data.errand_lat,
								                    "errand_lon":data.errand_lng,
								                    "req_isShow":"T",
								                    "nds_isShow":"T"
											},
											success:function(data){
												$.ajax({
													type:'post',
													url:'/errand/insertErrandInfo.nds',
													data:{"errandKey":errandKey},
													success:function(data){
														console.log("ajax success");
											            acceptErrand(errandKey, dest_email, area_no);
											            refAlert.child(alertKey).remove();
//		 									            refAlert.child(alertKey).update({ active : 0 });
											            window.open('/mainPage/chatroom.jsp?dest_email='+dest_email+'','','width=550px, height=701px');
													},
													error:function(e){
														console.log(e);
													}
												});
											},
											error:function(e){
												console.log(e);
											}
							            });
									},
									error:function(e){
										console.log(e);
									}
								});
							},
							error:function(e){
								console.log(e);
							}
						});
					});
			   }
		});
		//unread를 1씩 올려주는 트랜잭션
		let updates = {};
		updates["chatrooms/"+roomKey+"/unread/"+dest_email] = firebase.database.ServerValue.increment(1);
		firebase.database().ref().update(updates);
	}
	//채팅방 새로 개설
	function createRoom(dest_email) {
		let newKey = firebase.database().ref("chatrooms").push().key;
		roomKey = newKey; //새로운 채팅방 고유 키 생성
		//생성한 고유 키로 테이블을 만들고 그 안에 유저 정보 저장
		let reading = firebase.database().ref("chatrooms/"+newKey);
		reading.set({
			users : {
				[mem_email] : true,
				[dest_email] : true
			},
			unread : {
				[mem_email] : 0,
				[dest_email] : 0
			}
		});
//		init();
	}
  //수락할 시 status를 1로 설정
  function acceptErrand(errandKey, rider, area_no) {
    refArea.child(area_no).child("errand").child(errandKey).once('value', function(snapshot){
      let alertData = {
          content : snapshot.val().errand_item+" 심부름 배달 요청이 수락되었습니다. 심부름을 시작하세요!",
          type : "acceptedErrand",
          timestamp : getTime(),
          active : 1,
          errandKey : errandKey,
          requester : mem_email
      };
      firebase.database().ref("alert/"+rider).push().update(alertData);
      alertData = {
          content : snapshot.val().errand_item+" 심부름 배달 요청을 수락하셨습니다. 심부름이 시작됩니다!",
          type : "acceptErrand",
          timestamp : getTime(),
          active : 1,
          errandKey : errandKey,
          rider : rider
      };
      refAlert.push().update(alertData);
//       let updData = {
//         status : 1
//       };
//       refErrand.child(errandKey).update(updData);
      refArea.child(area_no).child("errand").child(errandKey).remove();
      refArea.child("errand").child(mem_email).child(errandKey).remove();
    });
  }
  //거부할 시 rider를 ""로 설정
  function refuseErrand(errandKey, rider, area_no) {
	  refArea.child(area_no).child("errand").child(errandKey).once('value', function(snapshot){
      let alertData = {
          content : snapshot.val().errand_item+" 심부름 배달 요청이 거절되었습니다.",
          type : "refusedErrand",
          timestamp : getTime(),
          active : 1
      };
      firebase.database().ref("alert/"+rider).push().update(alertData);
      alertData = {
          content : snapshot.val().errand_item+" 심부름 배달 요청을 거절하셨습니다.",
          type : "refuseErrand",
          timestamp : getTime(),
          active : 1
      };
      refAlert.push().update(alertData);
      let updData = {
        rider : ""
      };
      refArea.child(area_no).child("errand").child(errandKey).update(updData);
    });
  }
</script>