<%@page import="com.Fyou.service.CategoriServiceImpl"%>
<%@page import="com.Fyou.service.CategoriService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<%
CategoriService csvc = new CategoriServiceImpl();
String ct = (String) request.getAttribute("cate");
String kw = (String) request.getAttribute("keyword");

ct = ct.isEmpty() ? "전체" : ct;
%>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/LSH/vendor.css">
<link rel="stylesheet" type="text/css" href="css/LSH/style.css">
<link rel="stylesheet" type="text/css" href="css/LSH/LSH.css">
<meta name="viewport" content="width=1200">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="css/goodsinfo.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
	document.title = "${goodsinfo.goodsName}";
</script>
<style>
body {
	min-width: 1200px; /* 원하는 최소 너비를 설정 */
}

.card {
	display: flex;
	flex-direction: column;
}

.card-body {
	flex-grow: 1; /* 카드 본문 부분의 높이를 자동으로 조정하여 동일하게 맞춤 */
}
</style>
</head>





<body>


	<div class="container-md">

		<div class="row">
			<div class="col-md-12">

				<div
					class="section-header d-flex flex-wrap justify-content-between my-4">
					<h2 class="section-title"><%=ct%></h2>
				</div>

			</div>
		</div>

		<div class="row p-5">
			<div class="col-md-12">
				<c:if test="${goodsList.size() == 0}">
					<div class="card mb-3 border  p-3">
						<div class="card-body p-0">
							<h5>검색 결과 없음</h5>
							<p class="card-text">다른 검색어로 검색해보세요.</p>
						</div>
					</div>
				</c:if>

				<div
					class="product-grid row row-cols-md-3 row-cols-lg-3 row-cols-xl-4 row-cols-xxl-5">


					<c:forEach var="item" items="${goodsList}" varStatus="vs">
						<div class="col">
							<div class="product-item">
								<figure>
									<a href="goodsinfo.do?gno=${item.seqGoods}"
										title="Product Title"> <img src="images/${item.imgUrl }"
										alt="상품 이미지" class="tab-image">
									</a>
								</figure>
								<div class="d-flex flex-column text-start">
									<h3 class="fs-6 fw-normal">${item.goodsName}</h3>
									<div
										class="d-flex justify-content-start align-items-center gap-2">
										<span id="price" class="text-dark fw-semibold goodsPrice"
											data-price="${item.goodsPrice}"></span>
									</div>
									<span>리뷰 수(00) </span>
									<div class="button-area p-3 pt-0">
										<div class="row g-1 mt-2">
											<div class="col">
												<a href="goodsinfo.do?gno=${item.seqGoods}"
													class="btn btn-primary rounded-1 p-2 fs-7 btn-cart"> 상세
													정보</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
				<!-- / product-grid -->


			</div>
		</div>
	</div>
</body>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>


<!-- Bootstrap core JS-->
<script src="js/scripts.js">
</script>

<script>
	//가격 천단위
	document.addEventListener("DOMContentLoaded", function() {
		const priceElements = document.querySelectorAll(".goodsPrice");

		priceElements.forEach(function(priceElement) {
			const priceValue = parseInt(
					priceElement.getAttribute("data-price"), 10);
			if (!isNaN(priceValue)) {
				priceElement.textContent = priceValue.toLocaleString() + "원";
			}
		});
	});
</script>

</html>