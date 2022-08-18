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
<h1>클라이언트 상품 보기페이지</h1>

<div>
	<label>판매자</label><input name="pt_no" readonly="readonly" value="${clinet_no.pt_name}">
</div>

<script type="text/javascript">
	function basketingchange(){
		const btnelement = document.getElementById('basketing');
		const htmlown = '<button id="basketed" onclick="basketedchange()">장바구니담김</button>';
		alert("장바구니에 담았습니다.");
		btnelement.innerHTML=htmlown;
	}

</script>

<script type="text/javascript">
function basketedchange(){
	const htmltwo = '<button id="basketing" onclick="basketingchange()">장바구니</button>';
	const btnelementtwo= document.getElementById('basketed');
	
	btnelementtwo.innerHTML=htmltwo;
}
</script>

<button id="basketing" onclick="basketingchange()">장바구니</button>
<button>구매하기</button>
<div>
	<label>상품내용</label>
		<div> ${clinet_no.PT_content}</div>
</div>
<div>
	<label>등록 아이디</label><input name="PT_id" readonly="readonly" value="${clinet_no.PT_id}">
</div>
<div>
	<label>상품 상태</label><input name="PT_State" readonly="readonly" value="${clinet_no.PT_State}">
</div>
<div>
	<label>상품 제목</label><input name="PT_title" readonly="readonly" value="${clinet_no.PT_title}">
</div>
<div>
	<label>상품 사진</label><input name="PT_photourl" readonly="readonly" value="${clinet_no.PT_photourl}">
</div>

<div>
	<label>캘린더 앞</label><input name="Calendar_before" readonly="readonly" value="${clinet_no.calendar_before}">
</div>
<div>
	<label>캘린더 뒤</label><input name="Calendar_after" readonly="readonly" value="${clinet_no.calendar_after}">
</div>


	
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