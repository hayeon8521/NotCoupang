<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.Fyou.vo.AskVO"%>
<%@page import="java.util.List"%>

<%
String LOGID = (String) session.getAttribute("LOGID");
String LOGNAME = (String) session.getAttribute("LOGNAME");
String MEMBERDIVISION = (String) session.getAttribute("MEMBERDIVISION");
List<AskVO> list = (List<AskVO>) request.getAttribute("askList");
String pg = (String) request.getAttribute("page");
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
			<li class="nav-item active"><a class="nav-link"
				href="Admin_insert.do"> <span>상품 등록</span></a></li>

			<li class="nav-item active"><a class="nav-link"
				href="Admin_list.do?page=1"> <span>등록 상품 조회</span></a></li>


			<li class="nav-item active"><a class="nav-link"
				href="Admin_ask.do"> <span>문의 관리</span></a></li>

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
					<h1 class="h3 mb-2 text-gray-800">문의 관리</h1>
					<p class="mb-4"></p>

					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="dataTable" width="100%"
									cellspacing="0">
									<thead>
										<tr>
											<th style="width: 10%">문의 번호</th>
											<th style="width: 10%">상품 번호</th>
											<th style="width: 50%">문의</th>
											<th style="width: 10%">구매자 ID</th>
											<th style="width: 20%"></th>
										</tr>
									</thead>
									<tbody>
										<%
										int page_int = Integer.parseInt(pg);
										page_int = (page_int - 1) * 10;
										String goods_state = "";
										for (int i = 0; (i < 10) && i < list.size() - page_int; i++) {
										%>
										<tr id="<%=page_int + i%>">
											<td style="width: 10%"><%=list.get(page_int + i).getSeqAsk()%></td>
											<td style="width: 10%"><%=list.get(page_int + i).getGoodsNum()%></td>
											<td style="width: 50%; word-break: break-all"><%=list.get(page_int + i).getAsk()%></td>
											<td style="width: 10%"><%=list.get(page_int + i).getBuyerId()%></td>
											<td style="width: 20%"><button id="ask_button">작성하기</button></td>
										</tr>
										<%
										}
										%>
									</tbody>
								</table>
								<nav aria-label="..." style="float: right">
									<ul class="pagination">
										<%
										int now_page = Integer.parseInt(pg);
										int real_end = list.size();
										if (now_page < 10) {
										%>
										<li class="page-item disabled"><a class="page-link">&laquo;</a></li>
										<%
										} else {
										%>
										<li class="page-item"><a class="page-link" 
										href="Admin_ask.do?page=<%=(((int) ((now_page - 1) / 10) + 1) * 10) - 10%>">&laquo;</a></li>
										<%
										}
										int last_page = ((int) (real_end / 10) + 1);
										for (int i = 0; i < 10; i++) {
										if (last_page < (int) ((now_page - 1) / 10) + i + 1) {
											break;
										}
										if (Integer.parseInt(pg) == ((int) ((now_page - 1) / 10 + 1) * 10 + i - 9)) {
										%>
										<li class="page-item active" aria-current="page"><a
											class="page-link"><%=(int) ((now_page - 1) / 10 + 1) * 10 + i - 9%></a></li>
										<%
										} else {
										%>
										<li class="page-item"><a class="page-link"
											href="Admin_ask.do?page=<%=(int) ((now_page - 1) / 10 + 1) * 10 + i - 9%>"><%=(int) ((now_page - 1) / 10 + 1) * 10 + i - 9%></a></li>
										<%
										}
										}
										if ((((int) ((now_page - 1) / 10) + 1) * 10) > last_page) {
										%>
										<li class="page-item disabled"><a class="page-link">&raquo;</a>
											<%
											} else {
											%>
										<li class="page-item"><a class="page-link"
											href="Admin_ask.do=<%=(((int) ((now_page - 1) / 10) + 1) * 10) + 1%>">&raquo;</a>
											<%
											}
											%></li>
									</ul>
								</nav>
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
		let arr = document.querySelectorAll("#ask_button")
		for (i = 0; i < arr.length; i++) {
			console.log(arr[i].parentNode.id)
			arr[i].addEventListener("click", function(e) {
				console.log(e.target.parentNode.parentNode.id);
				location.href = "Admin_insert_ask.do?list_num="
						+ e.target.parentNode.parentNode.id
			})
		}
	</script>

</body>
</html>