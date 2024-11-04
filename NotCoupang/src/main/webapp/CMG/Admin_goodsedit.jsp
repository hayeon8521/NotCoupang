<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.Fyou.vo.GoodsinfoVO"%>
<%@page import="com.Fyou.vo.ImgVO"%>
<%@page import="java.util.List"%>
<%
GoodsinfoVO gvo = (GoodsinfoVO) request.getAttribute("gvo");
ImgVO ivo = (ImgVO) request.getAttribute("ivo");
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
                <a class="nav-link" href="index_edit.html">
                    <span>3번 카테고리 이동</span></a>
            </li>


            <li class="nav-item active">
                <a class="nav-link" href="index_edit.html">
                    <span>4번 카테고리 이동</span></a>
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
								<span class="mr-2 d-none d-lg-inline text-gray-600 small">유저
									ID</span>
						</a></li>

						<div class="topbar-divider d-none d-sm-block"></div>

						<li class="nav-item dropdown no-arrow"><a class="nav-link"
							href="index_edit.html"> <span
								class="mr-2 d-none d-lg-inline text-gray-600 small">Logout</span>
						</a></li>

					</ul>

				</nav>
				<!-- End of Topbar -->

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<h1 class="h3 mb-2 text-gray-800">상품 수정</h1>
					<p class="mb-4"></p>

					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-body">
							<div class="table-responsive">
								<form action="Admin_goodsedit_control.do" method="post" enctype="multipart/form-data">
								<input type="hidden" name="seq_img" value="<%=ivo.getSeqImg() %>">
								<input type="hidden" name="seq_goods" value="<%=gvo.getSeqGoods() %>">
								<input type="hidden" name=list_num value="<%=list_num %>">
									<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
										<tbody>
											<tr>
												<td style="width: 25%; vertical-align: middle">상품명</td>
												<td><input type="text"
													class="form-control bg-light border-0 small"
													aria-label="Search" aria-describedby="basic-addon2"
													name="goods_name" value="<%=gvo.getGoodsName() %>"></td>
											</tr>
											<tr>
												<td style="vertical-align: middle">가격</td>
												<td><input type="text"
													class="form-control bg-light border-0 small"
													aria-label="Search" aria-describedby="basic-addon2"
													name="goods_price" value="<%=gvo.getGoodsPrice()%>"></td>
											</tr>
											<tr>
												<td style="vertical-align: middle">재고</td>
												<td><input type="text"
													class="form-control bg-light border-0 small"
													aria-label="Search" aria-describedby="basic-addon2"
													name="goods_inven" value="<%=gvo.getGoodsInven() %>"></td>
											</tr>
											<tr>
												<td style="vertical-align: middle">카테고리</td>
												<td><input type="text"
													class="form-control bg-light border-0 small"
													aria-label="Search" aria-describedby="basic-addon2"
													name="goods_catename" value="<%=gvo.getGoodsCatename() %>"></td>
											</tr>
											<tr>
												<td style="vertical-align: middle">현재 상황</td>
												<td><input type="text"
													class="form-control bg-light border-0 small"
													aria-label="Search" aria-describedby="basic-addon2"
													name="goods_state" value="<%=gvo.getGoodsState() %>"></td>
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
									<div style="text-align: center">
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

</body>

</html>