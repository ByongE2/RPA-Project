package com.rpa.admin.goods.sportswear.service;

import java.util.List;

import com.rpa.goods.sportswear.domain.AttachImageVO;
import com.rpa.goods.sportswear.domain.SportswearDto;
import com.rpa.goods.sportswear.domain.SwCriteria;
import com.rpa.order.domain.OrderDto;

public interface Admin_Goods_SportswearService {

	//등록
	void swInsert(SportswearDto swDto) throws Exception;
	//목록(페이징+검색)
	List<SportswearDto> swGetList(SwCriteria cri) throws Exception;
	//row 총 갯수
	int swGetTotal(SwCriteria cri) throws Exception;
	//조회
	SportswearDto swGetDetail(Long swID) throws Exception;
	//수정
	int swModify(SportswearDto swDto) throws Exception;
	//삭제
	
	int swRemove(Long swID) throws Exception;
	//지정 상품 이미지 정보 얻기

	List<AttachImageVO> getAttachInfo(Long swID);
	//주문 상품 리스트
	List<OrderDto> getOrderList(SwCriteria cri);
	//주문 총 갯수
	int getOrderTotal(SwCriteria cri);
}