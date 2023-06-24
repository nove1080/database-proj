<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="../css/topbar.css" />
<div class="top-bar">
	<c:choose>
		<c:when test="${ sessionScope.userMid == null }">
			<a href="../page/loginForm.jsp">로그인</a> 
		</c:when>
		<c:otherwise>
			<a href="../process/logout.jsp">로그아웃</a> 		
			&nbsp; &nbsp; &nbsp;
			<a href="../page/fieldRegisterForm.jsp">풋살장 등록</a>
			&nbsp; &nbsp; &nbsp;
			<a href="../page/reservationDelete.jsp">예약 삭제</a>
		</c:otherwise>
	</c:choose>
</div>