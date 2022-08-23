package com.rpa.goods.sportswear.mapper;

import java.util.List;

import com.rpa.goods.sportswear.domain.SwCartDto;

// 뷰는 숫자를 반환 받도록 한다. (0 : 등록 실패 / 1 : 등록 성공 / 2 : 등록된 데이터 존재 / 5 : 로그인 필요
public interface SwCartMapper {
	
	/* 카트 추가 */
	public int addCart(SwCartDto cart) throws Exception;
	
	/* 카트 삭제 */
	public int deleteCart(Long cartId) throws Exception;
	
	/* 카트 수량 수정 */
	public int modifyCount(SwCartDto cart) throws Exception;
	
	/* 카트 목록 */
	public List<SwCartDto> getCart(String memberId) throws Exception;	
	
	/* 카트 확인 */
	public SwCartDto checkCart(SwCartDto cart);
	
}