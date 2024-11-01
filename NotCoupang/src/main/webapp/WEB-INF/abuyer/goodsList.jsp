<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=1200">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="css/goodsinfo.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
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
<div class="container mt-5">
	<div class="row row-cols-4 g-4">
		<c:forEach var="item" items="${goodsList}">
		<div class="col">
			<div class="card h-100">
				<img src="..." class="card-img-top" alt="...">
				<div class="card-body">
					<h5 class="card-title">${item.goodsName}</h5>
					<p class="card-text">${item.goodsPrice}</p>
					<p class="card-text">This is a wider card with supporting text
						below as a natural lead-in to additional content. This content is
						a little bit longer.</p>
				</div>
				<div class="card-footer">
					<small class="text-body-secondary">Last updated 3 mins ago</small>
				</div>
			</div>
		</div>
		</c:forEach>

		<!-- 카드 반복 -->
	</div>
</div>
</body>

