package com.rpa.goods.sportswear.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rpa.goods.sportswear.domain.AttachImageVO;
import com.rpa.goods.sportswear.domain.SwCartDto;
import com.rpa.goods.sportswear.mapper.AttachMapper;
import com.rpa.goods.sportswear.mapper.SwCartMapper;

@Service
public class SwCartServiceImpl implements SwCartService{
	
	@Autowired
	private SwCartMapper cartMapper;
	
	@Autowired
	private AttachMapper attachMapper;
	
	// 카트 추가
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
	
	// 카트 데이터 리스트
	@Override
	public List<SwCartDto> getCartList(String id) {
		List<SwCartDto> cart = cartMapper.getCart(id);
		
		for(SwCartDto dto : cart) {
			// 종합 정보 초기화
			dto.initSaleTotal();
			//이미지 정보 가져오기
			Long swID = dto.getGoods_swID();
			
			List<AttachImageVO> imageList = attachMapper.getAttachList(swID);
			
			dto.setImageList(imageList);
		}
		return cart;
	}//getCartList
	
	//카트 수량 수정
	@Override
	public int modifyCount(SwCartDto cart) {
		
		return cartMapper.modifyCount(cart);
		
	}//modifyCount
	
	//카트 삭제
	@Override
	public int deleteCart(Long cartId) {
		
		return cartMapper.deleteCart(cartId);
	}//deleteCart
	

}//SwCartServiceImpl
