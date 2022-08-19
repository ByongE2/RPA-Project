<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
	
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
	
<!-- 아임포트 -->	
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<!-- include summernote css/js-->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css"
	rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>

<!-- include summernote-ko-KR -->
<script src="/resources/js/summernote-ko-KR.js"></script>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>클라이언트 상품 보기페이지</h1>

<div>
	<label>판매자</label><input name="pt_no" readonly="readonly" value="${clinet_no.pt_name}">
</div>

<script type="text/javascript">
	function basketingchange(){
		const btnelement = document.getElementById('basketing');
		const htmlown = '<button id="basketed" onclick="basketedchange()">장바구니담김</button>';
		alert("장바구니에 담았습니다.");
		//컨트롤러 넘겨주는 과정 수정하기
		location.href="ptclient/basketinsert?"
				
		btnelement.innerHTML=htmlown;
	}
</script>

<script type="text/javascript">
	function basketedchange(){
		alert("이미 담겨있습니다");
	}
</script>

<button id="basketing"  onclick="basketingchange()">장바구니</button>

<script type="text/javascript">
function iamport(){
	//가맹점 식별코드
	const title=${clinet_no.PT_title};
	var price= ${clinet_no.PT_Price};
	
	IMP.init('imp56221238');
	IMP.request_pay({
	    pg : 'kcp',
	    pay_method : 'card',
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : title , //결제창에서 보여질 이름
	    amount :price, //실제 결제되는 가격
	    buyer_email : 'iamport@siot.do',
	    buyer_name :"kkao45617",
	    buyer_tel : '010-1234-5678',
	    buyer_addr : '서울 강남구 도곡동',
	    buyer_postcode : '123-456'
	}, function(rsp) {
		console.log(rsp);
	    if ( rsp.success ) {
	    	var msg = '결제가 완료되었습니다.';
	        msg += '고유ID : ' + rsp.imp_uid;
	        msg += '상점 거래ID : ' + rsp.merchant_uid;
	        msg += '결제 금액 : ' + rsp.paid_amount;
	        msg += '카드 승인번호 : ' + rsp.apply_num;
	    } else {
	    	 var msg = '결제에 실패하였습니다.';
	         msg += '에러내용 : ' + rsp.error_msg;
	    }
	    alert(msg);
	});
}
</script>

<button onclick="iamport()">구매하기</button>



<div>
	<label>상품내용</label>
		<div> ${clinet_no.PT_content}</div>
</div>
<div>
	<label>등록 아이디</label><input name="PT_id" readonly="readonly" value="${clinet_no.PT_id}">
</div>
<div>
	<label>상품 상태</label><input name="PT_State" readonly="readonly" value="${clinet_no.PT_State}">
</div>
<div>
	<label>상품 제목</label><input name="PT_title" readonly="readonly" value="${clinet_no.PT_title}">
</div>
<div>
	<label>상품 가격</label><input name="PT_price" readonly="readonly" value="${clinet_no.PT_Price}">
</div>
<div>
	<label>상품 사진</label><input name="PT_photourl" readonly="readonly" value="${clinet_no.PT_photourl}">
</div>

<div>
	<label>캘린더 앞</label><input name="Calendar_before" readonly="readonly" value="${clinet_no.calendar_before}">
</div>
<div>
	<label>캘린더 뒤</label><input name="Calendar_after" readonly="readonly" value="${clinet_no.calendar_after}">
</div>


	
		<button id="ptlist">목록</button>
	
<script>
	var operForm =$("#operForm");
	
	$(document).ready(function() {
		$("#ptlist").on("click",function(){
			self.location="/ptclient/clientlist";
		})
	});
</script>
</body>
</html>