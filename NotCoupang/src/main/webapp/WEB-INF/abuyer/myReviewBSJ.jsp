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
</style>

<!-- 세션 -->
<%
String LOGID = (String) session.getAttribute("LOGID");
String LOGNAME = (String) session.getAttribute("LOGNAME");
String MEMBERDIVISION = (String) session.getAttribute("MEMBERDIVISION");
%>

 <div class="container mt-4 containerBSJ">
    <div class="row">
      <!-- 사이드바 -->
      <aside class="col-md-3">
        <div class="border-end bg-white p-3">
          <div class="sidebar-heading d-flex align-items-center border-bottom mt-3 fw-bold">MY쿠팡</div>
          <div class="list-group list-group-flush mt-2">
            <a class="list-group-item list-group-item-action list-group-item-light p-3" href="myOrderList.do?buyerId=${LOGID }">주문 목록</a>
            <a class="list-group-item list-group-item-action list-group-item-light p-3 disabled text-bg-primary" href="myReview.do?buyerId=${LOGID }">리뷰 관리</a>
            <a class="list-group-item list-group-item-action list-group-item-light p-3" href="myAsk.do?buyerId=${LOGID }">문의 내역</a>
            <a class="list-group-item list-group-item-action list-group-item-light p-3" href="checkMem.do?memberId=${LOGID }">회원 정보 수정</a>
          </div>
        </div>
      </aside>

      <!-- 리뷰 섹션 -->
      <div class="col-md-9">
        <section class="order-section">
          <h2 class="mb-4 mb-4 mt-5">리뷰 목록</h2>

          <!-- 검색창 & 돋보기 HTML -->
          <div class="search-bar search-barBSJ">
            <input type="text" class="form-control" placeholder="내가 쓴 리뷰 검색">
            <i class="bi bi-search" style="position: absolute; right: 15px; top: 50%; transform: translateY(-50%); cursor: pointer;"></i>
          </div>

          <!-- 탭 내비 -->
          
          <%-- <ul class="nav nav-tabs" id="reviewTabs" role="tablist">
            <li class="nav-item" role="presentation">
              <button class="nav-link active" id="written-tab" data-bs-toggle="tab" data-bs-target="#written" type="button" role="tab" aria-controls="written" aria-selected="true">작성한 리뷰</button>
            </li>
            <li class="nav-item" role="presentation">
              <button class="nav-link" id="unwritten-tab" data-bs-toggle="tab" data-bs-target="#unwritten" type="button" role="tab" aria-controls="unwritten" aria-selected="false">리뷰 작성하기</button>
            </li>
          </ul> --%>
          


          <div class="tab-content border mb-3" id="reviewTabsContent">
            <div class="tab-pane fade show active" id="written" role="tabpanel" aria-labelledby="written-tab">
              <fmt:formatDate value="${review.goodsMdate }"
									pattern="yyyy-MM-dd HH:mm:ss" />
			  <fmt:formatNumber value="${review.goodsPrice}" type="number" groupingUsed="true"/>
              <!-- 반복문 시작 -->
              <c:forEach var="review" items="${goodsmylist }">
              
              <!-- 작성한 리뷰 콘텐츠 -->
              <div class="review-card mt-3">
                <div class="product-info">
                  <img src="images/${review.imgUrl }" alt="Product Image" style="width:150px; height:150px;">
                  <div>
                    <h6 class="mb-0">${review.goodsName }</h6>
                   
                     <!-- 천단위 가격 콤마 포맷팅 -->
                    <p class="text-muted mb-0"><fmt:formatNumber value="${review.goodsPrice}" type="number" groupingUsed="true"/>원 · ${review.goodsInven }개</p>
                  </div>
                </div>
                <!-- 리뷰 내용 -->
                <div class="review-content mb-3">
                  <label for="reviewContent1" class="form-label"></label>
                  <textarea id="reviewContent1" class="form-control" rows="5" readonly="readonly">${review.goodsMid }</textarea>
                </div>
                <!--  버튼 -->
                <div class="action-buttons">
                  <button class="btn btn-warning modifyreview">수정</button>
                  <button class="btn btn-danger">삭제</button>
                </div>
                <div class="mt-3 text-muted">
                  작성일자: 2024-10-18 15:53:28
                </div>
              </div>
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
<script>
document.querySelectorAll('.')
  document.querySelector('#modifyreview').addEventListener('click',function(e){
    console.log(e.target);
  });
</script>
      </html>
      