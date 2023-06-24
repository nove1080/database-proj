<%@ page import="utils.JSFunction" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/style.css"/>
<link rel="stylesheet" href="../css/title.css"/>
<link rel="stylesheet" href="../css/support.css"/>
<link rel="stylesheet" href="../css/loginform.css"/>
<link rel="stylesheet" href="../css/topbar.css"/>
<title>풋살장 예약 시스템 - 로그인</title>
</head>
<body>
	<%
	if (session.getAttribute("userMid") != null) {
		String mid = session.getAttribute("userMid").toString();
		if(mid.equals("system")) {
			String msg = "관리자 계정으로 접속하셨습니다.";
			String url = "../page/admin.jsp";
			JSFunction.alertLocation(msg, url, out);
		} else {
			String userMname = session.getAttribute("userMname").toString();
			String msg = userMname + "님 환영합니다.";
			String url = "main.jsp";
			JSFunction.alertLocation(msg, url, out);
		}
	}
	%>
	<header>
		<jsp:include page="../inc/title.jsp"/>
		<jsp:include page="../menubar/topbar.jsp"/>
	</header>
	<div id="wrap">
		<h2>Login</h2>
		<form action="../process/loginProcess.jsp" method="post">
			<div class="form-container">
				<table>
					<tr>
						<th>아이디</th>
						<td><input id="id" type="text" name="userMid" placeholder="ID"/></td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input id="pw" type="password" name="userPasswd" placeholder="PW"/></td>
					</tr>
				</table>
				<button type="submit" id="login">로그인</button>
				<button type="button" onclick="location.href='joinForm.jsp'" id="join">회원가입</button>
			</div>
		</form>	
	</div>
	<footer class="footer">	
		<jsp:include page="../inc/support.jsp"/>
	</footer>
</body>
</html>