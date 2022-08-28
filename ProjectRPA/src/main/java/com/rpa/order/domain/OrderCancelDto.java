package com.rpa.order.domain;

import lombok.Data;

@Data
public class OrderCancelDto {
	
	private String id;
	
	private String orderId;

	private String keyword;
	private int amount;
	private int pageNum;
	
}
