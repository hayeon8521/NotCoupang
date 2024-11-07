<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">



<!--요기서-->
<div class="d-flex mb-0 border-bottom-1 border-1 border-black">
	<div class="p-1">
		<a href="goodsinfo.do?seqGoods=${cart.goodsNum }"><img
			src="images/${cart.imgUrl }" class="thumbnail"></a>
	</div>
	<div class="pt-2" style="width: 345px;">
		<h5 class="card-title" style="text-align: left;">
			상품제목, 가격, 수량
		</h5>
		<div id="pricediv" class="p-2 text-start">
			<h3 class="price" name="${cart.goodsPrice }">
				텍스트 에어리어!!
			</h3>
		</div>
		<div class="d-flex">
			<div class="p-2">
				<h3>
					등록 삭제 버든
				</h3>
			</div>
		</div>
	</div>
</div>
<!--요기까지 반복-->