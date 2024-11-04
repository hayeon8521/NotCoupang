<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>주문 목록</title>
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
    
      <!-- 사이드바 -->
      <div class="d-flex" id="wrapper">
        <!-- Sidebar-->
        <div class="col-md-3 border-end bg-white" id="sidebar-wrapper">
          <div class="sidebar-heading d-flex align-items-center border-bottom mt-3 fw-bold">MY쿠팡</div>
      
          <div class="list-group list-group-flush" id="nav_div">
            <a class="list-group-item list-group-item-action list-group-item-light p-3 disabled text-bg-primary" href="#!">주문 목록</a>
            <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">리뷰 관리</a>
            <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">문의 내역</a>
            <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">회원 정보 수정</a>
          </div>
       
      </div>
      <!-- 메인 -->
      <main class="col-md-9 main-content">
        <!-- 헤더 -->
        <header class="header d-flex justify-content-between align-items-center p-3 mb-4">
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
           <!-- 검색창 & 돋보기 HTML -->
            <div class="search-bar">
                <input type="text" class="form-control" placeholder="내가 쓴 리뷰 검색">
                <i class="bi bi-search" style="position: absolute; right: 15px; top: 50%; transform: translateY(-50%); cursor: pointer;"></i>
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
		 <script>window.addEventListener('DOMContentLoaded', event => {

// Toggle the side navigation
const sidebarToggle = document.body.querySelector('#sidebarToggle');
        if (sidebarToggle) {
          // Uncomment Below to persist sidebar toggle between refreshes
          // if (localStorage.getItem('sb|sidebar-toggle') === 'true') {
          //     document.body.classList.toggle('sb-sidenav-toggled');
          // }
          sidebarToggle.addEventListener('click', event => {
            event.preventDefault();
            document.body.classList.toggle('sb-sidenav-toggled');
            localStorage.setItem('sb|sidebar-toggle', document.body.classList.contains('sb-sidenav-toggled'));
          });
}

});
  </script>
</body>



</html>
