<%@page import="com.Fyou.service.CategoriServiceImpl"%>
<%@page import="com.Fyou.vo.CategoriVO"%>
<%@page import="java.util.List"%>
<%@page import="com.Fyou.service.CategoriService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
CategoriService csvc = new CategoriServiceImpl();
List<CategoriVO> categories = csvc.listOfTcate();
String ct = (String) request.getAttribute("cate");
String kw = (String) request.getAttribute("keyword");

kw = kw == null ? "" : kw;

%>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="format-detection" content="telephone=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="author" content="">
<meta name="keywords" content="">
<meta name="description" content="">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="css/LSH/vendor.css">
<link rel="stylesheet" type="text/css" href="css/LSH/style.css">
<link rel="stylesheet" type="text/css" href="css/LSH/LSH.css">


<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;700&family=Open+Sans:ital,wght@0,400;0,700;1,400;1,700&display=swap"
	rel="stylesheet">

<header>
	<nav class="navbar navbar-expand-lg navbar-light bg-light py-1">
		<div class="container d-flex justify-content-between px-2 px-lg-4">

			<div class="collapse navbar-collapse justify-content-end"
				id="navbarSupportedContent">
				<div class="navbar-brand fs-7">000님</div>
				<form class="d-flex">
					<button class="btn btn-outline-danger btn-sm" type="submit">
						로그아웃</button>
				</form>
			</div>
		</div>
	</nav>




	<div class="container ">
		<div class="row py-3 border-bottom">

			<div
				class="col-sm-4 col-lg-2 text-center text-sm-start d-flex gap-3 justify-content-center justify-content-md-start">
				<div class="d-flex align-items-center my-3 my-sm-0">
					<a href="welcome.do"> <img src="imagesLSH/logo.png" alt="logo"
						class="img-fluid">
					</a>
				</div>
			</div>

			<div class="col-sm-6 offset-sm-2 offset-md-0 col-lg-8">
				<div class="search-bar row bg-light p-2 rounded-1">
					<form id="search-form" class="d-flex align-items-center w-100"
						action="goodsList.do" method="get">
						<div class="col-md-3">
							<select name="cate"
								class="form-select border-0 bg-transparent">
								<option value="" selected>전체</option>
								<%
								for (CategoriVO ele : categories) {
								%>
								<option value="<%=ele.getTcate()%>"
											   <%=(ct != null && ct.equals(ele.getTcate()) ? "selected" : "") %>
								><%=ele.getTcate()%></option>
								<%
								}
								%>
							</select>
						</div>
						<div class="col">
							<input type="text" name="keyword"
								class="form-control border-0 bg-transparent"
								placeholder="찾고 싶은 상품을 검색해보세요!" value="<%=kw %>">
						</div>
						<div class="col-auto justify-content-end">
							<button type="submit" class="btn btn-link p-0">
								<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
									viewBox="0 0 24 24">
						<path fill="currentColor"
										d="M21.71 20.29L18 16.61A9 9 0 1 0 16.61 18l3.68 3.68a1 1 0 0 0 1.42 0a1 1 0 0 0 0-1.39ZM11 18a7 7 0 1 1 7-7a7 7 0 0 1-7 7Z" />
					</svg>
							</button>
						</div>
					</form>
				</div>
			</div>


			<div class="col-lg-2 ">
				<ul
					class="navbar-nav list-unstyled d-flex flex-row gap-3 gap-lg-4 justify-content-center flex-wrap align-items-center mb-0 fw-bold text-uppercase text-dark ">
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle pe-3" role="button" id="pages"
						aria-expanded="false">마이쿠팡</a>
						<ul class="dropdown-menu border-0 p-3 rounded-0 shadow"
							id="dropdown" aria-labelledby="pages">
							<li><a href="myOrderList.do" class="dropdown-item">주문목록 </a></li>
							<li><a href="myReview.do" class="dropdown-item">리뷰관리 </a></li>
							<li><a href="myAsk.do" class="dropdown-item">문의 내역 </a></li>
							<li><a href="myPage.do" class="dropdown-item">회원정보 조회 및 수정 </a></li>
						</ul></li>
					<li class="nav-item active"><a href="#" class="nav-link">장바구니</a>
					</li>

				</ul>
			</div>

			<div class=" scroll-buttons">
				<button class="scroll-button btn btn-sm" id="scrollLeft"><</button>
				<div class="scrollmenu" id="scrollableMenu">
					<%
					for (CategoriVO ele : categories) {
					%>
					<a href="goodsList.do?cate=<%=ele.getTcate()%>"><%=ele.getTcate()%></a>
					<%
					}
					%>
				</div>
				<button class="scroll-button btn btn-sm" id="scrollRight">></button>
			</div>
		</div>



	</div>
</header>

<script src="js/LSH/jquery-1.11.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
	crossorigin="anonymous"></script>
<script src="js/LSH/plugins.js"></script>
<script src="js/LSH/script.js"></script>
<script>
		    const scrollableMenu = document.getElementById('scrollableMenu');
		    const scrollLeftButton = document.getElementById('scrollLeft');
		    const scrollRightButton = document.getElementById('scrollRight');
		
		    // 스크롤 이동 함수
		    const scrollAmount = 600; // 한 번에 스크롤할 거리 (픽셀)
		
		 	// 스크롤에 따라 버튼 활성화/비활성화 함수
			function updateButtonState() {
			    scrollLeftButton.disabled = scrollableMenu.scrollLeft === 0;
			    scrollRightButton.disabled = scrollableMenu.scrollLeft + scrollableMenu.clientWidth >= scrollableMenu.scrollWidth -1;
			}
		    
		    scrollLeftButton.addEventListener('click', () => {
		        scrollableMenu.scrollBy({
		            left: -scrollAmount,
		            behavior: 'smooth'
		        });
		    });
		
		    scrollRightButton.addEventListener('click', () => {
		        scrollableMenu.scrollBy({
		            left: scrollAmount,
		            behavior: 'smooth'
		        });
		    });
		    
		 	// 스크롤 이동 시 버튼 상태 업데이트
			scrollableMenu.addEventListener('scroll', updateButtonState);

			// 페이지 로드 시 버튼 상태 초기화
			window.addEventListener('load', updateButtonState);
</script>

