<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>


     
</head>
<body>


   
   <!-- header card -->
   
   <div class="card">
   
   </div>
   <br><br>
   <div id="slider">
      <section>
         <h1>공지사항 글쓰기</h1>
         <table>
            <tr>
               <td>글 번호</td>
               <td><c:out value="${notice.num}"></c:out></td>
            </tr>
            <tr>
               <td>별명</td>
               <td>${notice.user.nickName}</td>
            </tr>
            <tr>
               <td>제목</td>
               <td>${notice.title}</td>
            </tr>
            <tr>
               <td>내용</td>
               <td style="overflow:scroll;">
               ${notice.content}
               </td>
            </tr>
            <tr>
               <td>작성일</td>
               <td><fmt:formatDate pattern="yyyy-MM-dd"
                           value="${notice.notice_date}"/></td>
            </tr>
         </table>
         <div id="buttons">
            <button data-oper='modify' class="btn btn-default">수정</button>
               <button data-oper='remove' class="btn btn-info">삭제</button>
         </div>
      </section>
      
      <form id="operForm" name="frm" action="/board/modify" method="get">
         <input type="hidden" name="num" value="${notice.num}">
      </form>
   </div>

<script>
   var operForm = $("#operForm");
   var num = document.frm.num.value;
   
   console.log(num);
   
   
   $("button[data-oper='modify']").on("click", function(e){
      operForm.attr("action", "/board/modify.do?" + num).submit();
   });
   
   $("button[data-oper='remove']").on("click", function(e){
      operForm.attr("action", "/board/remove.do?" + num);
      operForm.submit();
   });
</script>   
</body>
</html>