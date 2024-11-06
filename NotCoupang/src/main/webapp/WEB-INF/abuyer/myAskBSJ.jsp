<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>문의 관리</title>
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Bootstrap 아이콘 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<!--내 CSS 연동-->

<style>
    body {
        background-color: #f8f9fa;
        font-family: Arial, sans-serif;
    }

    .list-group-item {
        font-weight: bold;
        cursor: pointer;
    }

    .list-group-item:hover {
        background-color: #e9ecef;
    }

    .nav-tabs {
        border-bottom: 2px solid #ddd;
        margin-bottom: 0;
    }

    .nav-tabs .nav-link {
        color: #333;
        font-weight: bold;
    }

    .nav-tabs .nav-link.active {
        color: #007bff;
        border: 1px solid #ddd;
        border-bottom: 2px solid #f8f9fa;
        background-color: #fff;
    }

    /* 검색창 & 돋보기 */
    .search-bar {
        position: relative;
        margin-bottom: 20px;
        max-width: 400px;
    }

    .search-bar input {
        width: 100%;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
        padding-right: 40px;
    }

    .search-bar i {
        position: absolute;
        right: 15px;
        top: 50%;
        transform: translateY(-50%);
        cursor: pointer;
        color: #888;
    }

    .tab-content {
        padding: 20px;
        border-radius: 8px;
        background-color: #fff;
    }

    .review-card {
        border: 1px solid #ddd;
        border-radius: 8px;
        padding: 20px;
        margin-bottom: 20px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        background-color: #ffffff;
    }

    .review-card .product-info {
        display: flex;
        align-items: center;
        gap: 15px;
        margin-bottom: 15px;
        padding-bottom: 15px;
        border-bottom: 1px solid #ddd;
        padding-left: 20px;
    }

    .product-info img {
        width: 100px;
        height: 100px;
        object-fit: cover;
        border-radius: 10px;
    }

    .review-content {
        padding: 15px;
    }

    .action-buttons {
        display: flex;
        justify-content: center;
        gap: 10px;
    }

    .action-buttons button {
        width: 80px;
    }

    /* 공통 스타일 중복 해결 */
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    .container {
        background-color: #ffffff;
        border: 1px solid #ddd;
        border-radius: 8px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        margin-top: 15px;
    }

    .mt-5, .my-5 {
        margin-top: 1.5rem !important;
    }

    .sidebar {
        background-color: #f9fbff;
        padding: 20px;
        border-right: 1px solid #ddd;
    }

    .sidebar h2 {
        color: #0077ff;
        margin-bottom: 20px;
        font-size: 1.2em;
    }

    .sidebar ul li {
        margin: 15px 0;
    }

    .sidebar ul li a {
        color: #333;
        text-decoration: none;
        font-weight: 500;
    }

    .sidebar ul li a:hover {
        color: #0077ff;
    }

    .main-content {
        padding: 20px;
    }

    .headerBSJ {
        background-color: #f0f8ff;
        border-radius: 8px;
        font-size: 1.1em;
        color: #333;
    }

    .headerBSJ .balance, .header .points {
        font-size: 1em;
    }

    .order-section h2 {
        font-size: 1.5em;
        margin-bottom: 20px;
    }

    .input-group {
        position: relative; /* 돋보기 부모 */
        width: 500px;
    }

    /* 돋보기 위치 */
    .input-group-append {
        position: absolute;
        right: 10px;
        top: 50%;
        transform: translateY(-50%);
    }

    .input-group-append .btn {
        padding: 0;
        border: none;
    }

    .search-button {
        background-color: transparent;
        border: none;
    }

    .btn-group .btn {
        font-size: 0.875em;
    }

    .order-group {
        border: 1px solid #ddd;
        padding: 20px;
    }

    .order-date {
        font-size: 1.2em;
        color: #0077ff;
        margin-bottom: 20px;
    }

    .order-item {
        background-color: #fafafa;
        padding: 10px;
        border-radius: 5px;
        margin-bottom: 10px;
        width: 100%; /* 폭 100% */
    }

    .product-img {
        width: 60px;
        height: 60px;
        border-radius: 4px;
    }

    .product-details p {
        font-size: 1em;
    }

    .order-actions .btn {
        width: 100%;
        font-size: 0.85em;
    }

    #wrapper {
        overflow-x: hidden;
    }

    #sidebar-wrapper {
        min-height: 100vh;
        transition: margin 0.25s ease-out;
    }

    #sidebar-wrapper .sidebar-heading {
        padding: 0.875rem 1.25rem;
        font-size: 1.2rem;
    }

    #sidebar-wrapper .list-group {
        width: 15rem;
    }

    #page-content-wrapper {
        min-width: 100vw;
    }

    #wrapper.toggled #sidebar-wrapper {
        margin-left: 0;
    }

    #sidebar-wrapper {
        margin-left: 0;
    }

    #page-content-wrapper {
        min-width: 0;
        width: 100%;
    }

    #nav_div a {
        font-size: 0.95rem;
    }

    #nav_div a:hover {
        background-color: #4285f4;
        color: white;
        font-weight: bold;
    }

    /* 검색창 & 돋보기 관련 스타일 중복 제거 */
    .search-barBSJ {
        position: relative;
        margin-bottom: 20px;
        max-width: 400px;
    }

    .search-barBSJ input {
        width: 100%;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
        padding-right: 40px;
    }

    .bi-searchBSJ {
        position: absolute;
        right: 15px;
        top: 50%;
        transform: translateY(-50%);
        cursor: pointer;
        color: #888;
    }
