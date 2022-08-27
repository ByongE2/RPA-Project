
package com.rpa.order.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rpa.goods.sportswear.domain.AttachImageVO;
import com.rpa.goods.sportswear.domain.SportswearDto;
import com.rpa.goods.sportswear.domain.SwCartDto;
import com.rpa.goods.sportswear.mapper.AttachMapper;
import com.rpa.goods.sportswear.mapper.Goods_SportswearMapper;
import com.rpa.goods.sportswear.mapper.SwCartMapper;
import com.rpa.order.domain.OrderDto;
import com.rpa.order.domain.OrderItemDto;
import com.rpa.order.domain.OrderPageItemDto;
import com.rpa.order.mapper.OrderMapper;
import com.rpa.user.domain.UserDTO;
import com.rpa.user.mapper.UserMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class OrderServiceImpl implements OrderService{
	
	private OrderMapper orderMapper;
	private AttachMapper attachMapper;
	
	private UserMapper userMapper;
	private SwCartMapper cartMapper;
	private Goods_SportswearMapper swMapper;
	
	/* 주문 정보 */
	@Override
	public List<OrderPageItemDto> getGoodsInfo(List<OrderPageItemDto> orders) {
		
		List<OrderPageItemDto> result = new ArrayList<OrderPageItemDto>();		
		
		for(OrderPageItemDto ord : orders) {
			
			OrderPageItemDto goodsInfo = orderMapper.getGoodsInfo(ord.getGoods_swId());			

			goodsInfo.setGoods_sw_Count(ord.getGoods_sw_Count());	
			//initSaleTotal : salePrice, totalPrice, savePoint, totalSavePoint 초기화
			goodsInfo.initSaleTotal();
			
			// 상품 마다 이미지 첨부
			List<AttachImageVO> imageList = attachMapper.getAttachList(goodsInfo.getGoods_swId());
			
			goodsInfo.setImageList(imageList);
			
			result.add(goodsInfo);			
		}		
		return result;
	}//getGoodsInfo
	
	/* 주문
	1. 사용할 데이터를 세팅 (회원 객체, 주문 객체)
	2. 주문 데이터 DB에 등록
	3. 비용, 포인트 변동 DB 적용
	4. 재고 차감 DB 적용
	5. 장바구니 상품 정보 DB 제거
	*/
	@Override
	@Transactional
	public void order(OrderDto ord) {
		
		/* 1. 사용할 데이터가져오기 */
		System.out.println("서비스 오더 여긴되니?1");
		System.out.println("ord : " + ord);
		/* 회원 정보 */
		UserDTO user = userMapper.getUserInfo(ord.getId());
		System.out.println("서비스 오더 여긴되니?2");
		/* 주문 정보 */
		List<OrderItemDto> ords = new ArrayList<>();
		for(OrderItemDto oit : ord.getOrders()) {
			OrderItemDto orderItem = orderMapper.getOrderInfo(oit.getGoods_swId());
			// 수량 셋팅
			orderItem.setGoods_sw_Count(oit.getGoods_sw_Count());
			// 기본정보 셋팅
			orderItem.initSaleTotal();
			//List객체 추가
			ords.add(orderItem);
		}
		System.out.println("서비스 오더 여긴되니?3");
		/* OrderDTO 셋팅 */
		ord.setOrders(ords);
		ord.getOrderPriceInfo();
		
		/* 2. DB 주문,주문상품(,배송정보) 넣기*/
		
		/* orderId만들기 및 OrderDto객체 orderId에 저장 */
		// DB에서 orderId 자동증가 안해줬음
		// orderId : "회원 아이디" + "_년도 월 일 분
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("_yyyyMMddmm");
		String orderId = user.getId() + format.format(date);
		ord.setOrderId(orderId);
		
		/* db넣기 */
		orderMapper.enrollOrder(ord);		//vam_orrpa_orderder 등록
		for(OrderItemDto oit : ord.getOrders()) {		//rpa_orderItem 등록
			oit.setOrderId(orderId);
			orderMapper.enrollOrderItem(oit);			
		}
		
		/* 3. 비용 포인트 변동 적용 */
		
		/* 비용 차감 & 변동 돈(money) User객체 적용 */
		int calMoney = user.getMoney();
		calMoney -= ord.getOrderFinalSalePrice();
		user.setMoney(calMoney);
		/* 포인트 차감, 포인트 증가 & 변동 포인트(point) User객체 적용 */
		int calPoint = user.getPoint();
		calPoint = calPoint - ord.getUsePoint() + ord.getOrderSavePoint();	// 기존 포인트 - 사용 포인트 + 획득 포인트
		user.setPoint(calPoint);
		/* 변동 돈, 포인트 DB 적용 */
		orderMapper.deductMoney(user);
		
		/* 4. 재고 변동 적용 */
		for(OrderItemDto oit : ord.getOrders()) {
			/* 변동 재고 값 구하기 */
			SportswearDto sw = swMapper.swGetDetail(oit.getGoods_swId());
			sw.setGoods_swStock(sw.getGoods_swStock() - oit.getGoods_sw_Count());
			/* 변동 값 DB 적용 */
			orderMapper.deductStock(sw);
		}
		/* 5. 장바구니 제거 */
		for(OrderItemDto oit : ord.getOrders()) {
			SwCartDto dto = new SwCartDto();
			dto.setId(ord.getId());
			dto.setGoods_swID(oit.getGoods_swId());
			
			cartMapper.deleteOrderCart(dto);
		}
		
	}//order
	
	

}//OrderServiceImpl
