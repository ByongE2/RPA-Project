package com.rpa.service;

import static org.junit.Assert.assertTrue;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.rpa.admin.goods.sportswear.service.Admin_Goods_SportswearService;
import com.rpa.goods.sportswear.domain.SportswearDto;
import com.rpa.goods.sportswear.domain.SwCriteria;
import com.rpa.mapper.SportswearMapperTest;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class SportswearServiceImplTest {
	
	@Autowired
	private Admin_Goods_SportswearService service;
	
//	@Test
//	public void admin_goods_swServiceInsertTest() throws Exception{
//		SportswearDto dto = new SportswearDto();
//		dto.setGoods_swName("sw service test");
//		dto.setGoods_swPrice(1000);
//		dto.setGoods_swStock(30);
//		dto.setGoods_swDetail("sw service test detail");
//		assertTrue(service.swInsert(dto)==1);
//	}
	
//	@Test
//	public void admin_goods_swServiceGetListTest() throws Exception{
//		service.swGetList(new SwCriteria(1, 10));
//	}
//	@Test
//	public void swServiceGetTotalTest() throws Exception{
//		log.info(service.swGetTotal(new SwCriteria()));
//	}
//	@Test
//	public void swServiceGetDetailTest() throws Exception{
//		log.info(service.swGetDetail(66L));
//	}
//	@Test
//	public void swServiceModifyTest() throws Exception{
//		SportswearDto dto = new SportswearDto();
//		dto.setGoods_swID(85L);
//		dto.setGoods_swName("sw service test22222");
//		dto.setGoods_swPrice(10000);
//		dto.setGoods_swStock(250);
//		dto.setGoods_swDetail("sw service test modify");
//		assertTrue(service.swModify(dto) == 1);
//	}
//	@Test
//	public void swServiceRemoveTest() throws Exception{
//		assertTrue(service.swRemove(82L) == 1);
//	}

}
