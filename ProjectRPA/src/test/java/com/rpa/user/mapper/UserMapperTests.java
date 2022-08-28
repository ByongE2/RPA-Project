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
   

   //회원가입 테스트
//   @Test
//   public void testJoin() {
//      UserDTO user = new UserDTO();
//      
//      user.setId("test");
//      user.setPw("test123");
//      user.setName("테스트");
//      user.setEmail("test123@google.com");
//      user.setAddress("수원");
//      user.setAddress2("수원2");
//      user.setAddress3("수원3");
//      
//      mapper.userJoin(user);
//   }//testJoin
   
   /* 아이디 중복 테스트*/
//   @Test
//   public void testIDcheck() {
//      String id = "user";   //존재o
//      String id2 = "aaaa";  // 존재x
//      mapper.userIDCheck(id);
//      mapper.userIDCheck(id2);
//   }
   
   /* 로그인 쿼리 테스트*/
//   @Test
//    public void userLoginTest() throws Exception{
//        UserDTO user = new UserDTO();    // MemberVO 변수 선언 및 초기화
//        
//        /* 올바른 아이디 비번 입력경우 */
////        user.setId("admin");
////        user.setPw("1234");
//        
//        /* 올바른 않은 아이디 비번 입력경우 */
//        user.setId("admin2222222222");
//        user.setPw("12342222");
//        
//        mapper.userLogin(user);
//        System.out.println("결과 값 : " +  mapper.userLogin(user));
//    }//userLoginTest
   
}