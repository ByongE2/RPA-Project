<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/CSS/main/main.css">
</head>
<body>
<div class="wrapperweb">
	<%@include file="../main/head.jsp" %>
	
 <!--본문 시작-->

    <!--슬라이드-->
    <div class="slidebox">
        <input type="radio" name="slide" id="slide01" checked>
        <input type="radio" name="slide" id="slide02" >
        <input type="radio" name="slide" id="slide03" >
        <input type="radio" name="slide" id="slide04" >
        <input type="radio" name="slide" id="slide05" >
        <ul class="slidelist">
            <li class="slideitem">
                <div>
                    <label for="slide05" class="left"></label>
                    <label for="slide02" class="right"></label>
                    <a href="#"><img src="https://i.ibb.co/PQqQ4TV/1.png"></a>
                </div>
            </li>
            <li class="slideitem">
                <div>
                    <label for="slide01" class="left"></label>
                    <label for="slide03" class="right"></label>
                    <a href="#"><img src="https://i.ibb.co/BBLWp5k/2.png"></a>
                </div>
            </li>
            <li class="slideitem">
                <div>
                    <label for="slide02" class="left"></label>
                    <label for="slide04" class="right"></label>
                    <a href="#"><img src="https://i.ibb.co/R7FHYyx/3.png"></a>
                </div>
            </li>
            <li class="slideitem">
                <div>
                    <label for="slide03" class="left"></label>
                    <label for="slide05" class="right"></label>
                    <a href="#"><img src="https://i.ibb.co/BCvt6YS/4.png"></a>
                </div>
            </li>
            <li class="slideitem">
                <div>
                    <label for="slide04" class="left"></label>
                    <label for="slide01" class="right"></label>
                    <a href="#"><img src="https://i.ibb.co/BjNpVvr/5.png"></a>
                </div>
            </li>
        </ul>
    </div>
    <!--슬라이드-->
   
    <!--본문 끝-->
    <%@include file="../main/footer.jsp" %>
</div>
    
	
	
	

</div>
</body>
</html>