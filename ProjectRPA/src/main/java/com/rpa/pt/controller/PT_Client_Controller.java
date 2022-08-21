package com.rpa.pt.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.rpa.pt.domain.Pt_Goods_DTO;
import com.rpa.pt.domain.Pt_Goods_basket_DTO;
import com.rpa.pt.service.Pt_Goods_Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/ptclient/*")
public class PT_Client_Controller {
	private Pt_Goods_Service service;
	
	@GetMapping("/clientlist")
	public void list(Model model) {
		log.info("list로 넘어옴");
		model.addAttribute("client",service.getlist());
	}
	
	@GetMapping("/clientget")
	public void clientget(int client_no,Model model) {
		log.info(client_no+"번 쨰 클라이언트 상품");
		model.addAttribute("clinet_no",service.pt_get(client_no));
	}
	@GetMapping("/basket")
	public void clientbasketview(String client_id,Model model) {
		System.out.println("아이디 : "+client_id);
		model.addAttribute("basket",service.clientBasketView(client_id));
	}
	
	
	@GetMapping("/basketinsert")
	public String clientbasketinsert(Pt_Goods_basket_DTO dto,int client_no) {
		service.clientBasketinsert(dto);
		return "ptclient/clientget?client_no="+client_no;
	}
	
	@GetMapping("/basketdelete")
	public String clientbasketDelete(String PT_code,String client_id) {
		service.clientBasketDelete(PT_code);
		return "redirect:/ptclient/basket?client_id="+client_id;
	}
	
}
