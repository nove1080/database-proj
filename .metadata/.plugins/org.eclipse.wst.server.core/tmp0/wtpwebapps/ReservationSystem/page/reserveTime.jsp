<%@ page import="dto.FieldDTO"%>
<%@ page import="dao.FieldDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String fid = request.getParameter("fid");
String date = request.getParameter("date");
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
	<!-- jQuery Timepicker 로드 -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
	<title>풋살장 예약 시스템 - 예약하기(time)</title>
	<script>
		$(function() {
			// timepicker 설정
			$("#starttimepicker, #endtimepicker").timepicker({
				timeFormat : 'HH:mm',
				interval : 30,
				minTime : '11:00',
				maxTime : '18:00',
				defaultTime : '10',
				startTime : '11:00',
				disableTextInput: true,
				dynamic : false,
				dropdown : true,
				scrollbar : true,
				disableTimeRanges : [ [ '11:29', '12:01' ]]
			});
		});
		function validateForm(form) {
			var startTime = form.startTime.value;
			var endTime = form.endTime.value;

			// startTime과 endTime이 빈 문자열인 경우
			if (startTime.trim() === "" || endTime.trim() === "") {
				alert("시작 시간과 종료 시간을 모두 지정해주세요");
				return false;
			}

			// startTime과 endTime을 시간 형식으로 파싱
			var startTimeObj = new Date("1970-01-01T" + startTime + ":00Z");
			var endTimeObj = new Date("1970-01-01T" + endTime + ":00Z");

			// startTime이 endTime보다 늦은 경우
			if (startTimeObj >= endTimeObj) {
				alert("종료 시간은 시작 시간보다 뒤에 있어야 합니다");
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
			<form action="../process/reserveProcess.jsp" method="POST"
				onsubmit="return validateForm(this);">
				<label for="starttimepicker">대여 시작 시간:</label>
				<input type="text" id="starttimepicker" name="startTime"><br><br>
				<label for="endtimepicker">대여 종료 시간:</label>
				<input type="text" id="endtimepicker" name="endTime"><br><br>
				<input type="hidden" name="date" value=<%= date %>/>
				<input type="hidden" name="fid" value=<%= fid %> />
				<input type="submit" value="예약">
			</form>
		</div>
	</div>
	<footer class="footer">	
		<jsp:include page="../inc/support.jsp"/>
	</footer>
</body>
</html>
