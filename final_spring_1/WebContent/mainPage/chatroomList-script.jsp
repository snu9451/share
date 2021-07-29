
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	Map<String, Object> login = new HashMap<>();
	//String mem_nickname = null;	// 전역에서 사용되는 정보
	String mem_email = null;	// 전역에서 사용되는 정보
	login = (Map<String, Object>)session.getAttribute("login");
	if(session.getAttribute("login") != null){
		//mem_nickname = login.get("MEM_NICKNAME").toString();
		mem_email = login.get("MEM_EMAIL").toString();
		int indexOfDot = mem_email.indexOf(".");
		if(indexOfDot>=0){
			mem_email = mem_email.substring(0,indexOfDot);
		}
	}
	/* =================안드로이드를 위한 코드 추가=====================[김은영] */
	else if(request.getHeader("mem_email") != null) {
		mem_email = (String)request.getHeader("mem_email");
		System.out.println("이메일: "+mem_email);
		login = new HashMap<>();
		login.put("MEM_EMAIL", mem_email);
		session.setAttribute("login", login);
		int indexOfDot = mem_email.indexOf(".");
		if(indexOfDot>=0){
			mem_email = mem_email.substring(0,indexOfDot);
		}
		System.out.println("안드로이드에서 로그인한 이메일: " + mem_email);
	}
	/* =================안드로이드를 위한 코드 추가=====================[김은영] */
	else{
%>
<script type="text/javascript">
		alert("로그인 세션이 만료됐습니다. 다시 로그인 해주세요");
		window.close();
</script>
<%
	}
	
//	String nickname = request.getParameter("nickname");
	
// /*	/\/\/\/\/\/\/\/\/\/\테스트용/\/\/\/\/\/\/\/\/\/\/\		*/
// 	String nickname = ;
// /*	\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/	*/
%>
  <script defer src="https://www.gstatic.com/firebasejs/8.6.8/firebase-app.js"></script>
  <script defer src="https://www.gstatic.com/firebasejs/8.6.8/firebase-database.js"></script>
  <script defer src="../common/init-firebase.js"></script>
