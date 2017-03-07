package edu.spring.studyware.member.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import edu.spring.studyware.domain.MemberVO;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	private static final String SESSION_ATTR_ID = "id";
	private static final String SESSION_ATTR_MEMBER_NO = "member_no";
	private static final String SESSION_ATTR_MEMBER_AUTH_NO = "member_auth_no";
	private static final String SESSION_ATTR_NICK = "login_nick";
	private static final String SESSION_ATTR_NAME = "login_name";

	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		logger.info("preHandle()호출..");

		// 세션에 기존 로그인 정보가 남아있으면 삭제하고, 그렇지 않으면 그냥 리턴,,

		// 세션객체를 얻어옴
		HttpSession session = request.getSession();
		Object id = session.getAttribute(SESSION_ATTR_ID);

		if (id != null) {
			session.removeAttribute(SESSION_ATTR_ID);
			session.removeAttribute("name");
			logger.info("기존로그인정보 삭제됨.");
		} else {
			logger.info("기존로그인정보가 없어요~");
		}

		return true;

	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub

		// 로그인한다음? 세션정보 저장..
		logger.info("postHandle() 호출!");

		HttpSession session = request.getSession();

		MemberVO result = (MemberVO) modelAndView.getModel().get("login_result");

		if (result != null) { // DB에 있는 아이디/패스워드 정보와 일치

			logger.info("새로운 로그인 성공");

			// 아이디 정보를 세션에 저장
			session.setAttribute(SESSION_ATTR_ID, result.getId());
			logger.info("Userid : " + result.getId());
			session.setAttribute(SESSION_ATTR_MEMBER_NO, String.valueOf(result.getMember_no()));
			logger.info(String.valueOf("member_no : " + result.getMember_no()));
			session.setAttribute(SESSION_ATTR_MEMBER_AUTH_NO, String.valueOf(result.getMember_auth_no()));
			logger.info(String.valueOf("member_auth_no : " + result.getMember_auth_no()));
			session.setAttribute(SESSION_ATTR_NICK, String.valueOf(result.getNick()));
			logger.info(String.valueOf("login_nick : " + result.getNick()));
			session.setAttribute(SESSION_ATTR_NAME, String.valueOf(result.getName()));
			logger.info(String.valueOf("login_name : " + result.getName()));

			// 기존에 최종 요청 주소(dest)가 있는 경우는 해당 페이지로 이동
			Object dest = session.getAttribute("dest");
			if (dest != null) {
				response.sendRedirect((String) dest);
			} else {
				// 저장된 최종 요청 주소가 없는 경우는 메인 페이지로 이동
				response.sendRedirect("/studyware");
			}

		} else { // DB에 일치하는 회원 정보가 없는 경우
			// 세션에 저장하는 정보 없음
			logger.info("로그인 실패");
			response.sendRedirect("/studyware/member/login");
		} // end if (result != null)
		
		
		/*
		 * String id=(String)modelAndView.getModel().get("id"); String
		 * name=(String)modelAndView.getModel().get("name"); logger.info(
		 * "아이디 : "+id);
		 * 
		 * 
		 * if(id!=null){
		 * 
		 * logger.info("새로운 로그인 성공!"); session.setAttribute(SESSION_ATTR_ID,
		 * id); session.setAttribute("name", name); }
		 */

	}
	
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		logger.info("afterCompletion() 호출!");
		super.afterCompletion(request, response, handler, ex);
	} // end afterCompletion()


}
