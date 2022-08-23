package com.rpa.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.rpa.goods.sportswear.mapper.AttachMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class AttachMapperTest {
	
	@Autowired
	private AttachMapper attachMapper;
	
	@Test
	public void getAttachListTest() {
		Long swID = 244L;
		log.info("이미지 정보: " + attachMapper.getAttachList(swID));
	}

}
