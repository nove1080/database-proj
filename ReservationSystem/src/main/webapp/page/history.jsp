<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.sql.Date"%>
<%@ page import="utils.BoardPage" %>
<%@ page import="dto.ReservationDTO" %>
<%@ page import="dao.ReservationDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../process/isLoggedIn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>풋살장 예약 시스템 - 예약 조회</title>
<link rel="stylesheet" href="../css/style.css"/>
<link rel="stylesheet" href="../css/title.css"/>
<link rel="stylesheet" href="../css/support.css"/>
<link rel="stylesheet" href="../css/topbar.css"/>
<link rel="stylesheet" href="../css/paging.css"/>
<link rel="stylesheet" href="../css/history.css" />
</head>
<body>
	<header>
		<jsp:include page="../inc/title.jsp"/>
		<jsp:include page="../menubar/topbar.jsp"/>
	</header>
	<div id="wrap">
		<h2>예약 조회</h2>
		<jsp:include page="../inc/reservationList.jsp"/>
	</div>
	<footer class="footer">	
		<jsp:include page="../inc/support.jsp"/>
	</footer>
</body>
</html>