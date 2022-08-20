<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet" href="../resources/css/admin/goods/sportswear/sw.css"> -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">

<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<script src="https://code.jquery.com/jquery-3.6.0.min.js" 
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" 
		crossorigin="anonymous">
</script>
</head>
<body>
	<div class="panel-heading">
		상품 등록
 </div>

 	<form role="form" action="/admin/goods/sportswear/insert" method="post">
		 	<div class="form-group">
			 <label>상품명</label>
			 <input class="form-control" name="goods_swName">
			</div>
			<div class="form-group">
				<label>상품 가격</label>
				<input class="form-control" name="goods_swPrice">
			</div>
			<div class="form-group">
				<label>상품 설명</label>
				<input class="form-control" name="goods_swDetail">
			</div>
			<div class="form-group">
				<label>상품 재고</label>
				<input class="form-control" name="goods_swStock">
			</div>
			<div class="form-group">
				<label>상품 할인율</label>
				<input id="discount_interface" maxlength="2" value="0">
				<input name="goods_swDiscount" type="hidden" value="0">	
				<span class="step_val">할인 된 가격 : <span class="span_discount"></span></span>
			</div>
			<button type="submit" class="btn btn-default">등록</button>
			<button type="reset" class="btn btn-default">리셋</button>
		</form>
<script>
/* 할인율 Input 설정 */
$("#discount_interface").on("propertychange change keyup paste input", function(){
	
	let userInput = $("#discount_interface");
	let discountInput = $("input[name='goods_swDiscount']");
	//할인율을 정수로 넣으면 서버에서 소수로 바꿔주는..
	//상품 가격 * (1 - (할인율/100))
	let discountRate = userInput.val();				// 입력할 할인값
	let sendDiscountRate = discountRate / 100;		// 서버에 전송할 할인값
	let goodsPrice = $("input[name='goods_swPrice']").val();		// 원가
	let discountPrice = goodsPrice * (1 - sendDiscountRate);		// 할인가격
	        
	$(".span_discount").html(discountPrice);
	
	discountInput.val(sendDiscountRate);	
	
});
//상품가격 > 상품 할인율 순으로 입력했다가, 다시 상품 가격을 수정했을 때도 할인가격을 바로 볼 수 있도록.
$("input[name='goods_swPrice']").on("change", function(){
	
	let userInput = $("#discount_interface");
	let discountInput = $("input[name='goods_swDiscount']");
	//할인율을 정수로 넣으면 서버에서 소수로 바꿔주는..
	//상품 가격 * (1 - (할인율/100))
	let discountRate = userInput.val();				// 입력할 할인값
	let sendDiscountRate = discountRate / 100;		// 서버에 전송할 할인값
	let goodsPrice = $("input[name='goods_swPrice']").val();		// 원가
	let discountPrice = goodsPrice * (1 - sendDiscountRate);		// 할인가격
	        
	$(".span_discount").html(discountPrice);
});

</script>		
			

</body>
</html>