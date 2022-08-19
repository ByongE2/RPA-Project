package com.rpa.controller;

import java.sql.Connection;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.rpa.pt.domain.Pt_Goods_DTO;
import com.rpa.pt.mapper.Pt_Goods_Mapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class OrderControllerImplTest {
	@Autowired
	private Pt_Goods_Mapper mapper;
	@Autowired
	private DataSource datasource;
	
	@Test
	public void testinsert() {
		Pt_Goods_DTO dto= new Pt_Goods_DTO();
		dto.setPT_id("kkao45617");
		dto.setPT_content("����");
		dto.setPT_title("Ÿ��Ʋ");
		dto.setPt_name("�ƹ���");
		dto.setPT_photourl(null);
		dto.setPT_Price("12345");
		dto.setCalendar_before("�޷���");
		dto.setCalendar_after("�޷� ��");
		log.info("---------------�μ�Ʈ");
		log.info("insert : "+mapper.ptinsert(dto));
	}
	
	@Test
	public void testconnection() {
		try(Connection con = datasource.getConnection()){
			log.info("datasource : "+datasource);
			log.info(con);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@Test
	public void testlist() {
		log.info(mapper.getlist());
	}
	
	@Test
	public void testbasketview() {
		mapper.ClientBasketView("kkao45617");
	}
	
}
