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
import com.rpa.goods.sportswear.service.AttachService;
import com.rpa.goods.sportswear.service.Goods_SportswearService;
import com.rpa.mapper.SportswearMapperTest;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class SportswearServiceImplTest {
	
	@Autowired
	private Admin_Goods_SportswearService service;
	@Autowired
	private Goods_SportswearService service2;
	@Autowired
	private AttachService service3;
	
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
	@Test
	public void swServiceGetDetailTest() throws Exception{
		
		long swID = 226L;
		SportswearDto sw = service2.swGetDetail(swID);
		
		System.out.println("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
		System.out.println("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ전체 : " + sw);
		System.out.println("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡsw ID : " + swID);
		System.out.println("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ이미지 정보 : " + sw.getImageList().isEmpty());
		
		//image 테이블 만든 뒤 다시.
		
	}
//	@Test
//	public void swServiceModifyTest() throws Exception{
//		SportswearDto dto = new SportswearDto();
//		dto.setGoods_swID(148L);
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
