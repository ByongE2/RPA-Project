package com.rpa.goods.sportswear.service;

import java.util.List;

import com.rpa.goods.sportswear.domain.AttachImageVO;

public interface AttachService {

	//이미지 데이터 반환 
	List<AttachImageVO> getAttachList(Long swID);
}
