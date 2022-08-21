<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
장바구니로 흘러들어옴

<table	border="1">
	<tr>
		<th>사용자 아이디</th>
		<th>상품 이름</th>
		<th>상품 금액</th>
		<th>상품 사진</th>
		<th>결제상태</th>
		<th>상품 코드</th>
		<th>상품일자</th>
		<th></th>
	</tr>
	<c:forEach items="${basket}" var="basket">
		<tr>
			<td>${basket.PT_id_basket }</td>
			<td>${basket.PT_title_basket }</td>
			<td>${basket.PT_price_basket }</td>
			<td>${basket.pt_photourl_basket }</td>
			<td>${basket.purchase_basket }</td>
			<td>${basket.PT_code }</td>
			<td>${basket.pt_date }</td>
			<td><button onclick="location.href='/ptclient/basketdelete?PT_code=${basket.PT_code}&client_id=${basket.PT_id_basket }'">삭제</button></td>
		</tr>
	</c:forEach>
</table>

<button id="ptlist">목록</button>
	
<script>
	var operForm =$("#operForm");
	
	$(document).ready(function() {
		$("#ptlist").on("click",function(){
			self.location="/ptclient/clientlist";
		})
	});
</script>
</body>
</html>