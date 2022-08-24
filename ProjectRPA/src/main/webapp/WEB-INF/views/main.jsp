<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" 
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" 
		crossorigin="anonymous">
</script>
<style type="text/css">
*{
	margin: 0;
	padding:0;
}
a{
	text-decoration: none;
}
/* 화면 전체 렙 */
.wrapper{
	width: 100%;
}
/* content 랩 */
.wrap{
	width : 1080px;
	margin: auto;
}
/* 홈페이지 기능 네비 */ 
.top_gnb_area{
	width: 100%;
    height: 50px;
    background-color: #f0f0f1;
    position:relative;    
}
.top_gnb_area .list{
	position: absolute;
    top: 0px;
    right: 0;
    
}
.top_gnb_area .list li{
	list-style: none;	
    float : left;
    padding: 13px 15px 0 10px;
    font-weight: 900;
    cursor: pointer;
}
/* 로고, 검색, 로그인 */
.top_area{
	width: 100%;
    height: 150px;
    /* background-color: #f7f0b9; */
}
/* 로고 영역 */
.logo_area{
	width: 25%;
	height: 100%;
	float:left;
}
.logo_area img{
	width: 100%;
    height: 100%;
}

/* 검색 박스 영역 */
.search_area{
	width: 50%;
	height: 100%;
	float:left;	
}
.search_wrap{
	width: 100%;
    height: 100%;
}
#searchForm{
	width: 100%;
    height: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
}
.search_input{
    display: flex;
    height: 30%;
    width: 80%;	
}
.search_input select{
	width: 20%;
    text-align: center;
    font-size: 15px;	
}
.search_input input{
    margin-left: 10px;
    width: 57%;	
    font-size: 18px;
    padding-left: 2%;
}
.search_btn{
	margin-left: 10px;
    width: 17%;
    border-radius: 14px;
    font-size: 17px;
    font-weight: 600;	
}	


/* 로그인 버튼 영역 */
.login_area{
	width: 25%;
	height: 100%;
	display: inline-block;	
	text-align: center;		
}
.login_button{
	height: 50%;
    background-color: #D4DFE6;
    margin-top: 30px;
    line-height: 77px;
    font-size: 40px;
    font-weight: 900;
    border-radius: 10px;
    cursor: pointer;	
}
.login_area>span{
	margin-top: 10px;
    font-weight: 900;
    display: inline-block;
}
.login_button{
	height : 50%;
	background-color: #D4DFE6;
	margin-top:30px;
}

/* 제품 목록 네비 */
.navi_bar_area {
  overflow: hidden;
  background-color: #5e6b9e;
}

