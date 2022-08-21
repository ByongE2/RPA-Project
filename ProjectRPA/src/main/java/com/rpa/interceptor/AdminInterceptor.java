package com.rpa.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class AdminInterceptor implements HandlerInterceptor {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
		return true;
		
//		HttpSession session = request.getSession();
		
//		UserDto uDto = (UserDto)session.getAttribute("user");
		
		//관리자 계정 유효성 체크
//		if(uDto == null || uDto.getGrade() == 0) { // 관리자 계정이 아닌 경우
//			
//			response.sendRedirect("/main");
//			
//			return false;
//		}
//	return true; // 관리자 계정일 경우.
			
		
	}

}
