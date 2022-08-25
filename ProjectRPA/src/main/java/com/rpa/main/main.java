package com.rpa.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.rpa.pt.controller.PT_Client_Controller;
import com.rpa.pt.service.Pt_Goods_Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/main/*")
public class main {
	
	@GetMapping("/main")
	public void main() {
		log.info("메인");
	}
}
