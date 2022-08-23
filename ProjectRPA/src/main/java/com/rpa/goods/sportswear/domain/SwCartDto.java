package com.rpa.goods.sportswear.domain;

import java.util.List;

import lombok.Data;
import lombok.Getter;
import lombok.ToString;

//롬복 @data 사용x ->  추가 : salePrice, totalPrice, point, totalPoint의 
//					Setter 메서드를 생성 안하기 위해서.(변화는 initSaleTotal 메서드만으로 하게 끔 하려고)
@Getter
@ToString
public class SwCartDto {
	

	private Long goods_cartId;
	
	private String id;//member id
    private Long goods_swID;
    private int goods_sw_Count;
    //SportswearDto
    private String goods_swName;
    private int goods_swPrice;
    private double goods_swDiscount;
    // 추가 , 가격
    private int salePrice; //할인 적용된 '하나'의 상품 '판매 가격'
    private int totalPrice;// salePrice * 수량 : 총 가격
    // 추가2 ,포인트
    private int point; //상품 한개에서 받을 수 있는 포인트
    private int totalPoint; //
    //상품 이미지
    private List<AttachImageVO> imageList;
    
    
    
    // 추가 초기화 메서드. 
    public void initSaleTotal() {
    	//salePrice, totalPrice
		this.salePrice = (int) (this.goods_swPrice * (1-this.goods_swDiscount));
		this.totalPrice = this.salePrice*this.goods_sw_Count;
		//point, totalPoint
		this.point = (int)(Math.floor(this.salePrice*0.05));
		this.totalPoint =this.point * this.goods_sw_Count;
	}

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
	public void setImageList(List<AttachImageVO> imageList) {
		this.imageList = imageList;
	}
	
	
}
