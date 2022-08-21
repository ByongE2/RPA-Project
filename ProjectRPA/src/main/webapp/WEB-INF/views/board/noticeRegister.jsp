<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>

 <!-- 서머노트링크 -->
<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<!-- /서머노트링크 -->

<script type="text/javascript">
$(document).ready(function() {
    $('#summernote').summernote({
       height : 300,
       lang : 'ko-KR',
       placeholder : '내용을 입력하세요',
       minHeight : 400,
       disableResizeEditor:true,
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
       url:"summernoteImage.do",
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

   <div class="card">
   
   </div>
   <br><br>
<div id="slider">
   
      <!-- 여기에 내용 넣으세요 -->
      <h3>공지사항 글 쓰기</h3>
      <br>

      <form method="post" action="/notice/register">
 
		<input type="hidden" name="usernum" value="${sessionScope.user.userNum}">
      
         <table border=1 width="100%">
            <tr>
               <td align="center">글 제목</td>
               <td><input type="text" name="title" style="width: 100%"></td>
            </tr>
            <tr>
            <td colspan="2"><textarea class="form-control" id="summernote" name="content"></textarea>
               </td>
            </tr>
         </table>
         <input type="submit" value="등록">
      </form>
</div>


</body>
</html>