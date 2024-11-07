<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script>
    document.title = "마이페이지-문의";
</script>


<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">


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
    padding-right: 40px; /* 돋보기와 간격 */
}

.search-barBSJ i {
    position: absolute;
    right: 15px;
    top: 50%;
    transform: translateY(-50%);
    cursor: pointer;
    color: #888;
    z-index: 50;
}

.tab-contentBSJ{
	padding: .7rem !important;
	
}


.centeredBSJ{
	position: relative;
	top: 0px;
	left: 230px;
}

.priceAndCountBSJ{
	position: relative;
	top: -60px;
	left: 170px;
}

</style>


<!-- 세션 -->
<%
String LOGID = (String) session.getAttribute("LOGID");
String LOGNAME = (String) session.getAttribute("LOGNAME");
String MEMBERDIVISION = (String) session.getAttribute("MEMBERDIVISION");
%>

<div class="container mt-4 containerBSJ">
	<div class="row">
		<div class="col-md-3 border-end bg-white" id="sidebar-wrapper">
			<div class="sidebar-heading d-flex align-items-center border-bottom mt-3 fw-bold">MY쿠팡</div>
			<div class="list-group list-group-flush" id="nav_div">
				<a class="list-group-item list-group-item-action list-group-item-light p-3" href="myOrderList.do?buyerId=${LOGID }">주문 목록</a>
				<a class="list-group-item list-group-item-action list-group-item-light p-3" href="myReview.do?buyerId=${LOGID }">리뷰 관리</a>
				<a class="list-group-item list-group-item-action list-group-item-light p-3 disabled text-bg-primary" href="myAsk.do?buyerId=${LOGID }">문의 내역</a>
				<a class="list-group-item list-group-item-action list-group-item-light p-3" href="checkMem.do?memberId=${LOGID }">회원 정보 수정</a>
			</div>
		</div>

		<!-- 문의 섹션 -->
		<div class="col-md-9 p-3">
			<section class="order-section">
				<h2 class="mb-4 mt-5">문의 목록</h2>

				<!-- 검색창 & 돋보기 HTML -->
				<div class="search-barBSJ">
					<input type="text" class="form-control" id="askSearchInputBSJ" placeholder="상품명으로 검색">
					<i class="bi bi-search" style="position: absolute; right: 15px; top: 50%; transform: translateY(-50%); cursor: pointer;"></i>
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
					
					
				<div class="tab-content border mb-3 tab-contentBSJ" id="reviewTabsContent">
					<div class="tab-pane fade show active" id="written" role="tabpanel" aria-labelledby="written-tab">
					
				
						<!-- 반복문 시작 - 답변받은 문의 -->
						<c:forEach var="ask" items="${goodsmylist }">
							<c:choose>
								<c:when test="${not empty ask.goodsState && not empty ask.goodsMid}">
									<div class="review-card mt-3 askGroupBSJ">
										<h5>문의일: <fmt:formatDate value="${ask.goodsMdate }" pattern="yyyy-MM-dd" /></h5>
										<div class="product-info centeredBSJ" style="display:inline-block;">
											<a href="goodsinfo.do?gno=${ask.seqGoods }"><img src="images/${ask.imgUrl }" alt="Product Image" style="width: 150px; height: 150px;"></a>
											<div class="priceAndCountBSJ">
												<h5 class="mb-0 askGoodsNameBSJ">${ask.goodsName }</h5>
												<p><fmt:formatNumber value="${ask.goodsPrice}" type="number"
										groupingUsed="true" />
								    원 · ${ask.goodsInven }개 남음</p>
											</div>
										</div>
										<div class="review-content mb-3">
											<label for="reviewContent1" class="form-label">문의내용</label>
											<textarea class="form-control" rows="5" readonly="readonly">${ask.goodsState }</textarea>
										</div>
										
										<div class="review-content mb-3">
											<label for="reviewContent1" class="form-label">문의답변</label>
											<textarea class="form-control" rows="5" readonly="readonly">${ask.goodsMid }</textarea>
										</div>
										<div class="action-buttons tab-contentBSJ">
											<button class="btn btn-danger delAskBtn" data-askNum="${ask.seqGoods }">문의 삭제</button>
										</div>
									</div>
								</c:when>
							</c:choose>
						</c:forEach>
					</div>

					<div class="tab-pane fade" id="unwritten" role="tabpanel" aria-labelledby="unwritten-tab">
						<!-- 반복문 시작 - 답변 없는 문의 -->
						<c:forEach var="ask" items="${goodsmylist }">
							<c:choose>
								<c:when test="${not empty ask.goodsState && empty ask.goodsMid}">
									<div class="review-card mt-3 askGroupBSJ">
										<H5>문의일: <fmt:formatDate value="${ask.goodsMdate }" pattern="yyyy-MM-dd" /></H5>
										<div class="product-info centeredBSJ" style="display:inline-block;">
											<img src="images/${ask.imgUrl }" alt="Product Image" style="width: 150px; height: 150px;">
											<div class="priceAndCountBSJ">
												<h5 class="mb-0 askGoodsNameBSJ">${ask.goodsName }</h5>
												<p>
													<fmt:formatNumber value="${ask.goodsPrice}" type="number"
														groupingUsed="true" />
													원 · ${ask.goodsInven }개 남음
												</p>
											</div>
										</div>
										<div class="review-content mb-3">
											<label for="reviewContent1" class="form-label">문의내용</label>
											<textarea class="form-control" rows="5" readonly="readonly">${ask.goodsState }</textarea>
										</div>
										<div class="action-buttons">
											<button class="btn btn-warning reAskBtn" data-askNum="${ask.seqGoods }">재문의</button>
											<button class="btn btn-danger delAskBtn" data-askNum="${ask.seqGoods }">삭제</button>
										</div>
										<div class="review-content mb-3">
											<label for="reviewContent1" class="form-label">문의답변</label>
											<textarea class="form-control" rows="5" readonly="readonly">[아직 문의 답변이 없습니다]</textarea>
										</div>
									</div>
								</c:when>
							</c:choose>
						</c:forEach>
					</div>
				</div>
			</section>
		</div>
	</div>
