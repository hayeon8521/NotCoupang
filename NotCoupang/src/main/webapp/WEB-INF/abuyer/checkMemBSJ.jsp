<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">

<link rel="stylesheet" href="css/BSJ/myOrderList.css" />

<style>
  /* 검색창 & 돋보기 *///
        .search-barBSJ {
            position: relative;
            margin-bottom: 20px;
            max-width: 400px;
        }
        .search-barBSJ input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            padding-right: 40px;
        }
        .search-barBSJ i {
            position: absolute;
            right: 15px;
            top: 50%;
            transform: translateY(-50%);
            cursor: pointer;
            color: #888;
        }
</style>

<!-- 세션 -->
<%
String LOGID = (String) session.getAttribute("LOGID");
String LOGNAME = (String) session.getAttribute("LOGNAME");
String MEMBERDIVISION = (String) session.getAttribute("MEMBERDIVISION");
%>

 <div class="container mt-4 containerBSJ" style="padding-top: 100px;">
	<form action="checkMem.do" method="post">
		<div class="container mt-5 w-75"
			style="width: 1300px; height: 1000px; background-color: white;">
			<h4 class="mb-4 mt-3">회원정보 확인</h4>
			<div class="border-bottom border-2">
						<h6><span class="text-primary">${LOGID }</span> 님의 정보를 안전하게 보호하기 위해
						비밀번호를 다시 한번 확인 합니다.</h6>
				
				</div>
			
				<div class="form-section ">
				<div class="mb-3 mt-4 row">
					<label for="staticID" class="col-sm-2 col-form-label">아이디</label>
					<div class="col-sm-8">
						<input type="text"  class="form-control mb-2"id="staticID" name="staticID" value="${LOGID }" readonly />
					</div>
				</div>
			</div>
			<div class="form-section">
				<div class="mb-3 row ">
					<label for="inputPassword" class="col-sm-2 col-form-label">비밀번호</label>
					<div class="col-sm-8">
						<input type="password" class="form-control mb-2" id="inputPassword" name="inputPassword"
							 placeholder="비밀번호를 입력하세요"/>
					</div>
				</div>
			</div>


			<div class="container col-sm-3 text-center">
				<button class="btn btn-sm btn-primary mt-3" type="submit">확인</button>
				<button class="btn btn-sm btn-secondary mt-3">취소</button>
			</div>
		</div>
	</form>
</div>

</body>

</html>