package com.rpa.user.service;

import com.rpa.user.domain.UserDTO;

public interface UserService {

	public void userJoin(UserDTO user) throws Exception;

	public int userIDCheck(String id) throws Exception;
	
	public UserDTO userLogin(UserDTO user) throws Exception;
	
	//id찾기
	public UserDTO findId(UserDTO user) throws Exception;
	
	//pw찾기
	public UserDTO findPw(UserDTO user) throws Exception;
	
	//pw 바꾸기
	public UserDTO updatePw(UserDTO user) throws Exception;
	
	public int updateInfo(UserDTO user) throws Exception;
	
	public UserDTO get(String id) throws Exception;
	
}
