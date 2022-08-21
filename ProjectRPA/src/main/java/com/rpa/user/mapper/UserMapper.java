package com.rpa.user.mapper;

import com.rpa.user.domain.UserDTO;

public interface UserMapper {

	//회원가입
	public void userJoin(UserDTO user);
	
	//id 중복확인	
	public int userIDCheck(String id);
	
	// 로그인
	public UserDTO userLogin(UserDTO user);
	
	//id찾기
	public UserDTO findId(UserDTO user);
	
	//pw찾기
	public UserDTO findPw(UserDTO user);
	
	//pw 바꾸기
	public UserDTO updatePw(UserDTO user);
	
}
