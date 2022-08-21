package com.rpa.board.service;

import java.util.List;

import com.rpa.board.domain.UserVO;

public interface UserService {
	public List<UserVO> getUserList();
	public void register(UserVO vo);
	public void registerToKakao(UserVO vo);
	public UserVO login(UserVO vo);
	public UserVO get(int userNum);
	public UserVO getId(UserVO vo);
	public UserVO findPassword(UserVO vo);
	public UserVO getNickName(UserVO vo);
	public List<UserVO> idList(UserVO vo);
	public int remove(int userNum);
	public int modify(UserVO vo);
}