<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- 날짜 포멧 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x"%>
<!DOCTYPE html>
<html>
<head>
<!-- 기본 기능 선언부 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<script src="js/PHY/hayeonPHY.js"></script>
<!-- 기본 기능 선언부  -->
<meta charset="UTF-8">
<title>낫팡 - 장바구니</title>
<%
    String LOGID = (String) session.getAttribute("LOGID");
    String LOGNAME = (String) session.getAttribute("LOGNAME");
    String MEMBERDIVISION = (String) session.getAttribute("MEMBERDIVISION");

	if (LOGID == null) {
%>
		<script>
			window.location.replace("/NotCoupang/welcome.do");
		</script>
<%
	} else if (MEMBERDIVISION.equals("seller")) {
%>
		<script>
			//NotCoupang/Admin_main.do
			window.location.replace("/NotCoupang/Admin_main.do");
		</script>
<%
    }
%>
<style>
	.boxPHY {
		width: 900px;
		text-align: center;
		margin: 0px 0;
		padding: 0px;
		border-radius: 5px;
		border: 0px solid cyan;
	}
	.logo {
		width: 140px;
		height: 37px;;
	}
	h2 {
		font-weight: 500;
	}
	a.noline {
		text-decoration: none;
	}
	.thumbnail {
		width: 150px;
		height: 150px;
	}
	.goodscheck {
		width: 25px;
		height: 25px;
	}
	.allcheck {
		width: 15px;
		height: 15px;
	}
	.quantity-container {
         display: flex;
         align-items: center;
         width: 150px;
     }
     .quantity-container button {
         width: 30px;
         height: 30px;
         background-color: #007bff;
         color: white;
         border: none;
         cursor: pointer;
         font-size: 18px;
         font-weight: bold;
     }
     .quantity-container input[type="number"] {
         width: 60px;
         height: 30px;
         text-align: center;
         border: 1px solid #ddd;
         font-size: 16px;
         margin: 0 5px;
     }
	 .link-dark:hover {
		color:#007bff;
	 }
	 .floating {
		position: fixed;
	 }
	 .spinnermap {
		position: fixed;
		top: 0;
		left: 0;
		width: 100vw;
		height: 100vh;
		background-color: rgba(0, 0, 0, 0.5);
		display: flex;
		justify-content: center;
		align-items: center;
		z-index: 9999;
		display: none;
	}
</style>
</head>
<body style="background-color: #EBEBEB;">
	<div class="spinnermap">
		<div class="text-center">
			<div class="spinner-border text-primary" style="width: 5rem; height: 5rem;" role="status">
				<span class="visually-hidden">기다려!</span>
			</div>
		</div>
	</div>
	<div class="d-flex flex-column align-items-center">
		<div class="mt-3 mb-3" style="text-align: left; width: 980px;">
			<a href="/NotCoupang/welcome.do">
				<img class="logo" src="images/logo.png" alt="Logo">
			</a>
		</div>
	</div>
	<div class="d-flex flex-column align-items-center">
		<div class="d-flex flex-column align-items-center pt-5 border-top border-3 border-dark-subtle" style="background-color: white; width: 980px;">
			<div class="boxPHY">
				<div class="d-flex pt-0">
					<div class="me-auto p-0">
						<h2>
							<a class="link-dark" href="javascript:history.back()"><i class="bi bi-chevron-left"></i></a>장바구니
						</h2>
					</div>
					<div class="p-0 align-self-center fw-bold text-secondary">
						<b>01</b>옵션선택<i class="bi bi-chevron-right"></i>
						<b style="color: #4285f4;font-size: 1rem;">02</b><span class="text-dark-emphasis">장바구니<i class="bi bi-chevron-right"></i></span>
						<b>03</b>주문/결제<i class="bi bi-chevron-right"></i>
						<b>04</b>주문완료
					</div>
				</div>
			</div>
			<div class="boxPHY pt-4 d-flex">
				<div class="p-0 flex-fill">
					<div class="d-grid gap-2">
						<button class="border border-bottom-0 border-1 border-primary rounded-top-1 bg-white noline" style="height: 40px; color: #4285f4;" type="button">일반구매(0)</button>
					</div>
				</div>
				<div class="p-0 flex-fill">
					<div class="d-grid gap-2">
						<button class="border-0 border-bottom border-primary rounded-top-1 noline" style="height: 40px; color: rgb(72, 72, 72);" type="button">정기배송(0)</button>
					</div>
				</div>
			</div>





			<div class="boxPHY pt-3">
				<div class="d-flex mb-0">
					<div class="me-auto p-2 border border-1 rounded border-dark-subtle" style="width: 600px; z-index: 999;">
