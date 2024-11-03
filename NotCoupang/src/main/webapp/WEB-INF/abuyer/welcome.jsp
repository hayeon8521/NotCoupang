<%@page import="com.Fyou.vo.CategoriVO"%>
<%@page import="java.util.List"%>
<%@page import="com.Fyou.service.CategoriServiceImpl"%>
<%@page import="com.Fyou.service.CategoriService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
CategoriService csvc = new CategoriServiceImpl();
List<CategoriVO> categories = csvc.listOfTcate();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/LSH/vendor.css">
<link rel="stylesheet" type="text/css" href="css/LSH/style.css">
<link rel="stylesheet" type="text/css" href="css/LSH/LSH.css">
<title>Insert title here</title>
</head>
<body>
	<!-- 상단 배너 -->
	<section
		style="background-image: url('imagesLSH/banner.jpg'); background-repeat: no-repeat; background-size: cover;">
		<div class="container-lg">
			<div class="row">
				<div class="col-lg-6 pt-5 mt-5">
					<h2 class="display-1 ls-1">
						<span class="fw-bold text-primary">!Coupang</span> <span
							class="fw-bold text-danger">??</span>
					</h2>
					<!--  
					<p class="fs-4">Dignissim massa diam elementum.</p>
					-->
					<div class="d-flex gap-3">
						<a href="goodsList.do"
							class="btn btn-primary text-uppercase fs-6 rounded-pill px-4 py-3 mt-3">
							상품 검색</a>
					</div>
					<div class="row my-5"></div>
				</div>
			</div>
			<!-- 상단배너 텍스트 칸 -->
			<!--
			<div class="row row-cols-1 row-cols-sm-3 row-cols-lg-3 g-0 justify-content-center">
				<div class="col">
					<div class="card border-0 bg-primary rounded-0 p-4 text-light">
						<div class="row">
							<div class="col-md-9">
								<div class="card-body p-0">
									<h5 class="text-light">Fresh from farm</h5>
									<p class="card-text">Lorem ipsum dolor sit amet,
										consectetur adipi elit.</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			-->
		</div>
	</section>
	<!-- 상단 배너 끝-->

	<!-- 카테고리 칸들 -->

	<section class="py-3">
		<div class="container-md">
			<div class="row">
				<div class="col-md-12">
					<div
						class="section-header d-flex flex-wrap justify-content-between mb-2">
						<h2 class="section-title">카테고리</h2>
					</div>
					<div class="banner-blocks row-gap-2 column-gap-2">
						<%
						int cateNum = 1;
						for (CategoriVO ele : categories) {
						%>
						<div
							class="banner-ad d-flex align-items-center large bg-info block-<%=cateNum++%>"
							style="background: url('imagesLSH/cate.jpg') no-repeat; background-size: cover;">
							<div class="banner-content p-5">
								<div class="content-wrapper text-light">
									<h3 class="banner-title text-light"><%=ele.getTcate()%></h3>
									<a href="goodsList.do?cate=<%=ele.getTcate()%>"
										class="btn-link text-white">Shop Now</a>
								</div>
							</div>
						</div>
						<%
						}
						%>







					</div>
					<!-- / Banner Blocks -->

				</div>
			</div>
		</div>
	</section>

	<!-- 카테고리 -->


	<!-- 구역2 -->
	<section class="pb-5">
		<div class="container-lg">

			<div class="row">
				<div class="col-md-12">

					<div
						class="section-header d-flex flex-wrap justify-content-between my-4">

						<h2 class="section-title">추천 상품?</h2>


					</div>

				</div>
			</div>

			<div class="row">
				<div class="col-md-12">

					<div
						class="product-grid row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-3 row-cols-xl-4 row-cols-xxl-5">
						<%
						for (int i = 0; i < 10; i++) {
						%>
						<div class="col">
							<div class="product-item">
								<figure>
									<a href="index.html" title="Product Title"> <img
										src="images/product-thumb-1.png" alt="상품 이미지"
										class="tab-image">
									</a>
								</figure>
								<div class="d-flex flex-column text-center">
									<h3 class="fs-6 fw-normal">상품명</h3>
									<div
										class="d-flex justify-content-center align-items-center gap-2">
										<span class="text-dark fw-semibold">10000원</span>
									</div>
									<div class="button-area p-3 pt-0">
										<div class="row g-1 mt-2">
											<div class="col">
												<a href="#"
													class="btn btn-primary rounded-1 p-2 fs-7 btn-cart"> 상세
													정보</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<%
						}
						%>




					</div>
					<!-- / product-grid -->


				</div>
			</div>
		</div>
	</section>













	<!-- 임시 칸 -->
	<section class="py-5">
		<div class="container-lg">
			<div class="row row-cols-1 row-cols-sm-3 row-cols-lg-5">
				<%
				for (int i = 0; i < 5; i++) {
				%>
				<div class="col">
					<div class="card mb-3 border border-dark-subtle p-3">
						<div class="text-dark mb-3">
							<svg width="32" height="32">
								<use xlink:href="#package"></use></svg>
						</div>
						<div class="card-body p-0">
							<h5>Free delivery</h5>
							<p class="card-text">Lorem ipsum dolor sit amet, consectetur
								adipi elit.</p>
						</div>
					</div>
				</div>
				<%
				}
				%>
			</div>
		</div>
	</section>



</body>
<!-- Core theme JS-->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Bootstrap core JS-->
<script src="js/scripts.js"></script>
</html>