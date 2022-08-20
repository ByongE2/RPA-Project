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
			<button type="submit" class="btn btn-default">등록</button>
			<button type="reset" class="btn btn-default">리셋</button>
		</form>
			

</body>
</html>