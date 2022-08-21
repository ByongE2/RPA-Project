package com.rap.board.mapper;

import java.util.List;
import java.util.Map;

import com.rpa.board.domain.NoitceVO;
import com.rpa.board.domain.Criteria;

public interface NoticeMapper {
   public List<NoitceVO> getList();
   public NoitceVO get(int boardNum);
   public int delete(int boardNum);
   public int insert(NoitceVO vo);
   public int insertSelectKey(NoitceVO vo);
   public int update(NoitceVO vo);
   public List<NoitceVO> getListWithPagging(Criteria cri);
   public int getTotalCount(Criteria cri);
   
   //검색조건
   public List<NoitceVO> searchTest(Map<String, Map<String,String>>map);

}