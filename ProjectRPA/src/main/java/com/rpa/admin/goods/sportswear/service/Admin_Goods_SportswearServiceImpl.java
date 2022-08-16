package com.rpa.admin.goods.sportswear.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rpa.admin.goods.sportswear.mapper.Admin_Goods_SportswearMapper;
import com.rpa.goods.sportswear.domain.SportswearDto;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class Admin_Goods_SportswearServiceImpl implements Admin_Goods_SportswearService {

	@Autowired
	private Admin_Goods_SportswearMapper swMapper;
	
	//등록
	@Override
	public int swInsert(SportswearDto swDto) throws Exception {
		log.info("service : swInsert");
		return swMapper.swInsert(swDto);
	}
	
}
