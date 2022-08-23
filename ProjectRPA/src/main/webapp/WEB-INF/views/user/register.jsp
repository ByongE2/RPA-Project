<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/CSS/register.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
<div class="wrapper">
	<div class="content">
		<h1><a href="/mainTEST">Register</a></h1>
	<form id="join_form" method="post" name="frm">
		<div>
			<h3 class="title">
				<label for="id">아이디</label>
			</h3>
			<div class="box_id">
				<input type="text" id="id_input" name="id" maxlength="20" class="p">
				<!-- <input type="hidden" name="reid" size="20"> -->
				<!-- <button type="button" id="btnCheck" class="btn btn-default">중복확인</button> -->
				<span id="result"></span>
			</div>
					<span class="id_check_1">사용 가능한 아이디입니다.</span>
					<span class="id_check_2">아이디가 이미 존재합니다.</span>
				<span class="final_id_ck">아이디를 입력해주세요.</span>	
			</div>		
		
		<div>
			<h3 class="title">
				<label for="pwd">비밀번호</label>
			</h3>
			<div class="box_pass">
				<input type="password" id="pw_input" name="pw" maxlength="20" class="p">
			</div>
			<span class="final_pw_ck">비밀번호를 입력해주세요.</span>
		</div>
		
		<div>
			<h3 class="title">
				<label id="pwd_check">비밀번호 재확인</label>
			</h3>
			<div class="box_passCheck">
				<input type="password" id="pwck_input" name="pw2" maxlength="20" class="p">
			</div>
			<span class="final_pwck_ck">비밀번호 확인을 입력해주세요.</span>
			<span class="pwck_input_re_1">비밀번호가 일치합니다.</span>
            <span class="pwck_input_re_2">비밀번호가 일치하지 않습니다.</span>
		</div>
		
		<div>
			<h3 class="title">
				<label for="name">이름</label>
			</h3>
			<div class="box_name">
				<input type="text" id="name_input" name="name" maxlength="20" class="p">
			</div>
			<span class="final_name_ck">이름을 입력해주세요.</span>
		</div>
		
		<div>
			<h3 class="title">
				<label for="phone">휴대전화</label>
			</h3>
			<div class="box_phone">
				<input type="text" id="phone_input" name="phone" maxlength="13" placeholder="-까지 입력해주세요." class="p">
			</div>
			<span class="final_phone_ck">휴대전화 번호를 입력해주세요.</span>
		</div>
		
		<div>
			<h3 class="title">
				<label for="address">주소</label>
				<button type="button" onclick="execution_daum_address()">주소검색</button>
			</h3>
			<div class="box_address">
				<input type="text" id="address1" name="address" required="required" readonly="readonly" class="p">
				<input type="text" id="address2"  required="required" readonly="readonly" class="p">
			</div>
			<span class="final_addr_ck">주소를 입력해주세요.</span>
		</div>
		
		<div>
			<h3 class="title">
				<label for="email">이메일</label>
			</h3>
			<div class="box_email">
				<input type="text" id="email_input" name="email" maxlength="30" class="p">
			</div>
			<span class="final_email_ck">이메일을 입력해주세요.</span>
		</div>
		
		<br><br>
		<div class="join" align="center">
			<!-- <button type="button" id="register" class="submit">가입하기</button> -->
			<input type="button" id="register" class="submit" value="가입하기">
			<!-- <input type="submit" id="register" class="submit" value="가입하기"> -->
		</div>
	</form>
</div>
</div>






<script type="text/javascript">

/* 유효성 검사 통과유무 변수 */
var idCheck = false;            // 아이디
var idckCheck = false;            // 아이디 중복 검사
var pwCheck = false;            // 비번
var pwckCheck = false;            // 비번 확인
var pwckcorCheck = false;        // 비번 확인 일치 확인
var nameCheck = false;            // 이름
var phoneCheck = false;            // 전화번호
var emailCheck = false;            // 이메일
var addressCheck = false         // 주소