<c:choose>
	<c:when test="${isdata == 'YES'}">
		<c:forEach var="cart" items="${myCartList}">
						<!--요기서-->
						<div class="d-flex mb-0 border-bottom-1 border-1 border-black">
							<div class="p-2 align-self-center">
								<input class="goodscheck" type="checkbox" id="checkbox_${cart.goodsNum}" name="checkbox">
							</div>
							<div class="p-1">
								<a href="goodsinfo.do?seqGoods=${cart.goodsNum }"><img src="images/PHY/${cart.imgUrl }" class="thumbnail"></a>
							</div>
							<div class="pt-2" style="width: 345px;">
								<h5 class="card-title" style="text-align: left;">
									<a class="link-dark link-underline-opacity-0 link-underline-opacity-100-hover" href="goodsinfo.do?seqGoods=${cart.goodsNum }">${cart.goodsName }</a>
								</h5>
								<div id="pricediv" class="p-2 text-start">
									<h3 class="price" name="${cart.goodsPrice }"><fmt:formatNumber value="${cart.goodsPrice * cart.cartCount}" type="number" pattern="#,##0"/>원</h3>
								</div>
								<div class="d-flex">
									<div class="p-2">
										<h3>
											<div class="btn-group border border-2" role="group" aria-label="Basic mixed styles example">
												<!-- 상품 번호로 버튼을 구분해 ID 설정 -->
												<button type="button" class="btn" id="downcount_${cart.goodsNum}" data-goodsnum="${cart.goodsNum}_${cart.goodsInven}">─</button>
												<button type="button" class="btn">${cart.cartCount}</button>
												<button type="button" class="btn" id="upcount_${cart.goodsNum}" data-goodsnum="${cart.goodsNum}_${cart.goodsInven}">┼</button>
											</div>
										</h3>
									</div>
								</div>
							</div>
							<div class="ms-auto p-0">	
								<a class="link-dark link-underline-opacity-100 link-underline-opacity-0-hover" href="#">삭제</a>
							</div>
						</div>
						<!--요기까지 반복-->
		</c:forEach>
	</c:when>
	<c:when test="${isdata == 'NO'}">
        <p>장바구니에 담긴 상품이 없습니다.</p>
    </c:when>
