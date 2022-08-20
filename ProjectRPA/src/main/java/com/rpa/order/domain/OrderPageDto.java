package com.rpa.order.domain;

import java.util.List;

import lombok.Data;

@Data
public class OrderPageDto {
	
	//OrderPageItemDto 클래스 객체를 요소로 가지는 변수. 여러 종류 data 주고받기 위해.
	private List<OrderPageItemDto> orders;

}
