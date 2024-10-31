<%@page import="com.Fyou.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x" %>
    
<%
	MemberVO member = (MemberVO) request.getAttribute("member");
%>
<jsp:include page="includes/header.jsp"></jsp:include>
<table class="table fre">
	<tr>
		<td>JSP 아이디</td><td>이름</td><td>연락처</td><td>권한</td>
	</tr>
	<tr>
		<td><%=member.getMemberId() %></td><td><%=member.getMemberName() %></td><td><%=member.getMemberPhone() %></td><td><%=member.getMemberDivision() %></td>
	</tr>
	<tr>
		<td>JSTL 아이디</td><td>이름</td><td>연락처</td><td>권한</td>
	</tr>
	<tr>
		<td>${member.memberId }</td><td>${member.memberName }</td><td>${member.memberPhone }</td><td>${member.memberDivision }</td>
	</tr>
	<tr>
		<td>자바스크립트  아이디</td><td>이름</td><td>연락처</td><td>권한</td>
	</tr>
</table>
<table class="table after">
	<tr>
		<td>JSON 아이디</td><td>이름</td><td>연락처</td><td>권한ㅁㄴㅇㄹㄴ</td>
	</tr>
</table>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="js/test.js"></script>

<jsp:include page="includes/footer.jsp"></jsp:include>