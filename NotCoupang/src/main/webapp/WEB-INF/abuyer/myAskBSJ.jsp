<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



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

.form-label {
	font-weight: bold;
}

.form-section {
	border-bottom: 1px solid #ddd;
	margin-bottom: 20px !important;
}

.form-section:last-child {
	border-bottom: none;
}

.btn-custom {
	background-color: #f8f9fa;
	color: #000;
	border: 1px solid #ddd;
	padding: 5px 10px;
}

#sidebar-wrapper .sidebar-heading {
	padding: 0.875rem 1.25rem;
	font-size: 1.2rem;
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
			<div
				class="sidebar-heading d-flex align-items-center border-bottom mt-3 fw-bold">MY쿠팡</div>

			<div class="list-group list-group-flush" id="nav_div">
				<a
					class="list-group-item list-group-item-action list-group-item-light p-3 "
					href="myOrderList.do?buyerId=${LOGID }">주문 목록</a> <a
					class="list-group-item list-group-item-action list-group-item-light p-3"
					href="myReview.do?buyerId=${LOGID }">리뷰 관리</a> <a
					class="list-group-item list-group-item-action list-group-item-light p-3 disabled text-bg-primary"
					href="myAsk.do?buyerId=${LOGID }">문의 내역</a> <a
					class="list-group-item list-group-item-action list-group-item-light p-3"
					href="checkMem.do?memberId=${LOGID }">회원 정보 수정</a>
			</div>

		</div>

		<!-- 리뷰 섹션 -->
		<div class="col-md-9">
			<section class="order-section">
				<h2 class="mb-4 mt-5">문의 목록</h2>

				<!-- 검색창 & 돋보기 HTML -->
				<div class="search-barBSJ">
					<input type="text" class="form-control" placeholder="내가 쓴 문의 검색">
					<i class="bi bi-searchBSJ"></i>
				</div>

				<!-- 탭 내비 -->
				<ul class="nav nav-tabs" id="reviewTabs" role="tablist">
					<li class="nav-item" role="presentation">
						<button class="nav-link active" id="written-tab"
							data-bs-toggle="tab" data-bs-target="#written" type="button"
							role="tab" aria-controls="written" aria-selected="true">답변받은
							문의</button>
					</li>
					<li class="nav-item" role="presentation">
						<button class="nav-link" id="unwritten-tab" data-bs-toggle="tab"
							data-bs-target="#unwritten" type="button" role="tab"
							aria-controls="unwritten" aria-selected="false">답변없는 문의</button>
					</li>
				</ul>

				<div class="tab-content border mb-3" id="reviewTabsContent">
					<div class="tab-pane fade show active" id="written" role="tabpanel"
						aria-labelledby="written-tab">

						<c:forEach var="ask" items="${goodsmylist }">
								<c:choose>
									<c:when test="${not empty ask.goodsState }">
										<c:choose>
											<c:when test="${not empty ask.goodsMid }">
								        
								        <!-- 작성한 문의 콘텐츠 -->
										<div class="review-card mt-3">
			
											 <fmt:formatDate value="${ask.goodsMdate }" pattern="yyyy-MM-dd HH:mm:ss" />
			
											<div class="product-info">
												<img src="images/${ask.imgUrl }" alt="Product Image"
													style="width: 150px; height: 150px;">
												<div>
													<h6 class="mb-0">${ask.goodsName }</h6>
													<p class="text-muted mb-0">${ask.goodsPrice }원,
														${ask.goodsInven }개</p>
												</div>
											</div>
											<!-- 문의 내용 -->
											<div class="review-content mb-3">
												<label for="reviewContent1" class="form-label">문의내용</label>
												<textarea id="reviewContent1" class="form-control" rows="5"
													readonly="readonly">${ask.goodsState }</textarea>
											</div>
											<!-- 버튼 -->
											<div class="action-buttons">
												<button class="btn btn-danger delAskBtn" data-askNum="${ask.seqGoods }">삭제</button>
											</div>
			
			
											<!-- 답변 내용 -->
											<div class="review-content mb-3">
												<label for="reviewContent1" class="form-label">문의답변</label>
												<textarea id="reviewContent1" class="form-control" rows="5"
													readonly="readonly">${ask.goodsMid }</textarea>
											</div>
			
			
										</div>
								        
								        
								        
								        
								        
								        
										        </c:when>
										</c:choose>
								        
								        
								    </c:when>
								</c:choose>

							

						</c:forEach>

					</div>

					<div class="tab-pane fade" id="unwritten" role="tabpanel"
						aria-labelledby="unwritten-tab">
						
						
						<c:forEach var="ask" items="${goodsmylist }">
								<c:choose>
									<c:when test="${not empty ask.goodsState }">
										<c:choose>
											<c:when test="${empty ask.goodsMid }">
								        
								        <!-- 작성한 문의 콘텐츠 -->
										<div class="review-card mt-3">
			
											 <fmt:formatDate value="${ask.goodsMdate }" pattern="yyyy-MM-dd HH:mm:ss" />
			
											<div class="product-info">
												<img src="images/${ask.imgUrl }" alt="Product Image"
													style="width: 150px; height: 150px;">
												<div>
													<h6 class="mb-0">${ask.goodsName }</h6>
													<p class="text-muted mb-0">${ask.goodsPrice }원,
														${ask.goodsInven }개</p>
												</div>
											</div>
											<!-- 문의 내용 -->
											<div class="review-content mb-3">
												<label for="reviewContent1" class="form-label">문의내용</label>
												<textarea id="reviewContent1" class="form-control" rows="5"
													readonly="readonly">${ask.goodsState }</textarea>
											</div>
											<!-- 버튼 -->
											<div class="action-buttons">
												<button class="btn btn-warning reAskBtn" data-askNum="${ask.seqGoods }">재문의</button>
												<button class="btn btn-danger delAskBtn" data-askNum="${ask.seqGoods }">삭제</button>
											</div>
			
			
											<!-- 답변 내용 -->
											<div class="review-content mb-3">
												<label for="reviewContent1" class="form-label">문의답변</label>
												<textarea id="reviewContent1" class="form-control" rows="5"
													readonly="readonly">[아직 문의 답변이 없습니다]</textarea>
											</div>
			
			
										</div>
								        
								        
										        </c:when>
										</c:choose>
								        
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

<script>

window.addEventListener('DOMContentLoaded', event => {
	  document.querySelectorAll(".delAskBtn").forEach(button => {
		  button.addEventListener('click', function(e) {
	            console.log("삭제 버튼눌림");
		             
	           let delAsktBtn = e.target.closest(".review-card");
	         
	   	   //let askNum = e.target.getAttribute("data-askNum"); 
	        //console.log(askNum);
	        
		 
	     
	        //conosole.log(e.target);	
	      $.ajax({
            url: 'deleteAsk.do',
            data: { askNum : askNum }, //앞:파라미터이름 뒤:실제 데이터이름
            method: "POST",
            dataType: "json"
         })
         .done(function(result) {
      	   if (result.retCode == 'OK') {  // 화면에 [{retCode:OK}] ->result
 				alert("문의가 삭제 되었습니다.");
 				
 				delAsktBtn.remove();
 				//review-card mt-3  
 				    
 			} else if (result.retCode == 'FAIL') {
 					alert("문의 삭제에 실패했습니다.");
 			}
      	   
      	   
       	  })
         .fail(err => console.log(err));

	        
		});
		  
	});
});	 


</script>



</html>