<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
 <h3>주문 목록</h3>
 
 
<!--<jsp:include page="../includes/header.jsp"></jsp:include> -->

	<!-- 등록화면을 만들어보자 action에서 지정한 페이지로 이동함-->
	<form action="myOrderList.do">
		<table class="table">
		<tr>
		<th>주문번호</th>
		<th>상품명</th>
		<th>결제방법</th>
		<th>연락처</th>
		<th>주문금액</th>
		<th>주문상태</th>
		<th>주문일시</th>
		<th>운송장번호</th>
		</tr>
		<c:forEach var="orderList" items="${selectOrder}">
		<tr>
		<td><a href="./myOrderList.do?${orderList.buyerId }">${orderList.goodsNum }</a></td>
		
		</tr>
		</c:forEach>
	
		</table>
	</form>



<!-- Bootstrap core JS-->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="../js/scripts.js"></script>