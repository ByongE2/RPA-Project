<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>          
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome</title>
<link rel="stylesheet" href="/resources/CSS/goods/sportswear/swClientDetail.css">
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
			<!-- 장바구니 리스트 -->
			<div class="content_middle_section"></div>
			<!-- 장바구니 가격 합계 -->
			<!-- cartInfo -->
			<div class="content_totalCount_section">
				<!-- 체크박스 전체 여부 -->
				<div class="all_check_input_div">
					<input type="checkbox" class="all_check_input input_size_20" checked="checked"><span class="all_chcek_span">전체선택</span>
				</div>				
				
				<table class="subject_table">
					<caption>표 제목 부분</caption>
					<tbody>

						<tr>
							<th class="td_width_1"></th>
							<th class="td_width_2"></th>
							<th class="td_width_3">상품명</th>
							<th class="td_width_4">가격</th>
							<th class="td_width_4">수량</th>
							<th class="td_width_4">합계</th>
							<th class="td_width_4">삭제</th>
						</tr>
					</tbody>
				</table>
				<!-- 표 내용 -->
				<table class="cart_table">
					<caption>표 내용 부분</caption>
					<tbody>
						<c:forEach items="${cartInfo}" var="ci">
							<tr>
								<td class="td_width_1 cart_info_td">
									<input type="checkbox" class="individual_cart_checkbox input_size_20" checked="checked">
									<input type="hidden" class="individual_goods_swPrice_input" value="${ci.goods_swPrice}">
									<input type="hidden" class="individual_salePrice_input" value="${ci.salePrice}">
									<input type="hidden" class="individual_goods_sw_Count_input" value="${ci.goods_sw_Count}">
									<input type="hidden" class="individual_totalPrice_input" value="${ci.salePrice * ci.goods_sw_Count}">
									<input type="hidden" class="individual_point_input" value="포인트 추가">
									<input type="hidden" class="individual_totalPoint_input" value="총 포인트 추가">
									<input type="hidden" class="individual_goods_swId_input" value="${ci.goods_swID}">								
								</td>
								<td class="td_width_2">
									<div class="image_wrap" 
										data-swid="${ci.imageList[0].goods_swID}" 
										data-path="${ci.imageList[0].uploadPath}" 
										data-uuid="${ci.imageList[0].uuid}" 
										data-filename="${ci.imageList[0].fileName}">
										<img>
									</div>								
								</td>
								<td class="td_width_3">${ci.goods_swName}</td>
								<td class="td_width_4 price_td">
									<del>정가 : <fmt:formatNumber value="${ci.goods_swPrice}" pattern="#,### 원" /></del><br>
									판매가 : <span class="red_color"><fmt:formatNumber value="${ci.salePrice}" pattern="#,### 원" /></span><br>
									마일리지 : <span class="green_color"><fmt:formatNumber value="18" pattern="#,###" /></span>
								</td>
								<td class="td_width_4 table_text_align_center">
									<div class="table_text_align_center quantity_div">
										<input type="text" value="${ci.goods_sw_Count}" class="quantity_input">	
										<button class="quantity_btn plus_btn">+</button>
										<button class="quantity_btn minus_btn">-</button>
									</div>
									<a class="quantity_modify_btn" data-cartId="${ci.goods_cartId}">변경</a>
								</td>
								<td class="td_width_4 table_text_align_center">
									<fmt:formatNumber value="${ci.salePrice * ci.goods_sw_Count}" pattern="#,### 원" />
								</td>
								<td class="td_width_4 table_text_align_center">
									<button class="delete_btn" data-cartid="${ci.goods_cartId}">삭제</button>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<table class="list_table">
				</table>	


				

			<!-- 가격 종합 -->
			<div class="content_total_section">
				<div class="total_wrap">
					<table>
						<tr>
							<td>
								<table>
									<tr>
										<td>총 상품 가격</td>
										<td><span class="totalPrice_span">70000</span> 원</td>
									</tr>
									<tr>
										<td>배송비</td>
										<td><span class="delivery_price">3000</span>원</td>
									</tr>
									<tr>
										<td>총 주문 상품수</td>
										<td><span class="totalKind_span"></span>종류 <span
											class="totalCount_span"></span>개</td>
									</tr>
								</table>
							</td>
							<td>
								<table>
									<tr>
										<td></td>
										<td></td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
					<div class="boundary_div">구분선</div>
					<table>
						<tr>
							<td>
								<table>
									<tbody>
										<tr>
											<td><strong>총 결제 예상 금액</strong></td>
											<td><span class="finalTotalPrice_span">70000</span> 원</td>
										</tr>
									</tbody>
								</table>
							</td>
							<td>
								<table>
									<tbody>
										<tr>
											<td><strong>총 적립 예상 마일리지</strong></td>
											<td><span class="totalPoint_span">70000</span> 원</td>
										</tr>
									</tbody>
								</table>
							</td>
						</tr>
					</table>
				</div>
			</div> <!-- 가격종합 끝-->
			<!-- 구매 버튼 영역 -->
			<div class="content_btn_section">
				<a class="order_btn">주문하기</a>
			</div>
			<!-- 수량 조정 form -->
			<form action="/goods/sportswear/cart/update" method="post" class="quantity_update_form">
				<input type="hidden" name="goods_cartId" class="update_cartId">
				<input type="hidden" name="goods_sw_Count" class="update_goods_sw_Count">
				<input type="hidden" name="id" value="${user.id}">
			</form>	
			
			<!-- 삭제 form -->
			<form action="/goods/sportswear/cart/delete" method="post" class="quantity_delete_form">
				<input type="hidden" name="goods_cartId" class="delete_cartId">
				<input type="hidden" name="id" value="${user.id}">
			</form>		
			<!-- 주문 form -->
			<form action="/order/${user.id}" method="get" class="order_form">
			
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

