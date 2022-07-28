<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>리스트로들어옴</h1>

<table border="1">
	<tr>
		<th>번호</th>
		<th>이름</th>
		<th>내용</th>
		<th>아이디</th>
		<th>생성날짜</th>
		<th>금액</th>
		<th>물건 코드</th>
		<th>제목</th>
		<th>사진</th>
		<th>날짜1</th>
		<th>날짜2</th>
	</tr>
	<c:forEach items="${list }" var="pt">
		<tr>
			<td>${pt.PT_no }</td>
			<td>${pt.pt_name} </td>
			<td>${pt.PT_content}</td>
			<td>${pt.PT_id}</td>
			<td><fmt:formatDate value="${pt.PT_Registration}" pattern="yyyy-MM-dd"/> </td>
			<td>${pt.PT_Price}</td>
			<td>${pt.PT_code}</td>
			<td><a href="/ptproduct/ptget?PT_no=${pt.PT_no }"> ${pt.PT_title}</a></td>
			<td>${pt.PT_photourl}</td>
			
		</tr>
	</c:forEach>
</table>

</body>
</html>