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

	<div class="container">
		<div class="admin_content_subject"><span>상품 목록&관리</span></div>
		<button id="regBtn"  type="button" class="btn btn-xs pull-right">상품 등록</button>
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
	       				<td class="th_column_5">상품 재고</td>
	       				<td class="th_column_6">등록 날짜</td>
	       				<td class="th_column_7">수정 날짜</td>
	       			</tr>
	       		</thead>
	       		<c:forEach items="${list}" var="list">
	       		<tr>
	       			<td><c:out value="${list.goods_swID}"></c:out> </td>
	       			<td>
		       			<a class="move" href='<c:out value="${list.goods_swID}"/>'>
						<c:out value="${list.goods_swName}"></c:out>
						</a>
					</td>
	       			<td><c:out value="${list.goods_swPrice}"></c:out> </td>
	       			<td><c:out value="${list.goods_swDetail}"></c:out> </td>
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
	       	<form id="searchForm" action="/admin/goods/sportswear/list" method="get">
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

    	<form id="moveForm" action="/admin/goods/sportswear/list" method="get">
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

		var result = '<c:out value="${result}"/>';
			checkModal(result);
			//뒤로가기 모달창 문제 해결
			history.replaceState({},null,null);
			function checkModal(result){
				if(result === '' || history.state){
					return ;				
				}
				if(parseInt(result) > 0){
					$(".modal-body").html("게시글 " + parseInt(result) + "번이 등록되었습니다.");
				}
				$("#myModal").modal("show");
			}
			//등록버튼
			$("#regBtn").on("click",function(){
				self.location = "/admin/goods/sportswear/insert";
			});

		let moveForm = $('#moveForm');
		let searchForm = $('#searchForm');
		//페이지 이동 버튼
		$(".paginate_button a").on("click", function(e){
				e.preventDefault();
				moveForm.find("input[name='pageNum']").val($(this).attr("href"));
				moveForm.submit();
		});		
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
		});
		//
		$(".move").on("click", function(e){
			e.preventDefault();
			moveForm.append("<input type='hidden' name='swID' value='"+$(this).attr("href") + "'>");
			moveForm.attr("action", "/admin/goods/sportswear/detail");
			moveForm.submit();
		});

	});
</script>	
		

</body>
</html>