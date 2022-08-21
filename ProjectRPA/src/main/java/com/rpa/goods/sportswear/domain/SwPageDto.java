package com.rpa.goods.sportswear.domain;

import lombok.Data;

@Data
public class SwPageDto {

	//페이지 시작 번호
	private int pageStart;
	//페이지 끝 번호
	private int pageEnd;
	//이전, 다음 버튼 존재 유무
	private boolean next, prev;
	//row(행) 전체 개수
	private int total;
	//기준( 현재페이지 번호-pageNum, row(행)나타낼 갯수-amount, 검색 키워드-keyword, 검색 종류-type
	private SwCriteria cri;
	
	//생성자
	public SwPageDto(SwCriteria cri, int total) {
		this.cri = cri;
		this.total = total;
		
		this.pageEnd = (int)(Math.ceil(cri.getPageNum()/10.0))*10;
		this.pageStart = this.pageEnd - 9;
		//전체에서 마지막 페이지 번호
		int realEnd = (int)(Math.ceil(total * 1.0/cri.getAmount()));
		//페이지 끝 번호 유효성 체크
		if(realEnd < pageEnd) {
			this.pageEnd = realEnd;
		}
		this.prev = this.pageStart > 1;
		this.next = this.pageEnd < realEnd;
	}
	
	public SwPageDto() {}
	
	
}
