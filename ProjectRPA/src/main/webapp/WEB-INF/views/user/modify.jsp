<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Info Modify</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
    /* Set height of the grid so .sidenav can be 100% (adjust if needed) */
    .row.content {height: 1500px}
    
    /* Set gray background color and 100% height */
    .sidenav {
      background-color: #f1f1f1;
      height: 100%;
    }
    
    /* Set black background color, white text and some padding */
    footer {
      background-color: #555;
      color: white;
      padding: 15px;
    }
    
    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
      .row.content {height: auto;} 
    }
  </style>
</head>
<body>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="/mainTEST">RPA GYM</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Page 1 <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="#">Page 1-1</a></li>
          <li><a href="#">Page 1-2</a></li>
          <li><a href="#">Page 1-3</a></li>
        </ul>
      </li>
      <li><a href="#">Page 2</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><c:if test="${user == null}"><a href="/user/login"><span class="glyphicon glyphicon-log-in"></span> 로그인</a></c:if></li>
      <li><c:if test="${user != null}"><a><span class="glyphicon glyphicon-user"></span>${user.id}님 안녕하세요.</a></c:if></li>
      <li><c:if test="${user != null}"><a href="/user/logout"><span class="glyphicon glyphicon-log-in"></span> 로그아웃</a></c:if></li>
    </ul>
  </div>
</nav>


<div class="container-fluid">
  <div class="row content">
    <div class="col-sm-3 sidenav">
      <h4><c:if test="${user != null}"><p>${user.id} 님 </p></c:if></h4>
      <ul class="nav nav-pills nav-stacked">
        <li><a href="/user/mypage">내 정보</a></li>
        <li><a href="#section2">장바구니</a></li>
        <li><a href="#section3">임시메뉴</a></li>
        <li><a href="#section3">임시메뉴</a></li>
      </ul><br>
    </div>

    <div class="col-sm-9">
      <hr>
      <div class="container">
  		<h2>내 정보</h2>
  		<br>
  		<form action="/user/modify" id="operForm" method="post">
  		<table class="table table-bordered">
	    <tbody>
      		<tr>
				<th>아이디</th>
				<td><c:out value="${user.id}"></c:out></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="pw" value="${user.pw}"></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><c:out value="${user.name}"></c:out></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="text" name="phone" value="${user.phone}"></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="text" name="email" value="${user.email}"></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input type="text" id="address1" name="address" value="${user.address}"><button type="button" onclick="execution_daum_address()">주소검색</button></td>
			</tr>
	    </tbody>
	   </table>
	   <div id="buttons">
				<button data-oper='modify' class="btn btn-info">수정완료</button>
		</div>
	</form>
	</div>
      <br><br>
      <hr>
      <br>
    </div>
  </div>
</div>

<footer class="container-fluid">
  <p>Footer Text</p>
</footer>

<script>
	var operForm = $("#operForm");
	
	$("button[data-oper='modify']").on("click", function(e){
		operForm.attr("action", "/user/modify").submit();
	});
	
	
	
	
	/* 다음 주소 연동 */
	function execution_daum_address(){
	    
		new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	            
	        	// 각 주소의 노출 규칙에 따라 주소를 조합한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var addr = ''; // 주소 변수
	            var extraAddr = ''; // 참고항목 변수

	            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                addr = data.roadAddress;
	            } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                addr = data.jibunAddress;
	            }

	            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	            if(data.userSelectedType === 'R'){
	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraAddr += data.bname;
	                }
	                // 건물명이 있고, 공동주택일 경우 추가한다.
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                if(extraAddr !== ''){
	                    extraAddr = ' (' + extraAddr + ')';
	                }
	                // 조합된 참고항목을 해당 필드에 넣는다.
	                //document.getElementById("sample6_extraAddress").value = extraAddr;
	            	addr += extraAddr;
	            	
	            } else {
	                //document.getElementById("sample6_extraAddress").value = '';
	            	addr += ' ';
	            }

	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            //document.getElementById('sample6_postcode').value = data.zonecode;
	            //document.getElementById("sample6_address").value = addr;
	            $("#address1").val(addr);
	            
	            // 커서를 상세주소 필드로 이동한다.
	            //document.getElementById("sample6_detailAddress").focus();
	            $("#address1").attr("readonly",false);
	            $("#address1").focus();
	        }
	    }).open();
	}
</script>	
</body>
</html>