package com.rpa.order.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rpa.order.domain.OrderPageItemDto;
import com.rpa.order.mapper.OrderMapper;

@Service
public class OrderServiceImpl implements OrderService{
	
	@Autowired
	private OrderMapper orderMapper;
	
	/* 주문 정보 */
	@Override
	public List<OrderPageItemDto> getGoodsInfo(List<OrderPageItemDto> orders) {
		
		List<OrderPageItemDto> result = new ArrayList<OrderPageItemDto>();		
		
		for(OrderPageItemDto ord : orders) {
			
			OrderPageItemDto goodsInfo = orderMapper.getGoodsInfo(ord.getGoods_swId());			

			goodsInfo.setGoods_sw_Count(ord.getGoods_sw_Count());	
			//initSaleTotal : salePrice, totalPrice, savePoint, totalSavePoint 초기화
			goodsInfo.initSaleTotal();			
			
			result.add(goodsInfo);			
		}		
		return result;
	}//getGoodsInfo

}//OrderServiceImpl
