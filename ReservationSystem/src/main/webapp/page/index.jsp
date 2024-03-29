<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/style.css"/>
<link rel="stylesheet" href="../css/title.css"/>
<link rel="stylesheet" href="../css/support.css"/>
<link rel="stylesheet" href="../css/topbar.css"/>
<link rel="stylesheet" href="../css/index.css"/>
<title>풋살장 예약 시스템</title>
</head>
<body>
	<header>
		<jsp:include page="../inc/title.jsp"/>
		<jsp:include page="../menubar/topbar.jsp"/>
	</header>
	<div id="wrap">
		<p>전남대학교 풋살장 예약 시스템에 접속하신 것을 환영합니다.</p>
		<p>제공하는 서비스 목록은 다음과 같습니다</p>
		<br /><br />
		<div class="content">
			<p>1. 예약 진행 하기</p>
			<p>원하시는 풋살장을 선택한 후 날짜와 시간을 선택하여 예약이 가능합니다.</p>
			<p>2. 리뷰 조회 하기</p>
			<p>풋살장에 대한 모든 리뷰를 확인할 수 있습니다.</p>
			<p>3. 예약 내역 확인하기</p>
			<p>현재 사용자의 풋살장 예약 내역을 볼 수 있습니다.</p>
		</div>
		<br /><br />
		<p>우측 상단의 로그인 버튼을 클릭하여 로그인 후에 서비스를 이용할 수 있습니다.</p>
		<p>서비스와 관련하여 문의사항이 있다면 하단에 안내된 전화번호로 연락하실 수 있습니다.</p>
	</div>
	<footer class="footer">	
		<jsp:include page="../inc/support.jsp"/>
	</footer>
</body>
</html>