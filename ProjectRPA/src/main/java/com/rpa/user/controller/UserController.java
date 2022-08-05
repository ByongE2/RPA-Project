package com.rpa.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.rpa.user.domain.UserDTO;
import com.rpa.user.service.UserService;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/user/*")
@AllArgsConstructor
public class UserController {

	private static final Logger log = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	private UserService service;
	
	@GetMapping("/login")
	public void login() {
		log.info("로그인 페이지");
	}
	
	@GetMapping("/register")
	public void register() {
		log.info("회원가입 페이지");
	}
	
	
	@PostMapping("/register")
	public String register(UserDTO user) throws Exception {
		service.userJoin(user);
		log.info("register success");
		
		return "redirect:/mainTEST";
	}
	
	@RequestMapping(value = "/registerIdChk", method = RequestMethod.POST)
	@ResponseBody
	public String registerIDCheck(String id) throws Exception {
		log.info("idCheckt");
		
		int result = service.userIDCheck(id);
		
		log.info("결과 : " + result);
		
		if(result != 0) {
			return "fail"; //중복아이디 존재
		}else {
			return "success"; //중복아이디 없음
		}
	}
	
	@PostMapping("/login")
	public String login(HttpServletRequest request, UserDTO user, RedirectAttributes rttr) throws Exception {
		
		HttpSession session = request.getSession();
		UserDTO login = service.userLogin(user);
		
		if(login == null) {
			session.setAttribute("user", null);
			rttr.addFlashAttribute("msg", false);
		}else {
			session.setAttribute("user", login);
		}
		return "redirect:/mainTEST";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) throws Exception {
		
		session.invalidate();
		
		return "redirect:/user/login";
	}
	
	
}
