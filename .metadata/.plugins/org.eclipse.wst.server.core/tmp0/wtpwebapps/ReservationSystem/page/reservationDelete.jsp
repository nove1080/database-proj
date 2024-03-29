<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/style.css"/>
<link rel="stylesheet" href="../css/title.css"/>
<link rel="stylesheet" href="../css/support.css"/>
<link rel="stylesheet" href="../css/topbar.css"/>
<link rel="stylesheet" href="../css/paging.css"/>
<link rel="stylesheet" href="../css/history.css"/>
<title>관리자 페이지 - 예약 삭제</title>
</head>
<body>
	<header>
		<jsp:include page="../inc/title.jsp"/>
		<jsp:include page="../menubar/adminTopbar.jsp"/>
	</header>
	<div id="wrap">
		<h2>예약 삭제</h2>
		<jsp:include page="../inc/reservationList.jsp"/>
	</div>
	<footer class="footer">	
		<jsp:include page="../inc/support.jsp"/>
	</footer>
</body>
</html>