$(document).ready(function(){
	//회원가입 버튼(회원가입 기능 작동)
	$(".submit").click(function(){
		
		/* 입력값 변수 */
        var id = $('#id_input').val();                // id 입력란
        var pw = $('#pw_input').val();                // 비밀번호 입력란
        var pwck = $('#pwck_input').val();            // 비밀번호 확인 입력란
        var name = $('#name_input').val();            // 이름 입력란
        var phone = $('#phone_input').val();          // 이메일 입력란
        var email = $('#email_input').val();          // 이메일 입력란
        var addr = $('#address1').val();        	  // 주소 입력란
        
        /* 아이디 유효성검사 */
        if(id == ""){
            $('.final_id_ck').css('display','block');
            idCheck = false;
        }else{
            $('.final_id_ck').css('display', 'none');
            idCheck = true;
        }
        
        /* 비밀번호 유효성 검사 */
        if(pw == ""){
            $('.final_pw_ck').css('display','block');
            pwCheck = false;
        }else{
            $('.final_pw_ck').css('display', 'none');
            pwCheck = true;
        }
        
        /* 비밀번호 확인 유효성 검사 */
        if(pwck == ""){
            $('.final_pwck_ck').css('display','block');
            pwckCheck = false;
        }else{
            $('.final_pwck_ck').css('display', 'none');
            pwckCheck = true;
        }
        
        /* 이름 유효성 검사 */
        if(name == ""){
            $('.final_name_ck').css('display','block');
            nameCheck = false;
        }else{
            $('.final_name_ck').css('display', 'none');
            nameCheck = true;
        }
        
        /* 휴대전화 유효성 검사 */
        if(phone == ""){
            $('.final_phone_ck').css('display','block');
            phoneCheck = false;
        }else{
            $('.final_phone_ck').css('display', 'none');
            phoneCheck = true;
        }
        
        /* 이메일 유효성 검사 */
        if(email == ""){
            $('.final_email_ck').css('display','block');
            emailCheck = false;
        }else{
            $('.final_email_ck').css('display', 'none');
            emailCheck = true;
        }
        
        /* 주소 유효성 검사 */
        if(addr == ""){
            $('.final_addr_ck').css('display','block');
            addressCheck = false;
        }else{
            $('.final_addr_ck').css('display', 'none');
            addressCheck = true;
        }
        
        /* 최종 유효성 검사 */
        if(idCheck&&idckCheck&&pwCheck&&pwckCheck&&pwckcorCheck&&nameCheck&&phoneCheck&&emailCheck&&addressCheck ){
 
			$("#join_form").attr("action","/user/register");
			$("#join_form").submit();
        }
        return false;
		
	});
});

$('#id_input').on("propertychange change keyup paste input", function(){
	console.log("test")
	
	var id = $('#id_input').val();			// .id_input에 입력되는 값
	var data = {id : id}				// '컨트롤에 넘길 데이터 이름' : '데이터(.id_input에 입력되는 값)'
	
	$.ajax({
		type : "post",
		url : "/user/registerIdChk",
		data : data,
		success : function(result){
			console.log("성공여부 : " + result);
			if(result != 'fail'){
				$('.id_check_1').css("display", "inline-block");
				$('.id_check_2').css("display", "none");
				idckCheck = true;
			}else{
				$('.id_check_2').css("display", "inline-block");
				$('.id_check_1').css("display", "none");
				idckCheck = false;
			}
		}// success
		
	}); // ajax 종료
	
});

$('#pwck_input').on("propertychange change keyup paste input", function(){
	 var pw = $('#pw_input').val();
     var pwck = $('#pwck_input').val();
     $('.final_pwck_ck').css('display', 'none');
     
     if(pw == pwck){
         $('.pwck_input_re_1').css('display','block');
         $('.pwck_input_re_2').css('display','none');
         pwckcorCheck = true;
     }else{
         $('.pwck_input_re_1').css('display','none');
         $('.pwck_input_re_2').css('display','block');
         pwckcorCheck = false;
     }        
    
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