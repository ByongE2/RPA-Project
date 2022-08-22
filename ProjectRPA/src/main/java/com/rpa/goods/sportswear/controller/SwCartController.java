package com.rpa.goods.sportswear.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rpa.goods.sportswear.domain.SwCartDto;
import com.rpa.goods.sportswear.service.SwCartService;
import com.rpa.user.domain.UserDTO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
public class SwCartController {
	
	private SwCartService cartService;

	//(0 : 등록 실패 / 1 : 등록 성공 / 2 : 등록된 데이터 존재 / 5 : 로그인 필요)
	
	// 장바구니 등록
	@PostMapping("/cart/add")
	@ResponseBody
	public String addCartPOST(SwCartDto cart, HttpServletRequest request) {
		
		// 로그인 체크
		HttpSession session = request.getSession();
		UserDTO uDto = (UserDTO)session.getAttribute("user");
		if(uDto == null) {
			return "5";
		}
		// 카트 등록
		int result = cartService.addCart(cart);
		
		return result + "";
	}//addCartPOST
	
}//SwCartController
