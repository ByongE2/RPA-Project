package com.rpa.user.controller;

import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.rpa.user.domain.UserDTO;
import com.rpa.user.service.UserService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/user")
@Log4j
public class UserControllerImpl implements UserController {
	
	@Autowired
	private UserService userService;
	@Autowired
	private JavaMailSender mailSender;
	
	/*@Autowired로는 빈 등록해도 빈을 찾을 수 없다는 에러가남..*/
	@Bean
	BCryptPasswordEncoder pwEncoder() {
		return new BCryptPasswordEncoder();
	}
	
	/* 회원가입 */
	@Override
	@GetMapping("/join")
	public void joinGET() {
		log.info("회원가입 페이지 진입 GETㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
	}//joinGET
	
	@Override
	@PostMapping("/join")
	public String joinPOST(UserDTO user) throws Exception{
		
		log.info("회원가입 페이지 진입 POSTㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
		
		userService.userJoin(user);
		
		return "redirect:/main";
	}//joinPOST
	
	/* 회원 가입 시 아이디 중복 검사 , 비동기 방식*/
	@Override
	@PostMapping("/userIdChk")
	@ResponseBody
	public String userIDCheckPOST(String id) throws Exception{
		
		int result = userService.userIDCheck(id);
		
		if(result != 0) {
			return "fail";	// 중복 아이디가 존재
		} else {
			return "success";	// 중복 아이디 x
		}		
	} // userIDCheckPOST()
	
	/* 회원 가입 시 이메일 인증 */
	@Override
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
	
	/* 로그인 페이지 */
	@Override
	@GetMapping("/login")
	public void loginGET() {
		
		log.info("로그인 페이지 진입ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
		
	}//loginGET
	
	@Override
	@PostMapping("/login")
	public String loginPOST(HttpServletRequest request, UserDTO user, RedirectAttributes rttr) throws Exception{
		
		HttpSession session = request.getSession();
		String rawPw = "";		//인코딩 전 비밀번호
		String encodePw = "";	//인코딩 후 비밀번호
	
		UserDTO loginDto = userService.userLogin(user);	// 입력받은 아이디 일치하는 지 체크(id만 먼저)
		
		/*id 일치여부 체크하고 > 인코딩된 비밀번호 체크 순서*/
		if(loginDto != null) {											//1 일치하는 아이디 존재시
			
			rawPw = user.getPw();			// 사용자가 제출한 비밀번호 
			encodePw = loginDto.getPw();	// 데이터베이스에 저장된 인코딩된 비밀번호 
					
					//pwEncoder : BCryptPasswordEncoder 타입
			if(true == pwEncoder().matches(rawPw, encodePw)) {			//1-1 비밀번호 일치하면,
				
				loginDto.setPw("");						// loginDto에서 인코딩된 비밀번호 정보 지움
				session.setAttribute("user", loginDto); // session에 사용자의 정보 저장

				return "redirect:/main"; // 로그인 성공 메인페이지 이동
			} else {													//1-2 비밀번호 불일치하면,
				rttr.addFlashAttribute("result", 0);//0:실패 1:성공			
				return "redirect:/user/login";	
			}
		} else {														//2 일치하는 아이디가 존재하지 않을 시 (로그인 실패)
			rttr.addFlashAttribute("result", 0);			
			return "redirect:/user/login";	
		}
	}//loginPOST
	
    /* 메인페이지 로그아웃 */
    @Override
	@GetMapping("/logout")
    public String logoutMainGET(HttpServletRequest request) throws Exception{
        
        log.info("로그아웃 메서드(logoutMainGET) 실행 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
        
        HttpSession session = request.getSession();
        
        session.invalidate();
        
        return "redirect:/main";        
    }//logoutMainGET
	
	/* 비동기방식 로그아웃 메서드 */
    @Override
	@PostMapping("/logout")
    @ResponseBody
    public void logoutPOST(HttpServletRequest request) throws Exception{
    	
    	log.info("비동기 로그아웃 메서드 진입");
    	
    	HttpSession session = request.getSession();
    	
    	session.invalidate();
    }//logoutPOST
	
}//UserController