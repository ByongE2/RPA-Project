package com.rpa.goods.sportswear.domain;

import lombok.Data;
import lombok.Getter;
import lombok.ToString;

//롬복 @data 사용x ->  salePrice와 totalPrice의 Setter 메서드를 생성 안하기 위해서.(변화는 하나의 메서드만으로 하게 끔 하려고)
@Getter
@ToString
public class SwCartDto {
	
	public void setGoods_cartId(Long goods_cartId) {
		this.goods_cartId = goods_cartId;
	}
	public void setId(String id) {
		this.id = id;
	}
	public void setGoods_swID(Long goods_swID) {
		this.goods_swID = goods_swID;
	}
	public void setGoods_sw_Count(int goods_sw_Count) {
		this.goods_sw_Count = goods_sw_Count;
	}
	public void setGoods_swName(String goods_swName) {
		this.goods_swName = goods_swName;
	}
	public void setGoods_swPrice(int goods_swPrice) {
		this.goods_swPrice = goods_swPrice;
	}
	public void setGoods_swDiscount(double goods_swDiscount) {
		this.goods_swDiscount = goods_swDiscount;
	}
	private Long goods_cartId;
	
	private String id;//member id
    private Long goods_swID;
    private int goods_sw_Count;
    //SportswearDto
    private String goods_swName;
    private int goods_swPrice;
    private double goods_swDiscount;
    // 추가 
    private int salePrice; //할인 적용된 '하나'의 상품 '판매 가격'
    private int totalPrice;// salePrice * 수량 : 총 가격
    
    //salePrice, totalPrice 초기화 메서드. 
    public void initSaleTotal() {
		this.salePrice = (int) (this.goods_swPrice * (1-this.goods_swDiscount));
		this.totalPrice = this.salePrice*this.goods_sw_Count;
	}
	public int getSalePrice() {
		return salePrice;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
}