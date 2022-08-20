package com.rpa.goods.sportswear.service;

import java.util.List;

import com.rpa.goods.sportswear.domain.SportswearDto;
import com.rpa.goods.sportswear.domain.SwCriteria;

public interface Goods_SportswearService {

	// 상품 목록(검색) 
	public List<SportswearDto> swGetList(SwCriteria cri);
	
	//상품 정보
	public SportswearDto swGetDetail(Long swID);	
	
	//상품 총 갯수
	public int swGetTotal(SwCriteria cri);		
	
	//상품 id 이름
	public SportswearDto getSwIdName(Long swID);	
}
