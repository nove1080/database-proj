<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/style.css" />
<link rel="stylesheet" href="../css/title.css" />
<link rel="stylesheet" href="../css/support.css" />
<link rel="stylesheet" href="../css/topbar.css" />
<link rel="stylesheet" href="../css/fieldregisterform.css" />
<title>관리자 페이지 - 풋살장 등록</title>
</head>
<body>
<script>
  function validateForm() {
    var locationValue = document.getElementById("location").value;
    
    if (locationValue.includes("광주")) {
      // "광주"라는 텍스트가 포함된 경우 폼을 전송
      document.getElementById("registerfield").submit();
    } else {
      // "광주"라는 텍스트가 포함되지 않은 경우에 대한 처리 (예: 경고 메시지 표시)
      alert("광주광역시 풋살장만 추가 가능합니다.");
    }
  }
</script>
	<header>
		<jsp:include page="../inc/title.jsp" />
	</header>
	<div id="wrap">
		<h2>풋살장 추가하기</h2>
		<form action="../process/fieldRegisterProcess.jsp" method="get" id="registerfield">
			<div class="form-container">
				<table>
					<tr>
						<th>풋살장 이름</th>
						<td><input id="fname" type="text" name="newFname" placeholder="이름" /></td>
					</tr>
					<tr>
						<th>풋살장 위치</th>
						<td><input id="location" type="text" name="newLocation" placeholder="ex) 광주 북구 xx로 xxx" /></td>
					</tr>
				</table>
				<button type="button" id="addField" onclick="validateForm()">추가하기</button>
			</div>
		</form>
	</div>
	<footer class="footer">
		<jsp:include page="../inc/support.jsp" />
	</footer>
</body>
</html>