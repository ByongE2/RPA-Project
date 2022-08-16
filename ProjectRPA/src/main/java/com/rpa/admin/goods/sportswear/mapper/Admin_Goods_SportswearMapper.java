/*
 * 작성자:김병혁
 * 작성일:2022/08/02
 * 내용: SportsWearMapper 인터페이스
 */
package com.rpa.admin.goods.sportswear.mapper;

import java.util.List;
import java.util.Map;

import com.rpa.goods.sportswear.domain.SportswearDto;

public interface Admin_Goods_SportswearMapper {
	
	int swInsert(SportswearDto swDto) throws Exception;
//	int wsUpdate(SportswearDto swDto) throws Exception;
//	int swIncreaseViewCnt(Long goods_swID) throws Exception;
//	
//	List<SportswearDto>swSelectAll() throws Exception;
//	List<SportswearDto>swSelectPage(Map map) throws Exception;
//	
//	int swCount() throws Exception;
//	int swDeleteAll() throws Exception;
	
//	int searchResultCnt(SearchCondition sc);
//	List<SportswearDto> searchSelectPage(SearchCondition sc);
	
}
