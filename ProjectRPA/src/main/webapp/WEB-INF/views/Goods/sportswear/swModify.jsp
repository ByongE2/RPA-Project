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
</head>
<body>
	<%-- <%@include file="../includes/admin/header.jsp" %> --%>

	<div class="admin_content_wrap">
		<div class="admin_content_subject"><span>상품 수정</span></div>
		<div class="admin_content_main">
			<form role="form" action="/admin/goods/sportswear/modify" method="post">
				
				<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>
				<input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'>
				<input type="hidden" name="keyword" value='<c:out value="${cri.keyword}"/>'>

				<div class="form_section">
					<div class="form_section_title">
						<label>상품 ID</label>
					</div>
					<div class="form_section_content">
						<input class="form-control" name="goods_swID" value='<c:out value="${swInfo.goods_swID}"/>' readonly="readonly">
					</div>
				</div>

				<div class="form_section">
					<div class="form_section_title">
						<label>상품 이름</label>
					</div>
					<div class="form_section_content">
						<input name="goods_swName" value='<c:out value="${swInfo.goods_swName}"/>'>
						<span class="ck_warn swName_warn">상품 이름 입력하세요.</span>
					</div>
				</div>
				<div class="form_section">
					<div class="form_section_title">
						<label>등록 날짜</label>
					</div>
					<div class="form_section_content">
						<input value="<fmt:formatDate value='${swInfo.goods_swRegDate}' pattern='yyyy-MM-dd'/>" readonly="readonly">
					</div>
					</div>
					<div class="form_section">
					<div class="form_section_title">
						<label>최근 수정 날짜</label>
					</div>
					<div class="form_section_content">
						<input value="<fmt:formatDate value='${swInfo.goods_swUpdateDate}' pattern='yyyy-MM-dd'/>" readonly="readonly">
					</div>
				</div>            
				<div class="form_section">
					<div class="form_section_title">
						<label>상품 가격</label>
					</div>
					<div class="form_section_content">
						<input name="goods_swPrice" value='<c:out value="${swInfo.goods_swPrice}"/>'>
						<span class="ck_warn swPrice_warn">상품 가격을 입력해주세요.</span>
					</div>
				</div>               
				<div class="form_section">
					<div class="form_section_title">
						<label>상품 재고</label>
					</div>
					<div class="form_section_content">
						<input name="goods_swStock" value='<c:out value="${swInfo.goods_swStock}"/>'>
						<span class="ck_warn swStock_warn">상품 재고를 입력해주세요.</span>
					</div>
				</div>          
				<div class="form_section">
					<div class="form_section_title">
						<label>상품 소개</label>
					</div>
					<div class="form_section_content bit">
						<textarea name="goods_swDetail" id="swDetail_textarea">'<c:out value="${swInfo.goods_swDetail}"/>'</textarea>
						<span class="ck_warn swDetail_warn">상품 소개를 입력해주세요.</span>
					</div>
				</div>        		
			</form>
				<div class="btn_section">
					<button type="submit"  data-oper='modify' class="btn btn-default">Modify</button>		
					<button type="submit"  data-oper='remove' class="btn btn-danger">Remove</button>										    
					<button type="submit"  data-oper='list' class="btn btn-info">List</button>
			</div> 
		</div>  
		
	</div>

	<script type="text/javascript">
		$(document).ready(function(){
			
			var formObj = $("form");
			
			$('button').on("click", function(e){
				e.preventDefault();
				
				var operation = $(this).data('oper');
				console.log(operation);
				
				if(operation === 'remove'){
					formObj.attr("action", "/admin/goods/sportswear/remove");
				}else if(operation === 'list'){
					formObj.attr("action", "/admin/goods/sportswear/list").attr("method","get");
					var pageNumTag = $("input[name='pageNum']").clone();
					var amountTag = $("input[name='amount']").clone(); 
					// var typeTag = $("input[name='type']").clone(); 
					var keywordTag = $("input[name='keyword']").clone(); 
					formObj.empty();
					formObj.append(pageNumTag);
					formObj.append(amountTag); 
					// formObj.append(typeTag); 
					formObj.append(keywordTag); 
				}
				formObj.submit();
			});
		});
</script>           

	<%-- <%@include file="../includes/admin/footer.jsp" %> --%>
</body>
</html>