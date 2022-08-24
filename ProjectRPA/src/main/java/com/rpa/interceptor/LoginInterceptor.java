package com.rpa.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class LoginInterceptor implements HandlerInterceptor {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		System.out.println("LoginInterceptor preHandle 작동"); 
		
		/* 이전 작업에서 세션이 종료되지 않고, 새로운 세션을 저장하려 할 때 */
		HttpSession session = request.getSession();
		
		session.invalidate();
		
		return true;
	}

}
