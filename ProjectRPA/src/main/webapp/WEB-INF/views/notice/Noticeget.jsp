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
}
.btn_wrap{
	padding-left : 80px;
	margin-top : 50px;
} */
</style>
</head>
<body>
	<h1>상세 페이지</h1>
	<div class="input_wrap">
		<label>번호</label>
		<input name="notice_no" readonly="readonly" value='<c:out value="${NoticeInfo.notice_no}"/>' >
	</div>
	<div class="input_wrap">
		<label>제목</label>
		<input name="title" readonly="readonly" value='<c:out value="${NoticeInfo.title}"/>' >
	</div>
	<div class="input_wrap">
		<label>내용</label>
		<textarea rows="3" name="content" readonly="readonly"><c:out value="${NoticeInfo.content}"/></textarea>
	</div>
	<div class="input_wrap">
		<label>작성자</label>
		<input readonly="readonly" value='<c:out value="관리자"/>' >
	</div>
	<div class="input_wrap">
		<label>등록일</label>
		<input name="regDate" readonly="readonly" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${NoticeInfo.regDate}"/>' >
	</div>
		
	<%-- <div class="btn_wrap">
		<a class="btn" id="list_btn">목록</a>&nbsp;
		
		<c:if test="${user.grade == 1}"><a class="btn" id="modify_btn">수정</a></c:if>
	</div> --%>
	
		<%-- <c:if test="${user.grade == 1}"><button data-oper='modify' class="btn btn-default">Modify</button></c:if> --%>
		<c:if test="${user.grade == 1}"><button data-oper='modify' class="btn btn-success">수정</button></c:if>&nbsp;&nbsp;&nbsp;
	    <button data-oper='list'  class="btn btn-info">목록</button>	
	
	<form id="infoForm" action="/notice/Noticemodify" method="get">
		<input type="hidden" id="notice_no" name="notice_no" value='<c:out value="${NoticeInfo.notice_no}"/>'>
		<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>
    	<input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'>
       	<input type="hidden" name="type" value='<c:out value="${cri.type}"/>'>
    	<input type="hidden" name="keyword" value='<c:out value="${cri.keyword}"/>'>
	</form>
	
	
<script>
	let form = $("#infoForm");
	
	$("button[data-oper='modify']").on("click", function(e){
		form.attr("action", "/notice/Noticemodify").submit();
	});
	
	$("button[data-oper='list']").on("click", function(e){
		form.find("#notice_no").remove();
		form.attr("action", "/notice/Noticelist").submit();
	});
	
	/* $("#list_btn").on("click", function(e){
		form.find("#notice_no").remove();
		form.attr("action", "/notice/Noticelist");
		form.submit();
	});
	
	$("#modify_btn").on("click", function(e){
		form.attr("action", "/notice/Noticemodify");
		form.submit();
	}); */	
</script>

</body>
</html>