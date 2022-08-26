<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>          
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome</title>
<link rel="stylesheet" href="/resources/CSS/order.css">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
</head>
<body>

<div class="wrapper">
	<div class="wrap">
		<div class="top_gnb_area">
			<ul class="list">
				<c:if test = "${user == null}">	<!-- 로그인 x -->	
					<li >
						<a href="/user/login">로그인</a>
					</li>
					<li>
						<a href="/user/register">회원가입</a>
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
		<div class="top_area">
			<!-- 로고영역 -->
			<div class="logo_area">
				<a href="/main"><img src="/resources/goods/no Image.png"></a>
			</div>
			<div class="login_area">
			
				<!-- 로그인 하지 않은 상태 -->
				<c:if test = "${user == null }">
					<div class="login_button"><a href="/user/login">로그인</a></div>
					<span><a href="/user/register">회원가입</a></span>				
				</c:if>				
				
				<!-- 로그인한 상태 -->
				<c:if test="${ user != null }">
					<div class="login_success_area">
						<span>회원 : ${user.name}</span>
						<span>충전금액:< member 테이블 추가<fmt:formatNumber value="" pattern="\#,###.##"/></span>
						<span>포인트:< 테이블 추가<fmt:formatNumber value="" pattern="#,###" /></span>
						<a href="/user/logout">로그아웃</a>
					</div>
				</c:if>
				
			</div>
			<div class="clearfix"></div>			
		</div>
		<div class="content_area">
			
			<div class="content_subject"><span>장바구니</span></div>

			<div class="content_main">
				<!-- 회원 정보 -->
				<div class="member_info_div">
					<table class="table_text_align_center memberInfo_table">
						<tbody>
							<tr>
								<th style="width: 25%;">주문자</th>
								<td style="width: *">${userInfo.name} | ${userInfo.email}</td>
							</tr>
						</tbody>
					</table>
				</div>				
				
				<!-- 배송지 정보 -->
				<div class="addressInfo_div">
					<div class="addressInfo_button_div">
						<button class="address_btn address_btn_1" onclick="showAdress('1')" style="background-color: #3c3838;">상용자 정보 주소록</button>
						<button class="address_btn address_btn_2" onclick="showAdress('2')">직접 입력</button>
					</div>
					<div class="addressInfo_input_div_wrap">
						<div class="addressInfo_input_div addressInfo_input_div_1" style="display: block">
							<table>
								<colgroup>
									<col width="25%">
									<col width="*">
								</colgroup>
								<tbody>
									<tr>
										<th>이름</th>
										<td>
											${userInfo.name}
										</td>
									</tr>
									<tr>
										<th>주소</th>
										<td>
											${userInfo.address} ${userInfo.address2}<br>${userInfo.address3}
											<input class="selectAddress" value="T" type="hidden">
											<input class="addressee_input" value="${userInfo.name}" type="hidden">
											<input class="address1_input" type="hidden" value="${userInfo.address}">
											<input class="address2_input" type="hidden" value="${userInfo.address2}">
											<input class="address3_input" type="hidden" value="${userInfo.address3}">																					
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="addressInfo_input_div addressInfo_input_div_2">
							<table>
								<colgroup>
									<col width="25%">
									<col width="*">
								</colgroup>
								<tbody>
									<tr>
										<th>이름</th>
										<td>
											<input class="addressee_input">
										</td>
									</tr>
									<tr>
										<th>주소</th>
										<td>
											<input class="selectAddress" value="F" type="hidden">
											<input class="address1_input" readonly="readonly"> <a class="address_search_btn" onclick="execution_daum_address()">주소 찾기</a><br>
											<input class="address2_input" readonly="readonly"><br>
											<input class="address3_input" readonly="readonly">
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>				
				<!-- 상품 정보 -->
				<div class="orderGoods_div">
					<!-- 상품 종류 -->
					<div class="goods_kind_div">
						주문상품 <span class="goods_kind_div_kind"></span>종 <span class="goods_kind_div_count"></span>개
					</div>
					<!-- 상품 테이블 -->
					<table class="goods_subject_table">
						<colgroup>
							<col width="15%">
							<col width="45%">
							<col width="40%">
						</colgroup>
						<tbody>
							<tr>
								<th>이미지</th>
								<th>상품 정보</th>
								<th>판매가</th>
							</tr>
						</tbody>
					</table>
					<table class="goods_table">
						<colgroup>
							<col width="15%">
							<col width="45%">
							<col width="40%">
						</colgroup>					
						<tbody>
							<c:forEach items="${orderList}" var="ol">
								<tr>
									<td>
										<div class="image_wrap" 
											data-bookid="${ol.imageList[0].goods_swID}" 
											data-path="${ol.imageList[0].uploadPath}" 
											data-uuid="${ol.imageList[0].uuid}" 
											data-filename="${ol.imageList[0].fileName}">
											<img>
										</div>
									</td>
									<td>${ol.goods_swName}</td>
									<td class="goods_table_price_td">
										<fmt:formatNumber value="${ol.salePrice}" pattern="#,### 원" /> | 수량 ${ol.goods_sw_Count}개
										<br><fmt:formatNumber value="${ol.totalPrice}" pattern="#,### 원" />
										<br>[<fmt:formatNumber value="${ol.totalPoint}" pattern="#,### 원" />P]
										<input type="hidden" class="individual_bookPrice_input" value="${ol.bookPrice}">
										<input type="hidden" class="individual_salePrice_input" value="${ol.salePrice}">
										<input type="hidden" class="individual_bookCount_input" value="${ol.bookCount}">
										<input type="hidden" class="individual_totalPrice_input" value="${ol.salePrice * ol.bookCount}">
										<input type="hidden" class="individual_point_input" value="${ol.point}">
										<input type="hidden" class="individual_totalPoint_input" value="${ol.totalPoint}">
										<input type="hidden" class="individual_bookId_input" value="${ol.bookId}">
									</td>
								</tr>							
							</c:forEach>

						</tbody>
					</table>
				</div>		
						
				<!-- 포인트 정보 -->
				<div class="point_div">
					<div class="point_div_subject">포인트 사용</div>
					<table class="point_table">
						<colgroup>
							<col width="25%">
							<col width="*">
						</colgroup>
						<tbody>
							<tr>
								<th>포인트 사용</th>
								<td>
									${memberInfo.point} | <input class="order_point_input" value="0">원 
									<a class="order_point_input_btn order_point_input_btn_N" data-state="N">모두사용</a>
									<a class="order_point_input_btn order_point_input_btn_Y" data-state="Y" style="display: none;">사용취소</a>
									
								</td>
							</tr>
						</tbody>
					</table>
				</div>				
				<!-- 주문 종합 정보 -->
				<div class="total_info_div">
					<!-- 가격 종합 정보 -->
					<div class="total_info_price_div">
						<ul>
							<li>
								<span class="price_span_label">상품 금액</span>
								<span class="totalPrice_span">100000</span>원
							</li>
							<li>
								<span class="price_span_label">배송비</span>
								<span class="delivery_price_span">100000</span>원
							</li>
																					<li>
								<span class="price_span_label">할인금액</span>
								<span class="usePoint_span">100000</span>원
							</li>
							<li class="price_total_li">
								<strong class="price_span_label total_price_label">최종 결제 금액</strong>
								<strong class="strong_red">
									<span class="total_price_red finalTotalPrice_span">
										1500000
									</span>원
								</strong>
							</li>
							<li class="point_li">
								<span class="price_span_label">적립예정 포인트</span>
								<span class="totalPoint_span">7960원</span>
							</li>
						</ul>
					</div>
					<!-- 버튼 영역 -->
					<div class="total_info_btn_div">
						<a class="order_btn">결제하기</a>
					</div>
				</div>				
				
			</div>			

			<!-- 주문 요청 form -->
			<form class="order_form" action="/order" method="post">
				<!-- 주문자 회원번호 -->
				<input name="memberId" value="${memberInfo.memberId}" type="hidden">
				<!-- 주소록 & 받는이-->
				<input name="addressee" type="hidden">
				<input name="memberAddr1" type="hidden">
				<input name="memberAddr2" type="hidden">
				<input name="memberAddr3" type="hidden">
				<!-- 사용 포인트 -->
				<input name="usePoint" type="hidden">
				<!-- 상품 정보 -->
			</form>
			
		</div>
		<!-- content_area End-->
		
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
					<img src="/resources/goods/no Image.png">
				</div>
				<div class="footer_right">
					(주) RPA Health Club    대표이사 : OOO
					<br>
					사업자등록번호 : ooo-oo-ooooo
					<br>
					대표전화 : oooo-oooo(발신자 부담전화)
					<br>
					<br>
					COPYRIGHT(C) <strong>RPA.com</strong>	ALL RIGHTS RESERVED.
				</div>
				<div class="clearfix"></div>
			</div>
		</div> <!-- class="footer" -->		
		
	</div>	<!-- class="wrap" -->
</div>	<!-- class="wrapper" -->

<script>

</script>

</body>
</html>