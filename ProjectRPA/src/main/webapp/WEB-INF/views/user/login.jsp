<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
</head>
<body>
		<div class="logo_wrap">
			<span>Login</span>
		</div>
		
		<form id="login_form" method="post">
		<c:if test="${user == null}">
			<div>
				<div class="id_input_box">
				<label for=id>아이디 : </label>
				<input type="text" id="id_input" name="id">
				</div>
			</div>
			<div>
				<div class="pw_input_box">
				<label for=id>비밀번호 : </label>
				<input type="password" id="pw_iput" name="pw">
				</div>
			</div>
			<div class="login_button_wrap">
				<!-- <button type="submit"></button> -->
				<input type="button" class="login_button" value="로그인">
				<input type="button" value="회원가입">
			</div>	
		</c:if>
		<c:if test="${user != null }">
			<div>
				<p>${user.id}님 환영 합니다.</p>
				<button id="logoutBtn" type="button">로그아웃</button>
			</div>
		</c:if>
		<c:if test="${msg == false}">
			<p style="color: red;">로그인 실패! 아이디와 비밀번호 확인해주세요.</p>
		</c:if>		
		</form>		
		

<script type="text/javascript">

$('.login_button').click(function() {
	$("#login_form").attr("action","/user/login");
	$("#login_form").submit();
});
</script>


</body>
</html>