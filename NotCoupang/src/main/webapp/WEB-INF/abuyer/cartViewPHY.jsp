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
						<button class="border border-bottom-0 border-1 border-primary rounded-top-1 bg-white noline" style="height: 40px; color: #4285f4;" type="button">일반구매</button>
					</div>
				</div>
				<div class="p-0 flex-fill">
					<div class="d-grid gap-2">
						<button class="border-0 border-bottom border-primary rounded-top-1 noline" style="height: 40px; color: rgb(72, 72, 72);" type="button">정기배송</button>
					</div>
				</div>
			</div>



<c:choose>
	<c:when test="${isdata == 'YES'}">
			<div class="boxPHY pt-3">
				<div class="d-flex mb-0">
					<div class="me-auto p-2 border border-1 rounded border-dark-subtle" style="width: 600px; z-index: 999;">
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
								<a class="link-dark link-underline-opacity-100 link-underline-opacity-0-hover deleteitem" data-goodsnum="${cart.goodsNum}" href="#">삭제</a>
							</div>
						</div>
						<!--요기까지 반복-->
		</c:forEach>

					</div>
					<div class="floating d-flex flex-row-reverse" style="width: 900px;">
						<div class="p-2 border border-1 rounded border-dark-subtle" style="width: 280px; height: 235px;">
							<div class="d-flex mt-1">
								<div class="me-auto p-1"><h5><b>주문 예상 금액</b></h5></div>
								<div class="p-1"></div>
							</div>
							<div class="d-flex mb-0" style="height: 30px;">
								<div class="me-auto p-0">총 상품 가격</div>
								<div class="p-0 fw-bold viewprice">0원</div>
							</div>
							<div class="d-flex mb-0" style="height: 30px;">
								<div class="me-auto p-0">총 할인</div>
								<div class="p-0 fw-bold text-danger">-0원</div>
							</div>
							<div class="d-flex mb-0">
								<div class="me-auto p-0">총 배송비</div>
								<div class="p-0 fw-bold">+3,000원</div>
							</div>
							<div class="d-flex mb-0">
								<div class="me-auto p-1"></div>
								<div class="p-1 fw-bold fs-2 totalprice">0원</div>
							</div>
							<form name="hiddencart" action="checkoutcart.do">
								<input type="hidden" id="hiddenGoods" name="hiddenGoods" value="">
								<button class="btn btn-primary" id="sellee" type="submit">구매하기</button>
							</form>
						</div>
					</div>
				</div>
			</div>
	</c:when>
	<c:when test="${isdata == 'NO'}">
		<div style="height: 300px; display: flex; align-items: center; justify-content: center;">
			<h1>장바구니에 담은 상품이 없습니다.</h1>
		</div>
	</c:when>
