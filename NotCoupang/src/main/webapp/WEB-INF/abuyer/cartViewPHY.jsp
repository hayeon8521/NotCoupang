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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<script src="js/PHY/hayeonPHY.js"></script>
<!-- 기본 기능 선언부  -->
<meta charset="UTF-8">
<title>낫팡 - 장바구니</title>
<%
    String LOGID = (String) session.getAttribute("LOGID");
    String LOGNAME = (String) session.getAttribute("LOGNAME");
    String MEMBERDIVISION = (String) session.getAttribute("MEMBERDIVISION");


	if (LOGID == null) {
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
%>
<style>
	.boxPHY {
		width: 900px;
		text-align: center;
		margin: 0px 0;
		padding: 0px;
		border-radius: 5px;
		border: 0px solid cyan;
	}
	.logo {
		width: 140px;
		height: 37px;;
	}
	h2 {
		font-weight: 500;
	}
	a.noline {
		text-decoration: none;
	}
	.thumbnail {
		width: 150px;
		height: 150px;
	}
	.goodscheck {
		width: 25px;
		height: 25px;
	}
</style>
</head>
<body style="background-color: #EBEBEB;">
<%=LOGID %>
	<div class="d-flex flex-column align-items-center">
		<div class="mt-3 mb-3" style="text-align: left; width: 980px;">
			<a href="/NotCoupang/welcome.do">
				<img class="logo" src="images/logo.png" alt="Logo">
			</a>
		</div>
	</div>
	<div class="d-flex flex-column align-items-center">
		<div class="d-flex flex-column align-items-center pt-5 border-top border-3 border-dark-subtle" style="background-color: white; width: 980px;">
			<div class="boxPHY">
				<div class="d-flex pt-0">
					<div class="me-auto p-0">
						<h2>
							<a class="link-dark" href="javascript:history.back()"><i class="bi bi-chevron-left"></i></a>장바구니
						</h2>
					</div>
					<div class="p-0 align-self-center fw-bold text-secondary">
						<b>01</b>옵션선택<i class="bi bi-chevron-right"></i>
						<b style="color: #4285f4;font-size: 1rem;">02</b><span class="text-dark-emphasis">장바구니<i class="bi bi-chevron-right"></i></span>
						<b>03</b>주문/결제<i class="bi bi-chevron-right"></i>
						<b>04</b>주문완료
					</div>
				</div>
			</div>
			<div class="boxPHY pt-4 d-flex">
				<div class="p-0 flex-fill">
					<div class="d-grid gap-2">
						<button class="border border-bottom-0 border-1 border-primary rounded-top-1 bg-white noline" style="height: 40px; color: #4285f4;" type="button">일반구매(0)</button>
					</div>
				</div>
				<div class="p-0 flex-fill">
					<div class="d-grid gap-2">
						<button class="border-0 border-bottom border-primary rounded-top-1 noline" style="height: 40px; color: rgb(72, 72, 72);" type="button">정기배송(0)</button>
					</div>
				</div>
			</div>





			<div class="boxPHY pt-3">
				<div class="d-flex mb-0">
					<div class="me-auto p-2 border border-1 rounded border-black" style="width: 600px;">
						<!--요기서-->
						<div class="d-flex mb-3 border-bottom-1 border-1 border-black">
							<div class="p-2 align-self-center">
								<input class="goodscheck" type="checkbox" id="checkbox" name="checkbox">
							</div>
							<div class="p-1">
								<a href="goodsinfo.do?seqGoods=11"><img src="https://picsum.photos/200/300" class="thumbnail"></a>
							</div>
							<div class="p-0" style="width: 345px;">
								<h1 class="card-title" style="text-align: left;">
									<a class="link-dark link-offset-2 link-underline-opacity-0 link-underline-opacity-100-hover" href="goodsinfo.do?seqGoods=11">상품들 제목이야</a>
									<br><br>
								</h1>
								<div class="d-flex">
									<div class="p-2">
										<h3><input data-max-quantity="1" class="quantity-input" type="text" value="1">< 수량 ></h3>
									</div>
									<div class="p-2 flex-grow-1">
										<h3>150000원</h3>
									</div>
								</div>
							</div>
							<div class="ms-auto p-0">삭제</div>
						</div>
						<!--요기까지 반복-->
					</div>
					<div class="p-2 border border-1 rounded border-black" style="width: 280px;">한쪽은 주문예상 플로팅</div>
				</div>
			</div>
			<div class="boxPHY bg-info">[]전체선택(0/0) 선택삭제</div>
			<div class="boxPHY bg-info">안내영역 캐시적립 혜택</div>
		</div>
	</div>
</body>
</html>