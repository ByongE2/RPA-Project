<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/CSS/nav.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  
</head>
<body>

<header>
        <div id="Logo">
            <a href="../mainTEST">RPA GYM</a>
        </div>
    
    
<nav id="nav">
    <div id="menu1">
          <ul class="main">
            <li class="title"><a href="#">시설소개</a>
                  <ul class="sub">
                    <li class="subtitle"><a href="#">시험메뉴</a></li>
                    <li class="subtitle"><a href="#">시험메뉴</a></li>
                  </ul>
            </li>

            <li class="title"><a href="#">강사소개</a>
                <ul class="sub">
                  <li class="subtitle"><a href="#">시험메뉴</a></li>
                  <li class="subtitle"><a href="#">시험메뉴</a></li>
                </ul>
            </li>
            
            <li class="title"><a href="/ptclient/clientlist">PT예약</a>
                <ul class="sub">
                  <li class="subtitle"><a href="#">시험메뉴</a></li>
                  <li class="subtitle"><a href="#">시험메뉴</a></li>
                </ul>
            </li>
            
            <li class="title"><a href="#">이용권</a>
                <ul class="sub">
                  <li class="subtitle"><a href="#">시험메뉴</a></li>
                  <li class="subtitle"><a href="#">시험메뉴</a></li>
                </ul>
            </li>
            
            <li class="title"><a href="/ptproduct/">상 품</a>
                <ul class="sub">
                  <li class="subtitle"><a href="#">시험메뉴</a></li>
                  <li class="subtitle"><a href="#">시험메뉴</a></li>
                  <li class="subtitle"><a href="#">시험메뉴</a></li>
                </ul>
            </li>
            
            <li class="title"><a href="#">커뮤니티</a>
                <ul class="sub">
                  <li class="subtitle"><a href="#">시험메뉴</a></li>
                  <li class="subtitle"><a href="#">시험메뉴</a></li>
                </ul>
            </li>
        </ul>
    </div>
</nav>

<nav id="right_nav">
    <div class="right_menu">
        <ul class="right">
            <li><a href="/ptclient/basket">장바구니</a></li>
            <li><c:if test="${user == null}"><a href="/user/login">로그인</a></c:if></li>
            <li><c:if test="${user != null}"><a href="/user/logout">로그아웃</a></c:if></li>
            <li><c:if test="${user != null}"><p>${user.id}님 안녕하세요.</p></c:if></li>
        </ul>
    </div>
</nav>
</header>
<hr width="1500px">

<div id="side">
	    <li><a href="#">오시는길</a></li>
	    <li><a href="#">공지사항</a></li>
	    <li><a href="#">고객센터</a></li>
	    <li><a href="#">1:1 문 의</a></li>
</div>

<!-- <div id="rightbar">
		<li><a href="/ptclient/basket">장바구니</a></li>
</div> -->

</body>
</html>