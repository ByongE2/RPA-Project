package com.rpa.admin.goods.sportswear.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rpa.admin.goods.sportswear.mapper.Admin_Goods_SportswearMapper;
import com.rpa.goods.sportswear.domain.AttachImageVO;
import com.rpa.goods.sportswear.domain.SportswearDto;
import com.rpa.goods.sportswear.domain.SwCriteria;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class Admin_Goods_SportswearServiceImpl implements Admin_Goods_SportswearService {

	@Autowired
	private Admin_Goods_SportswearMapper swAdminMapper;
	
	@Transactional
	@Override
	public void swInsert(SportswearDto swDto) throws Exception {
		log.info("service : swInsertㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
		
		swAdminMapper.swInsert(swDto);
		
		//성능개선 이미지 넣을거 없으면 for문 돌릴필요도 없게끔.
		if(swDto.getImageList() == null || swDto.getImageList().size() <= 0) {
			return ;
		}
		// = for(AttachImageVO attach : swDto.getImageList()) {}
		swDto.getImageList().forEach(attach ->{
			attach.setGoods_swID(swDto.getGoods_swID()); //selectKey로 id값 getImageList의 null인 곳에 넣어줌.
			swAdminMapper.imageEnroll(attach);
		});
	}
	@Override
	public List<SportswearDto> swGetList(SwCriteria cri) throws Exception {
		log.info("service : swGetListㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
		return swAdminMapper.swGetList(cri);
	}
	@Override
	public int swGetTotal(SwCriteria cri) throws Exception {
		log.info("service: swGetTotalㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
		return swAdminMapper.swGetTotal(cri);
	}
	@Override
	public SportswearDto swGetDetail(Long swID) throws Exception {
		log.info("service: swGetDetailㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
		return swAdminMapper.swGetDetail(swID);
	}
	@Override
	public int swModify(SportswearDto swDto) throws Exception {
		log.info("service: swModifyㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
		return swAdminMapper.swModify(swDto);
	}
	@Override
	public int swRemove(Long swID) throws Exception {
		log.info("service: swRemoveㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
		return swAdminMapper.swRemove(swID);
	}
}
