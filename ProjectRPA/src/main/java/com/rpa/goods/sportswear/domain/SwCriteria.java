package com.rpa.goods.sportswear.domain;

import lombok.Data;

@Data
public class SwCriteria {
	
	// 현재 페이지 번호
	private int pageNum;
	// 페이지에 표시 개수
	private int amount;
	
	// 검색 타입
	private String type;
	// 검색 키워드
	private String keyword;
	// 검색 타입데이터 배열 변환
	public String[] getTypeArr() {
		return type == null ? new String[] {} : type.split("");
	}
	
	// Criteria 생성자
	public SwCriteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	// Criteria 기본 생성자
	public SwCriteria() {
		this(1,10);
	}
	
	
	

}
