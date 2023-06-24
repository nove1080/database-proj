<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/style.css"/>
<link rel="stylesheet" href="../css/title.css"/>
<link rel="stylesheet" href="../css/support.css"/>
<link rel="stylesheet" href="../css/loginform.css"/>
<title>풋살장 예약 시스템 - 회원가입</title>
</head>
<script>
function validateForm(form) {
	const midPattern = /^[A-Za-z0-9]{6,12}$/;
	const mid = form.userMid.value;
	
	const pwPattern = /^[A-Za-z0-9]{6,12}$/;
	const pw = form.userPasswd.value;
	
	if (!midPattern.test(mid)) {
		alert("아이디는 숫자 혹은 영문자를 사용한 6~12자 이내로 설정");
		return false;
	}
	
	if (!pwPattern.test(pw)) {
		alert("비밀번호는 숫자 혹은 영문자를 사용한 6~12자 이내로 설정");
		return false;
	}
}
</script>
<body>
	<header>
		<jsp:include page="../inc/title.jsp"/>
	</header>
	<h2>Sign up</h2>
	<div id="wrap">
		<form action="../process/joinProcess.jsp" method="post"
			onsubmit="return validateForm(this);">
			<div class="form-container">
				<table>
					<tr>
						<th>아이디</th>
						<td><input type="text" name="userMid" placeholder="영문 혹은 숫자를 조합한 6~12자 이내"/></td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="text" name="userPasswd" placeholder="영문 혹은 숫자를 조합한 6~12자 이내"/></td>
					</tr>
					<tr>
						<th>이름</th>
						<td><input type="text" name="userMname" placeholder="이름"/></td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td><input type="text" name="userPhone" placeholder="'-'을 포함하여 입력"/></td>
					</tr>
				</table>		
			</div>
			<button type="submit" id="join">회원가입하기</button>
		</form>
	</div>
	<footer class="footer">	
		<jsp:include page="../inc/support.jsp"/>
	</footer>
</body>
</html>