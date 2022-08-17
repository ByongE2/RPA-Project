<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/admin/goodsModify.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
 <script src="https://cdn.ckeditor.com/ckeditor5/26.0.0/classic/ckeditor.js"></script>
 <script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
</head>
</head>
<body>
	<%-- <%@include file="../includes/admin/header.jsp" %> --%>

	<div class="admin_content_wrap">
	    <div class="admin_content_subject"><span>상품 등록</span></div>
	    <div class="admin_content_main">
	    	<form action="/admin/goods/sportswear/modify" method="post" id="modifyForm">
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
	<input type="hidden" name="pageNum" value="${cri.pageNum}">
	<input type="hidden" name="amount" value="${cri.amount}">
	<input type="hidden" name="keyword" value="${cri.keyword}">
	<input type="hidden" name='swID' value="${swInfo.goods_swID}">
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