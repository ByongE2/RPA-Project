package com.rpa.order.domain;

import lombok.Data;

@Data
public class OrderItemDto {
	
	private String orderId; //주문 번호
    private Long goods_swId; //상품 번호
    private int goods_sw_Count; //주문 수량
    private Long orderItemId; //rpa_orderItem 기본키
    private int goods_swPrice; //상품 한 개 가격
    private double goods_swDiscount; //상품 할인 율
    private int savePoint; //상품 한개 구매 시 획득 포인트

    /* DB테이블에 존재 하지 않는 데이터 */
    private int salePrice; //할인 적용된 가격
    private int totalPrice; //총 가격(할인 적용된 가격 * 주문 수량)
    private int totalSavePoint; //총 획득 포인트(상품 한개 구매 시 획득 포인트 * 수량)
    
    //초기화
	public void initSaleTotal() {
		this.salePrice = (int) (this.goods_swPrice * (1-this.goods_swDiscount));
		this.totalPrice = this.salePrice*this.goods_sw_Count;
		this.savePoint = (int)(Math.floor(this.salePrice*0.05));
		this.totalSavePoint =this.savePoint * this.goods_sw_Count;
	}
	
}
