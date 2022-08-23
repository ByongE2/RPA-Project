package com.rpa.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.fasterxml.jackson.databind.cfg.HandlerInstantiator;
import com.rpa.user.domain.UserDTO;

import lombok.extern.log4j.Log4j;

@Log4j
public class CartInterceptor extends HandlerInterceptorAdapter{
	
	//로그인 체크로, 컨트롤러로 가기전에 먼저 체크. 로그인 안되어있으면 main으로, 장바구니 말고~
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		log.info("ㅡㅡㅡㅡㅡ장바구니 인터셉터 적용ㅡㅡㅡㅡ");
		
		HttpSession session = request.getSession();
		
		UserDTO uDto = (UserDTO)session.getAttribute("user");
		
		if(uDto == null) {
			response.sendRedirect("/mainTEST");
			return false;
		} else {
			
			return true;
		}
		
	}//preHandle
}//CartInterceptor
