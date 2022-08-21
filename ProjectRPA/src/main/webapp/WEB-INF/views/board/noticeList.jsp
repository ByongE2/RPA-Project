<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항</title>

   
  
</head>
<body>

<div class="card">
   
	</div>
	<br><br>
	<div id="slider">
		<!-- 여기에 내용 넣으세요 -->
		<h1>공지사항</h1>
		<hr>
		<!--게시판 메인페이지 영역 시작-->
		<div class="container">
			<div class="row">
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th style="backgorund-color: #eeeeee; text-align: center;">번호</th>
							<th style="backgorund-color: #eeeeee; text-align: center;">제목</th>
							<th style="backgorund-color: #eeeeee; text-align: center;">작성자</th>
							<th style="backgorund-color: #eeeeee; text-align: center;">작성일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="notice">
						<tr>
							<td>${notice.num}</td>
							<td><a href="/board/get?bno=<c:out value="${notice.num}"/>">${notice.title}</a></td>
							<td>${notice.user.userNum }</td>
							<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${notice.notice_date}" /></td>
						</tr>
						</c:forEach>
					</tbody>
				</table>

			</div>
		</div>
		<!--게시판 메인페이지 영역 끝-->
		<div class="d-grid gap-2 d-md-flex justify-content-md-end">
			<button data-oper='register' class="btn btn-primary me-md-2" type="button">글쓰기</button>
		</div>
		
		<form id="operForm" action="/board/register" method="get"></form>
	</div>

	
	
<script>
	var operForm = $("#operForm");
	
	$("button[data-oper='modify']").on("click", function(e){
		operForm.attr("action", "/board/modify.do").submit();
	});
	
	$("button[data-oper='remove']").on("click", function(e){
		operForm.attr("action", "/board/remove.do");
		operForm.submit();
	});
	
	$("button[data-oper='register']").on("click", function(e){
		operForm.attr("action", "/board/register.do");
		operForm.submit();
	});
	
</script>
	
</body>
</html>