<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String LOGID = (String) session.getAttribute("LOGID");
String LOGNAME = (String) session.getAttribute("LOGNAME");
String MEMBERDIVISION = (String) session.getAttribute("MEMBERDIVISION");
%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>!Coupang Admin</title>

<!-- Custom fonts for this template -->
<link href="CMG/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="CMG/css/sb-admin-2.min.css" rel="stylesheet">

<!-- Custom styles for this page -->
<link href="CMG/vendor/datatables/dataTables.bootstrap4.min.css"
	rel="stylesheet">

</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<ul
			class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
			id="accordionSidebar">

			<!-- Sidebar - Brand -->
			<a
				class="sidebar-brand d-flex align-items-center justify-content-center"
				href="Admin_main.do">
				<div class="sidebar-brand-icon rotate-n-15"></div>
				<div class="sidebar-brand-text mx-3">!Coupang</div>
			</a>

			<!-- Divider -->
			<hr class="sidebar-divider my-0">

			<!-- Nav Item - Dashboard -->
			<li class="nav-item active">
                <a class="nav-link" href="Admin_insert.do">
                    <span>상품 등록</span></a>
            </li>

            <li class="nav-item active">
                <a class="nav-link" href="Admin_list.do?page=1">
                    <span>등록 상품 조회</span></a>
            </li>


            <li class="nav-item active">
                <a class="nav-link" href="Admin_ask.do">
                    <span>문의 관리</span></a>
            </li>

		</ul>
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<nav
					class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

					<!-- Sidebar Toggle (Topbar) -->
					<button id="sidebarToggleTop"
						class="btn btn-link d-md-none rounded-circle mr-3">
						<i class="fa fa-bars"></i>
					</button>


					<!-- Topbar Navbar -->
					<ul class="navbar-nav ml-auto">

						<li class="nav-item dropdown no-arrow"><a class="nav-link">
								<span class="mr-2 d-none d-lg-inline text-gray-600 small"><%=LOGID %></span>
						</a></li>

						<div class="topbar-divider d-none d-sm-block"></div>

						<li class="nav-item dropdown no-arrow"><a class="nav-link"
							href="http://localhost/NotCoupang/logout.do"> <span
								class="mr-2 d-none d-lg-inline text-gray-600 small">Logout</span>
						</a></li>

					</ul>

				</nav>
				<!-- End of Topbar -->

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<h1 class="h3 mb-2 text-gray-800">상품 등록</h1>
					<p class="mb-4"></p>

					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-body">
							<div class="table-responsive">
								<form action="Admin_insert_control.do" method="post" enctype="multipart/form-data">
									<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
										<tbody>
											<tr>
												<td style="width: 25%; vertical-align: middle">상품명</td>
												<td><input type="text"
													class="form-control bg-light border-0 small"
													aria-label="Search" aria-describedby="basic-addon2"
													name="goods_name"></td>
											</tr>
											<tr>
												<td style="vertical-align: middle">가격</td>
												<td><input type="text"
													class="form-control bg-light border-0 small"
													aria-label="Search" aria-describedby="basic-addon2"
													name="goods_price"></td>
											</tr>
											<tr>
												<td style="vertical-align: middle">재고</td>
												<td><input type="text"
													class="form-control bg-light border-0 small"
													aria-label="Search" aria-describedby="basic-addon2"
													name="goods_inven"></td>
											</tr>
											<tr>
												<td style="vertical-align: middle">카테고리</td>
												<td>
													<select id="option_bigbox" style="width: 50%">
														<option value="" selected disabled>카테고리 선택</option>
														<option>패션의류/잡화</option>
														<option>뷰티</option>
														<option>출산/유아동</option>
														<option>식품</option>
														<option>주방용품</option>
														<option>생활용품</option>
														<option>홈인테리어</option>
														<option>가전디지털</option>
														<option>스포츠/레저</option>
														<option>자동자용품</option>
														<option>도서/음반/DVD</option>
														<option>완구/취미</option>
														<option>문구/오피스</option>
														<option>반려동물용품</option>
														<option>헬스/건강식품</option>
													</select>
												</td>
											</tr>
											<tr>
												<td></td>
												<td>
													<select id="option_box" name="goods_catename" style="width: 50%">
													</select>
												</td>
											</tr>
											<tr>
												<td style="vertical-align: middle">상품 썸네일</td>
												<td><input type="file"
													class="form-control bg-light border-0 small"
													aria-label="Search" aria-describedby="basic-addon2"
													name="img_thumbnail"></td>
											</tr>
										</tbody>
									</table>
									<div style="text-align: center;">
										<input class="btn btn-primary" type="submit" style="width: 250px;" value="제출">
									</div>
								</form>
							</div>
						</div>
					</div>

				</div>
				<!-- /.container-fluid -->

			</div>
			<!-- End of Main Content -->

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<!-- Bootstrap core JavaScript-->
	<script src="CMG/vendor/jquery/jquery.min.js"></script>
	<script src="CMG/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="CMG/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="CMG/js/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script src="CMG/vendor/datatables/jquery.dataTables.min.js"></script>
	<script src="CMG/vendor/datatables/dataTables.bootstrap4.min.js"></script>
	<script>
	document.querySelector("#option_bigbox").addEventListener("change", function(e) {
		big_cate = document.querySelector("#option_bigbox").value
		del_arr = document.querySelectorAll("#option_box option")
		for (let i = 0 ; i < del_arr.length ; i++) {
			del_arr[i].remove();
		}
		let cate_arr = []
		if (big_cate == "패션의류/잡화") {
			cate_arr = ["여성의류", "남성의류", "공용의류", "유아의류", "속옷/잠옷"]
		} else if (big_cate == "뷰티") {
			cate_arr = ["스킨케어", "클렌징/필링", "메이크업", "향수", "남성화장품", "네일", "뷰티소품", "어린이화장품", "헤어", "바디"]
		} else if (big_cate == "출산/유아동") {
			cate_arr = ["기저귀", "분유/어린이식품", "수유용품", "이유용품/유아식기", "매트/안정용품", "유모차/웨건", "카시트", "아기띠/외출용품", "욕실용품/스킨케어", "완구/교구", "유아용도서"]
		} else if (big_cate == "식품") {
			cate_arr = ["과일", "견과/건과", "채소", "쌀/잡곡", "음료", "육류", "수산물", "커피/원두/차", "조미료", "가공식품", "냉동식품"]
		} else if (big_cate == "주방용품") {
			cate_arr = ["냄비/프라이팬", "주방조리도구", "그릇/홈세트", "수저/커트라인", "컵/텀블러/와인용품", "주전자/커피/티용품", "밀폐저장/도시락", "주방잡화", "일회용품/종이컵"]
		} else if (big_cate == "생활용품") {
			cate_arr = ["헤어", "바디/세안", "구강/면도", "화장지/물티슈", "생리대/기저귀", "세탁/청소용품", "청소/주방세제", "수납/정리", "공구/철물/DIY", "생활잡화"]
		} else if (big_cate == "홈인테리어") {
			cate_arr = ["가구", "침구", "커튼/블라인드", "수예/수선", "조명/스탠드", "셀프인테리어", "원예/가드닝", "쿠션/거실화"]
		} else if (big_cate == "가전디지털") {
			cate_arr = ["TV", "냉장고", "세탁기", "노트북", "모니터", "휴대폰", "스마트워치", "게임", "키보드/마우스", "음향기기", "카메라"]
		} else if (big_cate == "스포츠/레저") {
			cate_arr = ["홈트레이닝", "수영/수상스포츠", "골프", "런닝/라이딩", "등산/아웃도어", "구기스포츠", "헬스/요가/댄스", "복싱/검도/태권도"]
		} else if (big_cate == "자동자용품") {
			cate_arr = ["자동차인테리어", "익스테리어", "세차/카케어", "차량용전자기기", "차량관리/소모품", "부품/안전/공구", "오토바이용품", "타이어"]
		} else if (big_cate == "도서/음반/DVD") {
			cate_arr = ["어린이도서", "소셜/에세이/시", "참고서", "여행", "역사", "만화/라노벨", "인문", "해외도서"]
		} else if (big_cate == "완구/취미") {
			cate_arr = ["로봇", "역할놀이", "블록놀이", "보드게임", "프라모델", "피규어/다이캐스트", "콘솔/휴대용게임기기"]
		} else if (big_cate == "문구/오피스") {
			cate_arr = ["미술/화방용품", "학용품/수업준비", "필기구", "노트/메모지", "바인더/파일", "카드/엽서/봉투", "앨범", "보드/칠판/광고"]
		} else if (big_cate == "반려동물용품") {
			cate_arr = ["강아지사료", "고양이사료", "산책용품", "관상어용품", "소동물/가축용품"]
		} else if (big_cate == "헬스/건강식품") {
			cate_arr = ["성인용건강식품", "여성용건강식품", "남성용건강식품", "임산부건강식품", "어린이건강식품", "헬스보충식품", "홍삼/인삼"]
		}
		for (let i = 0 ; i < cate_arr.length ; i++) {
			let opt = document.createElement("option");
			opt.value = cate_arr[i]
			opt.innerText = cate_arr[i]
			document.querySelector('#option_box').appendChild(opt);
		}
	})
	</script>
</body>

</html>