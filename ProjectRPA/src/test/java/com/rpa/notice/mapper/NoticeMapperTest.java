package com.rpa.notice.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.rpa.notice.domain.Criteria;
import com.rpa.notice.domain.NoticeDTO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class NoticeMapperTest {

	@Autowired
	private NoticeMapper mapper;
	
	@Test
	public void testGet() {
		log.info("--------get");
		log.info(mapper.get(2L));
	}
	
	@Test
	public void testDelete() {
		log.info("-----delete-----");
	    log.info("delete : " + mapper.delete(3L));
	}
	
	@Test
	public void testInsert() {
		NoticeDTO noticeDTO = new NoticeDTO();
		
		noticeDTO.setTitle("test");
		noticeDTO.setContent("test");
		log.info("-----insert-----");
		log.info("insert :" + mapper.insert(noticeDTO));
	}
	
	@Test
	public void testUpdate() {
		NoticeDTO noticeDTO = new NoticeDTO();
		
		noticeDTO.setNotice_no(6L);
		noticeDTO.setTitle("testUpdate");
		noticeDTO.setContent("testUpdate");
		log.info("-----update-----");
		log.info("update :" + mapper.update(noticeDTO));
	}
	
	@Test
	public void testGetList() {
		log.info("------getList-------");
		log.info(mapper.getList());
	}
	
	@Test
	public void testGetListWithPagging() {
		Criteria cri = new Criteria();
		cri.setPageNum(2);
		cri.setAmount(10);
		List<NoticeDTO> list = mapper.getListWithPagging(cri);
		log.info(list);
	}
}
