package com.rpa.order.mapper;

import java.util.List;

import com.rpa.goods.sportswear.domain.SportswearDto;
import com.rpa.goods.sportswear.domain.SwCartDto;
import com.rpa.order.domain.OrderDto;
import com.rpa.order.domain.OrderItemDto;
import com.rpa.order.domain.OrderPageItemDto;
import com.rpa.user.domain.UserDTO;

public interface OrderMapper {

	/* 주문 상품 정보(주문 페이지)*/	
	OrderPageItemDto getGoodsInfo(Long swID);
	
	/* 주문 상품 정보(주문 처리) */	
	OrderItemDto getOrderInfo(Long swID);
	/* 주문 테이블(rpa_order) 등록 */
	int enrollOrder(OrderDto ord);
	/* 주문 아이템 테이블(rpa_orderItem) 등록 */
	int enrollOrderItem(OrderItemDto orid);
	/* 주문 금액 차감 */
	int deductMoney(UserDTO user);
	/* 주문 재고 차감 */
	int deductStock(SportswearDto sw);
	
	/* 주문 취소 */
	int orderCancle(String orderId);
	/* 주문 상품 정보(주문취소) */
	List<OrderItemDto> getOrderItemInfo(String orderId);
	/* 주문 정보(주문취소) */
	OrderDto getOrder(String orderId);
	
}
