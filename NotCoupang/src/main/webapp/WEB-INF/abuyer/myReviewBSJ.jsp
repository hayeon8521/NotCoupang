<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

			<script>
				document.title = "마이페이지-리뷰";
			</script>

			<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">

			<link rel="stylesheet" href="css/BSJ/myOrderList.css" />

			<style>
				/* 검색창 & 돋보기 */
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

				.search-barBSJ i {
					position: absolute;
					right: 15px;
					top: 50%;
					transform: translateY(-50%);
					cursor: pointer;
					color: #888;
				}

				.motherContentBSH {
					padding: 30px;
					border: 1px solid #eee;
				}
			</style>

			<!-- 세션 -->
			<% String LOGID=(String) session.getAttribute("LOGID"); String LOGNAME=(String)
				session.getAttribute("LOGNAME"); String MEMBERDIVISION=(String) session.getAttribute("MEMBERDIVISION"); %>

				<div class="container mt-4 containerBSJ">
					<div class="row">
						<!-- 사이드바 -->
						<div class="col-md-3 border-end bg-white" id="sidebar-wrapper">
							<div class="sidebar-heading d-flex align-items-center border-bottom mt-3 fw-bold">MY쿠팡</div>

							<div class="list-group list-group-flush" id="nav_div">
								<a class="list-group-item list-group-item-action list-group-item-light p-3"
									href="myOrderList.do?buyerId=${LOGID }">주문 목록</a> <a
									class="list-group-item list-group-item-action list-group-item-light p-3 disabled text-bg-primary"
									href="myReview.do?buyerId=${LOGID }">리뷰 관리</a> <a
									class="list-group-item list-group-item-action list-group-item-light p-3"
									href="myAsk.do?buyerId=${LOGID }">문의 내역</a> <a
									class="list-group-item list-group-item-action list-group-item-light p-3"
									href="checkMem.do?memberId=${LOGID }">회원 정보 수정</a>
							</div>

						</div>

						<!-- 리뷰 섹션 -->
						<div class="col-md-9 p-3">
							<section class="order-section">
								<h2 class="mb-4 mb-4 mt-5">리뷰 목록</h2>

								<!-- 검색창 & 돋보기 HTML -->
								<div class="search-bar search-barBSJ">
									<input type="text" class="form-control" id="orderSearchInputBSJ" placeholder="상품명으로 검색">
									<i class="bi bi-search search-icon" style="position: absolute; right: 15px; top: 50%; transform: translateY(-50%); cursor: pointer;"></i>
								</div>

								<!-- 탭 내비 -->

								<!--  <ul class="nav nav-tabs" id="reviewTabs" role="tablist">
            <li class="nav-item" role="presentation">
              <button class="nav-link active" id="written-tab" data-bs-toggle="tab" data-bs-target="#written" type="button" role="tab" aria-controls="written" aria-selected="true">작성한 리뷰</button>
            </li>
            <li class="nav-item" role="presentation">
              <button class="nav-link" id="unwritten-tab" data-bs-toggle="tab" data-bs-target="#unwritten" type="button" role="tab" aria-controls="unwritten" aria-selected="false">리뷰 작성하기</button>
            </li>
          </ul> -->



								<div class="tab-content border mb-3" id="reviewTabsContent">
									<div class="tab-pane fade show active" id="written" role="tabpanel"
										aria-labelledby="written-tab">
										<fmt:formatDate value="${review.goodsMdate }" pattern="yyyy-MM-dd HH:mm:ss" />
										<fmt:formatNumber value="${review.goodsPrice}" type="number" groupingUsed="true" />


										<!-- 반복문 시작 -->
										<c:forEach var="review" items="${goodsmylist }">
											<c:choose>
												<c:when test="${not empty review.goodsMid }">




													<!-- 작성한 리뷰 콘텐츠 -->
													<!--요기서-->
													<div
														class="d-flex mb-0 border border-bottom-1 border-0 border-black motherContentBSH">
														<div class="p-1 me-3">
															<a href="goodsinfo.do?gno=${review.seqGoods }"><img
																	src="images/${review.imgUrl }" style="width: 300px; height: 300px;"
																	class="thumbnail"></a>
														</div>
														<div class="mt-2" style="width: 60%;">
															<h5 class="card-title goodsNameBSJ" style="text-align: left;">
																${review.goodsName }

															</h5>
															<p>
																<fmt:formatNumber value="${review.goodsPrice}" type="number"
																	groupingUsed="true" />
																원 · ${review.goodsInven }개
															</p>
															<div class="mt-3 text-muted">작성일자:
																<fmt:formatDate value="${review.goodsMdate }"
																	pattern="yyyy-MM-dd HH:mm:ss" />
															</div>
															<div id="pricediv" class="p-2 text-start">
																<h3 class="price" name="${cart.goodsPrice }">
																	<textarea id="reviewContent1" class="form-control" rows="5"
																		readonly="readonly">${review.goodsMid }</textarea>
																</h3>
															</div>
															<div class="d-flex">
																<div class="p-2">
																	<!--  버튼 -->
																	<div class="action-buttons">
																		<button class="btn btn-warning modifyReviewBtn">수정</button>
																		<button class="btn btn-warning modifyDoneBtn"
																			style="display: none;" data-goodsNum="${review.seqGoods}"
																			data-reviewNum="${review.goodsReviews}">수정
																			완료</button>
																		<button class="btn btn-danger delReviewBtn"
																			data-reviewNum="${review.goodsReviews}">삭제</button>
																	</div>

																</div>
															</div>
														</div>
													</div>
													<!--요기까지 반복-->


												</c:when>
											</c:choose>
										</c:forEach>

									</div>

									<div class="tab-pane fade" id="unwritten" role="tabpanel" aria-labelledby="unwritten-tab">
										<p class="mt-3">작성되지 않은 리뷰가 없습니다.</p>
									</div>
								</div>
							</section>
						</div>
					</div>
				</div>


				</body>

				</html>

				<script>

					window.addEventListener('DOMContentLoaded', event => {
						// console.log('DOMContentLoaded 실행됨');  // 이 메시지가 콘솔에 출력되는지 확인
						document.querySelectorAll(".modifyReviewBtn").forEach(button => {
							button.addEventListener('click', function (e) {
								console.log("수정버튼 클릭됨");


								// 클릭된 버튼의 부모 요소를 찾아 해당 섹션에서 <textarea> 찾기
								let reviewContainer = e.target.closest(".motherContentBSH");
								let modifyTextBtn = reviewContainer.querySelector("textarea#reviewContent1"); //수정부 testarea
								modifyTextBtn.removeAttribute("readonly"); //readonly속성빼기 -입력가능


								// 해당 섹션 내의 <textarea> 요소 선택
								let modifyDoneBtn = e.target.parentElement.querySelector(".modifyDoneBtn"); //수정완료 버튼가져옴
								modifyDoneBtn.style.display = 'inline-block'; //수정완료버튼 보이게
								let delReviewBtn = e.target.parentElement.querySelector(".delReviewBtn");
								e.target.style.display = 'none';
								delReviewBtn.style.display = 'none';



							});
						});
					});

					window.addEventListener('DOMContentLoaded', event => {
						document.querySelectorAll(".modifyDoneBtn").forEach(button => {
							button.addEventListener('click', function (e) {
								console.log("수정완료 버튼눌림");

								let modifyReviewBtn = e.target.parentElement.querySelector(".modifyReviewBtn");
								modifyReviewBtn.style.display = 'inline-block'; //수정버튼 보이고
								let delReviewBtn = e.target.parentElement.querySelector(".delReviewBtn");
								delReviewBtn.style.display = 'inline-block'; //삭제버튼 보이고
								e.target.style.display = 'none'; //수정완료버튼 감추고

								let reviewContainer = e.target.closest(".motherContentBSH");
								let modifyTextBtn = reviewContainer.querySelector("textarea#reviewContent1"); //수정부 testarea
								let modifyText = modifyTextBtn.value;
								let modGoodsNum = e.target.getAttribute("data-goodsNum");
								let reviewNum = e.target.getAttribute("data-reviewNum");

								console.log(modifyTextBtn);

								$.ajax({
									url: 'myReviewModify.do',
									data: { modifyText: modifyText, modGoodsNum: modGoodsNum, reviewNum: reviewNum }, //앞:파라미터이름 뒤:실제 데이터이름
									method: "POST",
									dataType: "json"
								})
									.done(function (result) {
										if (result.retCode == 'OK') {  // 화면에 [{retCode:OK}] ->result
											alert("리뷰 수정 성공하셨습니다.");


										} else if (result.retCode == 'FAIL') {
											alert("리뷰 수정에 실패했습니다.");
										}
									})
									.fail(err => console.log(err));


							});
						});
					});

					window.addEventListener('DOMContentLoaded', event => {
						document.querySelectorAll(".delReviewBtn").forEach(button => {
							button.addEventListener('click', function (e) {
								console.log("삭제 버튼눌림");

								/*
								 let reviewContainer = e.target.closest(".d-flex.mb-0.border-bottom-1.border-1.border-black");
					 let modifyTextBtn = reviewContainer.querySelector("textarea#reviewContent1"); //수정부 testarea
								*/

								//motherContentBSH
								let reviewNum = e.target.getAttribute("data-reviewNum");
								console.log(reviewNum);

								/*
							   
								 // 클릭된 버튼의 부모 요소를 찾아 해당 섹션에서 <textarea> 찾기
					  const reviewContainer = e.target.closest(".d-flex.mb-0.border-bottom-1.border-1.border-black");
					  
					  // 해당 섹션 내의 <textarea> 요소 선택
					  let reviewTextarea = reviewContainer.querySelector("textarea#reviewContent1");
					  
					  
								*/

								$.ajax({
									url: 'myReviewDel.do',
									data: { reviewNum: reviewNum }, //앞:파라미터이름 뒤:실제 데이터이름
									method: "POST",
									dataType: "json"
								})
									.done(function (result) {
										if (result.retCode == 'OK') {  // 화면에 [{retCode:OK}] ->result
											alert("리뷰가 삭제 되었습니다.");
											e.target.closest(".motherContentBSH").remove();

										} else if (result.retCode == 'FAIL') {
											alert("리뷰 삭제에 실패했습니다.");
										}


									})
									.fail(err => console.log(err));




							});

						});

					});

					$(document).ready(function () {
					    // 엔터 키 이벤트
					    $('#orderSearchInputBSJ').on('keypress', function (e) {
					        if (e.key === 'Enter') {
					            e.preventDefault();
					            performSearch();
					        }
					    });

					    // 돋보기 버튼 클릭 이벤트
					    $('.search-icon').on('click', function () {
					        performSearch();
					    });

					    // 검색 수행 함수
					    function performSearch() {
					        const searchText = $('#orderSearchInputBSJ').val().toLowerCase().trim();

					        $('.motherContentBSH').each(function () {
					            const goodsName = $(this).find('.goodsNameBSJ').text().toLowerCase().trim();

					            if (goodsName.includes(searchText)) {
					                $(this).addClass('d-flex').show();
					            } else {
					                $(this).removeClass('d-flex').hide();
					            }
					        });
					    }
					});

				</script>