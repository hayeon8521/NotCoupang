<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.Fyou.vo.GoodsinfoVO"%>
<%@page import="com.Fyou.vo.ImgVO"%>
<%@page import="java.util.List"%>
<%
String LOGID = (String) session.getAttribute("LOGID");
String LOGNAME = (String) session.getAttribute("LOGNAME");
String MEMBERDIVISION = (String) session.getAttribute("MEMBERDIVISION");
GoodsinfoVO gvo = (GoodsinfoVO) request.getAttribute("gvo");
List<ImgVO> img_list = (List<ImgVO>) request.getAttribute("img_list");
int list_num = (int) request.getAttribute("list_num");
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

<!-- Custom fonts for this template-->
<link href="CMG/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<!-- Custom styles for this template-->
<link href="CMG/css/sb-admin-2.min.css" rel="stylesheet">
</head>
<body>
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
			<li class="nav-item active"><a class="nav-link"
				href="Admin_insert.do"> <span>상품 등록</span></a></li>

			<li class="nav-item active"><a class="nav-link"
				href="Admin_list.do?page=1"> <span>등록 상품 조회</span></a></li>


			<li class="nav-item active"><a class="nav-link"
				href="Admin_ask.do"> <span>문의 관리</span></a></li>


			<li class="nav-item active"><a class="nav-link"
				href="index_edit.html"> <span>4번 카테고리 이동</span></a></li>

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
								<span class="mr-2 d-none d-lg-inline text-gray-600 small"><%=LOGID%></span>
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
					<h1 class="h3 mb-2 text-gray-800">등록 상품 상세 조회</h1>
					<p class="mb-4"></p>

					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="dataTable" width="100%"
									cellspacing="0">
									<tbody>
										<tr>
											<th style="width: 15%">이미지</th>
											<th style="width: 35%">상품명</th>
											<th style="width: 15%">카테고리</th>
											<th style="width: 15%">가격</th>
											<th style="width: 10%">재고</th>
											<th style="width: 10%">상태</th>
										</tr>
										<%
										String goods_state = "";
										if (gvo.getGoodsState().equals("state")) {
											goods_state = "판매중";
										} else if (gvo.getGoodsState().equals("stop")) {
											goods_state = "판매 중단";
										} else if (gvo.getGoodsState().equals("end")) {
											goods_state = "판매 종료";
										}
										%>
										<tr>
											<td style="width: 15%"><a><img
													src="images/<%=img_list.get(0).getImgUrl()%>" width="150px"></a></td>
											<td style="width: 35%"><%=gvo.getGoodsName()%></td>
											<td style="width: 15%"><%=gvo.getGoodsCatename()%></td>
											<td style="width: 15%"><%=gvo.getGoodsPrice()%></td>
											<td style="width: 10%"><%=gvo.getGoodsInven()%></td>
											<td style="width: 10%"><%=goods_state%></td>
										</tr>
									</tbody>
								</table>
								<div style="float: right">
									<input id="goods_edit" type="submit" value="edit"
										class="btn btn-warning">
									<input id="goods_delete"
										type="submit" value="delete" class="btn btn-danger">
								</div>
							</div>
						</div>
					</div>
					<div class="card shadow mb-4">
						<div class="card-body">
							<div class="table-responsive">
								<div>
									<h5 class="h3 mb-2 text-gray-800">상세 이미지</h5>
								</div>
								<table class="table table-bordered" id="dataTable" width="100%"
									cellspacing="0">
									<tbody id="detaie_img_tbody">
										<%
										for (int i = 1; i < img_list.size(); i++) {
										%>
										<tr>
											<td style="width: 100%"><a><img src="images/<%=img_list.get(i).getImgUrl()%>"
											style="width: 80%"></a></td>
										</tr>
										<tr>
											<td>
												<div style="float: right" id="<%=i%>">
													<button id="edit" class="btn btn-warning">edit</button>
													<button id="delete" class="btn btn-danger">delete</button>
												</div>
											</td>
										</tr>
										<%
										}
										%>
									</tbody>
								</table>
								<form action="Admin_insert_detail_image.do" method="post"
									enctype="multipart/form-data">
									<input type="hidden" name="goods_num"
										value="<%=gvo.getSeqGoods()%>"> <input type="hidden"
										name="list_num" value="<%=list_num%>">
									<table class="table table-bordered" id="dataTable" width="100%">
										<tbody>
											<tr>
												<td style="width: 100%" colspan="3"><input type="file"
													class="form-control bg-light border-0 small"
													aria-label="Search" aria-describedby="basic-addon2"
													name="img_detail"></td>
											</tr>
										</tbody>
									</table>
									<div style="text-align: center;">
										<input class="btn btn-primary" type="submit"
											style="width: 250px;" value="등록">
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
	seq_goods = <%=gvo.getSeqGoods()%>
	document.querySelector('#goods_edit').addEventListener('click', function(e) {
		location.href = 'Admin_goodsedit.do?seq_goods=<%=gvo.getSeqGoods()%>&list_num=<%=list_num%>'
	});
	document.querySelector('#goods_delete').addEventListener('click', function(e) {
		location.href = 'Admin_goodsdelete.do?seq_goods=<%=gvo.getSeqGoods()%>'
	});
	
	edit_button = document.querySelectorAll('#edit');
	delete_button = document.querySelectorAll('#delete');
	for (let i = 0 ; i < edit_button.length ; i++) {
		edit_button[i].addEventListener("click", function(e) {
			location.href = 'Admin_update_detail_image.do?seq_img=' + e.target.parentElement.id + '&list_num=<%=list_num%>&seq_goods=<%=gvo.getSeqGoods()%>'
		});
	}
	for (let i = 0 ; i < edit_button.length ; i++) {
		delete_button[i].addEventListener("click", function(e) {
			console.log(e.target.parentElement.id);
			location.href = 'Admin_delete_detail_image.do?seq_img=' + e.target.parentElement.id + '&list_num=<%=list_num%>&seq_goods=<%=gvo.getSeqGoods()%>'
		});
	}
	</script>
</body>
</html>