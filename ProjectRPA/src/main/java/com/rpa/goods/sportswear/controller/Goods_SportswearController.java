package com.rpa.goods.sportswear.controller;

import java.util.List;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.rpa.goods.sportswear.domain.AttachImageVO;
import com.rpa.goods.sportswear.domain.SwCriteria;

public interface Goods_SportswearController {
	
	/* 상품 목록 */
	String swListGet(SwCriteria cri, Model model) throws Exception;//swGetList

	/* 상품 상세 정보*/
	String swDetailGet(Long swID, Model model);

	/* 이미지 출력 */
	ResponseEntity<byte[]> getSwImage(String fileName);//getSwImage

	/* 이미지 정보 반환 */
	ResponseEntity<List<AttachImageVO>> getAttachList(Long swID);

}