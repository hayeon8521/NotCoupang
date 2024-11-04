<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<% String id = (String) session.getAttribute("LOGID");
	request.setAttribute("id", id);
%>
<meta charset="UTF-8">
<meta name="viewport" content="width=1200">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="css/CTB/goodsinfo.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
	document.title = "${goodsinfo.goodsName}";
</script>
</head>

<body>
	<div id="container">
		<section class="py-5">
			<div class="fixed-layout">

				<!-- 섬네일 이미지 530*600-->
				<!-- 테스트 이미지 https://dummyimage.com/600x700/dee2e6/6c757d.jpg -->
				<div class="content-left"></div>
				<div class="content-right" id="topGoodsinfo">
					<br>
					<!-- 상품명 -->
					<h3 class="display-5 fw-bolder">${goodsinfo.goodsName}</h3>
					<hr>
					<div class="fs-5 mb-5">
						<!-- 상품가격 -->
						<span id="price" class="goodsPrice makeBold"></span>
						<!-- 상품재고 -->
						<span id="stock-area" class="coupangGray">재고: <span>${goodsinfo.goodsInven}</span>개
						</span>
						<div class="topShipInfo makeBold">
							<p>
								무료배송 <span class="coupangGray">반품비 5,000원</span>
							</p>
							<p>배송사: CJ 대한통운</p>
						</div>
					</div>

					<div id="action-btn-menu" class="d-flex">
						<input class="form-control text-center me-3" id="inputQuantity"
							type="number" value="1" style="max-width: 4rem" />
						<!-- 장바구니 버튼 -->
						<button type="button" id="addCartBtn"
							class="btn btn-light coupangBlueBorder btnWid addCart addCartColor custom-radius">
							장바구니 담기</button>
						<!-- 바로 구매 버튼 -->
						<button type="button" id="buyBtn" onclick="sendCheckout()"
							class="btn btn-primary coupangBlueBack coupangBlueBorder btnWid custom-radius">
							바로 구매 ></button>
					</div>

					<div class="topShipInfo makeBold">
						<!-- 판매자명 -->
						<p>판매자: ${goodsinfo.goodsMid }</p>
						<!-- 리뷰 개수 -->
						<p>
							리뷰(<span class="totalReviewCnt">0</span>)
						</p>
					</div>
					<hr>
					<p>
						<span class="makeBold">적립</span>&nbsp;&nbsp;&nbsp;최대 5,000원
						낫쿠팡캐시적립 · 낫쿠페이 머니 결제시
					</p>
					<hr>
				</div>

			</div>
		</section>

		<section id="bottomSection">
			<ul class="tab-titles">
				<li class="makeBold"><a href="#detail">상품상세</a></li>
				<li class="makeBold"><a href="#review">상품평</a></li>
				<li class="makeBold"><a href="#qna">상품문의</a></li>
			</ul>
			<div id="detail">
				<!-- 바로 사진 들어갑니다. -->
				<!-- 사진 가져오기 최대 5개 -->



			</div>
			<div id="review" class="bottomAlign">
				<h3 id="moveR">상품평</h3>
				<div class="review-content">
					<!-- 상품평 리스팅-->
				</div>
				<div class="review-paging">
					<!-- 페이징 -->
				</div>



				<br> <br>
			</div>
			<div id="qna" class="bottomAlign">
				<div id="qna-modal-section">
					<h3>상품문의하기</h3>

					<button type="button" class="btn btn-light" id="open-modal-Btn">문의하기</button>

					<div class="Qna-modal">
						<div class="modal-content">
							<div>
								<span class="close">&times;</span>
								<p><b>상품문의</b></p>
							</div>
							<hr>
							<div>
								<table>
									<tbody>
										<tr>
											<th>문의내용</th>
											<td><textarea cols="30" rows="5" autofocus placeholder="문의사항을 입력해주세요."></textarea></td>
										</tr>
									</tbody>
								</table>
							<div class="modalBtn">
								<button type="button" class="btn btn-primary submit-qna">확인</button>
								<button type="button" class="btn btn-primary cancel-submit">취소</button>
							</div>
							
							</div>
						</div>
					</div>
				</div>
				<ul id="qna-term">
					<li>구매한 상품의 취소/반품은 마이쿠팡 구매내역에서 신청 가능합니다.</li>
					<li>상품문의 및 후기게시판을 통해 취소나 환불, 반품 등은 처리되지 않습니다.</li>
					<li>가격, 판매자, 교환/환불 및 배송 등 해당 상품 자체와 관련 없는 문의는 고객센터 내 1:1 문의하기를
						이용해주세요.</li>
					<li>"해당 상품 자체"와 관계없는 글, 양도, 광고성, 욕설, 비방, 도배 등의 글은 예고 없이 이동,
						노출제한, 삭제 등의 조치가 취해질 수 있습니다.</li>
					<li>공개 게시판이므로 전화번호, 메일 주소 등 고객님의 소중한 개인정보는 절대 남기지 말아주세요.</li>
				</ul>
				<div>
					<div class="qna-content"></div>
					<div class="qna-paging">
						<!-- 페이징 -->
					</div>
				</div>
				<br> <br>
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
					CD/DVD/GAME/<br> BOOK ㆍ복제가 가능한 상품의 포장 등을 훼손한 경우<br> <br>
					<span class="termsT">판매자 정보</span><br> <br> 판매자 낫쿠팡
					1577-7011<br> 미성년자가 체결한 계약은 법정대리인이 동의하지 않는 경우 본인 또는 법정대리인이 취소할
					수 있습니다.<br> <br>
				</p>
			</div>
		</section>
	</div>
	<div id="quick-scroll">
		<!-- 커서 클릭 모양으로 바뀌게 하기 위해 javascript:void(0) 사용, 실제 기능은 이벤트 핸들러에서 구현-->
		<a href="javascript:void(0)" id="quick-scroll_top"
			onclick="scrollToTop()"></a> <a href="javascript:void(0)"
			id="quick-scroll_bottom" onclick="scrollToBottom()"></a>
	</div>
</body>
<script>
	const logID = '${id}';
	//로그인 기능 구현후에 위에 코드 주석 풀 예정입니다. 아래는 임시!
	//const logID = "IDTestOnInfo";
	var gno = '${ goodsinfo.seqGoods }';
	var mid = '${goodsinfo.goodsMid}';

	//숫자 1000단위마다 콤마찍기. 숫자로 가져와서 바꾸니가 문자열로 만들지 않았음.
	let price = ${goodsinfo.goodsPrice};
	document.querySelector('#price').innerHTML = price.toLocaleString() + "원";
	//스크롤 최상단으로 이동
	function scrollToTop() {
		window.scrollTo({
			top : 0,
		});
	}
	//스크롤 최하단으로 이동
	function scrollToBottom() {
		window.scroll({
			top : document.body.scrollHeight,
		//behavior: 'smooth'
		});
	}
</script>
<script src="js/CTB/goodsinfoCTB.js"></script>

</html>
