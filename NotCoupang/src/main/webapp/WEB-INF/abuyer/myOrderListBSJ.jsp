<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<link rel="stylesheet" href="css/BSJ/myOrderList.css" />

  <script>
    document.title = "마이페이지-주문목록";
    	</script>

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
</style>

<!-- 세션 -->
<%
String LOGID = (String) session.getAttribute("LOGID");
String LOGNAME = (String) session.getAttribute("LOGNAME");
String MEMBERDIVISION = (String) session.getAttribute("MEMBERDIVISION");
%>

 <div class="container mt-4 containerBSJ">

		<div class="d-flex" id="wrapper">
		<!-- 사이드바 -->
			<div class="col-md-3 border-end bg-white" id="sidebar-wrapper">
				<div
					class="sidebar-heading d-flex align-items-center border-bottom mt-3 fw-bold">MY쿠팡</div>

				<div class="list-group list-group-flush" id="nav_div">
					<a
						class="list-group-item list-group-item-action list-group-item-light p-3 disabled text-bg-primary"
						href="myOrderList.do?buyerId=${LOGID }">주문 목록</a> <a
						class="list-group-item list-group-item-action list-group-item-light p-3"
						href="myReview.do?buyerId=${LOGID }">리뷰 관리</a> <a
						class="list-group-item list-group-item-action list-group-item-light p-3"
						href="myAsk.do?buyerId=${LOGID }">문의 내역</a> <a
						class="list-group-item list-group-item-action list-group-item-light p-3"
						href="checkMem.do?memberId=${LOGID }">회원 정보 수정</a>
				</div>

			</div>
			<!-- 메인 -->
			<main class="col-md-9 main-content">

				<!-- 주문 목록 섹션 -->
				<section class="order-section">
					<h2 class="mb-4 mb-4 mt-5">주문목록</h2>
					<!-- 검색창 & 돋보기 HTML -->
					<div class="search-bar search-barBSJ">
						<input type="text" class="form-control" id="orderSearchInputBSJ" placeholder="상품명으로 검색">
						<i class="bi bi-search"
							style="position: absolute; right: 15px; top: 50%; transform: translateY(-50%); cursor: pointer;"></i>
					</div>

					<div class="btn-group mb-4" role="group">
						<a href="myOrderList.do?buyerId=${LOGID}" class="btn btn-outline-secondary">최근 6개월</a>
						<a href="myOrderList.do?buyerId=${LOGID}" class="btn btn-outline-secondary">2024</a>
						<button class="btn btn-outline-secondary">2023</button>
						<button class="btn btn-outline-secondary">2022</button>
						<button class="btn btn-outline-secondary">2021</button>
					</div>



					<!-- 반복문 시작 -->
					<c:forEach var="order" items="${goodsmylist }">
						<!-- 주문 항목 리스트 -->
						<fieldset class="order-group border p-3 mb-4 rounded">
						
							<div class="order-date font-weight-bold text-muted">
								<fmt:formatDate value="${order.goodsMdate }"  
									pattern="yyyy.MM.dd" />            
								주문
							</div>  
							<div class="order-item d-flex align-items-center mb-3">
								<div id="orderGoodsImage"><a href="goodsinfo.do?gno=${order.seqGoods }"><img src="images/${order.imgUrl }" alt="상품썸네일"
									class="product-img mr-3 me-3"></a></div>   
								<div class="product-details flex-grow-1">
									<div id="orderGoodsName"> <p class="mb-1 font-weight-bold">${order.goodsName }</p> </div> 
									<p><fmt:formatNumber value="${order.goodsPrice}" type="number"
										groupingUsed="true" />
								    원 · ${order.goodsInven }개</p> 
								</div>
								<div class="order-actions d-flex flex-column align-items-center">
									<button onclick="deleteFunc('${order.goodsState}',this);"
										class="btn btn-outline-primary btn-sm mb-2 w-100">목록
										삭제</button>
									<button class="btn btn-outline-secondary btn-sm mb-2 w-100"
										data-bs-toggle="modal" data-bs-target="#exampleModal"
										data-num="${order.seqGoods }">문의 작성하기</button>
									<button class="btn btn-outline-secondary btn-sm mb-2 w-100"
										data-bs-toggle="modal" data-bs-target="#exampleModal"
										data-num="${order.seqGoods }">리뷰 작성하기</button>
								</div>
							</div>
							
						</fieldset>
					</c:forEach>

				</section>
			</main>
		</div>
	</div>

	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">내용 작성하기</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form>
						<div class="mb-3">
							<label for="message-text" class="col-form-label">Message:</label>
							<textarea class="form-control" id="message-text"></textarea>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary" id="sendAskBtn"
						data-bs-dismiss="modal">Send message</button>
				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
	<script>
