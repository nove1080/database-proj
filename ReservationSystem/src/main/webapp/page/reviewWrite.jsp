<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dto.FieldDTO"%>
<%@ page import="dao.FieldDAO"%>
<%
String fid = request.getParameter("fid");
String mid = session.getAttribute("userMid").toString();

FieldDAO dao = new FieldDAO(application);
FieldDTO dto = dao.getField(fid);

dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/style.css"/>
<link rel="stylesheet" href="../css/title.css"/>
<link rel="stylesheet" href="../css/support.css"/>
<link rel="stylesheet" href="../css/topbar.css"/>
<link rel="stylesheet" href="../css/review.css"/>
<title>풋살장 예약 시스템 - 리뷰 작성</title>
</head>
<body>
	<header>
		<jsp:include page="../inc/title.jsp"/>
		<jsp:include page="../menubar/topbar.jsp"/>
	</header>
	<h2>리뷰 작성</h2>
	<div id="wrap">
	<form action="../process/reviewWriteProcess.jsp">
		<input type="hidden" name="mid" value="<%= mid %>"/>
		<input type="hidden" name="fid" value="<%= fid %>"/>
		<table align="center">
			<tr>
				<td>제목 : <input type="text" name="title"/></td>
			</tr>
			<tr>
				<td>내용 : <input type="text" name="content"/></td>
			</tr>
			<tr>
				<td><input type="submit" value="작성"/></td>
			</tr>
		</table>
	</form>
	</div>
	<footer class="footer">	
		<jsp:include page="../inc/support.jsp"/>
	</footer>
</body>
</html>