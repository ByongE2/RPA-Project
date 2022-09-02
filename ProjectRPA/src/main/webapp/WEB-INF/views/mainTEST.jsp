<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="includes/allNav.jsp"></jsp:include>
<%-- 
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
			<img src="/resources/ptimg/2022081820210927_105642.jpg">
			<img src="C:\upload/test.jpg">
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
			<ul>
				<li>
					<a class="#" href="/goods/sportswear/list">상품 보기</a>
				</li>
			</ul>
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
		</div> 
		<!-- class="footer_nav" -->
		
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
		</div> 
		<!-- class="footer" -->	
	</div>
	<!-- class="wrap End -->
</div>
<!-- class="wrapper" End -->
 --%>

</body>
</html>