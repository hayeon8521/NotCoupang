<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- 날짜 포멧 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 기본 기능 선언부 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
	<script src="js/PHY/hayeonPHY.js"></script>
	<!-- 기본 기능 선언부 끝  -->
    <script>document.title = "낫팡 - 주문완료";</script>
    <style>
        .container-custom {
            max-width: 980px;
            margin-top: 20px;
            background-color: #ffffff;
            border: 1px solid #ddd;
            padding: 20px;
        }
        .order-status {
            font-weight: bold;
            font-size: 1.5em;
            text-align: center;
        }
        .order-summary {
            font-weight: bold;
            font-size: 1.2em;
            text-align: center;
            margin-bottom: 20px;
        }
        .shipping-info {
            border: 1px solid #28a745;
            padding: 15px;
            margin-bottom: 10px;
            background-color: #f9f9f9;
        }
        .divider {
            border-top: 1px solid #ddd;
            margin: 20px 0;
        }
        .recipient-info, .payment-info {
            font-size: 0.9em;
        }
        .btn-custom {
            width: 100%;
            padding: 12px;
            font-size: 1em;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="container container-custom">
        <!-- 주문 완료 상태 -->
        <div class="order-status">주문완료</div>
        <p class="text-center mt-3">주문이 완료되었습니다. 감사합니다!<br>고객님의 주문은 <strong>4번</strong>에 나뉘어 배송됩니다.</p>

        <!-- 배송정보 -->
        <div class="order-summary">상품배송 정보</div>

        <!-- 배송 정보 섹션 -->
        <div class="shipping-info">
            <p>배송 4건 중 1</p>
            <p class="text-success font-weight-bold">내일(월) 새벽 도착 보장 (상품 1개) <span class="text-muted">판매자: 쿠팡</span></p>
        </div>
        <div class="shipping-info">
            <p>배송 4건 중 2</p>
            <p class="text-success font-weight-bold">내일(월) 도착 보장 (상품 3개) <span class="text-muted">판매자: 쿠팡</span></p>
        </div>
        <div class="shipping-info">
            <p>배송 4건 중 3</p>
            <p class="text-success font-weight-bold">내일(월) 도착 보장 (상품 1개) <span class="text-muted">판매자: 하이보</span></p>
        </div>
        <div class="shipping-info">
            <p>배송 4건 중 4</p>
            <p class="text-success font-weight-bold">내일(월) 도착 보장 (상품 1개) <span class="text-muted">판매자: 주식회사 향연의자재</span></p>
        </div>

        <!-- 수평선 -->
        <div class="divider"></div>

        <!-- 받는 사람 정보와 결제 정보 -->
        <div class="row">
            <!-- 받는 사람 정보 -->
            <div class="col-md-6 recipient-info">
                <h5>받는사람 정보</h5>
                <p><strong>받는사람:</strong> 표하연 / 010-8521-6704</p>
                <p><strong>배송주소:</strong> 대구광역시 중구 서문로1가 34-8 웰콤로 2층 201호</p>
                <p><strong>배송 요청사항:</strong> 문 앞 (경비실)</p>
                <a href="#" class="text-primary">변경하기</a>
            </div>

            <!-- 결제 정보 -->
            <div class="col-md-6 payment-info">
                <h5>결제 정보</h5>
                <p><strong>주문금액:</strong> 85,060원</p>
                <p><strong>배송비:</strong> 0원</p>
                <hr>
                <p><strong>총 결제금액:</strong> <span style="font-size: 1.5em; color: #d9534f;">85,060원</span></p>
            </div>
        </div>

        <!-- 버튼 -->
        <div class="row">
            <div class="col-md-6">
                <button class="btn btn-outline-primary btn-custom">주문 상세보기</button>
            </div>
            <div class="col-md-6">
                <button class="btn btn-primary btn-custom">쇼핑 계속하기</button>
            </div>
        </div>
    </div>
</body>
</html>