</div>			


</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>

window.addEventListener('DOMContentLoaded', event => {
    document.querySelectorAll(".delAskBtn").forEach(button => {
        button.addEventListener('click', function (e) {
            console.log("삭제 버튼 눌림");
            console.log(e.target.parentElement.parentElement);
            e.target.parentElement.parentElement.remove();

            let delAskBtn = e.target.closest(".review-card");
            let askNum = e.target.getAttribute("data-askNum");

            $.ajax({
                url: 'deleteAsk.do?askNum=' + askNum,
                data: { askNum: askNum },
                method: "POST",
                dataType: "json"
            })
            .done(function (result) {
                if (result.retCode === 'OK') {
                    alert("문의가 삭제되었습니다.");
                    delAskBtn.remove();
                } else if (result.retCode === 'FAIL') {
                    alert("문의 삭제에 실패했습니다.");
                }
            })
            .fail(err => console.log(err));
        });
    });
});

$(document).ready(function() {
    // 검색 함수 정의
    function searchInActiveTab() {
        const searchText = $('#askSearchInputBSJ').val().toLowerCase();
        const activeTab = $('#reviewTabs .nav-link.active').attr('aria-controls');

        if (activeTab === 'written') {
            $('#written .askGroupBSJ').each(function() {
                const goodsName = $(this).find('.askGoodsNameBSJ').text().toLowerCase();
                $(this).toggle(goodsName.includes(searchText));
            });
        } else if (activeTab === 'unwritten') {
            $('#unwritten .askGroupBSJ').each(function() {
                const goodsName = $(this).find('.askGoodsNameBSJ').text().toLowerCase();
                $(this).toggle(goodsName.includes(searchText));
            });
        }
    }

    // 검색창에서 엔터 키를 누를 때 검색
    $('#askSearchInputBSJ').on('keypress', function(event) {
        if (event.keyCode === 13) {
            event.preventDefault();
            searchInActiveTab();
        }
    });

    // 돋보기 아이콘 클릭 시 검색
    $('.bi-search').on('click', function() {
        searchInActiveTab();
    });

    // 탭 전환 시 검색창 초기화
    $('#reviewTabs button').on('shown.bs.tab', function() {
        $('#askSearchInputBSJ').val('');
        $('.askGroupBSJ').show();
    });

    // 재문의 버튼 클릭 이벤트
    $(document).on('click', '.reAskBtn', function() {
        const $thisButton = $(this);
        const reviewCard = $thisButton.closest('.review-card');
        const askTextarea = reviewCard.find('textarea').first();
        const deleteBtn = reviewCard.find('.delAskBtn');
        const askNum = $thisButton.data('asknum');

        if ($thisButton.text() === '재문의') {
            $thisButton.text('재문의 등록');
            deleteBtn.hide();
            askTextarea.data('originalText', askTextarea.val());
            askTextarea.prop('readonly', false);
        } else {
            const updatedContent = askTextarea.val();
            console.log(updatedContent);

            $.ajax({
            	
                url: 'updateAsk.do',
                method: 'POST',
                dataType: "json",
                data: { askNum: askNum, updatedContent: updatedContent },
                success: function(response) {
                	console.log(response);
                    if (response.retCode == 'OK') {
                        alert('재문의가 등록되었습니다.');
                        askTextarea.prop('readonly', true);
                        deleteBtn.show();
                        $thisButton.text('재문의');
                    } else {
                        alert('문의 수정에 실패했습니다.');
                        resetReAskMode();
                    }
                },
                error: function() {
                    alert('서버 요청 중 오류가 발생했습니다.');
                    resetReAskMode();
                }
            });
        }

        function resetReAskMode() {
            askTextarea.val(askTextarea.data('originalText')).prop('readonly', true);
            deleteBtn.show();
            $thisButton.text('재문의');
        }
    });
});
            
          
         
  </script>



</html>