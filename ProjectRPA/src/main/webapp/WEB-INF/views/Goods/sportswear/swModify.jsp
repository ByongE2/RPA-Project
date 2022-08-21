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
</head>
</head>
<body>
	<%-- <%@include file="../includes/admin/header.jsp" %> --%>

	<div class="admin_content_wrap">
		<div class="admin_content_subject"><span>상품 수정</span></div>
		<div class="admin_content_main">
			<form role="form" action="/admin/goods/sportswear/modify" method="post">
				
				<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>
				<input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'>
				<input type="hidden" name="keyword" value='<c:out value="${cri.keyword}"/>'>

				<div class="form_section">
					<div class="form_section_title">
						<label>상품 ID</label>
					</div>
					<div class="form_section_content">
						<input class="form-control" name="goods_swID" value='<c:out value="${swInfo.goods_swID}"/>' readonly="readonly">
					</div>
				</div>

				<div class="form_section">
					<div class="form_section_title">
						<label>상품 이름</label>
					</div>
					<div class="form_section_content">
						<input name="goods_swName" value='<c:out value="${swInfo.goods_swName}"/>'>
						<span class="ck_warn swName_warn">상품 이름 입력하세요.</span>
					</div>
				</div>
				<div class="form_section">
					<div class="form_section_title">
						<label>등록 날짜</label>
					</div>
					<div class="form_section_content">
						<input value="<fmt:formatDate value='${swInfo.goods_swRegDate}' pattern='yyyy-MM-dd'/>" readonly="readonly">
					</div>
					</div>
					<div class="form_section">
					<div class="form_section_title">
						<label>최근 수정 날짜</label>
					</div>
					<div class="form_section_content">
						<input value="<fmt:formatDate value='${swInfo.goods_swUpdateDate}' pattern='yyyy-MM-dd'/>" readonly="readonly">
					</div>
				</div>            
				<div class="form_section">
					<div class="form_section_title">
						<label>상품 가격</label>
					</div>
					<div class="form_section_content">
						<input name="goods_swPrice" value='<c:out value="${swInfo.goods_swPrice}"/>'>
						<span class="ck_warn swPrice_warn">상품 가격을 입력해주세요.</span>
					</div>
				</div>               
				<div class="form_section">
					<div class="form_section_title">
						<label>상품 소개</label>
					</div>
					<div class="form_section_content bit">
						<textarea name="goods_swDetail" id="swDetail_textarea">'<c:out value="${swInfo.goods_swDetail}"/>'</textarea>
						<span class="ck_warn swDetail_warn">상품 소개를 입력해주세요.</span>
					</div>
				</div>  
				<div class="form_section">
					<div class="form_section_title">
						<label>상품 할인율</label>
					</div>
					<div class="form_section_content">
						<input name="goods_swDiscount" value='<c:out value="${swInfo.goods_swDiscount}"/>' readonly="readonly">
						<input id="discount_interface" maxlength="2" value="0">
						<input name="goods_swDiscount" type="hidden" value="0">	
						<span class="step_val">할인 된 가격 : <span class="span_discount"></span></span>
					</div>
				</div>
				<div class="form_section">
					<div class="form_section_title">
						<label>상품 재고</label>
					</div>
					<div class="form_section_content">
						<input name="goods_swStock" value='<c:out value="${swInfo.goods_swStock}"/>'>
						<span class="ck_warn swStock_warn">상품 재고를 입력해주세요.</span>
					</div>
				</div>
				<div class="form_section">
					<div class="form_section_title">
						<label>상품 이미지</label>
					</div>
					<div class="form_section_content">
						<input type="file" id="fileItem" name='uploadFile'
							style="height: 30px;">
						<div id="uploadResult"></div>
					</div>
				</div>
			</form>
				<div class="btn_section">
					<button type="submit"  data-oper='modify' class="btn btn-default">Modify</button>		
					<button type="submit"  data-oper='remove' class="btn btn-danger">Remove</button>										    
					<button type="submit"  data-oper='list' class="btn btn-info">List</button>
			</div> 
		</div>  
		
	</div>

