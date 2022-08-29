<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/CSS/main/main.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js" 
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" 
		crossorigin="anonymous">
</script>
</head>
<body>
<div>
<nav>
        <!--뒤에 이미지-->
        <div class="backgroundimg">
            <img class="backgroundimg-one" src="https://i.ibb.co/PCfxG2d/image.png">
        </div>
        
        <!--뒤에 이미지 끝-->
        <!--사이드 메뉴-->
        <ul class="sidemenu">
            <button class="leftmenu" onclick="location.href='/main/map'">오시는길</button>
            <button class="leftmenu" onclick="location.href='/notice/Noticelist'">공지사항</button>
            <button class="leftmenu">1:1 문의</button>
        </ul>
        <!--사이드 메뉴 끝-->
        <!--로고-->
        <div class="log">
            <a href="/main/main">
                <img class="logim" src="https://i.ibb.co/5vg7b03/RPA.jpg">
            </a>
        </div>
        
        <!--로고 끝-->

        <!--네이게이션-->
        
            <ul class="navigtion">
                <!--간격-->
                <div class="navigtionmain">
                    <li class="menu"><a href="/main/Facility">시설소개</a> </li>
                    <li class="menu"><a href="/main/instructor">강사소개 </a></li>
                    <li class="menu"><a href="/ptclient/clientlist">pt예약</a></li>
                    <li class="menu"><a href="/goods/sportswear/list">Goods</a></li>
                    <li>
                    	<div class="login_area">
							<!-- 로그인 하지 않은 상태 -->
							<c:if test = "${user == null }">
								<div class="login_button"><a href="/user/login">Login</a></div>
								<span><a href="/user/join">Register</a></span>				
							</c:if>				
							<!-- 로그인한 상태 -->
							<c:if test="${ user != null }">
								<div class="login_success_area">
									<span>회원 : ${user.name}</span>
									<span>충전금액 : <fmt:formatNumber value="${user.money }" pattern="\#,###.##"/></span>
									<span>포인트 : <fmt:formatNumber value="${user.point }" pattern="#,###" /></span>
									<a id="login_area_logout_button">로그아웃2</a>
								</div>
							</c:if>
						</div>
					</li>	
			<!-- class="login_area" End-->
                </div>
                
           	 
                
                
            </ul>
            <!--로그인-->
            <!--네비게이션 밑에 공백-->
            <div class="blank"></div>
		<!--네이게이션 끝-->
       
	</nav>
</div>	
</body>
<script>
/* gnb_area 로그아웃 버튼 작동 */
$("#login_area_logout_button").click(function(){
    //alert("버튼 작동");
    $.ajax({
        type:"POST",
        url:"/user/logout",
        success:function(data){
            alert("로그아웃 성공");
            document.location.reload(); // 새로고침해야 세션변화 반영     
        } 
    }); // ajax 
}); // $("#gnb_logout_button").click(function()
</script>
</html>