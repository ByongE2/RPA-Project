package com.rpa.goods.sportswear.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rpa.goods.sportswear.domain.SwCartDto;

public interface SwCartController {

	// 카트 등록
	String addCartPOST(SwCartDto cart, HttpServletRequest request);//addCartPOST

	// 카트 목록
	String cartPageGET(String id, Model model);//cartPageGET

	// 카트 수정
	String updateCartPOST(SwCartDto cart);//updateCartPOST

	// 카트 삭제
	String deleteCartPOST(SwCartDto cart);

}