package com.rpa.notice.service;

import java.util.List;

import com.rpa.notice.domain.Criteria;
import com.rpa.notice.domain.NoticeDTO;

public interface NoticeService {
	
	public List<NoticeDTO> getList();
	public NoticeDTO get(Long notice_no);
	public void register(NoticeDTO noticeDTO);
	public int modify(NoticeDTO noticeDTO);
	public int remove(Long notice_no);
	public List<NoticeDTO> getListWithPagging(Criteria cri);
	public int getTotalCount(Criteria cri);
	
}
