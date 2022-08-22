package com.rpa.goods.sportswear.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rpa.goods.sportswear.domain.SwCartDto;
import com.rpa.goods.sportswear.mapper.SwCartMapper;

@Service
public class SwCartServiceImpl implements SwCartService{
	
	@Autowired
	private SwCartMapper cartMapper;
	
	// 등록
	@Override
	public int addCart(SwCartDto cart){
		// 장바구니 데이터 체크
		SwCartDto checkCart = cartMapper.checkCart(cart);
		
		if(checkCart != null) {
			return 2; //등록된 데이터 존재
		}
		// 장바구니 등록 & 에러 시 0반환
		try {
			return cartMapper.addCart(cart);
		} catch (Exception e) {
			return 0;
		}
	}//addCart
	

}//SwCartServiceImpl
