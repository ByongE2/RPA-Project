<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>          
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome</title>
<link rel="stylesheet" href="/resources/CSS/swClientDetail.css">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
</head>
<body>

<div class="wrapper">
	<div class="wrap">
		
		
		<div class="content_area">
			<div class="line">
			</div>			
			<div class="content_top">
				<div class="ct_left_area">
					<div class="image_wrap" data-swid ="${swInfo.imageList[0].goods_swID}" data-path="${swInfo.imageList[0].uploadPath}" data-uuid="${swInfo.imageList[0].uuid}" data-filename="${swInfo.imageList[0].fileName}">
						<img>
					</div>				
				</div>
				<div class="ct_right_area">
					<div class="title">
						<h1>
							${swInfo.goods_swName}
						</h1>
					</div>
					<div class="line">
					</div>
					<div class="price">
						<div class="sale_price">정가 : <fmt:formatNumber value="${swInfo.goods_swPrice}" pattern="#,### 원" /></div>
						<div class="discount_price">
							판매가 : <span class="discount_price_number"><fmt:formatNumber value="${swInfo.goods_swPrice - (swInfo.goods_swPrice*swInfo.goods_swDiscount)}" pattern="#,### 원" /></span> 
							[<fmt:formatNumber value="${swInfo.goods_swDiscount*100}" pattern="###" />% 
							<fmt:formatNumber value="${swInfo.goods_swPrice*swInfo.goods_swDiscount}" pattern="#,### 원" /> 할인]
						</div>
						<div>
							적립 포인트 : <span class="point_span"></span>원
						</div>							
					</div>			
					<div class="line">
					</div>	
					<div class="button">						
						<div class="button_quantity">
							주문수량
							<input type="text" class="quantity_input" value="1">
							<span>
								<button class="plus_btn">+</button>
								<button class="minus_btn">-</button>
							</span>
						</div>
						<div class="button_set">
							<a class="btn_cart">장바구니 담기 버튼</a>
							<a class="btn_buy">바로구매 버튼</a>
						</div>
					</div>
				</div>
			</div>
			<div class="line">
			</div>				
			<div class="content_middle">
				<div class="book_content">
					상품 소개 :${swInfo.goods_swDetail }
				</div>
			</div>
			<div class="line">
			</div>				
			<div class="content_bottom">
				<div class="reply_subject">
					<h2>리뷰</h2>
				</div>
				
				<c:if test="${member != null}">
					<div class="reply_button_wrap">
						<button>리뷰 쓰기</button>
					</div>
				</c:if>		
				
				<div class="reply_not_div">
					
				</div>
				
			</div>
			<!-- 주문 form -->
			<form action="/order/${member.memberId}" method="get" class="order_form">
				<input type="hidden" name="orders[0].bookId" value="${swInfo.goods_swID}">
				<input type="hidden" name="orders[0].bookCount" value="">
			</form>	
		</div>
		
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
					<img src="#">
				</div>
				<div class="footer_right">
					(주) RPA    대표이사 : OOO
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
$(document).ready(function(){

	/* 이미지 삽입 */
	const bobj = $(".image_wrap");
	
	if(bobj.data("swid")){
		const uploadPath = bobj.data("path");
		const uuid = bobj.data("uuid");
		const fileName = bobj.data("filename");
		
		const fileCallPath = encodeURIComponent(uploadPath + "/s_" + uuid + "_" + fileName);
		
		bobj.find("img").attr('src', '/goods/sportswear/display?fileName=' + fileCallPath);
	} else {
		bobj.find("img").attr('src', '/resources/goods/no Image.png');
	}
});	

</script>


</body>
</html>