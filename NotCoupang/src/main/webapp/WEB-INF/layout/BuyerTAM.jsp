<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<!DOCTYPE html>
<html>
<head>
	<link href="css/styles.css" rel="stylesheet" />
	
	
	<tiles:insertAttribute name="header" />
<title>Insert title here</title>
</head>
<body>
	<div class="d-flex">
		<tiles:insertAttribute name="aside" />
		<tiles:insertAttribute name="body" />
	</div>
	
	
	
</body>
</html>