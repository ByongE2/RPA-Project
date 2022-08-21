package com.rpa.board.controller.user;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class LogoutController {
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		log.info("------- logout ---------");
		return "redirect:/home.do";
	}
}