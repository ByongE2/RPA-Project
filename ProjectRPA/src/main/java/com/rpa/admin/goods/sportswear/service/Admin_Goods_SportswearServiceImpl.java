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

	//등록
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
	
	//상품 리스트
	@Override
	public List<SportswearDto> swGetList(SwCriteria cri) throws Exception {
		log.info("service : swGetListㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
		return swAdminMapper.swGetList(cri);
	}
	
	//상품 총 갯수
	@Override
	public int swGetTotal(SwCriteria cri) throws Exception {
		log.info("service: swGetTotalㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
		return swAdminMapper.swGetTotal(cri);
	}
	
	//상품 상세 정보
	@Override
	public SportswearDto swGetDetail(Long swID) throws Exception {
		log.info("service: swGetDetailㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
		return swAdminMapper.swGetDetail(swID);
	}
	
	//상품 수정
	@Transactional //쿼리 2개이상 요청하기 때문에
	@Override
	public int swModify(SportswearDto swDto) throws Exception {
		log.info("service: swModifyㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
		
		int result = swAdminMapper.swModify(swDto);
		//상품이 수정 되고 && 이미지 정보 존재 할때만
		if(result == 1 && swDto.getImageList() != null && swDto.getImageList().size() > 0) {
			//이미지 정보 모두 삭제
			swAdminMapper.deleteImageAll(swDto.getGoods_swID());
			
			swDto.getImageList().forEach(attach -> {
				
				attach.setGoods_swID(swDto.getGoods_swID());
				swAdminMapper.imageEnroll(attach);
			});
		}//if
		return result;
	}//swModify
	
	//상품 삭제
	@Override
	@Transactional
	public int swRemove(Long swID) throws Exception {
		log.info("service: swRemoveㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
		
		//상품정보 삭제 전에, DB image테이블에 있는 정보부터 삭제.(외래키때문에 그냥삭제 안됨)
		swAdminMapper.deleteImageAll(swID);
		
		return swAdminMapper.swRemove(swID);
	}
	
	/* 지정 상품 이미지 정보 얻기 */
	@Override
	public List<AttachImageVO> getAttachInfo(Long swID) {
		
		log.info("service: getAttachInfoㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
		
		return swAdminMapper.getAttachInfo(swID);
	}
}
