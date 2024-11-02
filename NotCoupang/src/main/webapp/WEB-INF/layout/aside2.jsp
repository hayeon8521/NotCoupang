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

<div class="search-filter ">
	<div class="search-filter-content">
		<h4>카테고리</h4>
		<div class="search-filter-options search-category-component">
			<h5>카테고리</h5>
			<div>
				<ul>
					<li>
						<input type="radio"id="component" name="component" title="componentFilter" value="" checked=""> 
						<label for="component" >전체</label>
					</li>

				</ul>

			</div>
		</div>
		
		<%for(CategoriVO T : categories) {%>
		<div class="search-filter-options search-category-component">
			<%String tcate = T.getTcate(); %>
			<h5><%=tcate %></h5>
			<div>
				<ul>
			<%List<CategoriVO> bCategories = csvc.Tcates(tcate);%>
			<%for(CategoriVO B : bCategories) {%>
					<li>
						<input type="radio"id="component" name="component" title="componentFilter" value="" checked=""> 
						<label for="component" ><%=B.getBcate() %></label>
					</li>
			
			<%} %>
				</ul>
			</div>
			


		</div>
		<%} %>


		<!--  참고용 주석
		<div class="search-filter-options search-category-component">
			<h5>카테고리</h5>
			<div>
				<ul>
					<li class="search-option-item selected opened  selected opened all"
						data-category-id="" data-linkcode=""><input type="radio"
						id="component" name="component" title="componentFilter" value=""
						checked="checked"> <label for="component"
						data-srp-log="{&quot;group&quot;:&quot;FILTER&quot;, &quot;filterType&quot;:&quot;CATEGORY&quot;, &quot;id&quot;:&quot;all&quot;, &quot;depth&quot;:&quot;1&quot;}">전체</label>
					</li>

				</ul>

			</div>
		</div>
		-->













	</div>
</div>

