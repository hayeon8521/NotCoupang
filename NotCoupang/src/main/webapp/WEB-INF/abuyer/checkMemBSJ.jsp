<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>회원체크</title>
<!-- Bootstrap CSS -->
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet" />
<!-- Bootstrap 아이콘 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" />
<link rel="stylesheet" href="styles/styles2.css" />
<!--내 CSS 연동-->
</head>

<!-- 세션 -->
<%
    String LOGID = (String) session.getAttribute("LOGID");
    String LOGNAME = (String) session.getAttribute("LOGNAME");
    String MEMBERDIVISION = (String) session.getAttribute("MEMBERDIVISION");
%>


<body>
<form action="checkMem.do" method="post">
	<div class="container mt-5 w-75" style="width: 1300px; height:1000px;  background-color: white;">
		<table class="table">
			<thead>
				<h3 class="fw-bold">회원정보확인</h3>
				<div class="border-bottom border-2">
					<span class="text-primary">${LOGID }</span> 님의 정보를 안전하게 보호하기 위해 비밀번호를 다시
					한번 확인 합니다.
			</thead>
			</div>
			</thead>

			<tr>
				<th class="col-3" style="background-color: #EEF1F8;">아이디(이메일)</th>
				<td><input type="text" readonly class="form-control-plaintext"
					id="staticID" name="staticID" value="${LOGID }" /></td>
			</tr>
			<tr>
				<th class="col-3" style="background-color: #EEF1F8;">비밀번호</th>
				<td><input type="password" class="form-control w-50"
					id="inputPassword" name="inputPassword" /></td>
			</tr>
		</table>
		<div class="container col-sm-3 text-center">
			<button class="btn btn-sm btn-primary" type="submit">수정</button>
			<button class="btn btn-sm btn-secondary">취소</button>
		</div>
	</div>
	</form>



	<!-- JS -->
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
