<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Pragma","no-cache");
response.setDateHeader("Expires",0);
%>

<script type="text/javascript">
$(document).ready(function(){
	/* 로그인 모달에서 로그인 버튼이 클릭되었을 때 */
	$('#h_logout').on('click',function(){
		console.log("로그아웃 버튼 클릭!");
		location.href="http://localhost:9696/member/doLogout.nds";
	});
});

</script>