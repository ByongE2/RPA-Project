package com.rpa.user.mapper;

import com.rpa.user.domain.UserDTO;

public interface UserMapper {

	//회원가입
	public void userJoin(UserDTO user);
	
	//id 중복확인	
	public int userIDCheck(String id);
	
	public UserDTO userLogin(UserDTO user);
}
