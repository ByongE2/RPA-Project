package com.rpa.controller;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
						"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
@WebAppConfiguration
@Log4j
public class SportswearControllerImplTest {

	@Autowired
	private WebApplicationContext ctx;
	
	private MockMvc mockMvc;
	
	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
//	@Test
//	public void swControllerInsertTest() throws Exception {
//		String resultPage = 
//				mockMvc.perform(MockMvcRequestBuilders.post("/admin/goods/sportswear/insert")
//				.param("goods_swName",	"컨"	)
//				.param("goods_swPrice", "5000")
//				.param("goods_swStock", "200")
//				.param("goods_swDetail", "insert컨트롤러 테스트"))
//				.andReturn()
//				.getModelAndView()
//				.getViewName();
//		log.info(resultPage);
//	}
	
//	@Test
//	public void swControllerGetListTest() throws Exception{
//		log.info(
//				mockMvc.perform(MockMvcRequestBuilders.get("/admin/goods/sportswear/list")
//				.param("pageNum", "1")
//				.param("amount", "10"))
//				.andReturn()
//				.getModelAndView()
//				.getModelMap()
//				);
//	}
//	@Test
//	public void swControllerGetDetailTest() throws Exception {
//		log.info(
//				mockMvc.perform(MockMvcRequestBuilders.get("/admin/goods/sportswear/detail")
//				.param("swID", "66")	)
//				.andReturn()
//				.getModelAndView()
//				.getModelMap()
//				);
//	}
//	@Test
//	public void swControllerModifyTest() throws Exception{
//		String resultPage = 
//				mockMvc.perform(MockMvcRequestBuilders.post("/admin/goods/sportswear/modify")
//						.param("goods_swID",  "71")
//						.param("goods_swName",  "컨트롤러수정이름")
//						.param("goods_swPrice", "7171")
//						.param("goods_swStock", "71")
//						.param("goods_swDetail", "71번 컨트롤러 수정 테스트")	
//						)
//				.andReturn()
//				.getModelAndView()
//				.getViewName();
//		log.info(resultPage);
//	}
//	@Test
//	public void testRemove() throws Exception {
//		String resultPage = 
//				mockMvc.perform(MockMvcRequestBuilders.post("/admin/goods/sportswear/remove")
//				.param("swID", "83"))
//				.andReturn()
//				.getModelAndView()
//				.getViewName();
//		log.info(resultPage);
//	}
	
	
}
