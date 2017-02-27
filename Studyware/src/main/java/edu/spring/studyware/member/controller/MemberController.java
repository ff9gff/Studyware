package edu.spring.studyware.member.controller;

import java.io.IOException;

import java.io.PrintWriter;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.spring.studyware.domain.MemberVO;
import edu.spring.studyware.domain.Region1VO;
import edu.spring.studyware.member.service.MemberService;
//import project.spring.groupware.member.domain.LoginVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	private MemberService memberService;

	// 1. 회원 가입 페이지로 이동
	@RequestMapping(value = "/member/register", method = RequestMethod.GET)
	public String memberRegister(Locale locale, Model model) {

		List<Region1VO> depth1List = memberService.memberRegionDepth1();
		model.addAttribute("depth1List", depth1List);
		return "member/register";

	}

	

	// 2. 아이디 중복 체크
	@RequestMapping(value = "/member/checkid", method = RequestMethod.POST)
	public void checkid(@RequestBody MemberVO memberVO, HttpServletRequest request, HttpServletResponse response)
			throws IOException {

		logger.info("id: " + memberVO.getId());

	} // checkid(request, response)

	// 3. 닉네임 중복 체크
	@RequestMapping(value = "/member/checknick", method = RequestMethod.POST)
	public void checknick(@RequestBody MemberVO memberVO, HttpServletRequest request, HttpServletResponse response)
			throws IOException {

		logger.info("userid: " + memberVO.getNick());

		// String checknick = memberService.readNickname(vo.getNick());
		// logger.info("checkid : " + checknick);

		PrintWriter out = response.getWriter();

		 if (memberVO.getNick() != null) {
			 out.print("NOK");
		 } // end if
	} // checkid(request, response)

	// 4. 데이터 받아서 회원가입하기
	@RequestMapping(value = "/member/sign_up", method = RequestMethod.POST)
	public String signUp(Model model, MemberVO memberVO, RedirectAttributes attr) {
		logger.info("sign_up 호출");
		logger.info("아이디 : " + memberVO.getId());
		logger.info("비밀번호 : " + memberVO.getPwd());
		logger.info("이름 : " + memberVO.getName());
		logger.info("닉네임 : " + memberVO.getNick());
		logger.info("지역번호 : " + memberVO.getRegion_no());
		logger.info("핸드폰 : " + memberVO.getPhone());
		logger.info("이메일 : " + memberVO.getEmail());

		MemberVO vo = new MemberVO(memberVO.getId(), memberVO.getPwd(), memberVO.getName(), memberVO.getNick(),
				memberVO.getPhone(), memberVO.getEmail(), memberVO.getRegion_no(), 0, null);

		int signUpResult = memberService.memberSignUp(vo);

		if (signUpResult > 0) {
			logger.info("회원가입 성공");
		}
		
		return "member/welcome";

	}

	////////////////////////////////////// 로 그 인  ////////////////////////////////////// 
	
	// 1. 로그인.jsp 호출
	@RequestMapping(value = "/member/login", method = RequestMethod.GET)
	public String loginGET(HttpServletRequest request) {
		logger.info("loginGET() 호출...");
		return "member/login";
	}

	// 2. 로그인 후 작업 (세션)
	@RequestMapping(value = "/member/login-post", method = RequestMethod.POST)
	public void loginPOST(MemberVO memberVO, Model model, String query, HttpServletRequest request) {
		logger.info("loginPOST() 호출...");
		logger.info("입력 ID : " + memberVO.getId());
		logger.info("입력 PW : " + memberVO.getPwd());

		// MemberVO result = memberService.login(vo);
		// logger.info("result : " + result.toString()); // 로그인 실패시 result 값이
		// null 값이 오기 때문에 NullPointerException 발생
		// model.addAttribute("login_result", result);
		// 모델 객체에 속성(attribute)를 설정하면,
		// 인터셉터의 postHandle() 메소드의 ModelAndView 객체로 전달됨.

		// login-post 요청을 보낸 주소를 저장
		logger.info("query : " + query);
		if (query != null && !query.equals("null")) {
			// 요청 파라미터 query에 값이 들어 있는 경우
			String dest = query.substring(4); // substring : 문자열을 잘라서, 4번째 문자열부터
			// 시작하겠다. (0 부터 시작!)
			logger.info("dest : " + dest);
			request.getSession().setAttribute("dest", dest);
		}

	}
	
	//login check
	@RequestMapping(value="/member/login_check", method=RequestMethod.POST)
	public void loginCheck(HttpServletResponse response, String userid, String password) throws IOException{
		logger.info("아이디:"+userid);
		logger.info("비번:"+password);
		
		MemberVO vo = memberService.memberSelectOne(userid);
		PrintWriter out = response.getWriter();
		
		logger.info("아이디는:"+vo.getId());
		logger.info("비밀번호"+vo.getPwd());
		
		if(vo==null){
			out.print("1");
		}else{
			logger.info("왜 안찍혀");
			if(password.equals(vo.getPwd())){
				out.print("OK");
			}else{
				out.print("NOK");
			}
		}
	}
	
	
	
	
	@RequestMapping(value="main", method=RequestMethod.POST)
	public String mainConnect(String id,Model model){
		
		model.addAttribute("id",id);
		logger.info("이름불러오기-");
		
		MemberVO vo=memberService.memberSelectOne(id);
		
		model.addAttribute("name",vo.getNick());
		
		return "index";
		
	}
	

	// 3. 로그아웃
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest req) {
		logger.info("logout() 호출...");

		// // 세션에 저장된 로그인 관련 정보를 모두 삭제, 세션 무효화(invalidate)
		// HttpSession session = req.getSession();
		// session.removeAttribute("login_id");
		// session.removeAttribute("mno");
		// session.invalidate();

		return "redirect:/";
	}
}
