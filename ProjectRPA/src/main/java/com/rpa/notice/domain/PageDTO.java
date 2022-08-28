package com.rpa.notice.domain;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class PageDTO {

	//첫페이지
	private int startPage;
	//마지막페이지
	private int endPage;
	//이전페이지, 다음페이지
	private boolean prev, next;
	//전체게시물 수
	private int total;
	//현재 페이지, 페이지당 게시물 표시 정보
	private Criteria cri;
	
	public PageDTO(Criteria cri, int total) {
		this.cri = cri;
		this.total = total;
		
		//마지막페이지
		this.endPage = (int)(Math.ceil(cri.getPageNum()/10.0)) * 10;
		//시작페이지
		this.startPage = endPage-9;
		
		//전체 마지막 페이지
		int readEnd = (int)(Math.ceil(total*1.0)/cri.getAmount());
		
		//전체 마지막 페이지(readEnd)가 화면에 보이는 마지막페이지(endPage)보다 작은 경우,
		//보이는 페이지(endPage) 값 조정
		if(endPage >  readEnd) {
			endPage = readEnd;
		}
		//시작 페이지값이 1보다 큰 경우 true
		this.prev = this.startPage >1 ;
		
		//마지막 페이지값이 1보다 큰 경우 true
		this.next = this.endPage < readEnd;
		
	}
}
