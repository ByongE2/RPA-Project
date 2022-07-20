package com.rpa.pt.service;

import org.springframework.stereotype.Service;

import com.rpa.pt.domain.Pt_Goods_DTO;
import com.rpa.pt.mapper.Pt_Goods_Mapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Service
@Log4j
@AllArgsConstructor
public class Pt_Goods_Serviceimpl  implements Pt_Goods_Service{
	private Pt_Goods_Mapper mapper;

	@Override
	public void Ptregister(Pt_Goods_DTO dto) {
		log.info("pt 관리자 글쓰기 완료");
		mapper.ptinsert(dto);
		
	}
	

}
