package com.rpa.board.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.rap.board.mapper.UserMapper;
import com.rpa.board.domain.UserVO;
import com.rpa.board.service.UserService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class UserServiceImpl implements UserService{
	private UserMapper mapper;

	@Override
	public List<UserVO> getUserList() {
		log.info("----- getUserList ------");
		return mapper.getList();
	}

	@Override
	public void register(UserVO vo) {
		log.info("------ register --------");
		mapper.insert(vo);
	}

	@Override
	public UserVO login(UserVO vo) {
		log.info("------- login ---------");
		return mapper.getId(vo);
	}

	@Override
	public UserVO get(int userNum) {
		log.info("------- get ---------");
		return mapper.get(userNum);
	}

	@Override
	public UserVO getId(UserVO vo) {
		log.info("------- getId ---------");
		return mapper.getId(vo);
	}

	@Override
	public UserVO getNickName(UserVO vo) {
		log.info("------- getNickName ---------");
		return mapper.getNickName(vo);
	}

	@Override
	public List<UserVO> idList(UserVO vo) {
		log.info("------- getidList ---------");
		return mapper.getFindId(vo);
	}
	
	@Override
	public int remove(int userNum) {
		log.info("------- remove ---------");
		int result = mapper.delete(userNum);
		return result;
	}

	@Override
	public int modify(UserVO vo) {
		log.info("------- modify ---------");
		int result = mapper.update(vo);
		return result;
	}

	@Override
	public UserVO findPassword(UserVO vo) {
		log.info("------- findPassword ---------");
		return mapper.getPw(vo);
	}

	@Override
	public void registerToKakao(UserVO vo) {
		log.info("------ īī�� ȸ������ --------");
		mapper.kakaoInsert(vo);
	}


}