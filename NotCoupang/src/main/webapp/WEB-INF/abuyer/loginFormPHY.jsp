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
<script src="js/PHY/hayeonPHY.js"></script>
<title>낫팡 - 로그인페이지</title>
<!-- 기본 기능 선언부 끝 -->
<style>
.sidediv {
	width: 100%;
	text-align: center;
	display: flex;
	flex-direction: column;
	align-items: center;
}

.table {
	text-align: center;
	width: 500px;
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
.spinnermap {
	position: fixed;
	top: 0;
	left: 0;
	width: 100vw;
	height: 100vh;
	background-color: rgba(0, 0, 0, 0.2);
	display: flex;
	justify-content: center;
	align-items: center;
	z-index: 9999;
	display: none;
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
                window.location.replace("/NotCoupang/welcome.do");
            </script>
<%
        } else if (MEMBERDIVISION.equals("seller")) {
%>
            <script>
            	//NotCoupang/Admin_main.do
                window.location.replace("/NotCoupang/Admin_main.do");
            </script>
<%
        }
    }
%>
</head>
<body>
<!-- 메인페이지 완료되면 리다액션 위치 수정필요 (js, 로고이미지, 세션) -->
<!-- 
<p><%=LOGID %></p>
<p><%=LOGNAME %></p>
<p><%=MEMBERDIVISION %></p>
 -->
 <div class="spinnermap">
	<div class="text-center">
		<div class="spinner-border text-primary" style="width: 5rem; height: 5rem;" role="status">
			<span class="visually-hidden">기다려!</span>
		</div>
	</div>
</div>

<div class="sidediv">
	<h1>
		<a href="/NotCoupang/welcome.do">
			<img src="images/logo.png" alt="Logo">
	  </a>
	</h1>
	<table class="table table-borderless">
		<tr>
			<th colspan="2" style="border-bottom: 3px solid #4285f4;"><span style="color: #4285f4;">회원 로그인</span></th>
		</tr>
		<tr>
			<td colspan="2"  style="padding-top: 10px; padding-right: 0px; padding-left: 0px; padding-bottom: 0px;">
				<div class="input-group mb-0">
					<span class="input-group-text" id="basic-addon1">🔐</span>
					<input type="text" id="id" name="id" class="form-control" placeholder="Enter your ID" onblur="foucsOutId()" aria-label="Username" aria-describedby="basic-addon1">
				 </div>
			</td>
		</tr>
		<tr>
			<td id="idconfig" colspan="2"></td>
		</tr>
		<tr>
			<td colspan="2"  style="padding-top: 0px; padding-right: 0px; padding-left: 0px; padding-bottom: 0px;">
				<div class="input-group mb-0">
					<span class="input-group-text" id="basic-addon1">🔑</span>
					<input type="password" id="pw" name="pw" class="form-control" placeholder="Enter your PW" onblur="foucsOutPw()" aria-label="Username" aria-describedby="basic-addon1">
				 </div>
			</td>
		</tr>
		<tr>
			<td id="pwconfig" colspan="2"></td>
		</tr>
		<tr>
			<td colspan="2">
				<div class="d-grid gap-2">
					<button class="btn btn-primary" type="button" onclick="loginAction();">로그인</button>
				</div>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<div class="d-flex gap-2 w-100 mx-auto">
				    <button class="btn btn-outline-primary" style="width: 100%;" type="button" onclick="joinAction('buyer');">구매자회원가입</button>
				    <button class="btn btn-outline-primary" style="width: 100%;" type="button" onclick="joinAction('seller');">사업자회원가입</button>
				</div>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<span style="color: #666; font-size: 0.8rem;">
				물건을 구매하고 싶으신가요?<br>
				물건을 판매하고 싶으신가요?<br>
				회원가입해서 낫쿠팡의 혜택을 누려보세요.
				</span>
			</td>
		</tr>
		<tr>
			<td colspan="2"><span style="color: #555; font-size: 0.6rem;">©Fyou Corp - Project NotCoupang. All rights reserved.</span></td>
		</tr>
	</table>
</div>
</body>
</html>