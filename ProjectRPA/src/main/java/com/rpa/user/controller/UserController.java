package com.rpa.user.controller;

import java.util.Random;

import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rpa.user.domain.UserDTO;
import com.rpa.user.service.UserService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/user")
@Log4j
public class UserController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private JavaMailSender mailSender;
	
	//회원가입
	@GetMapping("/join")
	public void joinGET() {
		log.info("회원가입 페이지 진입 GETㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
	}//joinGET
	
	@PostMapping("/join")
	public String joinPOST(UserDTO user) throws Exception{
		
		log.info("회원가입 페이지 진입 POSTㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
		
		userService.userJoin(user);
		
		return "redirect:/main";
	}//joinPOST
	
	//로그인 페이지 이동
	@GetMapping("/login")
	public void loginGET() {
		
		log.info("로그인 페이지 진입ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
		
	}//loginGET
	
	// 아이디 중복 검사
	@PostMapping("/userIdChk")
	@ResponseBody
	public String userIDCheckPOST(String id) throws Exception{
		
		/* logger.info("memberIdChk() 진입"); */
		
		log.info("아이디 체크 페이지 진입ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
		
		int result = userService.userIDCheck(id);
		
		if(result != 0) {
			
			return "fail";	// 중복 아이디가 존재
			
		} else {
			
			return "success";	// 중복 아이디 x
		}		
	} // userIDCheckPOST()
	
	/* 이메일 인증 */
	@GetMapping("/mailCheck")
	@ResponseBody
	public String mailCheckGET(String email) throws Exception{
		
		/* 뷰(View)로부터 넘어온 데이터 확인 */
		log.info("이메일 데이터 전송 확인");
		log.info("이메일 : " + email);
				
		/* 인증번호(난수) 생성 */
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;
		log.info("인증번호 " + checkNum);
		
		/* 이메일 보내기 */
		String setFrom = "kbh25962@naver.com";  //root-context의 관리자 이메일
		String toMail = email;
		String title = "RPA Fitness 회원가입 인증 이메일 입니다.";
		String content = 
				"Welcome RPA Fitness" +
				"<br><br>" + 
				"인증 번호는 " + checkNum + "입니다." + 
				"<br>" + 
				"해당 인증번호를 인증번호 확인란에 기입하여 주세요.";		
		try {
			/*이메일 전송 코드*/
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content,true);
			mailSender.send(message);
			
		}catch(Exception e) {
			e.printStackTrace();
		}		
		
		String num = Integer.toString(checkNum);
		
		return num;
	}//mailCheckGET
	
}//UserController