package com.rpa.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.rpa.goods.sportswear.domain.SwCartDto;
import com.rpa.goods.sportswear.service.SwCartService;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class SwCartServiceTest {

	@Autowired
	private SwCartService service;
	
	/* (0 : 등록 실패 / 1 : 등록 성공 / 2 : 등록된 데이터 존재 / 5 : 로그인 필요)*/
	
	//등록 테스트
//	@Test
//	public void addCartTest() {
//		//given
//			String memberId = "admin";
//			Long swID = 259L;
//			int count = 5;
//			
//			SwCartDto dto = new SwCartDto(); 
//			dto.setId(memberId);
//			dto.setGoods_swId(swID);
//			dto.setGoods_sw_Count(count);
//		
//		//when
//			int result = service.addCart(dto);
//		
//		//then
//			System.out.println("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ result ::: " + result);
//	}//addCartTest
	
}