window.addEventListener('DOMContentLoaded', event => {

	// Toggle the side navigation
	const sidebarToggle = document.body.querySelector('#sidebarToggle');
	        if (sidebarToggle) {
	          // Uncomment Below to persist sidebar toggle between refreshes
	          // if (localStorage.getItem('sb|sidebar-toggle') === 'true') {
	          //     document.body.classList.toggle('sb-sidenav-toggled');
	          // }
	          sidebarToggle.addEventListener('click', event => {
	            event.preventDefault();
	            document.body.classList.toggle('sb-sidenav-toggled');
	            localStorage.setItem('sb|sidebar-toggle', document.body.classList.contains('sb-sidenav-toggled'));
	          });
	}

	        
	        
	        
	        
		 
	        
	        
});

function deleteFunc(orderNum, thisEvnet){
	let delItem = thisEvnet.parentElement.parentElement.parentElement;
	
	
	$.ajax({
        url: 'delOrder.do',
        data: { orderNum : orderNum },
        method: "POST",
        dataType: "json"
     })
     .done(function(result) {
    	 if (result.retCode == 'OK') {
				alert("주문목록에서 삭제되었습니다.");
			    delItem.remove(); //성공시 화면에서 삭제
			    
			} else if (result.retCode == 'FAIL') {
				alert("주문목록 삭제에 실패했습니다.");
			}
    	 
     })
     .fail(err => console.log(err));  // 세미콜론 추가
     
  }
		

//모달 생성
var exampleModal = document.getElementById('exampleModal');
exampleModal.addEventListener('show.bs.modal', function (event) {
	var button = event.relatedTarget;
	let goodsNum = button.getAttribute('data-num');
	exampleModal.setAttribute('data-goodsnum', goodsNum);
	exampleModal.setAttribute('data-AskReview', button.innerText);
});


//모달 버튼 클릭시 이벤트 발생
document.querySelector("#sendAskBtn").addEventListener('click',function(){
	let goodsNum = exampleModal.getAttribute('data-goodsnum');
	let button = exampleModal.getAttribute('data-AskReview');
	let message = document.querySelector("#message-text").value;
	
	
	
	if(button=="문의 작성하기"){
		console.log("문의 작성하기 클릭함");

		$.ajax({
			url: 'insertAsk.do',  //이화면에
			data: { goodsNum : goodsNum, message : encodeURIComponent(message) },
			method: "POST",
			dataType: "json"
		})
		.done(function(result) {
			if (result.retCode == 'OK') {  // 화면에 [{retCode:OK}] ->result
				alert("문의가 등록 되었습니다.");
				    
			} else if (result.retCode == 'FAIL') {
					alert("문의 등록에 실패했습니다.");
			}
		})
		.fail(err => console.log(err));  // 세미콜론 추가
		
	}else if(button=="리뷰 작성하기"){
		console.log("리뷰 작성하기 클릭함");
		$.ajax({
			url: 'insertReview.do',  //이화면에
			data: { goodsNum : goodsNum, message : encodeURIComponent(message) },
			method: "POST",
			dataType: "json"
		})
		.done(function(result) {
		if (result.retCode == 'OK') {  // 화면에 [{retCode:OK}] ->result
		alert("리뷰가 등록 되었습니다.");
		} else if (result.retCode == 'FAIL') {
		alert("리뷰 등록에 실패했습니다.");
		} else if (result.retCode == 'OVERLAP'){
		alert("등록된 리뷰가 이미 있습니다.");
		}
		})
		.fail(err => console.log(err));  // 세미콜론 추가
	}
	
	document.querySelector("#message-text").value = "";
});

//상품명 검색
$(document).ready(function() {
	 	// 1. 검색창에 키보드 입력을 감지하는 이벤트 추가
    $('#orderSearchInputBSJ').on('keypress', function(event) {
    	 // 2. 엔터 키 (keyCode 13)가 눌렸는지 확인
    	   
        if (event.keyCode === 13) {
            event.preventDefault();  // 엔터만 입력되는거 방지
            
            const searchText = $(this).val().toLowerCase();

            // 각 주문 항목을 검사하여 검색어 포함 여부에 따라 표시/숨김
            $('.order-group').each(function() {
                const goodsName = $(this).find('#orderGoodsName p').text().toLowerCase();

                if (goodsName.includes(searchText)) {
                    $(this).show();  // 검색어가 포함된 항목 표시
                } else {
                    $(this).hide();  // 포함되지 않은 항목 숨기기
                }
            });
        }
    });
});

		 
  </script>
</body>



</html>
