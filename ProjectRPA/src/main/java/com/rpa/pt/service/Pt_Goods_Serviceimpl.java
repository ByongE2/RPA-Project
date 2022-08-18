package com.rpa.pt.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.rpa.pt.domain.Pt_Goods_DTO;
import com.rpa.pt.domain.Pt_Goods_basket_DTO;
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
		log.info("들어는 왔음");
		mapper.ptinsert(dto);
		log.info("pt 관리자 글쓰기 완료");
	}

	@Override
	public List<Pt_Goods_DTO> getlist() {
		return mapper.getlist();
	}

	@Override
	public Pt_Goods_DTO pt_get(int pt_get) {
		return mapper.ptread(pt_get);
	}

	@Override
	public int PtViewGet() {
		return mapper.PtReadGet();
	}

	@Override
	public void ptdelete(int PT_no) {
		mapper.ptdelete(PT_no);
	}

	@Override
	public void ptupdate(Pt_Goods_DTO dto) {
		mapper.ptupdate(dto);
	}

	@Override
	public void clientBasketinsert(Pt_Goods_basket_DTO dto) {
		mapper.ClientBasketInsert(dto);
	}

	@Override
	public void clientBasketDelete(String pt_code) {
		mapper.ClientBasketDelete(pt_code);
	}

	@Override
	public List<Pt_Goods_basket_DTO> clientBasketView(String pt_code) {
		return mapper.ClientBasketView(pt_code);
		
	}



	
	

	


	

}