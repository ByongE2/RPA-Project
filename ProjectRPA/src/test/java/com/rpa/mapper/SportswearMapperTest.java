package com.rpa.mapper;

import static org.junit.Assert.assertTrue;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.rpa.admin.goods.sportswear.mapper.Admin_Goods_SportswearMapper;
import com.rpa.goods.sportswear.domain.SportswearDto;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class SportswearMapperTest {

	@Autowired
	private Admin_Goods_SportswearMapper mapper;
	
	@Test
	public void testMapper() {
		log.info(mapper);
	}
	
	@Test
	public void admin_goods_swMapperTest() throws Exception {
//		mapper.deleteAll();
		SportswearDto dto = new SportswearDto();
//		dto.setGoods_swID(2L);
		dto.setGoods_swName("sw insert test");
		dto.setGoods_swPrice(1000);
		dto.setGoods_swStock(30);
		dto.setGoods_swDetail("sw insert test detail");
		assertTrue(mapper.swInsert(dto)==1);
	}
	
	
	
	
	
}
