<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
	
	<script type="text/javascript">
      function initialize() {
        var mapLocation = new google.maps.LatLng('36.322473', '127.412501'); // 지도에서 가운데로 위치할 위도와 경도
        var markLocation = new google.maps.LatLng('36.322473', '127.412501'); // 마커가 위치할 위도와 경도
         
        var mapOptions = {
          center: mapLocation, // 지도에서 가운데로 위치할 위도와 경도(변수)
          zoom: 18, // 지도 zoom단계
          mapTypeId: google.maps.MapTypeId.ROADMAP
        };
        var map = new google.maps.Map(document.getElementById("map-canvas"), // id: map-canvas, body에 있는 div태그의 id와 같아야 함
            mapOptions);
         
        var size_x = 60; // 마커로 사용할 이미지의 가로 크기
        var size_y = 60; // 마커로 사용할 이미지의 세로 크기
         
        // 마커로 사용할 이미지 주소
        var image = new google.maps.MarkerImage( 'http://www.larva.re.kr/home/img/boximage3.png',
                            new google.maps.Size(size_x, size_y),
                            '',
                            '',
                            new google.maps.Size(size_x, size_y));
         
        var marker;
        marker = new google.maps.Marker({
               position: markLocation, // 마커가 위치할 위도와 경도(변수)
               map: map,
               icon: image, // 마커로 사용할 이미지(변수)
//             info: '말풍선 안에 들어갈 내용',
               title: '서대전네거리역이지롱~' // 마커에 마우스 포인트를 갖다댔을 때 뜨는 타이틀
        });
         
        var content = "헬스장 위치"; // 말풍선 안에 들어갈 내용
         
        // 마커를 클릭했을 때의 이벤트. 말풍선 뿅~
        var infowindow = new google.maps.InfoWindow({ content: content});
 
        google.maps.event.addListener(marker, "click", function() {
            infowindow.open(map,marker);
        });
         
 
         
      }
      google.maps.event.addDomListener(window, 'load', initialize);
</script>
	<link rel="stylesheet" href="../resources/CSS/main/main.css">
</head>
<body>
<div class="wrapperweb">
	<%@include file="../main/head.jsp" %>
		
	
		<!--맵 api-->
            <div class="background">
                <h3>오시는길</h3>
                <hr>
                
                <div class="letter">
                    <div class="Arrowout1">
                        <img class="Arrowin" src="https://i.ibb.co/rpYYSR6/image.png">
                        
                    </div>
                    <div class="Arrowout2">
                        <h4>주소</h4>
                        <br>
                        <h5>인천 광역시 연수구 아카데미로 이젠컴퓨터 140(지번 : 이젠로 어디로 가는건지 1-21)</h5>
                        
                    </div>
                </div>


                <div class="letter">
                    <div class="Arrowout1">
                        <img class="Arrowin" src="https://i.ibb.co/rpYYSR6/image.png">
                        
                    </div>
                    <div class="Arrowout2">
                        <h4>셔틀버스 운행시간 및 노선안내</h4>
                        <br>
                        <h5>운행기간 : 평일 운행(토/일 공휴일 휴차)</h5>
                        <h5>운행 간격 : 매시 15분 센터 출발~ 50분 센터 도착</h5>
                    </div>
                </div>

                    <div class="map">
                        <div id="map-canvas" style="width: 100%; height: 400px"></div>
                    </div>  
                    <br>
                    <br>
                    <div class="letter">
                        <div class="Arrowout1">
                            <img class="Arrowin" src="https://i.ibb.co/rpYYSR6/image.png">
                            
                        </div>
                        <div class="Arrowout2">
                            <h4>주차장 이용안내</h4>
                            <br>
                            <h5> - 이젠 대학교 북1문 이용 가능한 부분에서 하단에 위치</h5>
                            <h5> - 주차 가능 대수 : 일반주차 100대, 장애인 주차 4대</h5>
                        </div>
                    </div>

                    <h3>교통편</h3>
                    <hr>
                    <img src="https://i.ibb.co/C7sd9GQ/image.png">
            </div>

            
        <!--맵 api 끝--> 
	
	
	
	<%@include file="../main/footer.jsp" %>
</div>

</body>
</html>