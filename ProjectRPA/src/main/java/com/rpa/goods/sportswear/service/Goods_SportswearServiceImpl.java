package com.rpa.goods.sportswear.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.rpa.admin.goods.sportswear.mapper.Admin_Goods_SportswearMapper;
import com.rpa.goods.sportswear.domain.SportswearDto;
import com.rpa.goods.sportswear.domain.SwCriteria;
import com.rpa.goods.sportswear.mapper.Goods_SportswearMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class Goods_SportswearServiceImpl implements Goods_SportswearService{

	private Goods_SportswearMapper swMapper;
//	private AttachMapper attatchMapper;
	private Admin_Goods_SportswearMapper adminSwMapper;
	
	//상품 목록(검색)
	@Override
	public List<SportswearDto> swGetList(SwCriteria cri) {
		log.info("사용자 swGetList ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
		return null;
	}
	
	@Override
	public SportswearDto swGetDetail(Long swID) {
		return null;
	}
	
	@Override
	public int swGetTotal(SwCriteria cri) {
		return 0;
	}
	
	@Override
	public SportswearDto getSwIdName(Long swID) {
		return null;
	}
	
	
	
}
