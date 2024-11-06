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
<script>
    document.title = "${goodsinfo.goodsName}";
</script>
</head>
<body>
	<!-- 상단 배너 -->
	<section
		style="background-image: url('imagesLSH/banner.jpg');width: 100%; height: 450px; background-repeat: no-repeat; background-size: cover;">
		<div class="container-lg">
			<div class="row">
				<div class="col-lg-6 pt-5 mt-5">
					
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

	<section class="py-5">
		<div class="container-md">
			<div class="row">
				<div class="col-md-12">
					<div
						class="section-header d-flex flex-wrap justify-content-between mb-2">
						<h2 class="section-title">카테고리</h2>
						<div class="d-flex align-items-center">
		                	<a href="goodsList.do" class="btn btn-primary me-2">전체 보기</a>
		              	</div>
					</div>
					<div class="banner-blocks row-gap-2 column-gap-2">
						<%
						int cateNum = 0;
						for (CategoriVO ele : categories) {
						%>
						
						<div
							class="banner-ad d-flex align-items-center large bg-info block-<%=++cateNum%>"
							style="background: url('imagesLSH/cate (<%=cateNum %>).jpg') no-repeat; background-size: cover;">
							<div class="overlay"></div>
							 
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


</body>
<!-- Core theme JS-->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Bootstrap core JS-->
<script src="js/scripts.js"></script>
</html>