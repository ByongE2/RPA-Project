package com.rpa.pt.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.rpa.pt.domain.Pt_Goods_DTO;
import com.rpa.pt.service.Pt_Goods_Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/ptproduct/*")
public class PT_Goods_Controller {
	private Pt_Goods_Service service;
	
	//글쓰기
	@RequestMapping(value = "/ptregister", method = RequestMethod.POST)
	public String ptregister(Pt_Goods_DTO dto, RedirectAttributes rttr) {
		log.info("관리자 글쓰기에 들어옴"+dto);
		service.Ptregister(dto);
		rttr.addFlashAttribute("result",dto.getPT_no());
		
		
		return "redirect:/ptproduct/list";
	}
	
	@GetMapping("/ptregister")
	public void ptregister() {
		
	}
	
	@GetMapping("/list")
	public void list(Model model) {
		log.info("list로 넘어옴");
		model.addAttribute("list",service.getlist());
	}
	

}
