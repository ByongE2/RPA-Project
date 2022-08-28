package com.rpa.mapper;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.rpa.goods.sportswear.domain.SportswearDto;
import com.rpa.order.domain.OrderDto;
import com.rpa.order.domain.OrderItemDto;
import com.rpa.order.mapper.OrderMapper;
import com.rpa.user.domain.UserDTO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class OrderMapperTest {

	@Autowired
	private OrderMapper mapper;
	
	/* 상품 정보(주문 처리) */
//	@Test
//	public void getOrderInfoTest() {
//		
//		 OrderItemDto orderInfo = mapper.getOrderInfo(242L);
//		 
//		 System.out.println("result : " + orderInfo);
//	}
	
	/* rpa_order 테이블 등록 */
//	@Test
//	public void enrollOrderTest() {
//		
//		OrderDto ord = new OrderDto();
//		List<OrderItemDto> orders = new ArrayList<>();
//		
//		OrderItemDto order1 = new OrderItemDto();
//		
//		order1.setGoods_swId(242L);
//		order1.setGoods_sw_Count(5);
//		order1.setGoods_swPrice(50000);
//		order1.setGoods_swDiscount(0.1);
//		order1.initSaleTotal();
//		
//		ord.setOrders(orders);
//		
//		ord.setOrderId("주문 테스트 아이디");
//		ord.setAddressee("주문 테스트 받는사람이름");
//		ord.setId("admin");
//		ord.setMemberAddr1("test주소1");
//		ord.setMemberAddr2("test주소2");
//		ord.setMemberAddr3("test주소3");
//		ord.setOrderState("배송중비");
//		ord.getOrderPriceInfo();
//		ord.setUsePoint(1000);
//		
//		mapper.enrollOrder(ord);		
//	}
	
	/* rpa_orderItem 테이블 등록 */
//	@Test
//	public void enrollOrderItemTest() {
//		
//		OrderItemDto oid = new OrderItemDto();
//		
//		oid.setOrderId("주문 테스트 아이디");
//		oid.setGoods_swId(241L);
//		oid.setGoods_sw_Count(5);
//		oid.setGoods_swPrice(50000);
//		oid.setGoods_swDiscount(0.1);
//				
//		oid.initSaleTotal();
//		
//		mapper.enrollOrderItem(oid);
//	}	
	
	/* 회원 돈, 포인트 정보 변경 */
	@Test
	public void deductMoneyTest() {
		
		UserDTO user = new UserDTO();
		
		user.setId("admin");
		user.setMoney(500000);
		user.setPoint(10000);
		
		mapper.deductMoney(user);
	}
	
	/* 상품 재고 변경 */
	@Test
	public void deductStockTest() {
		SportswearDto sw = new SportswearDto();
		
		sw.setGoods_swID(242L);
		sw.setGoods_swStock(77);
		
		mapper.deductStock(sw);
	}
}
