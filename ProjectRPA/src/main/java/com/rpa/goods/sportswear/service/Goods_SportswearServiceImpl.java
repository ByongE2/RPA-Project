package com.rpa.goods.sportswear.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.rpa.admin.goods.sportswear.mapper.Admin_Goods_SportswearMapper;
import com.rpa.goods.sportswear.domain.AttachImageVO;
import com.rpa.goods.sportswear.domain.SportswearDto;
import com.rpa.goods.sportswear.domain.SwCriteria;
import com.rpa.goods.sportswear.mapper.AttachMapper;
import com.rpa.goods.sportswear.mapper.Goods_SportswearMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class Goods_SportswearServiceImpl implements Goods_SportswearService{

	private Goods_SportswearMapper swMapper;
	private AttachMapper attatchMapper;
	private Admin_Goods_SportswearMapper adminSwMapper;
	
	//상품 목록(검색)
	@Override
	public List<SportswearDto> swGetList(SwCriteria cri) {
		log.info("사용자 swGetList ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
		
		List<SportswearDto> list = swMapper.swGetList(cri);
		
		list.forEach(sw -> {
			
			Long swID = sw.getGoods_swID();
			
			List<AttachImageVO> imageList = attatchMapper.getAttachList(swID);
			
			sw.setImageList(imageList);
			
		});
		
		return list;
	}
	
	@Override
	public SportswearDto swGetDetail(Long swID) {
		log.info("swGetDetail()....................");
		
		SportswearDto swInfo = swMapper.swGetDetail(swID);
		swInfo.setImageList(adminSwMapper.getAttachInfo(swID));
		
		
		return swInfo;
	}
	
	@Override
	public int swGetTotal(SwCriteria cri) {
			log.info("swGetTotal()....................");
		
		return swMapper.swGetTotal(cri);
	}
	
	@Override
	public SportswearDto getSwIdName(Long swID) {
		return swMapper.getSwIdName(swID);
	}
	
	
	
}
