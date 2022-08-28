<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
<style type="text/css">
.input_wrap{
	padding: 5px 20px;
}
label{
    display: block;
    margin: 10px 0;
    font-size: 20px;	
}
input{
	padding: 5px;
    font-size: 17px;
}
textarea{
	width: 300px;
    height: 100px;
    font-size: 15px;
    padding: 10px;
}
/* .btn{
  	display: inline-block;
    font-size: 15px;
    padding: 6px 12px;
    background-color: #fff;
    border: 1px solid #ddd;
    font-weight: 600;
    width: 50px;
    height: 30px;
    line-height: 39px;
    text-align : center;
    margin-left : 30px;
    cursor : pointer;
} */
.btn_wrap{
	padding-left : 80px;
	margin-top : 50px;
}
</style>
</head>
<body>
	<h1>수정 페이지</h1>
	<form role="form" action="/notice/Noticemodify" method="post">
		<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'   >
	   	<input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'   >
	   	<input type="hidden" name="type" value='<c:out value="${cri.type}"/>'   >
	   	<input type="hidden" name="keyword" value='<c:out value="${cri.keyword}"/>'   >
	
	<div class="input_wrap">
		<label>번호</label>
		<input name="notice_no" readonly="readonly" value='<c:out value="${NoticeInfo.notice_no}"/>' >
	</div>
	<div class="input_wrap">
		<label>제목</label>
		<input name="title" value='<c:out value="${NoticeInfo.title}"/>' >
	</div>
	<div class="input_wrap">
		<label>내용</label>
		<textarea rows="3" name="content"><c:out value="${NoticeInfo.content}"/></textarea>
	</div>
	<div class="input_wrap">
		<label>작성자</label>
		<input readonly="readonly" value='<c:out value="관리자"/>' >
	</div>
	<div class="input_wrap">
		<label>등록일</label>
		<input name="regDate" readonly="readonly" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${NoticeInfo.regDate}"/>' >
	</div>
			
	<!-- <div class="btn_wrap">
		<a class="btn" id="list_btn">목록</a> 
		<a class="btn" id="modify_btn">수정</a>
		<a class="btn" id="cancel_btn">취소</a>
		<a class="btn" id="delete_btn">삭제</a>
	</div> -->
		<button type="submit"  data-oper='modify' class="btn btn-success">수정</button>												    
		<button type="submit"   data-oper='remove' class="btn btn-danger">삭제</button>												    
		<button type="submit"  data-oper='list' class="btn btn-info">목록</button>
	
	</form>
	<%-- <form id="infoForm" action="/notice/Noticemodify" method="get">
		<input type="hidden" id="notice_no" name="notice_no" value='<c:out value="${NoticeInfo.notice_no}"/>'>
		<input type="hidden" name="pageNum" value="${cri.pageNum }">
        <input type="hidden" name="amount" value="${cri.amount }">
        <input type="hidden" name="keyword" value="${cri.keyword }">
	</form> --%>
	

<script type="text/javascript">

	$(document).ready(function(){
		
		var formObj = $("form");
		
		$('button').on("click", function(e){
			e.preventDefault();
			
			var operation = $(this).data('oper');
			console.log(operation);
			
			if(operation === 'remove'){
				formObj.attr("action", "/notice/Noticedelete");
			}else if(operation === 'list'){
				formObj.attr("action", "/notice/Noticelist").attr("method","get");
			  	
				var pageNumTag = $("input[name='pageNum']").clone();
				var amountTag = $("input[name='amount']").clone(); 
				var typeTag = $("input[name='type']").clone(); 
				var keywordTag = $("input[name='keyword']").clone(); 
				
				formObj.empty();
			    formObj.append(pageNumTag);
				formObj.append(amountTag); 
				formObj.append(typeTag); 
				formObj.append(keywordTag); 
			}
			formObj.submit();
		});
	});
</script>	
<!-- <script>

	 let form = $("#infoForm");        // 페이지 이동 form(리스트 페이지 이동, 조회 페이지 이동)
     let mForm = $("#modifyForm");    // 페이지 데이터 수정 from
	
	    //목록 페이지 이동
	$("#list_btn").on("click", function(e){
		form.find("#notice_no").remove();
		form.attr("action", "/notice/Noticelist");
		form.submit();
	});
	
	    //수정하기
	$("#modify_btn").on("click", function(e){
		mForm.submit();
	});	
	
	    //취소
	$("#cancel_btn").on("click", function(e){
		form.attr("action", "/notice/Noticeget");
		form.submit();
	});
	    
	    //삭제
	$("#delete_btn").on("click", function(e){
        form.attr("action", "/notice/Noticedelete");
        form.attr("method", "post");
        form.submit();
    });
	    
</script> -->

</body>
</html>