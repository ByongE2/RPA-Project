package com.rpa.order.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.rpa.order.domain.OrderPageDto;
import com.rpa.order.service.OrderService;
import com.rpa.user.service.UserService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class OrderController {

	@Autowired
	private OrderService orderService;
	@Autowired
	private UserService userService;
	
	@GetMapping("/order/{id}")
	public String orderPgaeGET(@PathVariable("id") String id, OrderPageDto opd, Model model) {
		
		log.info("주문 페이지 진입 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
		
		model.addAttribute("orderList", orderService.getGoodsInfo(opd.getOrders()));
		model.addAttribute("userInfo", userService.getUserInfo(id));
		
		return "/order/order";
	}//orderPgaeGET
}//OrderController
