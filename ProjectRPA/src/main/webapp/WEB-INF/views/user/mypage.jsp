<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyPage</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
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
      <a class="navbar-brand" href="#">RPA GYM</a>
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
  		<table class="table table-bordered">
	    <tbody>
      		<tr>
				<th>아이디</th>
				<td><c:out value="${user.id}"></c:out></td>
			</tr>
			<tr>
				<th>이름</th>
				<td>${user.name}</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>${user.phone}</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>${user.email}</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>${user.address}</td>
			</tr>
			<tr>
				<th>가입일자</th>
				<td>${user.regDate}</td>
			</tr>
	    </tbody>
	   </table>
	   <div id="buttons">
				<button data-oper='modify' class="btn btn-info">내 정보 수정</button>
		</div>
		<form id="operForm" action="/user/modify" method="get"></form>
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

   
	<%--<br><br>
	<div id="slider">
		<section>
			<h1>내 정보 조회</h1>
			<table>
				<tr>
					<td>아이디</td>
					<td><c:out value="${user.id}"></c:out></td>
				</tr>
				<tr>
					<td>이름</td>
					<td>${user.name}</td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td>${user.phone}</td>
				</tr>
				<tr>
					<td>이메일</td>
					<td>${user.email}</td>
				</tr>
				<tr>
					<td>주소</td>
					<td>${user.address}</td>
				</tr>
			</table>
			<div id="buttons">
				<button data-oper='modify' class="btn btn-default">내 정보 수정</button>
			</div>
		</section>--%>

	

<script>
	var operForm = $("#operForm");
	
	$("button[data-oper='modify']").on("click", function(e){
		operForm.attr("action", "/user/modify").submit();
	});
	
	$("button[data-oper='remove']").on("click", function(e){
		operForm.attr("action", "../users/withdraw.do");
		operForm.submit();
	});
</script>	
</body>
</html>