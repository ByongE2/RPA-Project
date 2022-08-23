package com.rpa.order.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.rpa.order.domain.OrderPageDto;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@AllArgsConstructor
@Log4j
public class OrderController {

	@GetMapping("/order/{id}")
	public void orderPgaeGET(@PathVariable("id") String id, OrderPageDto opd, Model model) {
		
		System.out.println("userID : " + id);
		System.out.println("orders : " + opd.getOrders());
		
	}
}
