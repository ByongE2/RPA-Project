package com.rpa.board.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.rap.board.mapper.NoticeMapper;
import com.rpa.board.domain.NoitceVO;
import com.rpa.board.domain.Criteria;
import com.rpa.board.service.NoticeService;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class NoticeServiceImpl implements NoticeService {
   private NoticeMapper mapper;

   public void register(NoitceVO vo) {
      System.out.println("register Impl ... start...");
      mapper.insertSelectKey(vo);
   }

   @Override
   public NoitceVO get(int boardNum) {
      return mapper.get(boardNum);
   }

   @Override
   public int modify(NoitceVO vo) {
      return mapper.update(vo);
   }

   @Override
   public int remove(int boardNum) {
      return mapper.delete(boardNum);
   }

   @Override
   public List<NoitceVO> getList(Criteria cri) {
      return mapper.getListWithPagging(cri);
   }
   
   public int getTotal(Criteria cri) {
      return mapper.getTotalCount(cri);
   }

}