</style>

    
</head>
<!-- 세션 -->
<%
String LOGID = (String) session.getAttribute("LOGID");
String LOGNAME = (String) session.getAttribute("LOGNAME");
String MEMBERDIVISION = (String) session.getAttribute("MEMBERDIVISION");
%>
<body>
<div class="container mt-4 containerBSJ">
    <div class="row" id="wrapper">
        <!-- 사이드바 -->
        <aside class="col-md-3" id="sidebar-wrapper">
            <div class="border-end bg-white p-3">
                <div class="sidebar-heading d-flex align-items-center border-bottom mt-3 fw-bold">MY쿠팡</div>
                <div class="list-group list-group-flush mt-2" id="nav_div">
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="myOrderList.do?buyerId=${LOGID }">주문 목록</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="myReview.do?buyerId=${LOGID }">리뷰 관리</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3 disabled text-bg-primary" href="myAsk.do?buyerId=${LOGID }">문의 내역</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="checkMem.do?memberId=${LOGID }">회원 정보 수정</a>
                </div>
            </div>
        </aside>

        <!-- 리뷰 섹션 -->
        <div class="col-md-9">
            <section class="order-section">
                <h2 class="mb-4 mt-5">문의 목록</h2>

                <!-- 검색창 & 돋보기 HTML -->
                <div class="search-barBSJ">
                    <input type="text" class="form-control" placeholder="내가 쓴 문의 검색">
                    <i class="bi bi-searchBSJ"></i>
                </div>

                <!-- 탭 내비 -->
                <ul class="nav nav-tabs" id="reviewTabs" role="tablist">
                    <li class="nav-item" role="presentation">
                        <button class="nav-link active" id="written-tab" data-bs-toggle="tab" data-bs-target="#written" type="button" role="tab" aria-controls="written" aria-selected="true">답변받은 문의</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="unwritten-tab" data-bs-toggle="tab" data-bs-target="#unwritten" type="button" role="tab" aria-controls="unwritten" aria-selected="false">답변없는 문의</button>
                    </li>
                </ul>

                <div class="tab-content border mb-3" id="reviewTabsContent">
                    <div class="tab-pane fade show active" id="written" role="tabpanel" aria-labelledby="written-tab">
                        <!-- 작성한 문의 콘텐츠 -->
                        <div class="review-card mt-3">
                            <div class="product-info">
                                <img src="placeholder-image.jpg" alt="Product Image">
                                <div>
                                    <h6 class="mb-0">생필품</h6>
                                    <p class="text-muted mb-0">20,000 원, 1개</p>
                                </div>
                            </div>
                            <!-- 문의 내용 -->
                            <div class="review-content mb-3">
                                <label for="reviewContent1" class="form-label">문의 내용</label>
                                <textarea id="reviewContent1" class="form-control" rows="5" readonly="readonly"></textarea>
                            </div>

                            <!-- 답변 내용 -->
                            <div class="review-content mb-3">
                                <label for="reviewContent1" class="form-label">답변 내용</label>
                                <textarea id="reviewContent1" class="form-control" rows="5" readonly="readonly"></textarea>
                            </div>

                            <!-- 버튼 -->
                            <div class="action-buttons">
                                <button class="btn btn-warning">수정</button>
                                <button class="btn btn-danger">삭제</button>
                            </div>
                            <div class="mt-3 text-muted">
                                작성일자: 2024-10-18 15:53:28
                            </div>
                        </div>
                    </div>

                    <div class="tab-pane fade" id="unwritten" role="tabpanel" aria-labelledby="unwritten-tab">
                        <p class="mt-3">답변받지 못한 문의가 없습니다.</p>
                    </div>
                </div>
            </section>
        </div>
    </div>
</div>

<!-- JS -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>


      </html>