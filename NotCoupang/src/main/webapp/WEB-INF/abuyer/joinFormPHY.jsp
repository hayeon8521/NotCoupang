<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  <!-- 날짜 포멧 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x" %>
<!DOCTYPE html>
<html>
<head>
<!-- 기본 기능 선언부 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="js/hayeonPHY.js"></script>
<title>낫쿠 - 회원가입 페이지</title>
<!-- 기본 기능 선언부 끝 -->
 <script>
	const queryString = window.location.search;
	const urlParams = new URLSearchParams(queryString);
	const division = urlParams.get("division");
	console.log("division 값:", division);
 </script>
<style>
.sidediv {
	width: 100%;
	border: 1px solid #999;
	text-align: center;
	display: flex;
	flex-direction: column;
	align-items: center;
}

.table {
	text-align: center;
	width: 500px;
	border: 1px solid forestgreen;
	margin: 0px;
	padding: 0px;
}

img {
	margin-bottom: 20px;
	width: 195px;
	height: 46px;
}

h1 {
	padding-top: 48px;
}
#idconfig, #pwconfig {
	font-size: 0.8em;
	color: red;
	text-align: left;
	font-weight: bold;
}
</style>
<%
    String LOGID = (String) session.getAttribute("LOGID");
    String LOGNAME = (String) session.getAttribute("LOGNAME");
    String MEMBERDIVISION = (String) session.getAttribute("MEMBERDIVISION");

    if (MEMBERDIVISION != null) {
        if (MEMBERDIVISION.equals("buyer")) {
%>
            <script>
                window.location.replace("/NotCoupang/main.do");
            </script>
<%
        } else if (MEMBERDIVISION.equals("seller")) {
%>
            <script>
                window.location.replace("/NotCoupang/admin.do");
            </script>
<%
        }
    }
%>
</head>
<body>
<!-- 메인페이지 완료되면 리다액션 위치 수정필요 (js, 로고이미지, 세션) -->

<div class="sidediv">
	<h1>
		<a href="/NotCoupang/main.do">
			<img src="images/logo.png" alt="Logo">
	  </a>
	</h1>
	<table class="table">
		<tr>
			<th colspan="2">회원가입</th>
		</tr>
		<!-- 아이디 -->
		<tr>
			<td colspan="2">
				<div class="input-group mb-3">
					<span class="input-group-text" id="basic-addon1">👩‍🚀</span>
					<input type="text" id="id" name="id" class="form-control" placeholder="ID을 입력해주세요" onblur="foucsOutjoinId()" aria-label="Username" aria-describedby="basic-addon1">
				 </div>
			</td>
		</tr>
		<tr>
			<td id="idconfig" colspan="2"></td>
		</tr>
		<!-- 비밀번호 -->
		<tr>
			<td colspan="2">
				<div class="input-group mb-3">
					<span class="input-group-text" id="basic-addon1">🔐</span>
					<input type="text" id="pw" name="pw" class="form-control" placeholder="비밀번호" onblur="foucsOutjoinPw()" aria-label="Username" aria-describedby="basic-addon1">
				 </div>
			</td>
		</tr>
		<tr>
			<td id="pwconfig" colspan="2"></td>
		</tr>
		<!-- 비밀번호 확인 -->
		<tr>
			<td colspan="2">
				<div class="input-group mb-3">
					<span class="input-group-text" id="basic-addon1">🔑</span>
					<input type="text" id="pwcf" name="pwcf" class="form-control" placeholder="비밀번호 확인" onblur="foucsOutjoinIdPwCF()" aria-label="Username" aria-describedby="basic-addon1">
				 </div>
			</td>
		</tr>
		<tr>
			<td id="pwcfconfig" colspan="2"></td>
		</tr>
		<!-- 이름 -->
		<tr>
			<td colspan="2">
				<div class="input-group mb-3">
					<span class="input-group-text" id="basic-addon1">👨‍💻</span>
					<input type="text" id="fname" name="fname" class="form-control" placeholder="이름" onblur="foucsOutjoinName()" aria-label="Username" aria-describedby="basic-addon1">
				 </div>
			</td>
		</tr>
		<tr>
			<td id="nameconfig" colspan="2"></td>
		</tr>
		<!-- 별명 -->
		<tr>
			<td colspan="2">
				<div class="input-group mb-3">
					<span class="input-group-text" id="basic-addon1">👩‍💻</span>
					<input type="text" id="nick" name="nick" class="form-control" placeholder="별명" onblur="foucsOutjoinNick()" aria-label="Username" aria-describedby="basic-addon1">
				 </div>
			</td>
		</tr>
		<tr>
			<td id="nickconfig" colspan="2"></td>
		</tr>
		<!-- 연락처 -->
		<tr>
			<td colspan="2">
				<div class="input-group mb-3">
					<span class="input-group-text" id="basic-addon1">📱</span>
					<input type="text" id="phone" name="phone" class="form-control" placeholder="휴대폰 번호" onblur="foucsOutjoinPhone()" aria-label="Username" aria-describedby="basic-addon1">
				 </div>
			</td>
		</tr>
		<tr>
			<td id="phoneconfig" colspan="2"></td>
		</tr>
		<!-- 주소 -->
		<tr>
			<td colspan="2">
				<div class="input-group mb-3">
					<span class="input-group-text" id="basic-addon1">🏡</span>
					<input type="text" id="addres" name="addres" class="form-control" placeholder="주소" onblur="foucsOutjoinAddres()" aria-label="Username" aria-describedby="basic-addon1">
				 </div>
			</td>
		</tr>
		<tr>
			<td id="addresconfig" colspan="2"></td>
		</tr>

		<tr>
			<td colspan="2">
				<div class="d-grid gap-2">
					<button class="btn btn-primary" type="button" onclick="loginAction();">동의하고 가입하기</button>
				</div>
			</td>
		</tr>
		<tr>
			<td colspan="2">기타 설명들</td>
		</tr>
		<tr>
			<td colspan="2">©Fyou Corp - Project NotCoupang. All rights
				reserved.</td>
		</tr>
	</table>
</div>
</body>
</html>