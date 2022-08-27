package com.rpa.order.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.rpa.order.domain.OrderDto;
import com.rpa.order.domain.OrderPageDto;
import com.rpa.order.service.OrderService;
import com.rpa.user.domain.UserDTO;
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
		
		log.info("주문 페이지 진입 GETㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
		
		model.addAttribute("orderList", orderService.getGoodsInfo(opd.getOrders()));
		model.addAttribute("userInfo", userService.getUserInfo(id));
		
		return "/order/order";
	}//orderPgaeGET
	
	@PostMapping("/order")
	public String orderPagePost(OrderDto od, HttpServletRequest request) {
		
		log.info("주문 페이지 진입 POSTㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");

		orderService.order(od);
		log.info("주문 페이지 진입 POST2222ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
		
		/* View에서 login_area 부분 정보 업데이트 위해서*/
		UserDTO user = new UserDTO();
		user.setId(od.getId());
		log.info("주문 페이지 진입 POST3333ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
		
		HttpSession session = request.getSession();
		
		try {
			UserDTO login = userService.userLogin(user);
			login.setPw("");
			session.setAttribute("user", login);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/main";
	}
}//OrderController
