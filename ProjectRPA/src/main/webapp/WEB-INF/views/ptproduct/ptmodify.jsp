<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>SummerNoteExample</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- include libraries(jQuery, bootstrap) -->
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<!-- include summernote css/js-->

<link
	href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css"
	rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>

<!-- include summernote-ko-KR -->
<script src="/resources/js/summernote-ko-KR.js"></script>


<script type="text/javascript">
	$(document).ready(function() {
		$('#summernote').summernote({
			height : 300,
			lang : 'ko-KR',
			placeholder : '내용을 입력하세요',
			minHeight : 400,
			callbacks : {
				onImageUpload : function(files, editor, welEditable) {
					for (var i = files.length - 1; i >= 0; i--) {
						sendFile(files[i], this);
					}
				}
			}
		});
	});

	function sendFile(file, el) {
		var form_data = new FormData();
		form_data.append('file', file);
		$.ajax({
			data : form_data,
			type : "POST",
			url : '/image',
			cache : false,
			contentType : false,
			enctype : 'multipart/form-data',
			processData : false,
			success : function(url) {
				$(el).summernote('editor.insertImage', url);
				$('#imageBoard>ul').append()
			}
		})
	}
</script>
</head>

<body>
	<h2 style="text-align: center;">글 작성</h2>
	<br>
	<br>
	<br>


	<div style="width: 60%; margin: auto;">
		<form id="articleForm" role="form" method="post" action="/ptproduct/ptmodify">
			<label>상품 제목 : </label><input type="text" value="${ptlist.PT_title} name="PT_title" style="width: 40%;"><br>
			 <label>작성자 : </label><input type="text" name="pt_name" value="${ptlist.pt_name}"><br> 
			 <label>썸네일 : </label><input type="file" value="${ptlist.PT_photourl}" name="PT_photourl"><br>
			  <label>금액 : </label><input type="number" name="PT_Price" value="${ptlist.PT_Price}">원<br> 
			  <label>아이디 : </label><input type="text" name="PT_id" value="${ptlist.PT_id }" readonly="readonly"><br> 
			  <label>상품상태</label>
			  <select name="PT_State" >
			  	<option value="판매중">판매중</option>
			  	<option value="보류중">보류중</option>
			  	<option value="매진">매진</option>
			  </select>
			  
			  <label>상품 내용</label>
			  <textarea class="form-control" id="summernote" name="PT_content">${ptlist.PT_content }</textarea>
			<input id="subBtn" type="submit" value="수정" style="float: right;" />
			<input id="subBtn" type="button" value="취소" style="float: right;" onclick="history.go(-1)" />
		</form>
	</div>

</body>
</html>