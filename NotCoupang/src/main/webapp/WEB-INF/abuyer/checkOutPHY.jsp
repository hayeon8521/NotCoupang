<%@page import="com.Fyou.vo.CartmylistVO"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- 날짜 포멧 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!-- 
MemberVO(memberId=test, memberPw=test, memberNick=im_test, memberName=테스트, memberPhone=010-4321-9876, memberAddress=대구 중구 동성로 33, memberDivision=buyer, memberDate=Fri Nov 01 19:33:11 KST 2024)
[CartmylistVO(seqCart=123, goodsNum=11, memberId=test, cartCount=5, goodsName=콜라, goodsPrice=15000, goodsInven=999, imgUrl=여기선 피료없음)]
 -->
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
<title>낫팡 - 주문/결제</title>
<%
	String gno = request.getParameter("gno");
	String hiddenGoods = "";
	if(gno == null || gno.equals("")){
		hiddenGoods = request.getParameter("hiddenGoods");
	}else{
		hiddenGoods = gno+"_";
	}
	int totalcount = 0;
	List<CartmylistVO> myCartList = (List<CartmylistVO>) request.getAttribute("myCartList");
	for (CartmylistVO list : myCartList) {
		totalcount += list.getGoodsPrice()*list.getCartCount();
	}
	request.setAttribute("totalcount", totalcount);
	request.setAttribute("totalcount2", totalcount+3000);
%>
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
			window.location.replace("/NotCoupang/Admin_main.do");
		</script>
<%
    }
%>
<%
    Calendar calendar = Calendar.getInstance();
    calendar.add(Calendar.DATE, 3);
    Date datePlus1 = calendar.getTime();

    SimpleDateFormat dayFormat = new SimpleDateFormat("E", java.util.Locale.KOREAN);
    String dayOfWeek = dayFormat.format(datePlus1);

    SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd");
    String formattedDate = dateFormat.format(datePlus1);

    pageContext.setAttribute("dayOfWeek", dayOfWeek);
    pageContext.setAttribute("formattedDate", formattedDate);
