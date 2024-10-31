<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=1200">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="css/goodsinfo.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<div id="container">
		<section class="py-5">
			<div class="fixed-layout">

					<!-- 섬네일 이미지 600*700-->
					<div class="content-left">
						<img class="card-img-top mb-5 mb-md-0" id="sumnail"
							src="https://dummyimage.com/600x700/dee2e6/6c757d.jpg" alt="..." />
					</div>
					<div class="content-right" id="topGoodsinfo">
						<br>
						<!-- 상품명 -->
						<h3 class="display-5 fw-bolder">${goodsinfo.goodsName}</h3>
						<hr>
						<div class="fs-5 mb-5">
							<!-- 상품가격 -->
							<span class="goodsPrice makeBold">${goodsinfo.goodsPrice}</span>
							<!-- 상품재고 -->
							<span id="stock" class="coupangGray">재고: ${goodsinfo.goodsInven}개</span>
							<div class="topShipInfo makeBold">
								<p>
									무료배송 <span class="coupangGray">반품비 5,000원</span>
								</p>
								<p>배송사: CJ 대한통운</p>
							</div>
						</div>

						<div class="d-flex">
							<input class="form-control text-center me-3" id="inputQuantity"
								type="number" value="1" style="max-width: 4rem" />
							<button type="button" id="addCartBtn"
								class="btn btn-light coupangBlueBorder btnWid addCart addCartColor custom-radius">
								장바구니 담기</button>
							<button type="button" id="buyBtn"
								class="btn btn-primary coupangBlueBack coupangBlueBorder btnWid custom-radius">
								바로 구매 ></button>
						</div>

						<div class="topShipInfo makeBold">
							<!-- 판매자명 -->
							<p>판매자:</p>
							<!-- 리뷰 개수 -->
							<p>리뷰()</p>
						</div>
						<hr>
						<p>
							<span class="makeBold">적립</span>&nbsp;&nbsp;&nbsp;최대 5,000원 쿠팡캐시
							적립 · 쿠페이 머니 결제시
						</p>
						<hr>
					</div>

			</div>
		</section>

		<section id="bottomSection">
			<ul class="tab-titles">
				<li class="makeBold">상품상세</li>
				<li class="makeBold">상품평</li>
				<li class="makeBold">상품문의</li>
			</ul>
			<div id="detail">
				<h4>상품상세</h4>
				<!-- 사진 가져오기 최대 5개 -->
				<img src="" class="detailPic" alt="...">
				<p>사진 영역</p>
				<br> <br> <br>
			</div>
			<div id="review" class="bottomAlign">
				<h4>상품평</h4>
				<p>상품평 리스팅</p>
				<br> <br> <br>
			</div>
			<div id="qna" class="bottomAlign">
				<h4>상품문의</h4>
				<p>상품문의 리스팅</p>
				<br> <br> <br>
			</div>
			<div id="terms">
				<p>
					<span class="termsT">배송정보</span><br> 배송방법 순차배송 배송비 무료배송<br>
					- 로켓배송 상품 중 19,800원 이상 구매 시 무료배송<br> - 도서산간 지역 추가비용 없음<br>
					묶음배송 여부 가능<br> 배송기간 <br> ㆍ쿠팡친구 배송 지역 : 주문 및 결제 완료 후, 1-2일
					이내 도착<br> ㆍ쿠팡친구 미배송 지역 : 주문 및 결제 완료 후, 2-3일 이내 도착<br> -
					도서 산간 지역 등은 하루가 더 소요될 수 있습니다. 곧 고객님께도 쿠팡친구가 찾아갈 수 있도록 노력하겠습니다<br>
					<br> ㆍ천재지변, 물량 수급 변동 등 예외적인 사유 발생 시, 다소 지연될 수 있는 점 양해 부탁드립니다.<br>
					<br> <span class="termsT">교환/반품 안내</span><br> ㆍ교환/반품에 관한
					일반적인 사항은 판매자가 제시사항보다 관계법령이 우선합니다.<br> 다만, 판매자의 제시사항이 관계법령보다
					소비자에게 유리한 경우에는 판매자 제시사항이 적용됩니다.<br> 교환/반품 비용 ㆍ와우멤버십 회원: 무료로
					반품/교환 가능<br> ㆍ와우멤버십 회원 아닌 경우:<br> 1) [총 주문금액] - [반품 상품금액]
					= 19,800원 미만인 경우 반품비 5,000원<br> 2) [총 주문금액] - [반품 상품금액] =
					19,800원 이상인 경우 반품비 2,500원<br> 교환/반품 신청 기준일 <br> ㆍ단순변심에 의한
					로켓배송 상품의 교환/반품은 제품 수령 후 30일 이내까지, 교환/반품 제한사항에 해당하지 않는 경우에만 가능
					(교환/반품 비용 고객부담)<br> <br> ㆍ상품의 내용이 표시·광고의 내용과 다른 경우에는 상품을
					수령한 날부터 3개월 이내, 그 사실을 안 날 또는 알 수 있었던 날부터<br> 30일 이내에 청약철회 가능<br>
					<br> <span class="termsT">교환/반품 제한사항</span><br> ㆍ주문/제작
					상품의 경우, 상품의 제작이 이미 진행된 경우<br> ㆍ상품 포장을 개봉하여 사용 또는 설치 완료되어 상품의
					가치가 훼손된 경우 (단, 내용 확인을 위한 포장 개봉의 경우는 예외)<br> ㆍ고객의 사용, 시간경과, 일부
					소비에 의하여 상품의 가치가 현저히 감소한 경우<br> ㆍ세트상품 일부 사용, 구성품을 분실하였거나 취급
					부주의로 인한 파손/고장/오염으로 재판매 불가한 경우<br> ㆍ모니터 해상도의 차이로 인해 색상이나 이미지가
					실제와 달라, 고객이 단순 변심으로 교환/반품을 무료로 요청하는 경우<br> ㆍ제조사의 사정 (신모델 출시 등)
					및 부품 가격 변동 등에 의해 무료 교환/반품으로 요청하는 경우<br> ※ 각 상품별로 아래와 같은 사유로
					취소/반품이 제한될 수 있습니다.<br> <br> 의류/잡화/수입명품 <br> ㆍ상품의
					택(TAG) 제거, 라벨 및 상품 훼손, 구성품 누락으로 상품의 가치가 현저히 감소된 경우<br> <br>
					계절상품/식품/화장품 <br> ㆍ신선/냉장/냉동 상품의 단순변심의 경우<br> <br> ㆍ뷰티
					상품 이용 시 트러블(알러지, 붉은 반점, 가려움, 따가움)이 발생하는 경우,<br> 진료 확인서 및 소견서
					등을 증빙하면 환불이 가능 (제반비용 고객부담)<br> <br> 전자/가전/설치상품 <br>
					ㆍ설치 또는 사용하여 재판매가 어려운 경우<br> <br> ㆍ상품의 시리얼 넘버 유출로 내장된
					소프트웨어의 가치가 감소한 경우 (내비게이션, OS시리얼이 적힌 PMP)<br> <br> ㆍ홀로그램
					등을 분리, 분실, 훼손하여 상품의 가치가 현저히 감소하여 재판매가 불가할 경우 (노트북, 데스크탑 PC 등)<br>
					<br> 자동차용품 <br> ㆍ상품을 개봉하여 장착한 이후 단순변심인 경우<br> <br>
					CD/DVD/GAME/<br> BOOK ㆍ복제가 가능한 상품의 포장 등을 훼손한 경우<br>
					<br> <span class="termsT">판매자 정보</span><br> <br> 판매자
					쿠팡 1577-7011<br> 미성년자가 체결한 계약은 법정대리인이 동의하지 않는 경우 본인 또는 법정대리인이
					취소할 수 있습니다.<br> <br>
				</p>
			</div>
		</section>
	</div>
	<p>${goodsinfo}</p>
	<p>${reviews}</p>
	<p>${asks}</p>
	<p>${imgs}</p>
</body>


</html>