$(document).ready(function(){
	
	/* 종합 정보 섹션 정보 삽입 */
	setTotalInfo();	

		/* 이미지 삽입 */
		$(".image_wrap").each(function(i, obj){
	
	const bobj = $(obj);
	
		if(bobj.data("swid")){
			const uploadPath = bobj.data("path");
			const uuid = bobj.data("uuid");
			const fileName = bobj.data("filename");
			
			const fileCallPath = encodeURIComponent(uploadPath + "/s_" + uuid + "_" + fileName);
			
			$(this).find("img").attr('src', '/goods/sportswear/display?fileName=' + fileCallPath);
		} else {
			$(this).find("img").attr('src', '/resources/goods/no Image.png');
		}
	
	});

}); //$(document).ready(function()

/* 체크여부에따른 종합 정보 변화 */
$(".individual_cart_checkbox").on("change", function(){
	/* 총 주문 정보 세팅(배송비, 총 가격, 마일리지, 물품 수, 종류) */
	setTotalInfo($(".cart_info_td"));
});

/* 체크박스 전체 선택 */
$(".all_check_input").on("click", function(){

	// 체크박스 체크/해제  (체크=전체선택, 체크해제=전체선택 해제)
	if($(".all_check_input").prop("checked")){	//prop() : 인자가 하나면, 인자 속성 값인 property를 가져옴. >>> true 반환
		$(".individual_cart_checkbox").attr("checked", true);  //attr() : 똑같이 속성 값 가져오지만, 문자열의 형태로 가져옴. >>> 'checked'를 반환
	} else{
		$(".individual_cart_checkbox").attr("checked", false); //attr() : 인자가 2개이면 첫번째 인자의 이름을 가진 속성의 값(checked)를 두번째 인자값(true false)로 변경
	}

	// 총 주문 정보 세팅(배송비, 총 가격, 마일리지, 물품 수, 종류) 
	($(".cart_info_td"));	

});

