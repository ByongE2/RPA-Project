<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>          
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome</title>
<link rel="stylesheet" href="/resources/CSS/goods/sportswear/swClientList.css">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
</head>
<body>

	<div class="container">
		<div class="admin_content_subject"><span>상품 목록</span></div>
		<div class="table table-striped">
		<!-- 게시물 있을 때 -->
		<c:if test="${listCheck != 'empty' }">
	       	<table class="goods_table">
	       		<thead>
	       			<tr>
	       				<td class="th_column_1">상품 번호</td>
	       				<td class="th_column_2">상품 이름</td>
	       				<td class="th_column_3">상품 가격</td>
	       				<td class="th_column_4">상품 설명</td>
	       				<td class="th_column_5">상품 할인율</td>
	       				<td class="th_column_6">상품 재고</td>
	       				<td class="th_column_7">등록 날짜</td>
	       				<td class="th_column_8">수정 날짜</td>
	       			</tr>
	       		</thead>
	       		<c:forEach items="${list}" var="list">
	       		<tr>
					<td class="image">
						<div class="image_wrap" 
						data-swid ="${list.imageList[0].goods_swID}" 
						data-path="${list.imageList[0].uploadPath}" 
						data-uuid="${list.imageList[0].uuid}" 
						data-filename="${list.imageList[0].fileName}">
							<img>
						</div>				
					</td>
	       			<td><c:out value="${list.goods_swID}"></c:out> </td>
	       			<td>
		       			<a href="/goods/sportswear/detail/${list.goods_swID}">
						<c:out value="${list.goods_swName}"></c:out>
						</a>
					</td>
	       			<td><c:out value="${list.goods_swPrice}"></c:out> </td>
	       			<td><c:out value="${list.goods_swDetail}"></c:out> </td>
	       			<td><c:out value="${list.goods_swDiscount}"></c:out> </td>
	       			<td><c:out value="${list.goods_swStock}"></c:out> </td>
	       			<td><fmt:formatDate value="${list.goods_swRegDate}" pattern="yyyy-MM-dd"/></td>
	       			<td><fmt:formatDate value="${list.goods_swUpdateDate}" pattern="yyyy-MM-dd"/></td>
	      			</tr>
	       		</c:forEach>
	       	</table>
	    </c:if>
	    <!-- 게시물 없을 때 -->
	    <c:if test="${listCheck == 'empty'}">
  			<div class="table_empty">
  				등록된 상품이 없습니다.
  			</div>
  			</c:if>   	
           </div>
        <!-- 검색 시작 -->
        <div class="search_wrap">
	       	<form id="searchForm" action="/goods/sportswear/list" method="get">
	       		<div class="search_input">
	       			<input type="text" name="keyword" value="${pageMaker.cri.keyword}">
	       			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
	       			<input type="hidden" name="amount" value='${pageMaker.cri.amount}'>
	       			<button class='btn btn-primary'>검 색</button>
	       		</div>
	       	</form>
	       </div>     
        <!-- 검색 끝 -->   
    	<!-- 페이징 인터페이스 시작 -->
    	<div class="pull-right" >
	        <ul class="pagination">
	        	<!-- 이전 버튼 -->
	        	<c:if test="${pageMaker.prev}">
	        		<li class="paginate_button previous">
	        			<a href="${pageMaker.pageStart - 1}">이전</a>
	        		</li>
	        	</c:if>
	        	<!-- 페이지 번호 -->
	        	<c:forEach begin="${pageMaker.pageStart}" end="${pageMaker.pageEnd}" var="num">
							<li class="paginate_button ${pageMaker.cri.pageNum == num ? "active" : ""}">
	        			<a href="${num }">${num}</a> <!-- 한번 더 체크 -->
	        		</li>
	        	</c:forEach>
	        	<!-- 다음 버튼 -->
	        	<c:if test="${pageMaker.next}">
	        		<li class="paginate_button next">
	        			<a href="${pageMaker.pageEnd + 1 }">다음</a>
	        		</li>
	        	</c:if>
	        </ul>
        </div>       
    	<!-- 페이징 인터페이스 끝 -->

    	<form id="moveForm" action="/goods/sportswear/list" method="get">
			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
			<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
			<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
		</form>       
		<!--Modal 창 추가 -->
		<div id="myModal" class="modal" tabindex="-1" role="dialog">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">Modal title</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						처리가 완료됬습니다.
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary">성공!!</button>
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
		<!--Modal 창 닫기 -->
	</div>

<script>
$(document).ready(function() {

	let moveForm = $('#moveForm');
	let searchForm = $('#searchForm');
	//페이지 이동 버튼
	$(".paginate_button a").on("click", function(e){
			e.preventDefault();
			moveForm.find("input[name='pageNum']").val($(this).attr("href"));
			moveForm.submit();
	});	//$(".paginate_button a").on("click", function(e)	
	//상품 검색 버튼 동작
	$("#searchForm button").on("click", function(e){
		e.preventDefault();
		//검색 키워드 유효성 검사
		if(!searchForm.find("input[name='keyword']").val()){
			alert("키워드를 입력하십시오");
			return false;
		}
		searchForm.find("input[name='pageNum']").val("1");
		searchForm.submit();
	});//$("#searchForm button").on("click", function(e)

	/* 이미지 삽입 */
	$(".image_wrap").each(function(i, obj){
		
		const bobj = $(obj);
		
		if(bobj.data("swid")){
			const uploadPath = bobj.data("path");
			const uuid = bobj.data("uuid");
			const fileName = bobj.data("filename");
			
			const fileCallPath = encodeURIComponent(uploadPath + "/s_" + uuid + "_" + fileName);
			
			$(this).find("img").attr('src', '/goods/sportswear/display?fileName=' + fileCallPath);
			
		} else {
			
			$(this).find("img").attr('src', '/resources/goods/no Image.png');
			
		}
		
	});	
	
});//$(document).ready(function()
		
//뒤로가기 했을 때 새로고침 되게.
window.onpageshow = function(e) {
		if (e.persisted || (window.performance && window.performance.navigation.type == 2)) { //뒤로가기 감지
			 location.reload(); //현재 페이지 새로고침
		}
 }//window.onpageshow = function(e)
	
</script>

</body>
</html>