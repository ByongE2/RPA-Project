package com.rpa.goods.sportswear.service;

import java.util.List;

import com.rpa.goods.sportswear.domain.SwCartDto;

public interface SwCartService {
	
	//카트 추가
	public int addCart(SwCartDto cart);
	//장바구니 정보 리스트 
	public List<SwCartDto> getCartList(String id);
	//카트 수량 수정
	public int modifyCount(SwCartDto cart);
	//카트 삭제
	public int deleteCart(Long cartId);

}
