/*
 * 작성자:김병혁
 * 작성일:2022/08/02
 * 내용: SportsWearMapper 인터페이스
 */
package com.rpa.admin.goods.sportswear.mapper;

import java.util.List;
import java.util.Map;

import com.rpa.goods.sportswear.domain.SportswearDto;
import com.rpa.goods.sportswear.domain.SwCriteria;

public interface Admin_Goods_SportswearMapper {
	
	//등록
	int swInsert(SportswearDto swDto) throws Exception;
	//목록
	List<SportswearDto> swGetList(SwCriteria cri) throws Exception;
	//상품 총 갯수
	int swGetTotal(SwCriteria cri) throws Exception;
	//상세
	SportswearDto swGetDetail(Long swID) throws Exception;
	//수정
	int swModify(SportswearDto swDto);
	//삭제
	int swRemove(Long swID) throws Exception;
}
