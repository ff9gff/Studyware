package edu.spring.studyware.controller.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class EmailAuthController {

	private static final Logger logger = LoggerFactory.getLogger(EmailAuthController.class);

	@Autowired
	private JavaMailSenderImpl mailSender;
	
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

}