</c:choose>



						
					</div>
					<div class="floating d-flex flex-row-reverse" style="width: 900px;">
						<div class="p-2 border border-1 rounded border-dark-subtle" style="width: 280px; height: 250px;">
							<h3>주문 예상 금액</h3>
							<p>체크한 상품 가격</p>
							<p>총 할인 가격</p>
							<p>총 배송비</p>
							<h3>최종금액 가격</h3>
							<button class="btn btn-primary" id="sellee">구매하기(0)</button>
						</div>
					</div>
				</div>
			</div>
			<div class="boxPHY text-start m-3 p-3">
				<label><input type="checkbox" class="allcheck">전체선택(0/3)</label> <button class="btn btn-outline-dark rounded-0" onclick="abc();">선택삭제</button>
			</div>
		</div>
	</div>
	
	<script>
		document.addEventListener('DOMContentLoaded', function() {
			//완성하면 동일한건 함수로 압축하고 js파일로 만들어야하는데 시간이없넹

			const spinner = document.querySelector('.spinnermap');
				function showSpinner() {
				spinner.style.display = 'flex';
			}
			function hideSpinner() {
				spinner.style.display = 'none';
			}

			//상품들 체크 박스
			document.querySelectorAll('[id^="checkbox_"]').forEach(checkbox => {
				checkbox.addEventListener('change',function(){
					if(checkbox.checked){
						console.log('체크가 되었습니다');
					}else{
						console.log('체크가 풀렸습니다');
					}
				});
			});


			//fetch 로 보낼위치 cartViewcount.do
			//+ 버튼 누르면 현재고 확인해서 증감 하면서 장바구니 DB 변경
			document.querySelectorAll('[id^="upcount_"]').forEach(button => {
	            button.addEventListener('click', function() {
					showSpinner();
					//변경할 요소위치
					let priceElement = button.parentElement.parentElement.parentElement.parentElement.parentElement.querySelector('#pricediv').querySelector('h3');
					//1개 가격
					let oneprice = priceElement.getAttribute('name');
					console.log(priceElement);
					
					//현재재고
					let thiscount = button.parentElement.children[1].textContent;

	                let goodsInfomation = button.getAttribute('data-goodsnum');
					console.log("상품정보 = "+goodsInfomation);
					let parts = goodsInfomation.split("_");
					console.log("상품총재고=",parts[1]);

					if(Number(thiscount) >= Number(parts[1])){
						alert('상품 재고가 부족합니다. 구매할수있는 총 수량은'+parts[1]+'개 입니다');
						hideSpinner();
					}else{
						//장바구니 수량 업데이트
						$.ajax({
							url: 'cartViewcount.do',
							data: { goodsNum: parts[0], thiscount: thiscount, pm: "P" },
							method: "POST",
							dataType: "json"
						})
						.done(function(result) {
							if (result.retCode == 'OK') {
								console.log('성공');
								button.parentElement.children[1].textContent = Number(thiscount)+1;
								priceElement.innerText = (oneprice*(Number(thiscount)+1)).toLocaleString()+"원";
							}else if (result.retCode == 'FAIL') {
								console.log('실패');
							}
							hideSpinner();
						})
						.fail(err => console.log(err));
					}
	            });
	        });
			//- 버튼 누르면 현재고 확인해서 차감 하면서 장바구니 DB 변경
			document.querySelectorAll('[id^="downcount_"]').forEach(button => {
	            button.addEventListener('click', function() {
					showSpinner();
					//변경할 요소위치
					let priceElement = button.parentElement.parentElement.parentElement.parentElement.parentElement.querySelector('#pricediv').querySelector('h3');
					//1개 가격
					let oneprice = priceElement.getAttribute('name');
					console.log(priceElement);

					//현재재고
					let thiscount = button.parentElement.children[1].textContent;

	                let goodsInfomation = button.getAttribute('data-goodsnum');
					console.log("상품정보 = "+goodsInfomation);
					let parts = goodsInfomation.split("_");
					console.log("상품총재고=",parts[1]);

					if(Number(thiscount) <= 1){
						alert('최소 수량은 1개 입니다.');
						hideSpinner();
					}else{
						//장바구니 수량 업데이트
						$.ajax({
							url: 'cartViewcount.do',
							data: { goodsNum: parts[0], thiscount: thiscount, pm: "M" },
							method: "POST",
							dataType: "json"
						})
						.done(function(result) {
							if (result.retCode == 'OK') {
								console.log('성공');
								button.parentElement.children[1].textContent = Number(thiscount)-1;
								priceElement.innerText = (oneprice*(Number(thiscount)-1)).toLocaleString()+"원";
							}else if (result.retCode == 'FAIL') {
								console.log('실패');
							}
							hideSpinner();
						})
						.fail(err => console.log(err));
					}
	            });
	        });
			
			
		});
	</script>
</body>
</html>