</c:choose>
			<div class="boxPHY text-start m-3 p-3">
				<!--<label><input type="checkbox" class="allcheck">전체선택(0/3)</label> <button class="btn btn-outline-dark rounded-0" onclick="abc();">선택삭제</button>-->
			</div>
		</div>
	</div>
	<!-- footer start -->
	<link rel="stylesheet" href="https://www.coupang.com/resources/20241031181607/np/css/common.ko-KR.css" type="text/css" />
	<footer id="footer" class="footer_new">
		<div class="footer-layer1 is-narrowed border-0">
			<a href="https://news.coupang.com/" target="_blank">회사소개</a>
			<a href="https://ir.aboutcoupang.com/English/home/" target="_blank">Investor Relations</a>
			<a href="https://rocketyourcareer.kr.coupang.com" target="_blank">인재채용</a>
			<a href="https://marketplace.coupangcorp.com/s/?utm_source=button_pc&amp;utm_medium=non_paid&amp;utm_campaign=onsite_ca&amp;utm_id=coupang_app?inflow=WEB_FOOTER_B">입점 / 제휴문의</a>
			<a href="https://mc.coupang.com/ssr/desktop/contact/notice">공지사항</a>
			<a href="https://mc.coupang.com/ssr/desktop/contact/voc">고객의 소리</a>
			<a href="https://www.coupang.com/np/policies/terms">이용약관</a>
			<a href="https://privacy.coupang.com/ko/center/coupang"><b>개인정보 처리방침</b></a>
			<a href="https://rocketpay.coupang.com/rocketpay/operationTerms/coupangPcFooter">쿠팡페이 이용약관</a>
			<a href="https://www.coupang.com/np/safety">신뢰관리센터</a>
			<a href="https://partners.coupang.com/" target="_blank">제휴마케팅</a>
			<a href="https://ads.coupang.com" target="_blank">광고안내</a>
			<div class="site-picker">
				<label>
					<p>Global Site</p>
					<span class="site-picker__arrow"></span>
				</label>
				<ul>
					<li><a href="https://www.tw.coupang.com">Coupang Taiwan 酷澎台灣</a></li>
				</ul>
			</div>
	
		</div>
		<div class="footer-layer2">
			<span class="logo"><a href="https://www.coupang.com/" title="COUPANG">COUPANG</a></span>
			<div class="footer-content">
				<address>
					상호명 및 호스팅 서비스 제공 : 쿠팡(주)<br/>
					대표이사 : 강한승,박대준<br/>
					서울시 송파구 송파대로 570 <br/>
					사업자 등록번호 : 120-88-00767 <br/>
					통신판매업신고 : 2017-서울송파-0680<br/>
					<a href="http://www.ftc.go.kr/info/bizinfo/communicationViewPopup.jsp?wrkr_no=1208800767"
					   target="_blank" class="licensee" title="사업자정  보 확인">사업자정보 확인 &gt;</a>
				</address>
				<div class="contact-info">
					<a href="https://mc.coupang.com/ssr/desktop/contact/inquiry" class="call-center" title="365 고객센터">
						<strong>365고객센터</strong> | 전자금융거래분쟁처리담당<br/>
						<em>1577-7011 (유료)</em>
						서울시 송파구 송파대로 570<br/>
						<span class="contact-fax">email : help@coupang.com</span>
					</a>
				</div>
				<p class="safe-service">
					<strong>우리은행 채무지급보증 안내</strong><br/>
					<span>
					  당사는 고객님이 현금 결제한 금액에 대해<br/>우리은행과 채무지급보증 계약을 체결하여<br/>안전거래를 보장하고 있습니다.<br/>
				  </span>
					<a href="javascript:;" id="serviceCheck" class="service-check" title="서비스 가입사실 확인">서비스 가입사실 확인 &gt;</a>
				</p>
			</div>
		</div>
		<div class="footer-layer3 slide-unit">
			<div class="certification-list" style="width: 968px;height: 80px;margin: 0 auto;background: url(//static.coupangcdn.com/image/coupang/common/footer_asset_v20.png) no-repeat;background-position: -44px -92px;position: relative;background-size: 1086px 178px;">
			</div> 
		</div>
		<div class="footer-layer4" style="height: 95px;">
			<div class="coupang-copyright">
				<p class="info" style="padding-top:9px">사이버몰 내 판매되는 상품 중에는 쿠팡에 등록한 개별 판매자가 판매하는 마켓플레이스(오픈마켓) 상품이 포함되어 있습니다.
					<br> 마켓플레이스(오픈마켓) 상품의 경우 쿠팡은 통신판매중개자이며 통신판매의 당사자가 아닙니다. <br>쿠팡은 마켓플레이스(오픈마켓) 상품, 거래정보 및 거래 등에 대하여 책임을 지지
					않습니다. <br> 쿠팡은 소비자 보호와 안전거래를 위해 신뢰관리센터(CM112@coupang.com)를 운영하고 있으며, 관련 분쟁이 발생할 경우 별도의 분쟁 처리절차에 의거 분쟁이
					처리됩니다.<br> Copyright © Coupang Corp. 2010-2024 All Rights Reserved.
				</p>
				<ul class="sns-link">
					<li><a href="https://www.facebook.com/Coupang.korea" target="_blank" class="facebook" title="쿠팡 페이스북">쿠팡
						페이스북</a></li>
					<li><a href="https://news.coupang.com/" target="_blank" class="blog" title="쿠팡 뉴스룸">쿠팡 뉴스룸</a></li>
					<li><a href="https://www.instagram.com/coupang" target="_blank" class="instagram" title="쿠팡 인스타그램">쿠팡
						인스타그램</a></li>
				</ul>
			</div>
		</div>
	</footer>
	<!-- footer end -->

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

			//상품 삭제
			document.querySelectorAll('.deleteitem').forEach(deleteButton => {
				deleteButton.addEventListener('click', function(event) {
					showSpinner();
					event.preventDefault();
					let goodsnumer = this.getAttribute('data-goodsnum');
					let goodsNum = goodsnumer;
					let thisitem = this.closest('.d-flex.mb-0.border-bottom-1.border-1.border-black');
					let checkbox = thisitem.querySelector('.goodscheck');
            		let thisprice = thisitem.querySelector('.price');
					thisprice = parseInt(thisprice.innerText.replace(/,/g, "").replace("원", ""), 10);
					if (checkbox.checked) {
						let viewprice = document.querySelector('.viewprice').innerText;
						viewprice = parseInt(viewprice.replace(/,/g, "").replace("원", ""), 10);
						let hiddenGoods = document.querySelector('#hiddenGoods').value;
						document.querySelector('.viewprice').innerText = (Number(viewprice)-Number(thisprice)).toLocaleString()+"원";
						if((Number(viewprice)-Number(thisprice))==0){
							document.querySelector('.totalprice').innerText = "0원";
						}else{
							document.querySelector('.totalprice').innerText = (Number(viewprice)-Number(thisprice)+3000).toLocaleString()+"원";
						}
						goodsnumer = goodsnumer+"_";
						hiddenGoods = hiddenGoods.replace(goodsnumer,"");
						document.querySelector('#hiddenGoods').value = hiddenGoods; 
					}
					if (thisitem) {
						//장바구니에서 아이템삭제
						$.ajax({
							url: 'cartDelete.do',
							data: { goodsNum: goodsNum },
							method: "POST",
							dataType: "json"
						})
						.done(function(result) {
							if (result.retCode == 'OK') {
								console.log('삭제 성공');
								thisitem.remove();
								hideSpinner();
							}else if (result.retCode == 'FAIL') {
								console.log('삭제 실패');
								hideSpinner();
							}
						})
						.fail(err => console.log(err));
					}
				});
			});


			//상품들 체크 박스
			document.querySelectorAll('[id^="checkbox_"]').forEach(checkbox => {
				checkbox.addEventListener('change',function(){
					//현재가격 가져와서
					let thisprice = checkbox.closest('.d-flex').querySelector('.price').innerText;
					thisprice = parseInt(thisprice.replace(/,/g, "").replace("원", ""), 10);
					let goodsnumer = checkbox.getAttribute('id').split("_")[1];
					let viewprice = document.querySelector('.viewprice').innerText;
					viewprice = parseInt(viewprice.replace(/,/g, "").replace("원", ""), 10);
					let hiddenGoods = document.querySelector('#hiddenGoods').value;

					if(checkbox.checked){
						console.log('체크가 되었습니다');
						document.querySelector('.viewprice').innerText = (Number(viewprice)+Number(thisprice)).toLocaleString()+"원";
						document.querySelector('.totalprice').innerText = (Number(viewprice)+Number(thisprice)+3000).toLocaleString()+"원";
						hiddenGoods = hiddenGoods + goodsnumer + "_";
    					document.querySelector('#hiddenGoods').value = hiddenGoods; 
					}else{
						console.log('체크가 풀렸습니다');
						document.querySelector('.viewprice').innerText = (Number(viewprice)-Number(thisprice)).toLocaleString()+"원";
						if((Number(viewprice)-Number(thisprice))==0){
							document.querySelector('.totalprice').innerText = "0원";
						}else{
							document.querySelector('.totalprice').innerText = (Number(viewprice)-Number(thisprice)+3000).toLocaleString()+"원";
						}
						goodsnumer = goodsnumer+"_";
						hiddenGoods = hiddenGoods.replace(goodsnumer,"");
						document.querySelector('#hiddenGoods').value = hiddenGoods; 
					}
					console.log(document.querySelector('#hiddenGoods').value);
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