package com.rpa.pt.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.rpa.pt.domain.Pt_Goods_DTO;

public interface Pt_Goods_Service {
	//글쓰기
	public void Ptregister(Pt_Goods_DTO dto); 
	
	//리스트 읽기
	public List<Pt_Goods_DTO>getlist();
	
	//글 자세히보기
	public  Pt_Goods_DTO pt_get(int pt_get);
	
	
}
