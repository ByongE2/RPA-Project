<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>

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
<link rel="stylesheet" href="../resources/CSS/main/main.css">
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<h1>클라이언트 리스트로 들어옴</h1>



<button onclick="location.href='/ptclient/basket?client_id=${user.id}'">구매 내역</button>
<table border="1">
	<tr>
		<th>번호</th>
		<th>이름</th>
		<th>아이디</th>
		<th>생성날짜</th>
		<th>금액</th>
		<th>물건 코드</th>
		<th>제목</th>
		<th>사진</th>
		<th>날짜1</th>
		<th>날짜2</th>

	</tr>
	<c:forEach items="${client}" var="client">
		<tr>
			<td>${client.PT_no }</td>
			<td>${client.pt_name} </td>
			
			<td>${client.PT_id}</td>
			<td><fmt:formatDate value="${client.PT_Registration}" pattern="yyyy-MM-dd"/></td>
			<td> ${client.PT_Price}</td>
			<td>${client.PT_code}</td>
			<td><a href="/ptclient/clientget?client_no=${client.PT_no }&&pt_code=${client.PT_code}"> ${client.PT_title}</a></td>
			<td><img alt="이미지 없음"  src="/ProjectRPA/src/main/webapp/resources/ptimg/${client.PT_photourl}"></td>
			<td>${client.calendar_before }</td>
			<td>${client. calendar_after}</td>
			<!-- pt_no값을 못가져옴 -->
			
		</tr>
	</c:forEach>
</table>

</body>
</html>