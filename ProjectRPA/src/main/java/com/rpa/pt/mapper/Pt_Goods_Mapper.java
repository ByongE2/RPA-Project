package com.rpa.pt.mapper;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;

import com.rpa.pt.domain.Pt_Goods_DTO;

@MapperScan
public interface Pt_Goods_Mapper {
	public int ptinsert(Pt_Goods_DTO dto);
	public List<Pt_Goods_DTO> getlist();

}
