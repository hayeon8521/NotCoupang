<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- 날짜 포멧 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x"%>
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
<meta charset="UTF-8">
<title>낫팡 - 장바구니</title>
<%
    String LOGID = (String) session.getAttribute("LOGID");
    String LOGNAME = (String) session.getAttribute("LOGNAME");
    String MEMBERDIVISION = (String) session.getAttribute("MEMBERDIVISION");


	if (LOGID == null) {
%>
		<script>
			//alert('aa');
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
%>
<style>
	.boxPHY {
		width: 800px;
		text-align: center;
		margin: 0px 0;
		padding: 0px;
		border-radius: 5px;
		border: 1px solid cyan;
	}
	.logo {
		width: 140px;
		height: 37px;;
	}
</style>
</head>
<body style="background-color: #EBEBEB;">
<%=LOGID %>
	<div class="d-flex flex-column align-items-center">
		<div class="boxPHY bg-info">
			<a href="/NotCoupang/welcome.do">
				<img class="logo" src="images/logo.png" alt="Logo">
			</a>
			
			
			
			
			
			
			
			
		</div>
		
		
		
		
		
		<div class="boxPHY bg-primary">
			<장바구니 01 옵션선택>장바구니>주문결제>주문완료 영격
		</div>
		<div class="boxPHY bg-info">일반구매 정기배송</div>
		<div class="boxPHY bg-primary">2개로 분할해서 한쪽은 상품리스팅 /// 한쪽은 주문예상
			플로팅</div>
		<div class="boxPHY bg-info">혜택정보 영역</div>
	</div>
</body>
</html>