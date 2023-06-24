<!-- 동작 -->
<!-- 1. target : QueryString으로 어떤 서비스에 대한 풋살장 선택인지 url 제공하기 -->
<%@ page import="dto.FieldDTO"%>
<%@ page import="dao.FieldDAO"%>
<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String target = request.getParameter("target");
FieldDAO dao = new FieldDAO(application);
List<FieldDTO> list = dao.getAllFieldList();
dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/style.css"/>
<link rel="stylesheet" href="../css/title.css"/>
<link rel="stylesheet" href="../css/support.css"/>
<link rel="stylesheet" href="../css/main.css"/>
<link rel="stylesheet" href="../css/topbar.css"/>
<title>풋살장 예약 시스템 - 메인페이지</title>
</head>
<body>
	<c:import url="../process/isLoggedIn.jsp"/>
	<header>
		<jsp:include page="../inc/title.jsp"/>
		<jsp:include page="../menubar/topbar.jsp"/>
	</header>
	<div id="wrap">
		<h2>서비스를 이용할 풋살장을 선택해주세요</h2>
		<form action="<%= target %>.jsp">
			<select name="fid">
				<c:forEach items="<%= list %>" var="field">
					<option value="${ field.getFid() }">${ field.getFname() } - ${ field.getLocation() }</option>
				</c:forEach>
			</select>
			<input type="submit" value="선택완료"/>
		</form>
	</div>
	<footer class="footer">	
		<jsp:include page="../inc/support.jsp"/>
	</footer>
</body>
</html>