/* 총 주문 정보 세팅(배송비, 총 가격, 마일리지, 물품 수, 종류) */
function setTotalInfo(){
	let totalPrice = 0;				// 총 가격
	let totalCount = 0;				// 총 갯수
	let totalKind = 0;				// 총 종류
	let totalPoint = 0;				// 총 마일리지
	let deliveryPrice = 0;			// 배송비
	let finalTotalPrice = 0; 		// 최종 가격(총 가격 + 배송비)
	
	//체크 여부에 따라 데이터 변환.
	$(".cart_info_td").each(function(index, element){
		// is() 메서드 : 해당 메서드를 호출하는 객체가 is() 메서드의 인자로 지정한 선택자를 가지고 있으면 true를 반환
		if($(element).find(".individual_cart_checkbox").is(":checked") === true){	//체크여부
			// 총 가격
			totalPrice += parseInt($(element).find(".individual_totalPrice_input").val());
			// 총 갯수
			totalCount += parseInt($(element).find(".individual_goods_sw_Count_input").val());
			// 총 종류
			totalKind += 1;
			// 총 마일리지
			totalPoint += parseInt($(element).find(".individual_totalPoint_input").val());			
		}
	});
	
	/* 배송비 */
	if(totalPrice >= 30000){
		deliveryPrice = 0;
	} else if(totalPrice == 0){
		deliveryPrice = 0;
	} else {
		deliveryPrice = 3000;	//3만원 이상 무료, 미만은 3000원으로 하드 코딩.
	}
	/*최종 가격(총 가격 + 배송비) */	
	finalTotalPrice = totalPrice + deliveryPrice;
	
	/* ※ 세자리 컴마 Javscript Number 객체의 toLocaleString() */
	
	// 총 가격
	$(".totalPrice_span").text(totalPrice.toLocaleString());
	// 총 갯수
	$(".totalCount_span").text(totalCount);
	// 총 종류
	$(".totalKind_span").text(totalKind);
	// 총 마일리지
	$(".totalPoint_span").text(totalPoint.toLocaleString());
	// 배송비
	$(".delivery_price").text(deliveryPrice);	
	// 최종 가격(총 가격 + 배송비)
	$(".finalTotalPrice_span").text(finalTotalPrice.toLocaleString());		
}//function setTotalInfo()

/* 수량버튼 */
$(".plus_btn").on("click", function(){
	let quantity = $(this).parent("div").find("input").val();
	$(this).parent("div").find("input").val(++quantity);
});
$(".minus_btn").on("click", function(){
	let quantity = $(this).parent("div").find("input").val();
	if(quantity > 1){
		$(this).parent("div").find("input").val(--quantity);		
	}
}); // 수량버튼 끝

/* 수량 수정 버튼 */
$(".quantity_modify_btn").on("click", function(){
	let cartId = $(this).data("cartid");
	let goods_sw_Count = $(this).parent("td").find("input").val();
	$(".update_cartId").val(cartId);
	$(".update_goods_sw_Count").val(goods_sw_Count);
	$(".quantity_update_form").submit();
	
}); //수량 수정 버튼 끝

/* 장바구니 삭제 버튼 */
$(".delete_btn").on("click", function(e){
	e.preventDefault();
	const cartId = $(this).data("cartid");
	$(".delete_cartId").val(cartId);
	$(".quantity_delete_form").submit();
}); //장바구니 삭제 버튼 끝

/* 주문 페이지 이동 */	
$(".order_btn").on("click", function(){
	
	let form_contents =''; //<input>태그 문자열 값 동적 생성 위해
	let orderNumber = 0; //<input>의 name값에 index값을 주기위해 index값 역할 하는 변수(ex: order[0~])
	
	$(".cart_info_td").each(function(index, element){
		
		if($(element).find(".individual_cart_checkbox").is(":checked") === true){	// 체크여부(체크된 상품만 <input> 태그로 감싸도록)
			
			let goods_swId = $(element).find(".individual_goods_swId_input").val();
			let goods_sw_Count = $(element).find(".individual_goods_sw_Count_input").val();
			
			let goods_swID_input = "<input name='orders[" + orderNumber + "].goods_swId' type='hidden' value='" + goods_swId + "'>";
			form_contents += goods_swID_input;
			
			let goods_sw_Count_input = "<input name='orders[" + orderNumber + "].goods_sw_Count' type='hidden' value='" + goods_sw_Count + "'>";
			form_contents += goods_sw_Count_input;
			
			orderNumber += 1; //다음 객체 접근할 때 index +1
			
		}
	});	//주문 페이지 이동 끝

	$(".order_form").html(form_contents); //form_contents의 <input>태그를 주문페이지이동<form>태그 내부에 추가
	$(".order_form").submit();
	
});

</script>

</body>
</html>