package com.rpa.order.domain;

import java.sql.Date;
import java.util.List;

import lombok.Data;

@Data
public class OrderDto {

	private String orderId; //주문 번호
	private String addressee; //배송 받는이
	private String id; //주문 회원 아이디
	private String memberAddr1; //우편번호
	private String memberAddr2; //회원 주소
	private String memberAddr3; //회원 상세주소
	private String orderState; //주문 상태
	private List<OrderItemDto> orders; //주문 상품	
	private int deliveryCost; //배송비
	private int usePoint; //사용 포인트
	private Date orderDate; //주문 날짜
	
	/* DB테이블 존재 하지 않는 데이터 */
	private int orderSalePrice; //판매가(모든 상품 비용)
	private int orderSavePoint; //적립 포인트
	private int orderFinalSalePrice; //최종 판매 비용
	
	//
	public void getOrderPriceInfo() {
		/* 상품 비용 & 적립포인트 */
			for(OrderItemDto order : orders) {
				orderSalePrice += order.getTotalPrice();
				orderSavePoint += order.getTotalSavePoint();
			}
		/* 배송비용 */
			if(orderSalePrice >= 30000) {
				deliveryCost = 0;
			} else {
				deliveryCost = 3000;
			}
		/* 최종 비용(상품 비용 + 배송비 - 사용 포인트) */
			orderFinalSalePrice = orderSalePrice + deliveryCost - usePoint;
	}//getOrderPriceInfo
	
}//OrderDto
