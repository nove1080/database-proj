<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String mid = "";
if(session.getAttribute("userMid") != null) {
	mid = session.getAttribute("userMid").toString();
}
String url = "../page/index.jsp";
if(mid.equals("system")) {
	url = "../page/admin.jsp";
}
%>
<div class="title">
	<img src="../image/logo.png" alt="logo" width="100px">
	<a href="<%= url %>">
		전남대학교 풋살장 예약 시스템
	</a>
</div>