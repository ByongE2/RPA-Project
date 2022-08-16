package com.rpa.admin.goods.sportswear.service;

import com.rpa.goods.sportswear.domain.SportswearDto;

public interface Admin_Goods_SportswearService {

	//등록
	int swInsert(SportswearDto swDto) throws Exception;

}