<script type="text/javascript">
	let mem_email = "<%=mem_email%>";
	let dest_nickname = "";//상대방의 닉네임
	let dest_email = "";
	let dest_img = "";
	let lastMsg = "";//마지막 메세지
	let timestamp = "";//메세지 보낸 시각
	let unreads = "";//안읽은 메세지 수
	$(document).ready(function(){
		let reading = firebase.database().ref("chatrooms").orderByChild("users/"+mem_email).equalTo(true);
		reading.on('child_added', test_child_added);
		reading.on('child_changed', test_child_changed);
	});
	//채팅방 목록 불러와서 화면에 보여주기 & 새로운 채팅방이 추가되는지 감시
	function test_child_added(data) {
		console.log("addeddataval="+data.key);
		console.log("ADD");
		let key = data.key;
		let userData = firebase.database().ref("chatrooms/"+key).child("users");
		let msgData = firebase.database().ref("chatrooms/"+key).child("comments").limitToLast(1);
		let readData = firebase.database().ref("chatrooms/"+key+"/unread/"+mem_email);
		//collection에 대화방 추가
		msgData.once('value', function(data){
			console.log("datakey"+data.key);
			console.log("dataval"+data.val());
			if(!(data.val()==null || data.val()=="null")) {
				msgData.once('child_added', getMsgData);
				userData.once('child_added', getUserData);
		        let html =
		            "<li id='"+key+"' class=\"collection-item avatar\" onclick=\"enterChatroom(this.id,'"+dest_email+"');\" >" +
		            "<img class='profile' src=\"../myPage/assets/img/profile/"+dest_img+"\"/>" +
		            "<span class=\"dest\"><b>" + dest_nickname + "</b></span>" +
		            "<p class='msg'>" + lastMsg + "<br>" +
		            "</p>" +
		            "<p class='timestamp'>" + timestamp + "<br>" +
		            "</p>" +
		            "<a href=\"#!\" class=\"secondary-content\"><i id='unreads'>"+unreads+"</i></a>"+
		            "</li>";
		        $(".collection").html(html+$(".collection").html());
				//안읽은 메세지 수 표시
				readData.get().then(function(snapshot){
			        console.log("A"+snapshot.val());
					if(snapshot.val()!=0)
						$("#"+key).children("a").children("i").text(snapshot.val());
					else
						$("#"+key).children("a").children("i").text("");
				});
				$.ajax({
					type:'post',
					url:'/member/jsonSelectMember.nds',
					data:{"mem_email":dest_email},
					dataType:'json',
					success:function(data){
						console.log("ajax success for "+data.MEM_NICKNAME);
						$("#"+key).find("img.profile").attr("src","../myPage/assets/img/profile/"+data.MEM_IMG);
						$("#"+key).find("span.dest").children("b").text(data.MEM_NICKNAME);
					},
					error:function(e){
						console.log(e);
					}
				});
			}
		});
	}
	//채팅방의 내용이 바뀌는지 감시
	function test_child_changed(data) {
		console.log("changeddata="+data.key);
		let key = data.key;
		let userData = firebase.database().ref("chatrooms/"+key).child("users");
		let msgData = firebase.database().ref("chatrooms/"+key).child("comments").limitToLast(1);
		let readData = firebase.database().ref("chatrooms/"+key+"/unread/"+mem_email);
		//안읽은 메세지 수 표시
		readData.get().then(function(snapshot){
			if(snapshot.val()!=0)
				$("#"+key).children("a").children("i").text(snapshot.val());
			else
				$("#"+key).children("a").children("i").text("");
		});
		msgData.once('child_added', getMsgData);
		userData.once('child_added', getUserData);
		if(document.querySelector("#"+key)==null) {
			console.log("run");
	        let html =
	            "<li id='"+key+"' class=\"collection-item avatar\" onclick=\"enterChatroom(this.id,'"+dest_email+"');\" >" +
	            "<img class='profile' src=\"../myPage/assets/img/profile/"+dest_img+"\"/>" +
	            "<span class=\"dest\"><b>" + dest_nickname + "</b></span>" +
	            "<p class='msg'>" + lastMsg + "<br>" +
	            "</p>" +
	            "<p class='timestamp'>" + timestamp + "<br>" +
	            "</p>" +
	            "<a href=\"#!\" class=\"secondary-content\"><i id='unreads'>"+unreads+"</i></a>"+
	            "</li>";
	        $(".collection").append(html);
		}
        $("#"+key+" > .timestamp").text(timestamp);
        $("#"+key+" > .msg").text(lastMsg);
	}
	//상대방의 닉네임을 dest_nickname변수에 저장
	function getUserData(data){
		console.log("getUserData="+data.key);
		if(data.key != mem_email) {
			dest_email = data.key;
		}
	}
	//마지막 메세지의 내용과 시간을 가져옴
	function getMsgData(data){
		console.log("getMsgData="+data.key);
		lastMsg = data.val().message;
		timestamp = data.val().timestamp;
		console.log("lastMsg="+lastMsg);
		console.log("timeStamp="+timestamp);
	}
	//채팅방에 입장할 때 채팅방 고유 번호, 자신의 닉네임, 상대의 닉네임을 전달
	function enterChatroom(roomKey,pr_dest_email){
		$("#roomKey").val(roomKey);
		$("#mem_email").val(mem_email);
		$("#dest_email").val(pr_dest_email);
		$("#destForm").submit();
	}
	//Preloader
	$(window).on("load", function () {
	  if ($("#preloader").length) {
	    $("#preloader")
	      .delay(800)
	      .fadeOut("slow", function () {
	        $(this).remove();
	      });
	  }
	});
</script>