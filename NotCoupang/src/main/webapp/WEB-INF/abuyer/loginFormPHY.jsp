<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  <!-- 날짜 포멧 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x" %>
<!DOCTYPE html>
<!-- 기본 기능 선언부 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="js/hayeonPHY.js"></script>
<!-- 기본 기능 선언부 끝 -->
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
%>
<!-- 메인페이지 완료되면 리다액션 위치 수정필요 (js, 로고이미지, 세션) -->
<c:if test="${sessionScope.LOGID != null}">
    <c:choose>
        <c:when test="${sessionScope.MEMBERDIVISION == 'seller'}">
            <script>
                window.location.href = '/NotCoupang/admin.do';
            </script>
        </c:when>
        <c:otherwise>
            <script>
                window.location.href = '/NotCoupang/main.do';
            </script>
        </c:otherwise>
    </c:choose>
</c:if>
<div class="sidediv">
	<h1>
		<a href="/NotCoupang/main.do">
			<img src="images/logo.png" alt="Logo">
	  </a>
	</h1>
	<table class="table">
		<tr>
			<th colspan="2">회원 로그인</th>
		</tr>
		<tr>
			<td colspan="2">
				<div class="input-group mb-3">
					<span class="input-group-text" id="basic-addon1">@</span>
					<input type="text" id="id" name="id" value="" class="form-control" placeholder="Enter your ID" onblur="foucsOutId()" aria-label="Username" aria-describedby="basic-addon1">
				 </div>
			</td>
		</tr>
		<tr>
			<td id="idconfig" colspan="2"></td>
		</tr>
		<tr>
			<td colspan="2"><input type="password" id="pw" name="pw" value="" 
				placeholder="Enter your PW" onblur="foucsOutPw()"/></td>
		</tr>
		<tr>
			<td id="pwconfig" colspan="2"></td>
		</tr>
		<!--
			<tr>
				<td>[체크박스] 자동로그인</td>
				<td>아이디*비밀번호 찾기></td>
			</tr>
			-->
		<tr>
			<td colspan="2">
				<div class="d-grid gap-2">
					<button class="btn btn-primary" type="button" onclick="loginAction();">로그인</button>
				</div>
			</td>
		</tr>
		<td colspan="2">
			<div class="d-grid gap-2">
				<button class="btn btn-primary" type="button">회원가입</button>
			</div>
		</td>
		<tr>
			<td colspan="2">기타 설명들</td>
		</tr>
		<tr>
			<td colspan="2">©Fyou Corp - Project NotCoupang. All rights
				reserved.</td>
		</tr>
	</table>
</div>