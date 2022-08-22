package com.rpa.goods.sportswear.mapper;

import java.util.List;

import com.rpa.goods.sportswear.domain.SwCartDto;

public interface swCartMapper {
	
	/* 카트 추가 */
	public int addCart(SwCartDto cart);
	
	/* 카트 삭제 */
	public int deleteCart(Long cartId);
	
	/* 카트 수량 수정 */
	public int modifyCount(SwCartDto cart);
	
	/* 카트 목록 */
	public List<SwCartDto> getCart(String memberId);	
	
	/* 카트 확인 */
	public SwCartDto checkCart(SwCartDto cart);
	
}
