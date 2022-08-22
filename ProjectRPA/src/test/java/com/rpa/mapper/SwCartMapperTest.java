package com.rpa.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.rpa.goods.sportswear.domain.SwCartDto;
import com.rpa.goods.sportswear.mapper.SwCartMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class SwCartMapperTest {

	@Autowired
	private SwCartMapper mapper;
	
	//카트 추가
//	@Test
//	public void addCart() throws Exception {
//		String id = "user";
//		Long swID = 260L;
//		int count = 200;
//		
//		SwCartDto cart = new SwCartDto();
//		cart.setId(id);
//		cart.setGoods_swId(swID);
//		cart.setGoods_sw_Count(count);
//		
//		int result = 0;
//		result = mapper.addCart(cart);
//		
//		System.out.println("결과 : " + result);
//	}	
	/* 카트 삭제 */
//	@Test
//	public void deleteCartTest() throws Exception {
//		Long goods_cartId = 5L;
//		
//		mapper.deleteCart(goods_cartId);
//	}
//	
//	/* 카트 수량 수정 */
//
//	@Test
//	public void modifyCartTest() throws Exception {
//		Long cartId = 4L;
//		int count = 5;
//		
//		SwCartDto cart = new SwCartDto();
//		cart.setGoods_cartId(cartId);
//		cart.setGoods_sw_Count(count);
//		
//		mapper.modifyCount(cart);
//		
//	}
//
//	
//	/* 카트 목록 */ 
//
//	@Test
//	public void getCartTest() throws Exception {
//		String memberId = "user";
//		
//		List<SwCartDto> list = mapper.getCart(memberId);
//		for(SwCartDto cart : list) {
//			System.out.println("cart ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ :" +  cart);
//			cart.initSaleTotal();
//			System.out.println("init cart ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ: " + cart);
//		}
//	}
//	*/		
//	/* 카트 확인 */
//
	@Test
	public void checkCartTest() throws Exception {
		
		String memberId = "user";
		Long swID = 262L;
		
		SwCartDto cart = new SwCartDto();
		cart.setId(memberId);
		cart.setGoods_swId(swID);
		SwCartDto resutlCart = mapper.checkCart(cart);
		System.out.println("결과 : " + resutlCart);
	}
//	
}
