package com.rpa.board.controller.user;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.rap.board.mapper.UserMapper;
import com.rpa.board.domain.UserVO;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class JoinCheckController {
	@Autowired
	private UserMapper mapper;
	
	@GetMapping("/idCheck.do")
	public String idCheck(UserVO vo, Model model, HttpSession session) {
		log.info("------- idCheckPage ---------");
		System.out.println(vo);
		
		UserVO user = new UserVO();
		int result = 0;
		user = mapper.getId(vo);
		
		if(user != null) {
			result = user.getUserNum();
		}
		
		model.addAttribute("userId", vo.getUserId());
		model.addAttribute("result", result);
		return "users/userIncludes/idCheck";
	}
	
	@GetMapping("/nickNameCheck.do")
	public String nickName(UserVO vo, Model model, HttpSession session) {
		log.info("------- nickNameCheckPage ---------");
		System.out.println(vo);
		
		UserVO user = new UserVO();
		int result = 0;
		user = mapper.getNickName(vo);
		
		if(user != null) {
			result = user.getUserNum();
		}
		
		model.addAttribute("nickName", vo.getNickName());
		model.addAttribute("result", result);
		return "users/userIncludes/nicknameCheck";
	}

}