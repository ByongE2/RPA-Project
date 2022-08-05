<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/CSS/nav.css">
<!-- <style type="text/css">
* {
         margin: 0;
         padding: 0;
     }

     body {
         width: 100%; height: 100%; background:#333
         
     }

     header{
     width: 1500px; height: 90px; margin: auto; display: block; 
     /* background-color: aqua; */
     
     }

     #Logo{
     width:130px; height: 76px; margin:25px 10px 10px 10px; float: left; background-color:#b9e4b9;
     }

     #nav{
         width: 900px;height: 30px;margin: 50px 0 0 0;float: left;
     }

     #menu1{
         
         height: 50px;
     }

     #menu1 ul li {
         list-style: none; font-family: "Arial"; font-weight: bold; margin:0 auto;
     }

     #menu1 .main .title {
         float: left; padding: 0 30px;
     }

     #menu1 .main .title>a{
         text-decoration: none; color: rgb(236, 227, 227); padding: 9px;
         display: inline-block;
         border: 1px solid;
         border-radius: 10%;
         background: rgb(113, 109, 109);
         cursor: pointer;
     }

     #menu1 .main .title>a:hover{color: rgb(92, 233, 92);}

     #menu1 .main .subtitle {
         width: 70px;
         height: 50px;
         line-height: 50px;
         text-align: center;
         background: rgb(113, 109, 109);
         padding: 0 30px;
         position: relative;
         border: 1px;
         border-radius: 5%;
         list-style: none;
         text-decoration: none; color: rgb(236, 227, 227); padding: 8px;
         cursor: pointer;
     }

     #menu1 .main>li:hover .sub {
         display: block;
     }
     
     #menu1 .main>li a {
         display: block;
     }

     #menu1 .main .subtitle a:hover {
         color: #fff;
     }

     #menu1 .main .sub {
         left: 0 1;
         position: absolute;
         display: none;
     }

     #menu1 .main .sub li {
         background: #f5eff5;
     }

     #menu1 .main .sub li a:hover {
         background: #b9e4b9;
         
     }

     #right_nav {
         width: 400px;
         height: 50px;
         margin: 50px 0 0 0; float: right;
     }

     #right_nav .right {
         font-family: "Arial"; font-weight: bold; list-style: none; margin:0 auto;
     }

     #right_nav .right li {
         float: left; padding: 0 60px;
     }

     #right_nav .right li a {
         text-decoration: none; color: rgb(236, 227, 227); padding: 9px;
         display: inline-block;
         border: 1px solid;
         border-radius: 10%;
         background: rgb(113, 109, 109);
         cursor: pointer;
     }

     #right_nav .right li a:hover {
         color: rgb(92, 233, 92);
     }

     #side{
     display: block;
     list-style: none;
     margin-top: 20%;
     margin-left: 30PX;
     width: 150px;
     height: 200PX;
     position:fixed;
     }

     #side>li{
         padding: 10px;
         float: left;
         font-family: "Arial";font-weight: bold;
     }

     #side>li>a{
         text-decoration: none; color: rgb(236, 227, 227); padding: 9px;
         display: inline-block;
         border: 1px solid;
         border-radius: 10%;
         background: rgb(113, 109, 109);
         cursor: pointer;
     }

     #side>li>a:hover{
         color: rgb(92, 233, 92);  
     }

     #rightbar{
         list-style: none;
         float: right;
         position: fixed;
         height: 50px;
         text-align: right;
         width: 120px;
         right: 20px;
         display: block;
     }

     #rightbar>li{
         padding: 10px;
         float: left;
         font-family: "Arial";font-weight: bold;
     }

     #rightbar>li>a{
         text-decoration: none; color: rgb(236, 227, 227); padding: 9px;
         display: inline-block;
         border: 1px solid;
         border-radius: 10%;
         background: rgb(113, 109, 109);
         cursor: pointer;
     }

     #rightbar>li>a:hover{
         color: rgb(92, 233, 92);
     }
</style> -->
</head>
<body>

<header>
        <div id="Logo">
            <img src="#" >
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
            
            <li class="title"><a href="#">PT예약</a>
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
            
            <li class="title"><a href="#">상 품</a>
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
            <li><a href="#">전체보기</a></li>
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

<div id="rightbar">
		<li><a href="#">장바구니</a></li>
</div>

</body>
</html>