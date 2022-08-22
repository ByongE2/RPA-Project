package com.rpa.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.rpa.user.domain.UserDTO;

public class CartInterceptor extends HandlerInterceptorAdapter {
	
	//로그인 체크로, 컨트롤러로 가기전에 먼저 체크. 로그인 안되어있으면 main으로, 장바구니 말고~
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		
		UserDTO uDto = (UserDTO)session.getAttribute("user");
		
		if(uDto == null) {
			response.sendRedirect("/main");
			return false;
		} else {
			return true;
		}
		
	}//preHandle
}//CartInterceptor
