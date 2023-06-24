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
			<a href="../page/main.jsp?target=reserveDate">예약 하기</a>
			&nbsp; &nbsp; &nbsp;
			<a href="../page/history.jsp?page=1">예약 내역</a>
			&nbsp; &nbsp; &nbsp;
			<a href="../page/main.jsp?target=reviewWrite">리뷰 작성</a>
			&nbsp; &nbsp; &nbsp;
			<a href="../page/review.jsp">리뷰 조회</a>
		</c:otherwise>
	</c:choose>
</div>