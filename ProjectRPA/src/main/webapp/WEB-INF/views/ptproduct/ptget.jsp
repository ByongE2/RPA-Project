<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<!-- include summernote css/js-->

<link
	href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css"
	rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>

<!-- include summernote-ko-KR -->
<script src="/resources/js/summernote-ko-KR.js"></script>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>관리자용 상품 정보로 넘어옴</h1>

<div>
	<label>판매자</label><input name="pt_no" readonly="readonly" value="${pt_no.pt_name}">
</div>
<div>
	<label>상품내용</label>
	 
	<textarea rows="30" cols="10"  name="pt_content">${pt_no.PT_content }</textarea> 
	<span class="text-dark mb-0" th:utext="${pt_no.PT_content }"></span>
	
</div>
<div>
	<label>등록 아이디</label><input name="PT_id" readonly="readonly" value="${pt_no.PT_id}">
</div>
<div>
	<label>상품상태</label><input name="PT_State" readonly="readonly" value="${pt_no.PT_State}">
</div>
<div>
	<label>상품 제목</label><input name="PT_title" readonly="readonly" value="${pt_no.PT_title}">
</div>
<div>
	<label>상품 사진</label><input name="PT_photourl" readonly="readonly" value="${pt_no.PT_photourl}">
</div>
<div>
	<label>캘린더 앞</label><input name="Calendar_before" readonly="readonly" value="${pt_no.calendar_before}">
</div>
<div>
	<label>캘린더 뒤</label><input name="Calendar_after" readonly="readonly" value="${pt_no.calendar_after}">
</div>
<div>
	<label>상품코드</label><input name="PT_code" readonly="readonly" value="${pt_no.PT_code}">
</div>
<div>
	<label>상품 생성날짜</label><input name="PT_Registration" readonly="readonly" value="${pt_no.PT_Registration}">
</div>
	
		<button onclick="location.href='/ptproduct/ptmodify?pt_no=${pt_no.PT_no}'">수정하기</button>
		<button onclick="location.href='/ptproduct/ptremove?pt_no=${pt_no.PT_no}'">삭제</button>
		<button id="ptlist">리스트</button>
	
<script>
	var operForm =$("#operForm");
	
	$(document).ready(function() {
		$("#ptlist").on("click",function(){
			self.location="/ptproduct/list";
		})
	});
</script>
</body>
</html>