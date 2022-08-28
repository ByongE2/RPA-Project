<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/CSS/main/main.css">
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
            <button class="leftmenu">공지사항</button>
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
                </div>
                
           	 <div class="login_area">
			<h1>Login area</h1>
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
			<!-- class="login_area" End-->
                
                
            </ul>
            <!--로그인-->
            <!--네비게이션 밑에 공백-->
            <div class="blank"></div>
		<!--네이게이션 끝-->
       
	</nav>
</div>	
</body>
</html>