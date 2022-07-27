package com.rpa.pt.service;

import java.util.List;

import com.rpa.pt.domain.Pt_Goods_DTO;

public interface Pt_Goods_Service {
	//글쓰기
	public void Ptregister(Pt_Goods_DTO dto); 
	
	//읽기
	public List<Pt_Goods_DTO>getlist();

	
}
