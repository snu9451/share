<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

//	String nickname = request.getParameter("nickname");
	
/*	/\/\/\/\/\/\/\/\/\/\테스트용/\/\/\/\/\/\/\/\/\/\/\		*/
	String nickname = mem_email;
/*	\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/	*/
%>
<script type="text/javascript">
	let roomArr=[];
	let prevSum = 0;
	let nickname = "<%=nickname%>";//현재 접속자의 닉네임
	nickname = nickname.substr(0,nickname.length-4);
    let msgDd = $("#messagesDropdown").children("span");//안읽은 총 메세지 수
	$(document).ready(function(){
		let reading = firebase.database().ref("chatrooms").orderByChild("users/"+nickname).equalTo(true);
		reading.on('child_added', test_child_added);
		reading.on('child_changed', test_child_changed);
	});
	//채팅방 목록 불러와서 화면에 보여주기 & 새로운 채팅방이 추가되는지 감시
	function test_child_added(data) {
		console.log("ADD");
		let key = data.key;
		let readData = firebase.database().ref("chatrooms/"+key+"/unread/"+nickname);
		readData.get().then(function(snapshot){
			if(!(snapshot.val()==null || snapshot.val()=="null")) {
		        console.log("A"+snapshot.val()*1);
		        let html = "<input c_id='"+key+"' type='hidden' value="+snapshot.val()*1+">";
		        $("body").append(html);
		        roomArr.push(key);
		        updUnreadNum();
			}
		});
	}
	//채팅방의 내용이 바뀌는지 감시
	function test_child_changed(data) {
		console.log("CHANGE");
		let key = data.key;
		let toast = false;
		let readData = firebase.database().ref("chatrooms/"+key+"/unread/"+nickname);
		readData.get().then(function(snapshot){
			if(!(snapshot.val()==null || snapshot.val()=="null")) {
		        console.log("C"+snapshot.val());
		        let unreadNum = $("[c_id="+key+"]");
		        unreadNum.val(snapshot.val()*1);
		        updUnreadNum();
			}
		});
	}
	//안읽은 총 메세지 수 업데이트
	function updUnreadNum(){
		let sum = 0;
		for(let i of roomArr) {
			sum += $("[c_id="+i+"]").val()*1;
		}
		for(let i=0;i<sum-prevSum;i++)
	        toast("메세지 알림", "새로운 메세지가 있습니다.");
		msgDd.text(sum);
		prevSum = sum;
	}
</script>