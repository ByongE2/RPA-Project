<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<!-- <link rel="stylesheet" href="/resources/css/member/login.css"> -->
<style type="text/css">
*{
   margin: 0;
   padding:0;
}

/* 화면 전체 렙 */
.wrapper{
   width: 100%;   
}

/* content 랩 */
.wrap{
   width : 800px;
   margin: auto;
}

/* 페이지 로고 */
.logo_wrap{
   text-align: center;   
   margin: 150px 0;   
}
.logo_wrap>span{
   font-size : 50px;
   font-weight: 900;
}


/* 로그인 area */
.id_input_box{
   border: 1px solid black;
   height:31px;
   padding: 10px 14px;   
   display: block;
   width : 80%;
   margin : auto;   
}
.id_input{
   width:100%;
   height:100%;
   border:none;
   font-size:28px;
}


.pw_wrap{
   margin-top: 40px;
}
.pw_input_box{
   border: 1px solid black;
   height:31px;
   padding: 10px 14px;   
   display: block;
   width : 80%;
   margin : auto;   
}
.pw_iput{
   width:100%;
   height:100%;
   border:none;
   font-size:28px;
}


.login_button_wrap{
   margin-top: 40px;
   text-align: center;
}
.login_button{
   width: 84%;
    height: 80px;
    background-color: #6AAFE6;
    font-size: 40px;
    font-weight: 900;
    color: white;
    margin : auto;
}

/* 로그인 실패시 경고글 */
.login_warn{
   margin-top: 30px;
    text-align: center;
    color : red;
}

/* float 속성 해제 */
.clearfix{
   clear: both;
}
</style>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
</head>
<body>

<div class="wrapper">
   
   <div class="wrap">
      <form id="login_form" method="post">
         <div class="logo_wrap">
            <span>Login</span>
         </div>
         <div class="login_wrap"> 
            <div class="id_wrap">
                  <div class="id_input_box">
                  <input class="id_input" name="id">
               </div>
            </div>
            <div class="pw_wrap">
               <div class="pw_input_box">
                  <input class="pw_iput" name="pw">
               </div>
            </div>
            
            <c:if test = "${result == 0 }">
               <div class = "login_warn">ID 또는 비밀번호를 잘못 입력하셨습니다.</div>
            </c:if>
            
            <div class="login_button_wrap">
               <input type="button" class="login_button" value="Login">
            </div>         
         </div>
      </form>
      
   </div>

</div>

<script>
   /** 로그인 버튼 클릭*/
   $(".login_button").click(function(){
      
      /* 로그인 메서드 서버 요청 */
      $("#login_form").attr("action", "/user/login");
      $("#login_form").submit();
   });//$(".login_button").click(function()
</script>

</body>
</html>