%>
<style>
	.logo {
		width: 174px;
		height: 41px;
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
	.btn-primary {
		background-color: #007bff;
		border-color: #007bff;
		font-size: 1.2em;
		width: 100%;
	}
	.max-reward {
		color: red;
		font-weight: bold;
	}
</style>
</head>
<body style="background-color: white;">
	<div class="spinnermap">
		<div class="text-center">
			<div class="spinner-border text-primary" style="width: 5rem; height: 5rem;" role="status">
				<span class="visually-hidden">기다려!</span>
			</div>
		</div>
	</div>
	<div class="d-flex flex-column align-items-center pt-3">
		<div class="mt-3 mb-3" style="text-align: left; width: 1020px;">
			<a href="/NotCoupang/welcome.do">
				<img class="logo" src="images/logo.png" alt="Logo">
			</a>
		</div>
	</div>
	<div style="border: 1px solid darkgray; width: 100%;"></div>
	<div class="d-flex flex-column align-items-center">
		<div class="mt-3 mb-3" style="text-align: left; width: 1020px;">
			<div class="d-flex mb-3 border-bottom border-secondary border-3">
				<div class="me-auto p-2"><h3>주문/결제</h3></div>
				<div class="p-2 fs-6 align-self-center">
					<span style="color: #4285f4;">주문결제></span>
					<span style="color: gainsboro;">주문완료</span>
				</div>
			</div>
			<!-- 구매자 정보 -->
			<div class="card mb-4">
				<div class="card-header bg-light">
					<h5>구매자 정보</h5>
				</div>
				<div class="card-body">
					<div class="row mb-2">
						<div class="col-md-2 font-weight-bold text-end">이름</div>
						<div class="col-md-10">${memberInfo.memberName}</div>
					</div>
					<div class="row mb-2">
						<div class="col-md-2 font-weight-bold text-end">아이디</div>
						<div class="col-md-10">${memberInfo.memberId}</div>
					</div>
					<div class="row mb-2">
						<div class="col-md-2 font-weight-bold text-end">휴대폰 번호</div>
						<div class="col-md-10">
							${memberInfo.memberPhone} <button class="btn btn-light btn-sm ml-2">수정</button>
						</div>
					</div>
					<small class="text-muted">인증 번호를 못 받았다면, 1577-7011 번호 차단 및 스팸 설정을 확인해 주세요.</small>
				</div>
			</div>

			<!-- 받는 사람 정보 -->
			<div class="card mb-4">
				<div class="card-header bg-light">
					<h5>받는 사람 정보</h5>
				</div>
				<div class="card-body">
					<div class="row mb-2">
						<div class="col-md-2 font-weight-bold text-end">이름</div>
						<div class="col-md-10">${memberInfo.memberName} <span class="badge badge-primary ml-2">기본배송지</span></div>
					</div>
					<div class="row mb-2">
						<div class="col-md-2 font-weight-bold text-end">배송주소</div>
						<div class="col-md-10">${memberInfo.memberAddress}</div>
					</div>
					<div class="row mb-2">
						<div class="col-md-2 font-weight-bold text-end">연락처</div>
						<div class="col-md-10">${memberInfo.memberPhone}</div>
					</div>
					<div class="row mb-2">
						<div class="col-md-2 font-weight-bold text-end">배송 요청사항</div>
						<div class="col-md-10">
							<div class="dropdown">
								<button class="btn btn-light dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
									배송 요청사항 선택
								</button>
								<ul class="dropdown-menu">
									<li><a class="dropdown-item" onclick="setInputValue('문 앞')">문 앞</a></li>
									<li><a class="dropdown-item" onclick="setInputValue('직접 받고 부재 시 문 앞')">직접 받고 부재 시 문 앞</a></li>
									<li><a class="dropdown-item" onclick="setInputValue('경비실')">경비실</a></li>
									<li><a class="dropdown-item" onclick="setInputValue('택배함')">택배함</a></li>
									<li><a class="dropdown-item" onclick="setInputValue('위에서만 골라주세요')">위에서만 골라주세요</a></li>
								</ul>
							</div>
							<input type="text" class="form-control" id="selectedItemInput" placeholder="배송 요청 사항 선택 또는 입력해주세요" readonly>
						</div>
					</div>
				</div>
			</div>

			<!-- 배송 정보 -->
			<div class="card mb-4">
				<div class="card-header bg-light">
					<h5>배송 상품 정보</h5>
				</div>
				<div class="card-body">
					<p class="text-success font-weight-bold"><b>(${dayOfWeek}) ${formattedDate} 도착 보장</b></p>
					<c:forEach var="cart" items="${myCartList}">
						<p class="p-2">${cart.goodsName}, ${cart.cartCount}개, <fmt:formatNumber value="${cart.goodsPrice * cart.cartCount}" type="number" pattern="#,##0"/>원</p>
					</c:forEach>
					<p><b>수량 <c:out value="${fn:length(myCartList)}"/> 개 / 유료배송</b></p>
				</div>
			</div>

			<!-- 결제 정보 -->
			<div class="card mb-4">
				<div class="card-header bg-light">
					<h5>결제 정보</h5>
				</div>
				<div class="card-body">
					<div class="row mb-2">
						<div class="col-md-3 font-weight-bold">총 상품가격</div>
						<div class="col-md-9"><fmt:formatNumber value="${totalcount}" type="number" pattern="#,##0"/>원</div>
					</div>
					<div class="row mb-2">
						<div class="col-md-3 font-weight-bold">할인쿠폰</div>
						<div class="col-md-9">0원 <small class="text-muted text-danger">적용 가능한 할인쿠폰이 없습니다.</small></div>
					</div>
					<div class="row mb-2">
						<div class="col-md-3 font-weight-bold">배송비</div>
						<div class="col-md-9">3,000원</div>
					</div>
					<div class="row mb-2">
						<div class="col-md-3 font-weight-bold">쿠팡캐시</div>
						<div class="col-md-9">보유 : 0원</div>
					</div>
					<div class="row mb-2">
						<div class="col-md-3 font-weight-bold">총 결제금액</div>
						<div class="col-md-9"><b><fmt:formatNumber value="${totalcount2}" type="number" pattern="#,##0"/>원</b></div>
					</div>
				</div>
			</div>

			<div class="container mt-5">
				<!-- 결제 수단 -->
				<h5 class="font-weight-bold">결제 수단</h5>
				<div class="card p-3 mb-4">
					<div class="form-check payment-methods">
						<input class="form-check-input" type="radio" name="paymentMethod" id="creditCard" checked>
						<label class="form-check-label" for="creditCard">
							신용/체크카드
						</label>
						<span class="max-reward ml-2">최대 캐시적립</span>
						<div class="mt-2 pl-4">
							<select class="form-control mb-2" aria-label="Bank Selection">
								<option selected>신한카드 / ********4747</option>
								<option>국민카드 / ********1234</option>
								<option>우리카드 / ********5678</option>
							</select>
						</div>
					</div>
					<div class="form-check payment-methods">
						<input class="form-check-input" type="radio" name="paymentMethod" id="creditCard">
						<label class="form-check-label" for="creditCard">
							무통장 입금(가상계좌)
						</label>
						<span class="max-reward ml-2">5일 이내 미입금시 자동 결제취소</span>
						<div class="mt-2 pl-4">
							<select class="form-control mb-2" aria-label="Bank Selection">
								<option >신한은행 / 11023-90-77314</option>
								<option selected>국민은행 / 23091-87-45620</option>
								<option>우리은행 / 98234-56-19203</option>
								<option>한국은행 / 37490-12-78345</option>
								<option>농협 / 56902-34-98212</option>
								<option>우체국 / 90384-73-29184</option>
								<option>하나은행 / 12049-67-48290</option>
								<option>카카오뱅크 / 74820-45-19302</option>
								<option>토스뱅크 / 65231-89-34028</option>
							</select>
						</div>
					</div>
				</div>
				<p class="text-center mt-3 text-muted" style="font-size: 0.9em;">
					위 주문 내용을 확인 하였으며, 회원 본인은 개인정보 이용 제공(해외직구의 경우 국외제공) 및 결제에 동의합니다.
				</p>
				<form id="hiddencart" name="hiddencart" action="thank-you.do">
					<input type="hidden" id="hiddenGoods" name="hiddenGoods" value="<%=hiddenGoods%>">
					<button class="btn btn-primary paypull" type="button">결제하기</button>
				</form>
				
			</div>
		</div><!--<div class="mt-3 mb-3" style="text-align: left; width: 1020px;">-->
	</div>
</body>
<script>
	document.addEventListener('DOMContentLoaded', function() {
		const spinner = document.querySelector('.spinnermap');
		function showSpinner() {
			spinner.style.display = 'flex';
		}
		function hideSpinner() {
			spinner.style.display = 'none';
		}
		document.querySelector('.paypull').addEventListener('click',function(){
			showSpinner();
			setTimeout(function() {
				hideSpinner();
				document.querySelector("#hiddencart").submit();
			}, 200);
		});
	});
	
	function setInputValue(value) {
		document.getElementById("selectedItemInput").value = value;
	}
</script>
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
</html>