package com.rpa.notice.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.rpa.notice.domain.Criteria;
import com.rpa.notice.domain.NoticeDTO;
import com.rpa.notice.mapper.NoticeMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class NoticeServiceImpl implements NoticeService {
	
	private NoticeMapper mapper;
	
	@Override
	public void register(NoticeDTO noticeDTO) {
		log.info("register...............................................");
			mapper.insert(noticeDTO);
	}

	@Override
	public NoticeDTO get(Long notice_no) {
		return mapper.get(notice_no);
	}

	@Override
	public int modify(NoticeDTO noticeDTO) {
		return mapper.update(noticeDTO);
	}

	@Override
	public int remove(Long notice_no) {
		return mapper.delete(notice_no);
	}

	@Override
	public List<NoticeDTO> getList() {
		return mapper.getList();
	}

	@Override
	public List<NoticeDTO> getListWithPagging(Criteria cri) {
		return mapper.getListWithPagging(cri);
	}

	@Override
	public int getTotalCount(Criteria cri) {
		return mapper.getTotalCount(cri);
	}

}
