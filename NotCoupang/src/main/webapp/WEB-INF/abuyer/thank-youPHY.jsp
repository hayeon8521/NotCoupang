<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- 날짜 포멧 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 기본 기능 선언부 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
	<script src="js/PHY/hayeonPHY.js"></script>
	<!-- 기본 기능 선언부 끝  -->
	<%
	    String LOGID = (String) session.getAttribute("LOGID");
	    String LOGNAME = (String) session.getAttribute("LOGNAME");
	    String MEMBERDIVISION = (String) session.getAttribute("MEMBERDIVISION");
	
		if (LOGID == null) {
	%>
			<script>
				window.location.replace("/NotCoupang/welcome.do");
			</script>
	<%
		} else if (MEMBERDIVISION.equals("seller")) {
	%>
			<script>
				//NotCoupang/Admin_main.do
				window.location.replace("/NotCoupang/Admin_main.do");
			</script>
	<%
	    }
	%>
    <script>document.title = "낫팡 - 주문완료";</script>
    <style>
        .container-custom {
            max-width: 980px;
            margin-top: 20px;
            background-color: #ffffff;
            border: 1px solid #ddd;
            padding: 20px;
        }
        .order-status {
            font-weight: bold;
            font-size: 3rem;
            text-align: center;
        }
        .btn-custom {
            width: 100%;
            padding: 12px;
            font-size: 1em;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="container container-custom">
        <!-- 주문 완료 상태 -->
        <div class="order-status">주문완료</div>
        <div class="d-flex justify-content-center align-items-center" style="height: 300px;">
            <p class="text-center mt-3" style="margin: 0;">
                주문이 완료되었습니다. 감사합니다!<br>고객님의 주문은 <strong>빠른 시일 내에</strong> 나뉘어 배송됩니다.<br><br>
            </p>
        </div>
        <!-- 버튼 -->
        <div class="row">
            <div class="col-md-6">
                <button class="btn btn-outline-primary btn-custom orderinfo">주문 상세보기</button>
            </div>
            <div class="col-md-6">
                <button class="btn btn-primary btn-custom goingshowping">쇼핑 계속하기</button>
            </div>
        </div>
    </div>
</body>
<script>
    document.querySelector('.goingshowping').addEventListener('click', function(){
        window.location.replace("/NotCoupang/welcome.do");
    });

    document.querySelector('.orderinfo').addEventListener('click', function(){
        window.location.replace("/NotCoupang/myOrderList.do?buyerId=${LOGID}");
    });
</script>
</html>