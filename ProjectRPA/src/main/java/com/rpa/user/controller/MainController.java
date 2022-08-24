package com.rpa.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class MainController {

	@GetMapping("/main")
	public void mainPageGET() {
		
		log.info("메인 페이지 진입ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
	}//mainPageGET
}//MainController
