package com.rpa.notice.domain;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class Criteria {

	private int pageNum; // 현재 페이지
	private int amount; // 현재 페이지에 보여질 게시물 갯수
	private String type;
	private String keyword;
	
	public String[] getTypeArr() {
		return type == null ? new String[] {} :  type.split("");
	}
	
	public Criteria() {
        this(1,10);	// pageNum = 1, amount = 10
    }
	
	public Criteria(int pageNum, int amount) {
		this.pageNum  = pageNum;
		this.amount = amount;
	}
	
}
