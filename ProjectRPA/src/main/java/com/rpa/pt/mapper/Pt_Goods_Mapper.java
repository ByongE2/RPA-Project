package com.rpa.pt.mapper;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;

import com.rpa.pt.domain.Pt_Goods_DTO;

@MapperScan
public interface Pt_Goods_Mapper {
	public Integer ptinsert(Pt_Goods_DTO dto);
	public List<Pt_Goods_DTO> getlist();
	public Pt_Goods_DTO ptread(int PT_no);
	public int PtReadGet();
	public void ptdelete(int PT_no);
	public void ptupdate(int PT_no);
}
