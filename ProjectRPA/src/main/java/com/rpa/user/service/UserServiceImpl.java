package com.rpa.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rpa.user.domain.UserDTO;
import com.rpa.user.mapper.UserMapper;

import lombok.extern.log4j.Log4j;


@Service
@Log4j
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper mapper;
	
	//회원가입
	@Override
	public void userJoin(UserDTO user) throws Exception {
		mapper.userJoin(user);
	}
	//아이디 중복 검사
	@Override
	public int userIDCheck(String id) throws Exception {
		return mapper.userIDCheck(id);
	}

	@Override
	public UserDTO userLogin(UserDTO user) throws Exception {
		return mapper.userLogin(user);
	}

	@Override
	public UserDTO findId(UserDTO user) throws Exception {
		return mapper.findId(user);
	}

	@Override
	public UserDTO findPw(UserDTO user) throws Exception {
		return mapper.findPw(user);
	}

	@Override
	public UserDTO updatePw(UserDTO user) throws Exception {
		return mapper.updatePw(user);
	}

}
