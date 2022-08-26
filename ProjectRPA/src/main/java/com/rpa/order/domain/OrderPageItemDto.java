package com.rpa.order.domain;

import lombok.Data;

//상품 data를 담을 DTO
@Data
public class OrderPageItemDto {
	
	//view로부터 전달 받을 값
	private Long goods_swId; //상품id
	private int goods_sw_Count; // 주문한 상품의 수량
	
	//db로부터 가져올 값
	private String goods_swName;
    private int goods_swPrice;
    private double goods_swDiscount;
    
    //만들어 낼 값
    private int salePrice; 
    private int totalPrice;
    private int point;
    private int totalPoint;
    
    //만들어 낼 값 초기화
    public void initSaleTotal() {
		this.salePrice = (int) (this.goods_swPrice * (1-this.goods_swDiscount) );
		this.totalPrice = this.salePrice*this.goods_sw_Count;
		this.point = (int)(Math.floor(this.salePrice*0.05)); //판매가의 5%
		this.totalPoint =this.point * this.goods_sw_Count;
	}
    
    
    
}
