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

kw = kw == null ? "" : kw;
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
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
	document.title = "${goodsinfo.goodsName}";
</script>

</head>





<body id="LSH">


	<div class="container-lg">

		<div class="row">
			<div class="col-md-12">

				<div
					class="section-header d-flex flex-wrap justify-content-between my-4">
					<h2 class="section-title"><%=ct%>(${total})</h2>
				</div>

			</div>
		</div>
		<hr>
		<div class="row p-5">
			<div class="col-md-12">
				<c:if test="${goodsList.size() == 0}">
					<div class="card mb-3 border  p-3">
						<div class="card-body p-0">
							<c:choose>
								<c:when test="${keyword == null or fn:trim(keyword) == ''}">
									<h2>등록된 상품이 없습니다.</h2>
								</c:when>
								<c:otherwise>
									<h2>
										<span style="color: #fd766a">${keyword}
										</span>에 대한 검색결과가 없습니다.
									</h2>
									<ul>
										<li><p class="card-text">단어의 철자가 정확한지 확인해보세요.</p></li>
										<li><p class="card-text">한글을 영어로 혹은 영어를 한글로 입력했는지 확인해
												보세요.</p></li>
										<li><p class="card-text">검색어의 단어 수를 줄이거나, 보다 일반적인
												검색어로 다시 검색해 보세요.</p></li>
										<li><p class="card-text">두 단어 이상의 검색어인 경우, 띄어쓰기를 확인해
												보세요.</p></li>
										<li><p class="card-text">검색 옵션을 변경해서 다시 검색해 보세요.</p></li>
									</ul>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</c:if>

				<div
					class="product-grid row row-cols-md-3 row-cols-lg-3 row-cols-xl-4 row-cols-xxl-5">


					<c:forEach var="item" items="${goodsList}" varStatus="vs">
						<div class="col">
							<a href="goodsinfo.do?gno=${item.seqGoods}"
								title="${item.goodsName}" class="text-decoration-none">
								<div class="product-item">
									<figure>
										<img src="images/${item.imgUrl }" alt="상품 이미지"
											class="tab-image">
									</figure>
									<div class="d-flex flex-column text-start mt-5">
										<h3 class="fs-6 fw-normal item-title">${item.goodsName}</h3>
										<div
											class="d-flex justify-content-start align-items-center gap-4">
											<span id="price" class="text-dark fw-semibold goodsPrice"
												data-price="${item.goodsPrice}"></span>
										</div>
										<span>리뷰 수 (${item.goodsReviews}) </span>
									</div>
								</div>
							</a>
						</div>
					</c:forEach>
				</div>
				<hr>
				<!-- / product-grid -->


			</div>
		</div>
		<nav aria-label="Page navigation example">
		  <ul class="pagination justify-content-center">
		  	<c:choose>
		  		<c:when test="${prev}">
		  			<li class="page-item">
		  				<a class="page-link" href="goodsList.do?cate=${cate}&bcate=${bcate}&page=${startPage - 1}">Previous</a>
		  			</li>
		  		</c:when>
		  		<c:otherwise>
		  			<li class="page-item disabled">
            			<a class="page-link">Previous</a>
        			</li>
		  		</c:otherwise>
		  	</c:choose>
		  	<c:if test="${total == 0}">
		  		<li class="page-item active" aria-current="page">
		        	<span class="page-link">1</span>
		        </li>
		  	</c:if>
		    <c:forEach var="p" begin="${startPage}" end="${endPage}">
		        <c:choose>
		            <c:when test="${page == p}">
		                <li class="page-item active" aria-current="page">
		                    <span class="page-link">${p}</span>
		                </li>
		            </c:when>
		            <c:otherwise>
		                <li class="page-item">
		                    <a class="page-link" href="goodsList.do?cate=${cate}&bcate=${bcate}&page=${p}">${p}</a>
		                </li>
		            </c:otherwise>
		        </c:choose>
		    </c:forEach>
		    
		    <c:choose>
		  		<c:when test="${next}">
		  			<li class="page-item">
		  				<a class="page-link" href="goodsList.do?cate=${cate}&bcate=${bcate}&page=${endPage+1}">Next</a>
		  			</li>
		  		</c:when>
		  		<c:otherwise>
		  			<li class="page-item disabled">
            			<a class="page-link">Next</a>
        			</li>
		  		</c:otherwise>
		  	</c:choose>
		  </ul>
	  	</nav>
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