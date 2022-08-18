<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link  rel="stylesheet" href="/resources/CSS/login.css">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
</head>
<body>
<div class="wrapper">
	<div class="content">
		<div class="logo_wrap">
			<span><a href="/mainTEST">Login</a></span>
		</div>
		
		<form id="login_form" method="post" action="/user/login">
		<c:if test="${user == null}">
			<div>
				<h3 class="title">
					<label for=id>아이디 </label>
				</h3>
				<input type="text" id="id_input" name="id" class="p">
			</div>
			
			<div>
				<h3 class="title">
					<label for=id>비밀번호 </label>
				</h3>
				<input type="password" id="pw_iput" name="pw" class="p">
			</div>
			<br>
			
			<div class="find">
				<ul>
					<li><a href="#">아아디 찾기</a></li>
					<li><a href="#">비밀번호 찾기</a></li>
				</ul>
			</div>
			
			<div class="login_button_wrap">
				<!-- <button type="submit"></button> -->
				<button type="submit" class="login_button">로그인</button>
				<button type="button" class="register_button">회원가입</button>
			</div>
			<br>
			<div class="kakao">
				<!-- 카카오 로그인 -->
				<a class="p-2" onclick="kakaoLogin();">
				<!-- REST_API키 및 REDIRECT_URi는 본인걸로 수정 -->
				
					<img src="/resources/kakaoicon/kakao_login_medium_narrow.png" style="height:40px;">
			      		<!-- 이미지는 카카오 개발자센터에서 제공하는 login 이미지를 사용 -->
				</a>
				<!-- <button type="button">카카오톡 로그인</button> -->
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
		
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
  <script>
  //카카오로그인
  function kakaoLogin() {

    $.ajax({
        url: '/user/getkakao',
        type: 'get',
        async: false,
        dataType: 'text',
        success: function (res) {
            location.href = res;
        }
    });

  }

  $(document).ready(function() {

      var kakaoInfo = '${kakaoInfo}';

      if(kakaoInfo != ""){
          var data = JSON.parse(kakaoInfo);

          alert("카카오로그인 성공 \n accessToken : " + data['accessToken']);
          alert(
          "user : \n" + "email : "
          + data['email']  
          + "\n nickname : " 
          + data['nickname']);
      }
  });  
</script>

<script type="text/javascript">

$(document).ready(function(){
	$("#logoutBtn").on("click", function(){
		location.href="/logout";
	});
	
});
/* $('.login_button').click(function() {
	$("#login_form").attr("action","/user/login");
	$("#login_form").submit();
}); */
</script>
</div>
</div>
</body>
</html>