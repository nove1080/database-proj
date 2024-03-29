<%@ page import="dto.FieldDTO"%>
<%@ page import="dao.FieldDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String fid = request.getParameter("fid");
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
	<link rel="stylesheet" href="../css/reserve.css"/>
	<!-- jQuery 라이브러리 로드 -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<!-- jQuery UI 로드 -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
	<script src="//code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
	<title>풋살장 예약 시스템 - 예약하기(Date)</title>
	<script>
		$(function() {
			// datepicker 설정
			$("#datepicker").datepicker({
				dateFormat: "yy-mm-dd", // 선택한 날짜의 출력 형식
				showAnim: "fadeIn", // 애니메이션 효과 설정
				minDate: 0 // 선택 가능한 최소 날짜를 오늘로 설정
			});

		});
		function validateForm(form) {
			var date = form.date.value;
			if (date === "") {
				alert("날짜를 선택해주세요.");
				return false;
			}
			return true;
		}
	</script>
</head>
<body>
	<header>
		<jsp:include page="../inc/title.jsp"/>
		<jsp:include page="../menubar/topbar.jsp"/>
	</header>
		<div id="wrap">
			<h2><%= dto.getFname() %></h2>
			<div class="reservation-form-container">
				<form action="../page/reserveTime.jsp?fid=<%=fid %>" method="POST"
						onsubmit="return validateForm(this);">
					<label for="datepicker">희망 날짜:</label>
					<input type="text" id="datepicker" name="date">
					<input type="submit" value="다음">
				</form>
			</div>
		</div>
	<footer class="footer">	
		<jsp:include page="../inc/support.jsp"/>
	</footer>
</body>
</html>