package com.rpa.user.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.rpa.pt.service.Pt_Goods_Service;
import com.rpa.user.domain.UserDTO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class UserMapperTests {

	@Autowired
	private UserMapper mapper;
	

	
	@Test
	public void testJoin() {
		UserDTO user = new UserDTO();
		
		user.setId("test");
		user.setPw("test123");
		user.setName("테스트");
		user.setPhone("010-4545-4545");
		user.setAddress("수원");
		user.setEmail("test@naver.com");
		
		mapper.userJoin(user);
	}
	
	@Test
	public void userLoginTEST() throws Exception{
		UserDTO user = new UserDTO();
		
		user.setId("test333");
		user.setPw("1234");
		
		mapper.userLogin(user);
		System.out.println("결과 값 : " + mapper.userLogin(user));
	}
	
	@Test
	public void testIDcheck() {
		String id = "test222";
		String id2 = "tkfka";
		mapper.userIDCheck(id);
		mapper.userIDCheck(id2);
	}
	
	
}
