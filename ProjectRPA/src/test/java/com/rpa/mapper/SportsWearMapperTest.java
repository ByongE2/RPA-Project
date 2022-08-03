package com.rpa.mapper;

import static org.junit.Assert.assertTrue;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.rpa.admin.goods.sportswear.mapper.Admin_Goods_SportsWearMapper2;
import com.rpa.goods.sportswear.domain.SportsWearDto;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class SportsWearMapperTest {

	@Autowired
	private Admin_Goods_SportsWearMapper mapper;
	
	//mapper 테스트
	@Test
	public void testMapper() {
		log.info(mapper);
	}
	
	@Test
	public void admin_goods_swMapperTest() {
//		mapper.deleteAll();
		SportsWearDto dto = new SportsWearDto();
//		dto.setGoods_swID(2L);
		dto.setGoods_swName("맵퍼 테스트");
		dto.setGoods_swPrice(1000);
		dto.setGoods_swStock(30);
		dto.setGoods_swDetail("맵퍼 테스트 상세내용");
		assertTrue(mapper.swRegister(dto)==1);
		
	}
	
	@Test
	public void testsel2() {
		List<SportsWearDto> aa = mapper.testSel(1L);
		log.info(aa);
	}
	
	
	
}
