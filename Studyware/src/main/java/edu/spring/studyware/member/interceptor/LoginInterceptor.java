package edu.spring.studyware.member.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	private static final String SESSION_ATTR_ID="login_id";
	
	private static final Logger logger=LoggerFactory.getLogger(LoginInterceptor.class);
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
	
		logger.info("preHandle()호출..");
		
		//세션에 기존 로그인 정보가 남아있으면 삭제하고, 그렇지 않으면 그냥 리턴,,
		
		//세션객체를 얻어옴
		HttpSession session=request.getSession();
		Object id=session.getAttribute(SESSION_ATTR_ID);
	
		if(id!=null){
			session.removeAttribute(SESSION_ATTR_ID);
			session.removeAttribute("name");
			logger.info("기존로그인정보 삭제됨.");
		}else{
			logger.info("기존로그인정보가 없어요~");
		}
		
		return true;
		
		
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
	
		//로그인한다음? 세션정보 저장..
		
		HttpSession session=request.getSession();
		String id=(String)modelAndView.getModel().get("id");
		String name=(String)modelAndView.getModel().get("name");
		logger.info("아이디 : "+id);
		
		
		if(id!=null){
			
			logger.info("새로운 로그인 성공!");
			session.setAttribute(SESSION_ATTR_ID, id);
			session.setAttribute("name", name);
		}
	
	}
	
	
}
