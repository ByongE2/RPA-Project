/*
 * 작성자:김병혁
 * 작성일:2022/08/02
 * 내용: SportsWearMapper 인터페이스
 */
package com.rpa.admin.goods.sportswear.mapper;

import java.util.List;

import com.rpa.goods.sportswear.domain.SportsWearDto;

public interface Admin_Goods_SportsWearMapper2 {
	
	//상품등록
	public int swRegister(SportsWearDto swDto);
	
	public List<SportsWearDto> testSel(Long aa);
}
