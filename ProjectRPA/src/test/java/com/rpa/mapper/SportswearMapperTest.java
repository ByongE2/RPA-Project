package com.rpa.mapper;

import static org.junit.Assert.assertTrue;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.rpa.admin.goods.sportswear.mapper.Admin_Goods_SportswearMapper;
import com.rpa.goods.sportswear.domain.AttachImageVO;
import com.rpa.goods.sportswear.domain.SportswearDto;
import com.rpa.goods.sportswear.domain.SwCriteria;
import com.rpa.goods.sportswear.mapper.AttachMapper;
import com.rpa.goods.sportswear.mapper.Goods_SportswearMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class SportswearMapperTest {
	
	@Autowired
	private Admin_Goods_SportswearMapper mapper;
	@Autowired
	private Goods_SportswearMapper mapper2;
	
//	@Test
//	public void testMapper() {
//		log.info(mapper);
//	}
//	
//	@Test
//	public void imageEnrollTest() {
//		AttachImageVO vo = new AttachImageVO();
//		
//		vo.setGoods_swID(182L);
//		vo.setFileName("이미지이름");
//		vo.setUploadPath("이미지 경로");
//		vo.setUuid("이미지 고유식별자");
//		
//		mapper.imageEnroll(vo);
//	}
	
	@Test
	public void admin_goods_swMapperInsertTest() throws Exception {
		SportswearDto dto = new SportswearDto();
		dto.setGoods_swName("sw inseset test 상품이미지 담긴거33");
		dto.setGoods_swPrice(10004);
		dto.setGoods_swStock(302);
		dto.setGoods_swDetail("sw insert2 test detail");
		dto.setGoods_swDiscount(0.1);
		System.out.println("Before SportswearDto :" + dto);
		mapper.swInsert(dto);
		
		System.out.println("After SportswearDto :" + dto);
	}
//	
//	@Test
//	public void swGetListTest() throws Exception{
//		SwCriteria cri = new SwCriteria(1, 10);
//		
//		cri.setKeyword("test");
//		
//		List<SportswearDto> list = mapper.swGetList(cri);
//		
//		log.info(list);
//	}
	
//	@Test
//	public void swGetTotalTest() throws Exception{
//		SwCriteria cri = new SwCriteria();
//		cri.setKeyword("test");
//		
//		int total = mapper.swGetTotal(cri);
//		log.info(total);
//	}
//	@Test
//	public void swGetDetail() throws Exception{
//		log.info("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
//		log.info(mapper.swGetDetail(66L));
//	}
//	@Test
//	public void swModifyTest() throws Exception{
//		SportswearDto dto = new SportswearDto();
//		dto.setGoods_swName("수정테");
//		dto.setGoods_swPrice(70000);
//		dto.setGoods_swStock(77);
//		dto.setGoods_swDetail("70번 수정 내용임");
//		dto.setGoods_swID(65L);
//		assertTrue(mapper.swModify(dto) == 1);
//	}
//	@Test
//	public void swRemoveTest() throws Exception{
//		assertTrue(mapper.swRemove(81L) == 1); 
//	}
	
//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡclient mapper2 테스트
	
//	@Test
//	public void testMapper() {
//		log.info(mapper2);
//	}
//	
//	@Test
//	public void admin_goods_swMapperInsertTest() throws Exception {
//		SportswearDto dto = new SportswearDto();
//		dto.setGoods_swName("sw insert2 test");
//		dto.setGoods_swPrice(10004);
//		dto.setGoods_swStock(302);
//		dto.setGoods_swDetail("sw insert2 test detail");
//		assertTrue(mapper2.swInsert(dto)==1);
//	}
//	
//	@Test
//	public void swGetListTest() throws Exception{
//		SwCriteria cri = new SwCriteria(1, 10);
//		
//		cri.setKeyword("test");
//		
//		List<SportswearDto> list = mapper2.swGetList(cri);
//		
//		log.info(list);
//	}
	
//	@Test
//	public void swGetTotalTest() throws Exception{
//		SwCriteria cri = new SwCriteria();
//		cri.setKeyword("test");
//		
//		int total = mapper2.swGetTotal(cri);
//		log.info(total);
//	}
//	@Test
//	public void swGetDetail() throws Exception{
//		log.info("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
//		log.info(mapper2.swGetDetail(66L));
//	}
//	@Test
//	public void swModifyTest() throws Exception{
//		SportswearDto dto = new SportswearDto();
//		dto.setGoods_swName("수정테");
//		dto.setGoods_swPrice(70000);
//		dto.setGoods_swStock(77);
//		dto.setGoods_swDetail("70번 수정 내용임");
//		dto.setGoods_swID(65L);
//		assertTrue(mapper2.swModify(dto) == 1);
//	}
//	@Test
//	public void swRemoveTest() throws Exception{
//		assertTrue(mapper2.swRemove(81L) == 1); 
//	}	
//	
	/* 지정 상품 이미지 삭제 */
//	@Test
//	public void deleteImageAllTest() {
//		Long swID = 260L;
//		mapper.deleteImageAll(swID);
//	}
	
	/* 어제자 날짜 이미지 리스트 */
//	@Test
//	public void checkImageListTest() {
//		
//		mapper.checkFileList();
//		
//	}
	
	/* 지정 상품 이미지 정보 얻기 */
	@Test
	public void getAttachInfoTest() {
		
		Long swID = 261L;
		
		List<AttachImageVO> list = mapper.getAttachInfo(swID);
		
		System.out.println("list : " + list);
	}
	
	
}
