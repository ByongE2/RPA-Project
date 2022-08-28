<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
<style>
/*   a{
  	text-decoration : none;
  }
  table{
 	border-collapse: collapse;
 	width: 700px;    
 	margin-top : 20px;
 	text-align: center;
  }
  td, th{
  	border : 1px solid black;
  	height: 30px;
  }
  th{
  	font-size : 17px;
  }
  thead{
  	font-weight: 700;
  }
  .table_wrap{
  	margin : 50px 0 0 50px;
  }
  .bno_width{
  	width: 12%;
  }
  .writer_width{
  	width: 20%;
  }
  .regdate_width{
  	width: 15%;
  }
  .updatedate_width{
  	width: 15%;
  }
  .top_btn{
  	font-size: 20px;
    padding: 6px 12px;
    background-color: #fff;
    border: 1px solid #ddd;
    font-weight: 600;
  }
 */  
  .pageInfo{
    list-style : none;
    display: inline-block;
    margin: 65px 0 0 150px;      
  }
  .pageInfo li{
    float: left;
    font-size: 20px;
    margin-left: 18px;
    padding: 5px;
    font-weight: 500;
  }
  
 a:link {color:black; text-decoration: none;}
 a:visited {color:black; text-decoration: none;}
 a:hover {color:black; text-decoration: underline;}
 .active{
      background-color: #cdd5ec;
  }
  .input-group{
  	float: right;
  }
  
  #searchType{
  	height: 30px;
    width: 100px;
  }
  
  #search_area{
    height: 30px;
    width: 300px;
  }
  
  </style>
</head>
<body>
<div class="container">
	<h1>공지사항</h1>

<div class="table-responsive">
	<c:if test="${user.grade == 1}"><a href="/notice/NoticeRegister" class="btn btn-default">공지사항 등록</a></c:if>
	<table class="table">
		<thead>
			<tr>
				<th>#</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="list">
            <tr>
                <td><c:out value="${list.notice_no}"/></td>
                <td>
					<a class='move'  href=<c:out value="${list.notice_no }"/>>
					<c:out value="${list.title}"/></a>
				</td>
                <td><c:out value="관리자"/></td>
                <td><fmt:formatDate pattern="yyyy/MM/dd"
									value="${list.regDate }" /></td>
            </tr>
       		</c:forEach>
		</tbody>
	</table>
	
	<!-- 검색 조건 Start-->
	<div class="input-group">
	<form id="searchForm" action="/notice/Noticelist" method="get">
		<select name="type" id="searchType">
			<option value="" <c:out value="${page.cri.type == null ? 'selected' : '' }"/>>----</option>
			<option value="T"
			<c:out value="${page.cri.type eq 'T' ? 'selected' : '' }"/>
			>제목</option>
			<option value="C" <c:out value="${page.cri.type eq 'C' ? 'selected' : '' }"/>>내용</option>
			<option value="TC" <c:out value="${page.cri.type eq 'TC' ? 'selected' : '' }"/>>제목+내용</option>
		</select>
		
		
		
		
		<input type="text" name="keyword" id="search_area" placeholder="Search ..."/>
		<input type="hidden" name="pageNum" value="${page.cri.pageNum}">
		<input type="hidden" name="amount" value="${page.cri.amount}">
		<button class="btn btn-primary btn-sm">
		<span class="glyphicon glyphicon-search"></span> Search
		</button>
	</form>
	</div>
		
	
	<%-- <div class="search_wrap">
        <div class="search_area">
            <input type="text" name="keyword" value="${page.cri.keyword }">
            <button>Search</button>
        </div>
    </div> --%>
	
	<div class="pageInfo_wrap" >
        <div class="pageInfo_area">
        	<ul id="pageInfo" class="pageInfo">
        		<!-- 이전페이지 버튼 -->
                <c:if test="${page.prev}">
                    <li class="pageInfo_btn previous"><a href="${page.startPage-1}">Prev</a></li>
                </c:if>
        		
	        	<!-- 각 번호 페이지 버튼 -->
	            <c:forEach var="num" begin="${page.startPage}" end="${page.endPage}">
                	<li class="pageInfo_btn ${page.cri.pageNum == num ? "active":"" }"><a href="${num}">${num}</a></li>
	            </c:forEach>
	            
	            <!-- 다음페이지 버튼 -->
                <c:if test="${page.next}">
                    <li class="pageInfo_btn next"><a href="${page.endPage + 1 }">Next</a></li>
                </c:if>
        	</ul>
        </div>
    </div>
	<form id="moveForm" action="/notice/Noticelist" method="get">
		<input type="hidden" name="pageNum" value="${page.cri.pageNum }">
        <input type="hidden" name="amount" value="${page.cri.amount }">
        <input type="hidden" name="type" value="${page.cri.type}">
        <input type="hidden" name="keyword" value="${page.cri.keyword }">    
    </form>
</div>
</div>

<script>
$(document).ready(function(){
    
    let result = '<c:out value="${result}"/>';
    
    checkAlert(result);
    
    function checkAlert(result){
        
        if(result === ''){
            return;
        }
        
        if(result === "register success"){
            alert("등록이 완료되었습니다.");
        }
        
        if(result === "modify success"){
            alert("수정이 완료되었습니다.");
        }
        
        if(result === "remove success"){
            alert("삭제가 완료되었습니다.");
        }
        
    }    
    
});

	var moveForm = $("#moveForm");

	$(".move").on("click", function(e){
    	e.preventDefault();
	    moveForm.append("<input type='hidden' name='notice_no' value='"+ $(this).attr("href")+ "'>");
	    moveForm.attr("action", "/notice/Noticeget");
	    moveForm.submit();
    
});
	
	$(".pageInfo a").on("click", function(e){
		e.preventDefault();
        moveForm.find("input[name='pageNum']").val($(this).attr("href"));
        moveForm.submit();
 	
        
});
	/* $(".search_area button").on("click", function(e){
        e.preventDefault();
        let val = $("input[name='keyword']").val();
        moveForm.find("input[name='keyword']").val(val);
        moveForm.find("input[name='pageNum']").val(1);
        moveForm.submit();
}); */
	var searchForm = $("#searchForm");
	
	$("#searchForm button").on("click", function(e){
		e.preventDefault();
		
		if(!searchForm.find("option:selected").val()){
			alert("검색종류를 선택하세요.")
			return false;
		}
		if(!searchForm.find("[name='keyword']").val()){
			alert("키워드를 입력하세요.")
			return false;
		}
		
		searchForm.find("input[name='pageNum']").val(1);
		searchForm.submit();
	});
	
</script>
	
</body>
</html>