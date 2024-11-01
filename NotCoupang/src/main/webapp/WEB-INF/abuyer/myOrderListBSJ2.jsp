<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=1200">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="css/BSJ/myOrderList.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<h3>주문 목록</h3>



<!-- 등록화면을 만들어보자 action에서 지정한 페이지로 이동함 -->
<style>
body {
	margin: 0;
}

* {
	box-sizing: border-box;
}

p, span {
	margin: 0;
}

a {
	color: black;
}

img {
	display: block;
	width: 80%;
	height: 80px;
	margin: auto;
}

.cart {
	width: 80%;
	margin: auto;
	padding: 30px;
}

.cart ul {
	background-color: whitesmoke;
	padding: 30px;
	margin-bottom: 50px;
	border: whitesmoke solid 1px;
	border-radius: 5px;
	font-size: 13px;
	font-weight: 300;
}

.cart ul :first-child {
	color: #4285f4;
}

table {
	border-top: solid 1.5px black;
	border-collapse: collapse;
	width: 100%;
	font-size: 14px;
}

thead {
	text-align: center;
	font-weight: bold;
}

tbody {
	font-size: 12px;
}

td {
	padding: 15px 0px;
	border-bottom: 1px solid lightgrey;
}

.cart__list__detail :nth-child(3) {
	vertical-align: top;
}

.cart__list__detail :nth-child(3) a {
	font-size: 12px;
}

.cart__list__detail :nth-child(3) p {
	margin-top: 6px;
	font-weight: bold;
}

.cart__list__smartstore {
	font-size: 12px;
	color: gray;
}

.cart__list__option {
	vertical-align: top;
	padding: 20px;
}

.cart__list__option p {
	margin-bottom: 25px;
	position: relative;
}

.cart__list__option p::after {
	content: "";
	width: 90%;
	height: 1px;
	background-color: lightgrey;
	left: 0px;
	top: 25px;
	position: absolute;
}

.cart__list__optionbtn {
	background-color: white;
	font-size: 10px;
	border: lightgrey solid 1px;
	padding: 7px;
}

.cart__list__detail :nth-child(4), .cart__list__detail :nth-child(5),
	.cart__list__detail :nth-child(6) {
	border-left: 2px solid whitesmoke;
}

.cart__list__detail :nth-child(5), .cart__list__detail :nth-child(6) {
	text-align: center;
}

.cart__list__detail :nth-child(5) button {
	background-color: limegreen;
	color: white;
	border: none;
	border-radius: 5px;
	padding: 4px 8px;
	font-size: 12px;
	margin-top: 5px;
}

.price {
	font-weight: bold;
}

.cart__mainbtns {
	width: 420px;
	height: 200px;
	padding-top: 40px;
	display: block;
	margin: auto;
}

.cart__bigorderbtn {
	width: 200px;
	height: 50px;
	font-size: 16px;
	margin: auto;
	border-radius: 5px;
}

.cart__bigorderbtn.left {
	background-color: white;
	border: 1px lightgray solid;
}

.cart__bigorderbtn.right {
	background-color: #4285f4;
	color: white;
	border: none;
}

.btn_block {
	display: block;
	margin-bottom: 10px;
}
</style>

<section class="cart">
	<div class="cart__information">
		<ul>
			<li>장바구니 상품은 최대 30일간 저장됩니다.</li>
			<li>가격, 옵션 등 정보가 변경된 경우 주문이 불가할 수 있습니다.</li>
			<li>오늘출발 상품은 판매자 설정 시점에 따라 오늘출발 여부가 변경될 수 있으니 주문 시 꼭 다시 확인해 주시기
				바랍니다.</li>
		</ul>
	</div>
	<table class="cart__list">
		<form>
			<thead>
				<tr>
					<td><input type="checkbox"></td>
					<td id="orderDate">2024.11.01 주문</td>
					<td>상품정보</td>
					<td>옵션</td>
					<td>상품금액</td>
					<td>>상세보기</td>
				</tr>
			</thead>
			<tbody>
				<tr class="cart__list__detail">
					<td><input type="checkbox"></td>
					<td><img src="image/keyboard.jpg" alt="magic keyboard"></td>
					<td><a href="#">애플 공식 브랜드스토어</a><span
						class="cart__list__smartstore"> 스마트스토어</span>
						<p>Apple 매직 키보드 - 한국어(MK2A3KH/A)</p> <span class="price">116,62원</span><span
						style="text-decoration: line-through; color: lightgray;">119,000</span>
					</td>
					<td class="cart__list__option">
						<p>모델명 : 키보드 - 한국어 MK2A3KH/A / 1개</p>
					</td>
					<td><span class="price">116,620원</span><br></td>
					<td style="padding-left: 30px;"><button class="cart__list__optionbtn btn_block">배송
							조회</button>
					<button class="cart__list__optionbtn btn_block">교환/반품</button>
					<button class="cart__list__optionbtn btn_block">리뷰
							작성</button></td>
				</tr>

			</tbody>
			<tfoot>
				<tr>
					<td colspan="3"><input type="checkbox">
						<button class="cart__list__optionbtn">주문목록 삭제</button>
						<button class="cart__list__optionbtn">장바구니 담기</button></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</tfoot>
		</form>
	</table>
	<div class="cart__mainbtns">
		<button class="cart__bigorderbtn left">쇼핑 계속하기</button>
		<button class="cart__bigorderbtn right">주문하기</button>
	</div>
</section>




<!-- Bootstrap core JS-->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="../js/scripts.js"></script>