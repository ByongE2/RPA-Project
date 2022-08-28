package com.rpa.user.service;

import com.rpa.user.domain.UserDTO;

public interface UserService {
	
	//회원가입
	void userJoin(UserDTO user) throws Exception;
	
	//아이디 중복 검사
	int userIDCheck(String id) throws Exception;
	
	//로그인
	UserDTO userLogin(UserDTO user) throws Exception;
	
	//id찾기
	UserDTO findId(UserDTO user) throws Exception;
	
	//pw찾기
	UserDTO findPw(UserDTO user) throws Exception;
	
	//pw 바꾸기
	UserDTO updatePw(UserDTO user) throws Exception;
	
	//주문자 정보
	UserDTO getUserInfo(String id);
	
//	
//	public int updateInfo(UserDTO user) throws Exception;
//	
//	public UserDTO get(String id) throws Exception;
	
}
