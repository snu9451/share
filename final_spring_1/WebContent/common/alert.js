//지금안쓰는코드210706
    let refErrand = "";//errand테이블 접근할 주소
    let refRider = "";//rider테이블 접근할 주소
    let refAlert = "";//alert테이블 접근할 주소
    let my_lat = 0.0;//현재 자신의 위도
    let my_lng = 0.0;//현재 자신의 경도
    let mem_email = "rider@email";//현재 접속자의 이메일
    $(document).ready(function() {
      refErrand = firebase.database().ref("errand");
      refRider = firebase.database().ref("rider");
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
        refAlert.child(key).update({ active : 0 });
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
            makeModal(snapshot.key, snapVal.content, 1, "수락", "거절");
            $("#"+snapshot.key).find(".btn-primary").click(function(){
              acceptErrand(snapVal.errandKey, snapVal.rider);
              refAlert.child(snapshot.key).update({ active : 0 });
            });
            $("#"+snapshot.key).find(".btn-danger").removeAttr("data-dismiss");
            $("#"+snapshot.key).find(".btn-danger").click(function(){
			  $("#"+snapshot.key).find("#refuseNotice").removeAttr("style");
			  $("#"+snapshot.key).find("#refuse_detail_board").removeAttr("style");
			  $("#"+snapshot.key).find(".btn-danger").text("제출");
              $("#"+snapshot.key).find(".btn-danger").click(function(){
          	  	$("#"+snapshot.key).find(".btn-danger").attr("data-dismiss","modal");
	            refuseErrand(snapVal.errandKey, snapVal.rider);
	            refAlert.child(snapshot.key).update({ active : 0 });
			  });
            });
            $("#"+snapshot.key).modal("show");
          }
          else
            console.log("nothing");
        }
      });
    }
    //알림 모달 창 생성하는 함수
    function makeModal(alertKey, content, hasCancel = 0, btn_ok = "확인", btn_cancel = "취소", title = "알림"){
      let html =
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
				+"<div id=\"refuseNotice\"class=\"col-12 log__box d-flex flex-column justify-content-center\" style=\"display:none!important;\">거절 사유를 알려주세요.</div>"
				+"<textarea name=\"refuse_msg\" type=\"text\" class=\"form-control\" id=\"refuse_detail_board\" placeholder=\"상세 내용을 입력해주세요.\" rows=\"5\" style=\"display:none;\"></textarea>"
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
      $("body").append(html);
    }
  
  //////////////////////////////////////////심부름
    //수락할 시 status를 1로 설정
    function acceptErrand(errandKey, rider) {
      refErrand.child(errandKey).once('value', function(snapshot){
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
        let updData = {
          status : 1
        };
        refErrand.child(errandKey).update(updData);
      });
    }
    //거부할 시 rider를 ""로 설정
    function refuseErrand(errandKey, rider) {
      refErrand.child(errandKey).once('value', function(snapshot){
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
        refErrand.child(errandKey).update(updData);
      });
    }
  