.navi_bar_area a {
  float: left;
  font-size: 16px;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

.dropdown {
  float: left;
  overflow: hidden;
  margin-left: 10px;
}

.dropdown .dropbtn {
  font-size: 16px;
  font-weight: bold;  
  border: none;
  outline: none;
  color: white;
  padding: 14px 16px;
  background-color: inherit;
  font-family: inherit;
  margin: 0;
  width:140px;
}

.dropdown-content {
  display:none;
  position: absolute;
  background-color: #f9f9f9;
  width: 466px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content a {
  float: none;
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: inline-block;
  text-align: left;
  width: 80px;
}

.dropdown:hover .dropdown-content {
  display: block;
}

.navi_bar_area a:hover, .dropdown:hover .dropbtn {
  background-color: #475382;
}

.dropdown-content a:hover {
  background-color: #ddd;
}

/* 홈페이지 메인 제품 목록  */
.content_area{
	width: 100%;
    min-height: 1000px;
}

/* 로그인 성공 영역 */
.login_success_area{
	height: 62%;
    width: 80%;
    border: 2px solid #7474ad;
    border-radius: 15px;
    margin: 5% auto;
    padding-top: 5%;
}
.login_success_area>a{
    font-size: 15px;
    font-weight: 900;
    display: inline-block;
    margin-top: 5px;
    background: #e1e5e8;
    width: 82px;
    height: 22px;
    line-height: 22px;
    border-radius: 25px;
    color: #606267;    
}
.login_success_area>span{
	display : block;
	text-align: left;
    margin-left: 10%;
}

/* footer navai 영역 */
.footer_nav{
	width:100%;
	height:50px;
}
.footer_nav_container{
	width: 100%;
	height: 100%;
	background-color:#8EC0E4;
}
.footer_nav_container>ul{
	font-weight : bold;
	float:left;
	list-style:none;
	position:relative;
	padding-top:10px;
	line-height: 27px;
	font-family: dotum;
	margin-left: 10px;
}
.footer_nav_container>ul>li{
	display:inline;
	width: 45px;
	height: 19px;
	padding: 10px 9px 0 10px;
}
.footer_nav_container>ul>span{
	margin: 0 4px;
}
/* footer 영역 */
.footer{
	width:100%;
	height:130px;
	background-color:#D4DFE6;
	padding-bottom : 50px;
}
.footer_container{
	width: 100%;
	height: 100%;
	margin: auto;
}
.footer_left>img {
	width: 150%;
    height: 130px;
    margin-left: -20px;
    margin-top: -12px;
}
.footer_left{
	float :left;
	width: 170px;
	margin-left: 20px;
	margin-top : 30px;
	
}
.footer_right{
	float :left;
	width: 680px;
	margin-left: 70px;
	margin-top : 30px;
}


/* float 속성 해제 */
.clearfix{
	clear: both;
}

/* 슬라이드 */
.slick-prev{
	left: 160px;
    z-index: 1;
}
.slick-next{
	right: 160px;
    z-index: 1;
}
.slide_div img{
	margin: auto;
}
.slide_div_wrap{
	padding: 15px 0 15px 0;
    background: #e6e9f6;
}
.image_wrap img{
	max-width: 85%;
    height: auto;
    display: block;
	margin: auto;    
}

/* 상품 평점순 노출 관련 태그 */
.ls_wrap{
    margin: 30px 0 30px 0;
    padding: 0 10px 0 10px;
}
.ls_div_content{
	width: 80%;
    margin: auto;
    height: 275px;
    border: 1px solid #dadada;
}
.image_wrap{
	width: 80%;
    height: 60%;
    margin: auto;
    padding: 5% 0 5% 0;
    display: flex;
    align-items: center;    
}
.ls_category{
	text-align: center;
    font-size: 13px;
    color: #3e74ab;
}
.ls_rating{
	text-align: center;
    font-size: 13px;
    color: #e15b6e;
}
.ls_bookName{
	text-align: center;
    color: #333;
    font-size: 15px;
    font-weight: bold;
}
.ls_div_subject{
	font-weight: bold;
	font-size: 26px;
	padding-bottom: 10px;
}
.ls_div_content_prev{
    position: absolute;
    top: 40%;
    width: 40px;
    height: 30px;
    left: 27px;
    font-weight: bold;
    z-index: 1;
    opacity: 35%;
}
.ls_div_content_prev:hover{
   opacity: 80%;
}
.ls_div_content_next{
    position: absolute;
    top: 40%;
    width: 40px;
    height: 30px;
    right: 27px;
    font-weight: bold;
    z-index: 1;
    opacity: 35%;
}
.ls_div_content_next:hover{
   opacity: 80%;
}
</style> 

</head>
<body>

<div class="wrapper">
	<div class="wrap">
		<div class="top_gnb_area">
		<h1>gnb area</h1>
			<ul class="list">
				<c:if test = "${user == null}">	<!-- 로그인 x -->	
					<li >
						<a href="/user/login">로그인</a>
					</li>
					<li>
						<a href="/user/join">회원가입</a>
					</li>
				</c:if>
				<c:if test="${user != null }">	<!-- 로그인 o -->		
					<c:if test="${user.grade == 1 }">	<!-- 관리자 계정 -->
						<li><a href="/admin/main">관리자 페이지</a></li>
					</c:if>							
					<li>
						<a id="gnb_logout_button">로그아웃</a>
					</li>
					<li>
						마이룸
					</li>
					<li>
						<a href="/goods/sportswear/cart/${user.id}">장바구니</a>
					</li>
				</c:if>				
				<li>
					고객센터
				</li>			
			</ul>		
		</div> 
		<!--class="top_gnb_area End-->
		<div class="top_area">
			<div class="logo_area">
				<a href="/main"><img src="https://i.ibb.co/5vg7b03/RPA.jpg"></a>
			</div>
			<div class="search_area">
			<h1>Search area</h1>
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
			<div class="clearfix"></div>			
		</div>
		<!-- class="top_area End -->
		<div class="navi_bar_area">
		<h1>navi area</h1>
		</div>
		<!-- navi_bar_area -->
		<div class="content_area">
		<h1>content area</h1>
		</div>
		<!-- class="content_area" End -->
				<!-- Footer 영역 -->
		<div class="footer_nav">
			<div class="footer_nav_container">
				<ul>
					<li>회사소개</li>
					<span class="line">|</span>
					<li>이용약관</li>
					<span class="line">|</span>
					<li>고객센터</li>
					<span class="line">|</span>
					<li>광고문의</li>
					<span class="line">|</span>
					<li>채용정보</li>
					<span class="line">|</span>
				</ul>
			</div>
		</div> <!-- class="footer_nav" -->
		
		<div class="footer">
			<div class="footer_container">
				
				<div class="footer_left">
					<a href="/main"><img src="https://i.ibb.co/5vg7b03/RPA.jpg"></a>
				</div>
				<div class="footer_right">
					(주) RPA Fiteness
					<br>
					사업자등록번호 : ooo-oo-ooooo
					<br>
					대표전화 : oooo-oooo
					<br>
					<br>
					COPYRIGHT(C) <strong>rpa.com</strong>	ALL RIGHTS RESERVED.
				</div>
				<div class="clearfix"></div>
			</div>
		</div> <!-- class="footer" -->	
	</div>
	<!-- class="wrap End -->
</div>
<!-- class="wrapper" End -->

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