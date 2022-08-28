package com.rpa.notice.mapper;

import java.util.List;
import java.util.Map;

import com.rpa.notice.domain.Criteria;
import com.rpa.notice.domain.NoticeDTO;

public interface NoticeMapper {

	public NoticeDTO get(Long notice_no);
	public List<NoticeDTO> getList();
	public int insert(NoticeDTO noticeDTO);
	public int delete(Long notice_no);
	public int update(NoticeDTO noticeDTO);
	public List<NoticeDTO> getListWithPagging(Criteria cri);
	public int getTotalCount(Criteria cri);
	
	//검색조건
	public List<NoticeDTO> searchTest(Map<String, Map<String,String>> map);
}
