<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/style.css"/>
<link rel="stylesheet" href="../css/title.css"/>
<link rel="stylesheet" href="../css/support.css"/>
<link rel="stylesheet" href="../css/topbar.css"/>
<link rel="stylesheet" href="../css/index.css"/>
<title>관리자 페이지 - 메인</title>
</head>
<body>
		<header>
		<jsp:include page="../inc/title.jsp"/>
		<jsp:include page="../menubar/adminTopbar.jsp"/>
	</header>
	<div id="wrap">
		<p>관리자 전용 페이지에 접속하셨습니다.</p>
		<p>제공하는 서비스 목록은 다음과 같습니다</p>
		<br /><br />
		<div class="content">
			<p>1. 풋살장 신규 등록하기</p>
			<p>등록하실 풋살장의 이름과 위치를 입력하여 추가 하실 수 있습니다.</p>
			<p>2. 예약 삭제</p>
			<p>풋살장에 대한 예약을 취소할 수 있습니다.</p>
		</div>
		<br /><br />
		<p>우측 상단의 메뉴바를 통해서 기능을 사용하실 수 있습니다.</p>
		<p>서비스와 관련하여 문의사항이 있다면 하단에 안내된 전화번호로 연락하실 수 있습니다.</p>
	</div>
	<footer class="footer">	
		<jsp:include page="../inc/support.jsp"/>
	</footer>
</body>
</html>