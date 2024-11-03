<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MY 낫팡 · 주문 목록</title>
<!-- Bootstrap CSS -->
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Bootstrap 아이콘 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<link rel="stylesheet" href="styles/styles2.css">
<!--내 CSS 연동-->
<link rel="stylesheet" href="css/BSJ/myOrderList.css" />
</head>

<body>
	<div class="container mt-5">
		<div class="row">
			<!-- 사이드바 -->
			<aside class="col-md-3 sidebar text-center">
				<h2 class="font-weight-bold">MY 낫팡</h2>
				<ul class="nav flex-column">
					<li class="nav-item"><a href="#" class="nav-link">주문 목록</a></li>
					<li class="nav-item"><a href="#" class="nav-link">리뷰 관리</a></li>
					<li class="nav-item"><a href="#" class="nav-link">문의 내역</a></li>
					<li class="nav-item"><a href="#" class="nav-link">정보 변경</a></li>
				</ul>
			</aside>

			<!-- 메인 -->
			<main class="col-md-9 main-content">
				<!-- 헤더 -->
				<header
					class="header d-flex justify-content-between align-items-center p-3 mb-4">
					<div class="balance">
						<span>총 주문 금액</span> <span class="font-weight-bold">96,095원</span>
					</div>
					<div class="points">
						<span>이 달 주문 금액</span> <span class="font-weight-bold">10,000원</span>
					</div>
				</header>

				<!-- 주문 목록 섹션 -->
				<section class="order-section">
					<h2 class="mb-3">주문목록</h2>
					<div class="input-group mb-3">
						<input type="text" class="form-control"
							placeholder="주문한 상품을 검색할 수 있어요!">
						<div class="input-group-append">
							<button class="btn btn-outline-secondary search-button"
								type="button">
								<!-- 돋보기 아이콘 -->
								<i class="bi bi-search"></i>
							</button>
						</div>
					</div>

					<div class="btn-group mb-4" role="group">
						<button class="btn btn-outline-secondary">최근 6개월</button>
						<button class="btn btn-outline-secondary">2024</button>
						<button class="btn btn-outline-secondary">2023</button>
						<button class="btn btn-outline-secondary">2022</button>
						<button class="btn btn-outline-secondary">2021</button>
					</div>

					<!-- 주문 항목 리스트 -->
					<fieldset class="order-group border p-3 mb-4 rounded">
						<div class="order-date font-weight-bold text-muted">2024.
							10. 31 주문</div>
						<div class="order-item d-flex align-items-center mb-3">
							<img src="apple.jpg" alt="사과" class="product-img mr-3">
							<div class="product-details flex-grow-1">
								<p class="mb-1 font-weight-bold">시나노골드 못난이사과</p>
								<span>11,370원 · 1개</span>
							</div>
							<div class="order-actions d-flex flex-column align-items-center">
								<button class="btn btn-outline-primary btn-sm mb-2 w-100">목록 삭제</button>
								<button class="btn btn-outline-secondary btn-sm mb-2 w-100">문의 작성하기</button>
								<button class="btn btn-outline-secondary btn-sm w-100">리뷰 작성하기</button>
							</div>
						</div>

						<div class="order-item d-flex align-items-center">
							<img src="cola.jpg" alt="콜라" class="product-img mr-3">
							<div class="product-details flex-grow-1">
								<p class="mb-1 font-weight-bold">펩시 콜라 제로슈거 라임향</p>
								<span>14,680원 · 1개</span>
							</div>
							<div class="order-actions d-flex flex-column align-items-center">
								<button class="btn btn-outline-primary btn-sm mb-2 w-100">목록 삭제</button>
								<button class="btn btn-outline-secondary btn-sm mb-2 w-100">문의 작성하기</button>
								<button class="btn btn-outline-secondary btn-sm w-100">리뷰 작성하기</button>
							</div>
						</div>
					</fieldset>

					<!-- 다른 날짜 주문건 -->
					<fieldset class="order-group border p-3 mb-4 rounded">
						<div class="order-date font-weight-bold text-muted">2024. 11. 01 주문</div>
						<div class="order-item d-flex align-items-center mb-3">
							<img src="banana.jpg" alt="바나나" class="product-img mr-3">
							<div class="product-details flex-grow-1">
								<p class="mb-1 font-weight-bold">신선한 바나나</p>
								<span>8,500원 · 2개</span>
							</div>
							<div class="order-actions d-flex flex-column align-items-center">
								<button class="btn btn-outline-primary btn-sm mb-2 w-100">목록 삭제</button>
								<button class="btn btn-outline-secondary btn-sm mb-2 w-100">문의 작성하기</button>
								<button class="btn btn-outline-secondary btn-sm w-100">리뷰 작성하기</button>
							</div>
						</div>
					</fieldset>
					
					<fieldset class="order-group border p-3 mb-4 rounded">
						<div class="order-date font-weight-bold text-muted">2024.
							10. 31 주문</div>
						<div class="order-item d-flex align-items-center mb-3">
							<img src="apple.jpg" alt="사과" class="product-img mr-3">
							<div class="product-details flex-grow-1">
								<p class="mb-1 font-weight-bold">시나노골드 못난이사과</p>
								<span>11,370원 · 1개</span>
							</div>
							<div class="order-actions d-flex flex-column align-items-center">
								<button class="btn btn-outline-primary btn-sm mb-2 w-100">목록 삭제</button>
								<button class="btn btn-outline-secondary btn-sm mb-2 w-100">문의 작성하기</button>
								<button class="btn btn-outline-secondary btn-sm w-100">리뷰 작성하기</button>
							</div>
						</div>

						<div class="order-item d-flex align-items-center">
							<img src="cola.jpg" alt="콜라" class="product-img mr-3">
							<div class="product-details flex-grow-1">
								<p class="mb-1 font-weight-bold">펩시 콜라 제로슈거 라임향</p>
								<span>14,680원 · 1개</span>
							</div>
							<div class="order-actions d-flex flex-column align-items-center">
								<button class="btn btn-outline-primary btn-sm mb-2 w-100">목록 삭제</button>
								<button class="btn btn-outline-secondary btn-sm mb-2 w-100">문의 작성하기</button>
								<button class="btn btn-outline-secondary btn-sm w-100">리뷰 작성하기</button>
							</div>
						</div>
					</fieldset>

					<!-- 다른 날짜 주문건 -->
					<fieldset class="order-group border p-3 mb-4 rounded">
						<div class="order-date font-weight-bold text-muted">2024. 11. 01 주문</div>
						<div class="order-item d-flex align-items-center mb-3">
							<img src="banana.jpg" alt="바나나" class="product-img mr-3">
							<div class="product-details flex-grow-1">
								<p class="mb-1 font-weight-bold">신선한 바나나</p>
								<span>8,500원 · 2개</span>
							</div>
							<div class="order-actions d-flex flex-column align-items-center">
								<button class="btn btn-outline-primary btn-sm mb-2 w-100">목록 삭제</button>
								<button class="btn btn-outline-secondary btn-sm mb-2 w-100">문의 작성하기</button>
								<button class="btn btn-outline-secondary btn-sm w-100">리뷰 작성하기</button>
							</div>
						</div>
					</fieldset>
					
				</section>
			</main>
		</div>
	</div>

	<!-- Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
</body>



</html>
