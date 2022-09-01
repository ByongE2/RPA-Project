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
			lang :"ko-KR",
			placeholder : '내용을 입력하세요',
			minHeight : 400,
			focus:true,
			callbacks : {
				onImageUpload : function(files, editor, welEditable) {
					for (var i = files.length - 1; i >= 0; i--) {
						uploadSummernoteimageFile(files[i],this);
					}
				}
			}
		});
	});
	function uploadSummernoteimageFile(file,editor){
		data=new FormData();
		data.append("file",file);
		$.ajax({
			url:"summernoteImage",
			data : data,
			type : "POST",
			enctype : 'multipart/form-data',
			dataType:'JSON',
			contentType:false,
			processData:false,
			success: function(data){
				$(editor).summernote('insertImage',data.url);
			}
		});
	}
	
	
</script>
</head>

<body>
	<h2 style="text-align: center;">글 작성</h2>
	<br>
	<br>
	<br>

	
	<div style="width: 60%; margin: auto;">
		<form id="articleForm" role="form" enctype="multipart/form-data" method="post" action="/ptproduct/ptregister">
			<input type="text" name="PT_title" style="width: 40%;" placeholder="제목" /><br>
			 <label>작성자 : </label><input type="text" name="pt_name"><br> 
			 <label>썸네일 : </label><input type="file" name="PT_photourl"><br>
			  <label>금액 : </label><input type="number" name="PT_Price">원<br> 
			 <!-- 아이디 부분 --><input type="hidden" name="PT_id" value="${user.id}"><br> 
			  <label>상품상태</label>
			  
			  <select ty name="PT_State" >
			  	<option value="판매중">판매중</option>
			  	<option value="보류중">보류중</option>
			  	<option value="매진">매진</option>
			  </select>
			  
			  <label>상품 내용</label>
			  <textarea class="form-control" id="summernote" name="PT_content"></textarea>
			<input id="subBtn" type="submit" value="글 작성" style="float: right;" />
			<input id="subBtn" type="button" value="취소" style="float: right;" onclick="history.go(-1)" />
		</form>
	</div>

</body>
</html>