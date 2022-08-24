package com.rpa.user.service;

import com.rpa.user.domain.UserDTO;

public interface UserService {
	
	//회원가입
	public void userJoin(UserDTO user) throws Exception;
	
	//아이디 중복 검사
	public int userIDCheck(String id) throws Exception;
	
	//로그인
	public UserDTO userLogin(UserDTO user) throws Exception;
	
	//id찾기
	public UserDTO findId(UserDTO user) throws Exception;
	
	//pw찾기
	public UserDTO findPw(UserDTO user) throws Exception;
	
	//pw 바꾸기
	public UserDTO updatePw(UserDTO user) throws Exception;
	
}
