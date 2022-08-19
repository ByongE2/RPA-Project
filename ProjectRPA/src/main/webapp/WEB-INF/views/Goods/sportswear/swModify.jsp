<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			<form action="/admin/goods/sportswear/modify" method="post" id="modifyForm">
				
				<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>
				<input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'>
				<input type="hidden" name="keyword" value='<c:out value="${cri.keyword}"/>'>
				<input type="hidden" name='swID' value='<c:out value="${cri.goods_swID}"/>'>


				<div class="form_section">
					<div class="form_section_title">
						<label>상품 ID</label>
					</div>
					<div class="form_section_content">
						<input class="form-control" name="swID" value="${swInfo.goods_swID}" readonly="readonly"  value='<c:out value="${swInfo.goods_swName}"/>'>
					</div>
				</div>

				<div class="form_section">
					<div class="form_section_title">
						<label>상품 이름</label>
					</div>
					<div class="form_section_content">
						<input name="swName" value="${swInfo.goods_swName}">
						<span class="ck_warn swName_warn">상품 이름 입력하세요.</span>
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
						<input name="swPrice" value="${swInfo.goods_swPrice}">
						<span class="ck_warn swPrice_warn">상품 가격을 입력해주세요.</span>
					</div>
				</div>               
				<div class="form_section">
					<div class="form_section_title">
						<label>상품 재고</label>
					</div>
					<div class="form_section_content">
						<input name="swStock" value="${swInfo.goods_swStock}">
						<span class="ck_warn swStock_warn">상품 재고를 입력해주세요.</span>
					</div>
				</div>          
				<div class="form_section">
					<div class="form_section_title">
						<label>상품 소개</label>
					</div>
					<div class="form_section_content bit">
						<textarea name="swDetail" id="swDetail_textarea">${swInfo.goods_swDetail}</textarea>
						<span class="ck_warn swDetail_warn">상품 소개를 입력해주세요.</span>
					</div>
				</div>        		
				<input type="hidden" name='swID' value="${swInfo.goods_swID}">
			</form>
				<div class="btn_section">
				<button id="cancelBtn" class="btn">취 소</button>
				<button id="modifyBtn" class="btn modify_btn">수 정</button>
				<button id="deleteBtn" class="btn delete_btn">삭 제</button>
			</div> 
		</div>  
		<form id="moveForm" action="/admin/goods/sportswear/detail" method="get" >
			<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>
			<input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'>
			<input type="hidden" name="keyword" value='<c:out value="${cri.keyword}"/>'>
			<input type="hidden" name='swID' value='<c:out value="${cri.goods_swID}"/>'>
		</form>                     
	</div>
<script>
/* 취소 버튼 */
$("#cancelBtn").on("click", function(e){
	e.preventDefault();
	$("#moveForm").submit();
});
/* 삭제 버튼 */
$("#deleteBtn").on("click", function(e){
	e.preventDefault();
	let moveForm = $("#moveForm");
	moveForm.find("input").remove();
	moveForm.append('<input type="hidden" name="swID" value="${swInfo.goods_swID}">');
	moveForm.attr("action", "/admin/goods/sportswear/remove");
	moveForm.attr("method", "post");
	moveForm.submit();
});
/* 수정 버튼 */
$("#modifyBtn").on("click",function(e){
	
	e.preventDefault();
	
	/* 체크 변수 */
	let swName = false;
	let swPrice = false;
	let swStock = false;
	let swDetail = false;
	
	/* 체크 대상 변수 */
	let swName = $("input[name='swName']").val();
	let swPrice = $("input[name='swPrice']").val();
	let swStock = $("input[name='swStock']").val();
	let swDetail = $("input[name='swDetail']").val();
	
	//let intro = $(".bit p").html();
	//let Contents = $(".bct p").html();	
	
	/* 공란 체크 */
	if(bookName){
		$(".swName").css('display','none');
		bookNameCk = true;
	} else {
		$(".swName").css('display','block');
		bookNameCk = false;
	}
	
	if(authorId){
		$(".swPrice_warn").css('display','none');
		authorIdCk = true;
	} else {
		$(".swPrice_warn").css('display','block');
		authorIdCk = false;
	}
	
	if(publeYear){
		$(".swStock_warn").css('display','none');
		publeYearCk = true;
	} else {
		$(".swStock_warn").css('display','block');
		publeYearCk = false;
	}	
	
	if(publisher){
		$(".swDetail_warn").css('display','none');
		publisherCk = true;
	} else {
		$(".swDetail_warn").css('display','block');
		publisherCk = false;
	}
	
	/* 최종 확인 */
	if(swName && swPrice && swStock && swDetail){
		//alert('통과');
		$("#modifyForm").submit();
	} else {
		return false;
	}
});

</script>           

	<%-- <%@include file="../includes/admin/footer.jsp" %> --%>
</body>
</html>