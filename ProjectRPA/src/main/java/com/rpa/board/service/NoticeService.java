package com.rpa.board.service;

import java.util.List;

import com.rpa.board.domain.NoitceVO;
import com.rpa.board.domain.Criteria;

public interface NoticeService {
   public void register(NoitceVO vo);
   public NoitceVO get(int boardNum);
   public int modify(NoitceVO vo);
   public int remove(int boardNum);
   public List<NoitceVO> getList(Criteria cri);
   public int getTotal(Criteria cri);
}