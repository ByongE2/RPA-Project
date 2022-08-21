<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet" href="../resources/css/admin/goods/sportswear/sw.css"> -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">

<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<script src="https://code.jquery.com/jquery-3.6.0.min.js" 
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" 
		crossorigin="anonymous">
</script>
</head>
</head>
<body>
	<jsp:include page="../includes/allNav.jsp"></jsp:include>
 
    <div class="wrapper">
        <div class="wrap">
            <!-- gnv_area -->    
            <div class="top_gnb_area">
                <ul class="list">    
                    <li><a href="/main">메인 페이지</a></li>
                    <li><a href="#">로그아웃</a></li>
                    <li>고객센터</li>            
                </ul>
            </div>
            <!-- top_subject_area -->
            <div class="admin_top_wrap">
                <span>관리자 페이지</span>
                
            </div>
            <div class="admin_content_wrap">
                <div>관리자 페이지 입니다.</div>
            </div>
            <div class="clearfix"></div>
            <!-- contents-area -->
            <div class="admin_wrap">
                <!-- 네비영역 -->
                <div class="admin_navi_wrap">
                    <ul>
                        <li >
                            <a href="goods/sportswear/list" class="admin_list_01">상품 sw 관리</a>
                        </li>
                        <li>
                            <a class="admin_list_02" href="/ptproduct/list">pt 관리</a>
                        </li>
                        <li>
                            <a class="admin_list_05">회원 관리</a>                            
                        </li>                                                                                             
                        <li>
                            <a class="admin_list_05">주문 관리</a>                            
                        </li>                                                                                             
                    </ul>
                </div>
            </div>
        </div>
    </div>
 
</body>
</html>
