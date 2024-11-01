<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=1200" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Gaegu:wght@300;400;700&family=Jua&family=Noto+Sans+KR:wght@100..900&display=swap"
      rel="stylesheet"
    />
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css"
    />
  </head>

  <style>
    .nav_btn {
      text-align: center;
      font-family: 'Noto Sans KR', sans-serif;
      border: 0;
      margin-bottom: 30px;
      background-color: rgb(255, 255, 255, 0.3);
    }
  </style>

  <div class="d-flex justify-content-center bg-info-subtle">
    <div class="d-flex flex-row mb-3" style="width: 800px">
      <div class="p-2 w-25 bg-primary" style="height: 800px">
        사이드 바 구성하면 되고
        <div class="d-flex flex-column mb-3">
          <button type="button" href="#" class="btn btn-md nav_btn">
            주문 목록
          </button>
          <button type="button" href="#" class="btn btn-md nav_btn">
            리뷰 관리
          </button>
          <button type="button" href="#" class="btn btn-md nav_btn">
            문의 내역
          </button>
          <button type="button" href="#" class="btn btn-md nav_btn">
            회원 정보
          </button>
        </div>
      </div>
      <div class="p-2 w-75 bg-warning">
        마이페이지에 있는거 구성하면되고
        <div class="order_list_search">
          <form>
            <fieldset>
              <legend>주문목록</legend>
              <input
                class="border-1 rounded"
                type="text"
                id="order_list_search"
                name="order_list_search"
                size="30"
                maxlength="200"
                placeholder="주문한 상품을 검색할 수 있어요!"
              />
              <i class="bi bi-search text-primary"></i>
            </fieldset>
          </form>
        </div>
      </div>
    </div>
  </div>
  <!-- Bootstrap core JS-->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
  <!-- Core theme JS-->
  <script src="../js/scripts.js"></script>

  <!--내 css 연동-->
  <link rel="stylesheet" href="css/BSJ/myOrderList.css" />
</html>
