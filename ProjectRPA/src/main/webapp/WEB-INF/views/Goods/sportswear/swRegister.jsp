<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet" href="../resources/css/admin/goods/sportswear/sw.css"> -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">

<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<script src="https://code.jquery.com/jquery-3.6.0.min.js" 
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" 
		crossorigin="anonymous">
</script>
<style type="text/css">
	#result_card img{
		max-width: 100%;
	    height: auto;
	    display: block;
	    padding: 5px;
	    margin-top: 10px;
	    margin: auto;	
	}
	#result_card {
		position: relative;
	}
	.imgDeleteBtn{
	    position: absolute;
	    top: 0;
	    right: 5%;
	    background-color: #ef7d7d;
	    color: wheat;
	    font-weight: 900;
	    width: 30px;
	    height: 30px;
	    border-radius: 50%;
	    line-height: 26px;
	    text-align: center;
	    border: none;
	    display: block;
	    cursor: pointer;	
	}
	
</style>
</head>
<body>
	<div class="panel-heading">
		상품 등록
 </div>

 	<form role="form" action="/admin/goods/sportswear/insert" method="post">
		 	<div class="form-group">
			 <label>상품명</label>
			 <input class="form-control" name="goods_swName">
			</div>
			<div class="form-group">
				<label>상품 가격</label>
				<input class="form-control" name="goods_swPrice">
			</div>
			<div class="form-group">
				<label>상품 설명</label>
				<input class="form-control" name="goods_swDetail">
			</div>
			<div class="form-group">
				<label>상품 재고</label>
				<input class="form-control" name="goods_swStock">
			</div>
			<div class="form-group">
				<label>상품 할인율</label>
				<input id="discount_interface" maxlength="2" value="0">
				<input name="goods_swDiscount" type="hidden" value="0">	
				<span class="step_val">할인 된 가격 : <span class="span_discount"></span></span>
			</div>
			<div class="form_section">
       			<div class="form_section_title">
       				<label>상품 이미지</label>
       			</div>
       			<div class="form_section_content">
					<input type="file" id ="fileItem" name="uploadFile" style="height: 30px;">
					<!-- 파일 여러개 올리고 싶으면 multiple-->
					<!-- <input type="file" multiple> -->
					<div id="uploadResult">
						<!-- js로 동적으로 이미지 추가하게끔 하려함. -->
						<!-- <div id="result_card">
							<div class="imgDeleteBtn">x</div>
							<img src="/resources/ptimg/2022081820210927_105642.jpg">
						</div> -->
					</div>
       			</div>
      		</div>
			<button type="submit" class="btn btn-default">등록</button>
			<button type="reset" class="btn btn-default">리셋</button>
		</form>
