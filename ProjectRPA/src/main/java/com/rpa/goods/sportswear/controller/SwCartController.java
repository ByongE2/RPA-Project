package com.rpa.goods.sportswear.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
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
	
	// 카트 등록
	@PostMapping("/goods/sportswear/cart/add")
	@ResponseBody
	public String addCartPOST(SwCartDto cart, HttpServletRequest request) {
		
		// 로그인 체크
		HttpSession session = request.getSession();
		UserDTO uDto = (UserDTO)session.getAttribute("user");
		System.out.println("dDto ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ비포:" + uDto);
		if(uDto == null) {
			return "5";
		}
		// 카트 등록
		System.out.println("dDto ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ:에프터" + uDto);
		System.out.println("cart ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ:에프터" + cart);
		System.out.println("cart 아이디ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ:에프터" + cart.getId());
		System.out.println("cart 상품아이디ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ:에프터" + cart.getGoods_swID());
		System.out.println("cart 상품 갯수ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ:에프터" + cart.getGoods_sw_Count());
		int result = cartService.addCart(cart);
		
		return result + "";
	}//addCartPOST
	
	// 카트 목록 리스트
	@GetMapping("/goods/sportswear/cart/{id}")
	public String cartPageGET(@PathVariable("id") String id, Model model) {
		
		model.addAttribute("cartInfo", cartService.getCartList(id));
		
		return "/Goods/sportswear/swCart";
	}//cartPageGET

	// 카트 수량 수정
	@PostMapping("/goods/sportswear/cart/update")
	public String updateCartPOST(SwCartDto cart) {
		
		cartService.modifyCount(cart);
		
		return "redirect:/goods/sportswear/cart/" + cart.getId();
	}//updateCartPOST
	
	// 카트 삭제
	/* 장바구니 수량 수정 */
	@PostMapping("/goods/sportswear/cart/delete")
	public String deleteCartPOST(SwCartDto cart) {
		
		cartService.deleteCart(cart.getGoods_cartId());
		
		return "redirect:/goods/sportswear/cart/" + cart.getId();
	}//deleteCartPOST
	
}//SwCartController
