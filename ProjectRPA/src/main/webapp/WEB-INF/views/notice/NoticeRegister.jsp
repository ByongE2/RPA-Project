<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="/notice/NoticeRegister" method="post">
	    <div class="input_wrap">
	        <label>Title</label>
	        <input name="title">
	    </div>
	    
	    <div class="input_wrap">
	        <label>Content</label>
	        <textarea rows="3" name="content"></textarea>
	    </div>
	    
	    <button type="submit" class="btn btn-default">등록</button>
	    <button type="reset" class="btn btn-default">취소</button>
	</form>
	
</body>
</html>