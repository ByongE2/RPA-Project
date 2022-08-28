package com.rpa.pt.mapper;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;

import com.rpa.pt.domain.Pt_Goods_DTO;
import com.rpa.pt.domain.Pt_Goods_basket_DTO;

@MapperScan
public interface Pt_Goods_Mapper {
	public Integer ptinsert(Pt_Goods_DTO dto);
	public List<Pt_Goods_DTO> getlist();
	public Pt_Goods_DTO ptread(int PT_no);
	public int PtReadGet();
	public void ptdelete(int PT_no);
	public void ptupdate(Pt_Goods_DTO dto);
	public void ClientBasketInsert(Pt_Goods_basket_DTO dto);
	public void ClientBasketDelete(String pt_code);
	public List<Pt_Goods_basket_DTO> ClientBasketView(String client_id);
	public Pt_Goods_basket_DTO basketExistence(String pt_code);
}
