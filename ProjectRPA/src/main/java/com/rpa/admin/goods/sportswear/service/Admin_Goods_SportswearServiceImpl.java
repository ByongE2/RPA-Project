package com.rpa.admin.goods.sportswear.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rpa.admin.goods.sportswear.mapper.Admin_Goods_SportswearMapper;
import com.rpa.goods.sportswear.domain.SportswearDto;
import com.rpa.goods.sportswear.domain.SwCriteria;

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
	@Override
	public List<SportswearDto> swGetList(SwCriteria cri) throws Exception {
		log.info("service : swGetList");
		return swMapper.swGetList(cri);
	}
	@Override
	public int swGetTotal(SwCriteria cri) throws Exception {
		log.info("service: swGetTotal");
		return swMapper.swGetTotal(cri);
	}
	@Override
	public SportswearDto swGetDetail(Long swID) throws Exception {
		log.info("service: swGetDetail");
		return swMapper.swGetDetail(swID);
	}
	@Override
	public int swModify(SportswearDto swDto) throws Exception {
		log.info("service: swModify");
		return swMapper.swModify(swDto);
	}
	@Override
	public int swRemove(Long swID) throws Exception {
		log.info("service: swRemove");
		return swMapper.swRemove(swID);
	}
	
}
