package com.rpa.admin.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/admin")
@Log4j
public class AdminInterceptorController {
	
	@GetMapping("/main")
	public String adminMain() throws Exception{
		log.info("관리자 메인페이지로 이동");
		return "admin/adminMain";
	}
}
