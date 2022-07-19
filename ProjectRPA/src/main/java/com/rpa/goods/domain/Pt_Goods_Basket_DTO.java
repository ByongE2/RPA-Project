package com.rpa.goods.domain;

import java.util.Date;

import lombok.Data;

@Data
public class Pt_Goods_Basket_DTO {
	private String PT_id_basket,PT_title_basket,pt_photourl_basket,purchase_basket;
	private int PT_price_basket;
	private Date pt_date;
}
