package com.rpa.user.service;

import com.rpa.user.domain.UserDTO;

public interface UserService {

	public void userJoin(UserDTO user) throws Exception;

	public int userIDCheck(String id) throws Exception;
	
	public UserDTO userLogin(UserDTO user) throws Exception;
}
