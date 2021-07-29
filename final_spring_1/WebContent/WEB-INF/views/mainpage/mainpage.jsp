<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 비회원이라면
	if(session.getAttribute("login")==null){
		out.print("로그인이 필요합니다.\n");	
	// 아이디가 저장되어 있는 회원이라면, 아이디를 자동으로 띄워주어야 함.
	} else if(request.getAttribute("savedId")!=null && request.getAttribute("savedId").toString().length()>0){
		out.print("저장한 아이디 ===> "+request.getAttribute("savedId").toString()+"\n");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
</head>
<body>
	메인페이지입니다.
</body>
</html>