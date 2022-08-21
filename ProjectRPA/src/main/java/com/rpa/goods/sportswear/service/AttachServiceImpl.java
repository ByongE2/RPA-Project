package com.rpa.goods.sportswear.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rpa.goods.sportswear.domain.AttachImageVO;
import com.rpa.goods.sportswear.mapper.AttachMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class AttachServiceImpl implements AttachService{
	
	@Autowired
	private AttachMapper attachMapper;
	
	@Override
	public List<AttachImageVO> getAttachList(Long swID) {
		
		log.info("getAttachList.........");
		
		return attachMapper.getAttachList(swID);
	}
}
