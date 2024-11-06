<%@page import="com.Fyou.vo.CategoriVO"%>
<%@page import="java.util.List"%>
<%@page import="com.Fyou.service.CategoriServiceImpl"%>
<%@page import="com.Fyou.service.CategoriService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
CategoriService csvc = new CategoriServiceImpl();
List<CategoriVO> categories = csvc.listOfTcate();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/LSH/sidebar.css">

</head>
<body>
	<div class="sidebar-category">
		<h4>카테고리</h4>
		<ul class="category-list">
			<li class="category-item"><a href="goodsList.do">전체</a></li>
		</ul>
		<%
		for (CategoriVO T : categories) {
			String tcate = T.getTcate();
		%>
		<ul class="category-list">
			<li class="category-item"><a href="goodsList.do?cate=<%=tcate%>"><%=tcate%></a>
				<ul class="subcategory-list">
					<%
					List<CategoriVO> bCategories = csvc.Tcates(tcate);
					for (CategoriVO B : bCategories) {
						String bcate = B.getBcate();
					%>
					<li><a href="goodsList.do?cate=<%=tcate%>&bcate=<%=bcate%>"><%=bcate%></a></li>
					<%
					}
					%>
				</ul>
			</li>
		</ul>

		<%
		}
		%>
		
	</div>

</body>