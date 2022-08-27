package com.rpa.order.service;

import java.util.List;

import com.rpa.order.domain.OrderDto;
import com.rpa.order.domain.OrderPageItemDto;

public interface OrderService {

	/* 주문 정보 */
	List<OrderPageItemDto> getGoodsInfo(List<OrderPageItemDto> orders);
	
	/* 주문 */
	void  order(OrderDto ord); 
	
}
