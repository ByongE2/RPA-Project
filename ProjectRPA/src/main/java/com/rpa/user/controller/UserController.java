package com.rpa.user.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.rpa.user.domain.UserDTO;

public interface UserController {

	/* 회원가입 */
	void joinGET();//joinGET
	String joinPOST(UserDTO user) throws Exception;//joinPOST

	/* 회원 가입 시 아이디 중복 검사 , 비동기 방식*/
	String userIDCheckPOST(String id) throws Exception; // userIDCheckPOST()

	/* 회원 가입 시 이메일 인증 */
	String mailCheckGET(String email) throws Exception;//mailCheckGET

	/* 로그인 페이지 */
	void loginGET();//loginGET
	String loginPOST(HttpServletRequest request, UserDTO user, RedirectAttributes rttr) throws Exception;//loginPOST

	/* 메인페이지 로그아웃 */
	String logoutMainGET(HttpServletRequest request) throws Exception;//logoutMainGET

	/* 비동기방식 로그아웃 메서드 */
	void logoutPOST(HttpServletRequest request) throws Exception;//logoutPOST

}