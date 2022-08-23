package com.rpa.order.mapper;

import com.rpa.order.domain.OrderPageItemDto;

public interface OrderMapper {

	/* 주문 상품 정보 */	
	public OrderPageItemDto getGoodsInfo(Long swID);
	
}
