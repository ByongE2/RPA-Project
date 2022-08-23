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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
		
		<form id="login_form" method="post">
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
			
			<c:if test = "${result == 0 }">
                <div class ="login_warn">사용자 ID 또는 비밀번호를 잘못 입력하셨습니다.</div>
            </c:if>
			
			<div class="find">
				<ul>
					<li><a href="javascript:void(0)" onclick="findId()">아아디 찾기</a></li>
					<li><a href="javascript:void(0)" onclick="findPw()">비밀번호 찾기</a></li>
				</ul>
			</div>
			
			<div class="login_button_wrap">
				<!-- <button type="submit"></button> -->
				<button type="button" class="login_button">로그인</button>
				<button type="button" class="register_button" onclick="location='/user/register'">회원가입</button>
			</div>
			<br>
			<div class="kakao">
				<!-- 카카오 로그인 -->
				<a class="p-2" href="https://kauth.kakao.com/oauth/authorize?client_id=413e8a35b4572f164e0f426232a72f19&redirect_uri=http://localhost:8080/user/kakaologin&response_type=code">
				<!-- <a class="p-2" href="/user/kakaologin" id="btn-kakao-login"> -->
				<!-- <a class="p-2" onclick="loginWithKakao();"> -->
				<!-- REST_API키 및 REDIRECT_URi는 본인걸로 수정 -->
				
					<img src="/resources/kakaoicon/kakao_login_medium_narrow.png" style="height:40px;">
			      		<!-- 이미지는 카카오 개발자센터에서 제공하는 login 이미지를 사용 -->
				</a>
				<!-- <input type="hidden" name="kakaoemail" id="kakaoemail" />
				<input type="hidden" name="kakaoname" id="kakaoname" />
 -->			</div>
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
		
		
		<%-- kakaoemail을 넘기기 위한 숨겨진 form --%>	
		<%--
		<form action="./kakaologin" method="post" name="lfrm" hidden>
			<input type="text" name="kakaoemail" id="kakaoemail" value="" />
		</form>
		--%>
		
		
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

<script type='text/javascript'>

	/* 로그인 버튼 클릭 메서드 */
	$(".login_button").click(function(){
		
	    /* alert("로그인 버튼 작동"); */
	    
		/* 로그인 메서드 서버 요청 */
        $("#login_form").attr("action", "/user/login");
        $("#login_form").submit();
    
	});
/* $(document).ready(function(){
    Kakao.init('2341e4170b6971da0753e52d72ba4fe2');
    Kakao.isInitialized();
});

function loginWithKakao() {
    Kakao.Auth.authorize({ 
    redirectUri: 'http://localhost:8080/user/kakaologin' 
    }); // 등록한 리다이렉트uri 입력
} */

/* Kakao.init('2341e4170b6971da0753e52d72ba4fe2');


$("#btn-kakao-login").on("click", function(){
    //1. 로그인 시도
    Kakao.Auth.login({
        success: function(authObj) {
         
          //2. 로그인 성공시, API 호출
          Kakao.API.request({
            url: '/v2/user/me',
            success: function(res) {
              console.log(res);
              var id = res.id;
			  scope : 'account_email';
			alert('로그인성공');
              location.href="/mainTEST";
              
        }
          })
          console.log(authObj);
          var token = authObj.access_token;
        },
        fail: function(err) {
          alert(JSON.stringify(err));
        }
      });
        
}) //
 */

</script>
<!-- 
  <script>
  
  $(function(){

		$("#btn-kakao-login").click(function(event){
			// a태그 기능 실행멈춤.
			event.preventDefault();
			// 카카오 로그인 실행시 오류메시지를 표시하는 경고창을 화면에 보이지 않게 한다.
			$("alert-kakao-login").addClass("d-none");
			// 사용자 키를 전달, 카카오 로그인 서비스 초기화.
			Kakao.init('2341e4170b6971da0753e52d72ba4fe2');
			// 카카오 로그인 서비스 실행하기 및 사용자 정보 가져오기.
			Kakao.Auth.login({
				success:function(auth){
					Kakao.API.request({
						url: '/v2/user/me',
						success: function(response){
							// 사용자 정보를 가져와서 폼에 추가.
							var account = response.kakao_account;
							
							$('#form-kakao-login input[name=email]').val(account.email);
							$('#form-kakao-login input[name=name]').val(account.profile.nickname);
							// 사용자 정보가 포함된 폼을 서버로 제출한다.
							document.querySelector('#form-kakao-login').submit();
						},
						fail: function(error){
							// 경고창에 에러메시지 표시
							$('alert-kakao-login').removeClass("d-none").text("카카오 로그인 처리 중 오류가 발생했습니다.")
						}
					}); // api request
				}, // success 결과.
				fail:function(error){
					// 경고창에 에러메시지 표시
					$('alert-kakao-login').removeClass("d-none").text("카카오 로그인 처리 중 오류가 발생했습니다.")
				}
			}); // 로그인 인증.
		}) // 클릭이벤트
	})// 카카오로그인 끝.
  
  //카카오로그인
	window.kakao.init("2341e4170b6971da0753e52d72ba4fe2");
  
  	function kakaoLogin(){
  		window.kakao.Auth.login({
  			scope:'profile,account_email',
  			success:function(authObj){
  				window.kakao.API.request({
  					url:'/v2/user/me',
  					success:res => {
  						const name = res.properties.nickname;
  						const email = res.kakao_account.email;
  						
  						console.log(name);
  						console.log(email);
  						
  						$('kakaoname').val(name);
  						$('kakaoeamil').val(email);
  						document.login_frm.submit();
  					}
  				});
  			}
  		});
  	}
 -->  
  <%--  function kakaoLogin() {

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
  });   */
</script>
 --%>
<script type="text/javascript">
  function findId(){
		var url="find_id_form";
		
		window.open(url, "_blank_1", "toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=500, height=500");
	}
  
  function findPw(){
	  var url="find_password_form";
	  
	  window.open(url, "_blank_1", "toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=500, height=500");
  }
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