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

	<%-- <%@include file="../includes/admin/header.jsp" %> --%>
	<div class="admin_content_wrap">
			<div class="admin_content_subject"><span>상품 상세</span></div>

			<div class="admin_content_main">

				<div class="form_section">
					<div class="form_section_title">
						<label>상품 이름</label>
					</div>
					<div class="form_section_content">
						<input name="swName" value='<c:out value="${swInfo.goods_swName}"/>' disabled>
					</div>
				</div>
				<div class="form_section">
					<div class="form_section_title">
						<label>등록 날짜</label>
					</div>
					<div class="form_section_content">
						<input value="<fmt:formatDate value='${swInfo.goods_swRegDate}' pattern='yyyy-MM-dd'/>" disabled>
					</div>
				</div>
				<div class="form_section">
					<div class="form_section_title">
						<label>최근 수정 날짜</label>
					</div>
					<div class="form_section_content">
						<input value="<fmt:formatDate value='${swInfo.goods_swUpdateDate}' pattern='yyyy-MM-dd'/>" disabled>
					</div>
				</div>                    		                    		
				<div class="form_section">
					<div class="form_section_title">
						<label>상품 가격</label>
					</div>
					<div class="form_section_content">
						<input id="swPrice" readonly="readonly" value="<c:out value='${swInfo.goods_swPrice}'/>" disabled>
					</div>
				</div>            
				<div class="form_section">
					<div class="form_section_title">
						<label>상품 소개</label>
					</div>
					<div class="form_section_content bit">
						<textarea name="swDetail" id="swDetail_textarea" disabled>${swInfo.goods_swDetail}</textarea>
					</div>
				</div>        		
				<div class="form_section">
					<div class="form_section_title">
						<label>상품 할인율</label>
					</div>
					<div class="form_section_content bit">
						<input id="swDiscount" name="swDiscount" readonly="readonly" value="<c:out value='${swInfo.goods_swDiscount}'/>">
					</div>
				</div>        		
				<div class="form_section">
					<div class="form_section_title">
						<label>상품 재고</label>
					</div>
					<div class="form_section_content">
						<input name="swStock" value="<c:out value='${swInfo.goods_swStock}'/>" disabled>
					</div>
				</div>          
				<div class="btn btn-default">
					<button data-oper='modify' class="btn btn-default">Modify</button>
					<button data-oper='list'  class="btn btn-info" > List</button>
				</div> 
			</div>      

	<form id="moveForm" action="/admin/goods/sportswear/modify" method="get" >
		<input type="hidden" id="swID" name="swID" value='<c:out value="${swInfo.goods_swID}"/>'>
		<input type="hidden" name="pageNum" value="${cri.pageNum}">
		<input type="hidden" name="amount" value="${cri.amount}">
		<input type="hidden" name="keyword" value="${cri.keyword}">
	</form>
	
	</div>
	<%-- <%@include file="../includes/admin/footer.jsp" %> --%>

<script>
let moveForm = $("#moveForm");	
/* 목록 이동 버튼 */
$("button[data-oper='list']").on("click", function(e){
	moveForm.find("#swID").remove();
	moveForm.attr("action", "/admin/goods/sportswear/list").submit();
});	
/* 수정 페이지 이동 */
$("button[data-oper='modify']").on("click", function(e){
	moveForm.attr("action", "/admin/goods/sportswear/modify").submit();
});	

$(document).ready(function(){
/* 할인율 값 삽입 */
let swDiscount = "<c:out value='${swInfo.goods_swDiscount}'/>" * 100;
$("#swDiscount").attr("value", swDiscount);
});
</script>
</body>
</html>