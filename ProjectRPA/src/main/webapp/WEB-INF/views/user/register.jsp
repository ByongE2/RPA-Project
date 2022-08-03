<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/CSS/register.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- <script src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script> -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
<div class="wrapper">
	<div class="content">
		<h1>회원가입</h1>
	<form id="join" method="post" name="frm">
		<div>
			<h3 class="title">
				<label for="id">아이디</label>
			</h3>
			<div class="box_id">
				<input type="text" id="id" name="id" maxlength="20" class="p">
				<!-- <input type="hidden" name="reid" size="20"> -->
				<!-- <button type="button" id="btnCheck" class="btn btn-default">중복확인</button> -->
				<span id="result"></span>
			</div>
				<span class="id_check_1">사용 가능한 아이디입니다.</span>
				<span class="id_check_2">아이디가 이미 존재합니다.</span>
		</div>	
		
		<div>
			<h3 class="title">
				<label for="pwd">비밀번호</label>
			</h3>
			<div class="box_pass">
				<input type="password" id="pw" name="pw" maxlength="20" class="p">
			</div>
		</div>
		
		<div>
			<h3 class="title">
				<label id="pwd_check">비밀번호 재확인</label>
			</h3>
			<div class="box_passCheck">
				<input type="password" id="pw2" name="pw2" maxlength="20" class="p">
			</div>
		</div>
		
		<div>
			<h3 class="title">
				<label for="name">이름</label>
			</h3>
			<div class="box_name">
				<input type="text" id="name" name="name" maxlength="20" class="p">
			</div>
		</div>
		
		<div>
			<h3 class="title">
				<label for="phone">휴대전화</label>
			</h3>
			<div class="box_phone">
				<input type="text" id="phone" name="phone" maxlength="13" placeholder="-까지 입력해주세요." class="p">
			</div>
		</div>
		
		<div>
			<h3 class="title">
				<label for="address">주소</label>
				<button type="button" onclick="execution_daum_address()">주소검색</button>
			</h3>
			<div class="box_address">
				<input type="text" id="address1" name="address" required="required" readonly="readonly" class="p">
				<input type="text" id="address2" name="address" required="required" readonly="readonly" class="p">
			</div>
		</div>
		
		<div>
			<h3 class="title">
				<label for="email">본인확인 이메일</label>
			</h3>
			<div class="box_email">
				<input type="text" id="email" name="email" maxlength="30" class="p">
			</div>
		</div>
		
		<br><br>
		<div class="join" align="center">
			<button type="button" id="register" class="submit" onclick="joinform_check()">가입하기</button>
			<!-- <input type="submit" id="register" class="submit" value="가입하기"> -->
		</div>
	</form>
</div>
</div>






<script type="text/javascript">
$(document).ready(function(){
	//회원가입 버튼(회원가입 기능 작동)
	$(".submit").click(function(){
		$("#join").attr("action","/user/register");
		$("#join").submit();
	});
});

$('#id').on("propertychange change keyup paste input", function(){
	console.log("test")
	
	var memberId = $('#id').val();			// .id_input에 입력되는 값
	var data = {Id : memberId}				// '컨트롤에 넘길 데이터 이름' : '데이터(.id_input에 입력되는 값)'
	
	$.ajax({
		type : "POST",
		url : "/user/registerIdChk",
		data : data,
		success : function(result){
			console.log("성공여부 : " + result);
			if(result!='fail'){
				$('.id_check_1').css("display","inline-block");
				$('.id_check_2').css("display","none");				
			}else{
				$('.id_check_2').css("display","inline-block");
				$('.id_check_1').css("display","none");				
			}
		}// success
		
	}); // ajax 종료
	
});

//아이디 중복검사
/* $('#btnCheck').click(function(){

	if($('#id').val() != ''){
		$.ajax({
			type:'post',
			url:'/user/register/idCheck',
			data:'id='+$('#id').val(),
			dataType:'json',
			success: function(result){
				if(result=='0'){
					$('#result').text('사용 가능한 아이디입니다.');
				}else{
					$('#result').text('이미 사용중인 아이디입니다.');
				}
			},
			error:function(a,b,c){
				console.log(a,b,c);
			}
		});
	}else{
		alert('아이디를 입력하세요.');
		$('#id').focus();
	}
}); */

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
	
/*  	var id = $('#id_input').val();	// .id_input에 입력되는 값
	var data = {id : id}			// '컨트롤에 넘길 데이터 이름' : '데이터(.id_input에 입력되는 값)'
	
	$.ajax({
		type : "post",
		url : "/user/idCheck",
		data : data,
		success : function(result){
			if(result != 'fail'){
				$('.id_check_1').css("display","inline-block");
				$('.id_check_2').css("display","none");
			}else{
				$('.id_check_2').css("display","inline-block");
				$('.id_check_1').css("display","inline-block");
			}
		}
	});
});// function 종료 */
</script>

</body>
</html>