<script>
/* 할인율 Input 설정 */
$("#discount_interface").on("propertychange change keyup paste input", function(){
	
	let userInput = $("#discount_interface");
	let discountInput = $("input[name='goods_swDiscount']");
	//할인율을 정수로 넣으면 서버에서 소수로 바꿔주는..
	//상품 가격 * (1 - (할인율/100))
	let discountRate = userInput.val();				// 입력할 할인값
	let sendDiscountRate = discountRate / 100;		// 서버에 전송할 할인값
	let goodsPrice = $("input[name='goods_swPrice']").val();		// 원가
	let discountPrice = goodsPrice * (1 - sendDiscountRate);		// 할인가격
	        
	$(".span_discount").html(discountPrice);
	
	discountInput.val(sendDiscountRate);	
	
});
//상품가격 > 상품 할인율 순으로 입력했다가, 다시 상품 가격을 수정했을 때도 할인가격을 바로 볼 수 있도록.
$("input[name='goods_swPrice']").on("change", function(){
	
	let userInput = $("#discount_interface");
	let discountInput = $("input[name='goods_swDiscount']");
	//할인율을 정수로 넣으면 서버에서 소수로 바꿔주는..
	//상품 가격 * (1 - (할인율/100))
	let discountRate = userInput.val();				// 입력할 할인값
	let sendDiscountRate = discountRate / 100;		// 서버에 전송할 할인값
	let goodsPrice = $("input[name='goods_swPrice']").val();		// 원가
	let discountPrice = goodsPrice * (1 - sendDiscountRate);		// 할인가격
	        
	$(".span_discount").html(discountPrice);
});
/* 이미지 업로드 */
$('input[type="file"]').on("change", function(e){
	let formData = new FormData();
	let fileInput = $('input[name="uploadFile"]');
	let fileList = fileInput[0].files;
	let fileObj = fileList[0];
	
	//이미지파일인지 js로 체크
	if(!fileCheck(fileObj.name, fileObj.size)){
		return false;
	}
	
	formData.append("uploadFile", fileObj); //가상의 form태그 역할. key값있는상태에서 같은 key값 추가하면 배열 끝에 새로운 값 추가.(배열임)
	
	
	$.ajax({
		url: '/admin/goods/sportswear/uploadAjaxAction', //서버로 요청을 보낼 url
		// processData, contentType 속성 값을 'false'로 해야만 첨부파일이 서버로 전송 됨.
    	processData : false,  //서버로 전송할 데이터를 queryStirng 형태로 변환할지 여부
    	contentType : false,  //서버로 전송되는 데이터의 content-type
    	data : formData,	  //서버로 전송할 데이터
    	type : 'POST',	 	  //서버 요청 타입(GET, POST)
    	dataType : 'json',	  //서버로부터 반환받을 데이터 타입
   		success : function(result){
    		console.log(result);
    		showUploadImage(result);
    	},
    	error : function(result){
	    	alert("이미지 파일이 아님. 이미지 형식 파일 올려주세요~");
    	}
	});
	
	
	/*
	파일 여러개 업로드 하고 싶은 경우 + <input>태그에 multiple 속성
	for(let i = 0; i < fileList.length; i++){
	formData.append("uploadFile", fileList[i]);
	}
	*/

	//alert("통과");
	//console.log("fileObj : " + fileObj);
	//console.log("fileList : " + fileList);
	//console.log("fileName : " + fileObj.name);
	//console.log("fileSize : " + fileObj.size);
	//console.log("fileType(MimeType) : " + fileObj.type);
}); //imageUpload

/* 업로드 제약 1MB 이하 and jsp, png */
let regex = new RegExp("(.*?)\.(jpg|png)$"); //jsp,png파일만
let maxSize = 1048576; //1MB	

function fileCheck(fileName, fileSize){
	if(fileSize >= maxSize){
		alert("파일 사이즈 초과");
		return false;
	}
	if(!regex.test(fileName)){
		alert("해당 종류의 파일은 업로드할 수 없음.");
		return false;
	}
	return true;		
}//fileCheck

/* 이미지 출력 */
function showUploadImage(uploadResultArr){
	//전달받은 데이터 검증
	if(!uploadResultArr || uploadResultArr.length == 0){return}
	
    let uploadResult = $("#uploadResult");
    //배열 첫번 째 데이터로 초기화
    let obj = uploadResultArr[0];
    
    let str = "";
    //미리보기에는 썸네일 이미지가 나오게
    //let fileCallPath = obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName;  //('\' 을 '/' 로) 못바꿔줘서 에러
    //let fileCallPath = obj.uploadPath.replace(/\\/g, '/') + "/s_" + obj.uuid + "_" + obj.fileName;
    let fileCallPath = encodeURIComponent(obj.uploadPath.replace(/\\/g, '/') + "/s_" + obj.uuid + "_" + obj.fileName);
    				   //encodeURIComponent() 메서드 :
    				   //다음의 문자 A-Z a-z 0-9 - _ . ! ~ * ' ( )을 제외한 모든 문자를 UTF-8로 인코딩하여 이스케이프 문자로 변환
    				   //혹시 파일 이름에 한글 문자를 UTF-8로 자동으로 바꿔주지 않는 브라우저가 있을 수도 있어서.(보통은 자동으로 변환해줌)
    				   //+  '/'와 '\'문자 또한 인코딩을 하기 때문에 replace() 메서드를 사용 안 해도 된다.
    str += "<div id='result_card'>";
	str += "<img src='/display?fileName=" + fileCallPath +"'>";
	str += "<div class='imgDeleteBtn'>x</div>";
	str += "</div>";
	
	uploadResult.append(str);  // = uploadResult.html(str);  
}

</script>		
			

</body>
</html>