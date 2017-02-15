package edu.spring.studyware;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.java.studyware.domain.MemberVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class TestController {

	private static final Logger logger = LoggerFactory.getLogger(TestController.class);

	@Autowired
	private JavaMailSenderImpl mailSender;
	
	@RequestMapping(value = "index", method = RequestMethod.GET)
	public String cancelJoin(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "index";
	}

	// 회원가입하러 가기
	@RequestMapping(value = "/memberRegister", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "memberRegister";
	}

	// 아이디 중복 체크
	@RequestMapping(value = "checkid", method = RequestMethod.POST)
	public void checkid(@RequestBody MemberVO vo, HttpServletRequest request, HttpServletResponse response)
			throws IOException {

		logger.info("id: " + vo.getId());

		// String checkid = memberService.readUserid(vo.getId());
		// logger.info("checkid : " + checkid);

		PrintWriter out = response.getWriter();

		// if (checkid != null) {
		// out.print("NOK");
		// } // end if
	} // checkid(request, response)

	// 닉네임 중복 체크
	@RequestMapping(value = "checknick", method = RequestMethod.POST)
	public void checknick(@RequestBody MemberVO vo, HttpServletRequest request, HttpServletResponse response)
			throws IOException {

		logger.info("userid: " + vo.getNick());

		// String checknick = memberService.readNickname(vo.getNick());
		// logger.info("checkid : " + checknick);

		PrintWriter out = response.getWriter();

		// if (checknick != null) {
		// out.print("NOK");
		// } // end if
	} // checkid(request, response)

	// 이메일 인증
	@RequestMapping(value = "email_auth", method = RequestMethod.POST)
	public void email_auth(Model model, @RequestBody String email, HttpServletResponse response) throws IOException {
		int code = (int) (Math.random() * 10000);
		SimpleMailMessage message = new SimpleMailMessage();
		message.setTo(email);
		logger.info("메일 주소 : " + email);
		message.setSubject("Studyware TuttoStudy 회원가입 인증번호");
		message.setText("인증번호: " + code);
		logger.info("보낸 코드 : " + code);
		mailSender.send(message);

		PrintWriter out = response.getWriter();

		if (code != 0 || code != Integer.valueOf("")) {
			// out.print("OK");
			out.print(code);
			// model.addAttribute("code", code);
		}

		// model.addAttribute("code", code);
	} // end email_auth(model, email)

	// 데이터 받아서 회원가입하기
	@RequestMapping(value = "sign_up", method = RequestMethod.POST)
	public void signUp(Model model, MemberVO vo,
			RedirectAttributes attr) {
		logger.info("sign_up 호출");
		logger.info("아이디 : " + vo.getId());
		logger.info("비밀번호 : " + vo.getPwd());

		// int member_result = memberService.createMember(vo);
		//
		// String userid = membervo.getUserid();
		// int mno = memberService.readMnobyUserid(userid);
		//
		// if (member_result == 1) {
		// logger.info("MemberVO insert complete");
		// attr.addFlashAttribute("insert_result", "success");
		// } else {
		// attr.addFlashAttribute("insert_result", "fail");
		// }
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void loginGET(HttpServletRequest request) {
		logger.info("loginGET() 호출...");
	} // end loginGET()

	@RequestMapping(value = "/login-post", method = RequestMethod.POST)
	public void loginPOST(MemberVO vo, Model model, String query, HttpServletRequest request) {
		logger.info("loginPOST() 호출...");
		logger.info("입력 ID : " + vo.getId());
		logger.info("입력 PW : " + vo.getPwd());

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

	} // end loginPOST()

	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest req) {
		logger.info("logout() 호출...");

		// // 세션에 저장된 로그인 관련 정보를 모두 삭제, 세션 무효화(invalidate)
		// HttpSession session = req.getSession();
		// session.removeAttribute("login_id");
		// session.removeAttribute("mno");
		// session.invalidate();

		return "redirect:index";
	} // end logout()
}
