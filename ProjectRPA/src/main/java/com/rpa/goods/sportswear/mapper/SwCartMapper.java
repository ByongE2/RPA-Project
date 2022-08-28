package com.rpa.goods.sportswear.mapper;

import java.util.List;

import com.rpa.goods.sportswear.domain.SwCartDto;

// 뷰는 숫자를 반환 받도록 한다. (0 : 등록 실패 / 1 : 등록 성공 / 2 : 등록된 데이터 존재 / 5 : 로그인 필요
public interface SwCartMapper {
	
	/* 카트 추가 */
	public int addCart(SwCartDto cart) throws Exception;
	
	/* 카트 삭제 */
	public int deleteCart(Long cartId);
	
	/* 카트 수량 수정 */
	public int modifyCount(SwCartDto cart);
	
	/* 카트 목록 */
	public List<SwCartDto> getCart(String id);	
	
	/* 카트 확인 */
	public SwCartDto checkCart(SwCartDto cart);
	
	/* 카트 제거(주문) */
	//장바구니에서 주문한 경우, '주문 상품에 대한' '장바구니 상품 정보' 삭제하는 메서드.
	int deleteOrderCart(SwCartDto dto);
	
}