<script type="text/javascript">
	//수정 삭제 목록 버튼
	$(document).ready(function(){
		
		var formObj = $("form");
		
		$('button').on("click", function(e){
			e.preventDefault();
			
			var operation = $(this).data('oper');
			console.log(operation);
			
			if(operation === 'remove'){
				formObj.attr("action", "/admin/goods/sportswear/remove");
			}else if(operation === 'list'){
				formObj.attr("action", "/admin/goods/sportswear/list").attr("method","get");
				var pageNumTag = $("input[name='pageNum']").clone();
				var amountTag = $("input[name='amount']").clone(); 
				// var typeTag = $("input[name='type']").clone(); 
				var keywordTag = $("input[name='keyword']").clone(); 
				formObj.empty();
				formObj.append(pageNumTag);
				formObj.append(amountTag); 
				// formObj.append(typeTag); 
				formObj.append(keywordTag); 
			}//end operation === 'list'
			formObj.submit();
		});//end $('button').on("click", function(e)
				
		/* 할인율 인터페이스 출력 */
		let swPriceInput = $("input[name='goods_swPrice']");
		let discountInput = $("input[name='goods_swDiscount']");
		
		let swPrice = swPriceInput.val();
		let rawDiscountRate = discountInput.val();
		let discountRate = rawDiscountRate * 100;
		
		let discountPrice = swPrice * (1-rawDiscountRate);
		$(".span_discount").html(discountPrice);
		$("#discount_interface").val(discountRate);
		
		//뷰에서 삭제할 이미지 정보 별도로 받지 않고, 수정할 상품 관련된 이미지 정보 모두 지운 후 , 기존 이미지 정보 + 새로추가한 이미지 정보 뷰로부터 받아서 테이블에 행 추가
		// https://kimvampa.tistory.com/235 참고. 
		/* 기존 이미지 출력 */
		let swID = '<c:out value="${swInfo.goods_swID}"/>';
		let uploadResult = $("#uploadResult");
		
		$.getJSON("/getAttachList", {swID : swID}, function(arr){
			
			console.log(arr);
			
			if(arr.length === 0){
				let str = "";
				str += "<div id='result_card'>";
				str += "<img src='/resources/goods/no Image.png'>";
				str += "</div>";
				
				uploadResult.html(str);				
				return;
			}//if(arr.length === 0)
			
			let str = "";
			let obj = arr[0];
			
			let fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
			str += "<div id='result_card'";
			str += "data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "'";
			str += ">";
			str += "<img src='/goods/sportswear/display?fileName=" + fileCallPath +"'>";
			//삭제버튼 + 이미지 정보 담긴 <input>태그 추가되게 끔
			str += "<div class='imgDeleteBtn' data-file='" + fileCallPath + "'>x</div>";
			str += "<input type='hidden' name='imageList[0].fileName' value='"+ obj.fileName +"'>";
			str += "<input type='hidden' name='imageList[0].uuid' value='"+ obj.uuid +"'>";
			str += "<input type='hidden' name='imageList[0].uploadPath' value='"+ obj.uploadPath +"'>";				
			str += "</div>";
			
			uploadResult.html(str);			
			
		});// GetJSON
		
	});//end $(document).ready(function()
	
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
		
	});//$("#discount_interface").on("propertychange change keyup paste input", function()
	
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
		
	});// $("input[name='goods_swPrice']").on("change", function()
			
	/* 이미지 삭제 버튼 동작 */
	$("#uploadResult").on("click", ".imgDeleteBtn", function(e){
		deleteFile();
	});
	
	/* 파일 삭제 메서드 */
	function deleteFile(){
		
		//서버에 저장된 실제 파일까지 삭제하는 코드.
		/* let targetFile = $(".imgDeleteBtn").data("file");
		let targetDiv = $("#result_card");
		
		$.ajax({
			url: '/admin/goods/sportswear/deleteFile',
			data : {fileName : targetFile},
			dataType : 'text',
			type : 'POST',
			success : function(result){
				console.log(result);
				
				targetDiv.remove();
				$("input[type='file']").val("");
			},
			error : function(result){
				console.log(result);
				
				alert("파일 삭제 실패.")
			}
		});//end ajax */
		
		//나는 view단계에서는 서버에 삭제 요청 하지 않고, 선택한 이미지를 서버에 저장시키도록 하는 요청만 하게 끔
		//즉 사용자가 이미지 삭제버튼 누르면, 이미지가 삭제된것처럼 느끼게만 하고(사실 이미지 출력 되는 태그만 제거한 것임)
		$("#result_card").remove();
		
	}//end deleteFile
	
	/* 이미지 업로드 */
	$('input[type="file"]').on("change", function(e){
		
		//이미지 이미 존재하면 삭제하고 업로드 요청하게 끔 = 미리보기 태그가 존재하는지 안하는지로 판단.
		if($("#result_card").length > 0){
			deleteFile();
		}
		
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
		str += "<img src='/goods/sportswear/display?fileName=" + fileCallPath +"'>";
		str += "<div class='imgDeleteBtn' data-file='" + fileCallPath + "'>x</div>";
		//이미지 정보 input태그 적용시점 : 이미지 여러개 등록이면 등록버튼 눌렀을 때 되도록하는게 더낫다. 지금은 안함.
		str += "<input type='hidden' name='imageList[0].fileName' value='"+ obj.fileName +"'>"; 
		str += "<input type='hidden' name='imageList[0].uuid' value='"+ obj.uuid +"'>";
		str += "<input type='hidden' name='imageList[0].uploadPath' value='"+ obj.uploadPath +"'>";
		str += "</div>";
		
		uploadResult.append(str);  // = uploadResult.html(str);  
	}
</script>           

	<%-- <%@include file="../includes/admin/footer.jsp" %> --%>
</body>
</html>