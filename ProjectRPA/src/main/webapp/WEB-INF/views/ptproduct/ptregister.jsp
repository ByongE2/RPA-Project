<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<!-- include summernote css/js-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
<!-- include summernote-ko-KR -->
<script src="/resources/js/summernote-ko-KR.js"></script>
<title>글쓰기</title>

<script>
$(document).ready(function() {
	  $('#summernote').summernote({
 	    	placeholder: '내용을 입력하세요',
	        minHeight: 370,
	        maxHeight: null,
	        focus: true, 
	        lang : 'ko-KR'
	  });
	});
	
</script>
</head>

<body>
<h2 style="text-align: center;">글 작성</h2><br><br><br>

<div style="width: 60%; margin: auto;">
	<form method="post" action="/ptproduct/ptregister">
		<input type="text" name="PT_title" style="width: 40%;" placeholder="제목"/><br>
				<label>작성자 : </label><input type="text" name="pt_name"><br>
				<label>썸네일 : </label><input type="file" name="PT_photourl"><br>
				<label>금액 : </label><input type="number" name="PT_Price">원<br>
				<label>아이디 : </label><input type="text" name="PT_id"><br>
				<textarea id="summernote" name="PT_content"></textarea>
		<input id="subBtn" type="submit" value="글 작성" style="float: right;" />
		<input id="subBtn" type="button" value="취소" style="float: right;" onclick="history.go(-1)"/>
	</form>
</div>

</body>
</html>