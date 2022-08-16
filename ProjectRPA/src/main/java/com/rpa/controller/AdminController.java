package com.rpa.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/admin")
@Log4j
public class AdminController {
	
	@GetMapping("/main")
	public void adminMain() throws Exception{
		log.info("관리자 메인페이지로 이동");
	}

}
