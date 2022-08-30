package com.rpa.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.rpa.user.domain.UserDTO;
import com.rpa.user.mapper.UserMapper;

import lombok.extern.log4j.Log4j;


@Service
@Log4j
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper mapper;
	
	/*@Autowired로는 빈 등록해도 빈을 찾을 수 없다는 에러가남..*/
	@Bean
	BCryptPasswordEncoder pwEncoder() {
		return new BCryptPasswordEncoder();
	}
	
	/* 회원가입 */
	@Override
	public void userJoin(UserDTO user) throws Exception {
		/* 비밀번호 인코딩 */
		String rawPw = "";			// 인코딩 전 비밀번호
		String encodePw = "";		// 인코딩 후 비밀번호
		
		rawPw = user.getPw();						// 비밀번호 데이터 가져오고
		encodePw = pwEncoder().encode(rawPw);		// 비밀번호 인코딩
		user.setPw(encodePw);						// 인코딩된 비밀번호 member객체에 다시 저장
		
		/* 회원가입 쿼리 실행 */
		mapper.userJoin(user);
	}//userJoin
	
	/* 아이디 중복 검사 */
	@Override
	public int userIDCheck(String id) throws Exception {
		return mapper.userIDCheck(id);
	}
	
	/* 로그인 */
	@Override
	public UserDTO userLogin(UserDTO user) throws Exception {
		return mapper.userLogin(user);
	}
	/* 주문자 정보 */
	@Override
	public UserDTO getUserInfo(String id) {
		return mapper.getUserInfo(id);
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

	/*@Override
	public int updateInfo(UserDTO user) throws Exception {
		int result = mapper.updateInfo(user);
		return result;
	}

	@Override
	public UserDTO get(String id) throws Exception {
		return mapper.get(id);
	}*/

}
