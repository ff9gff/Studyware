package edu.spring.studyware.member.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LogoutInterceptor extends HandlerInterceptorAdapter{

	
	
	private static final Logger logger=LoggerFactory.getLogger(LogoutInterceptor.class);
	

	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
	
		// TODO Auto-generated method stub
		
		
		logger.info("logout prehandle()호출 ㅎ");
		
		HttpSession session=request.getSession();
		Object id=session.getAttribute("login_id");
		
		if(id!=null){
			session.removeAttribute("login_id");
			logger.info("기존 로그인정보 삭제됨...");
		}
		
		
		return true;
		}
	
	
	
}
