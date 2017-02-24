package edu.spring.studyware.register.controller;

import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.spring.studyware.domain.Region1VO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class RegisterController {

	private static final Logger logger = LoggerFactory.getLogger(RegisterController.class);

	// 1. 스터디 등록 페이지로 이동
	@RequestMapping(value = "studyCreate/register", method = RequestMethod.GET)
	public String studyRegister(Locale locale, Model model) {
		
		logger.info("스터디등록");

		
		return "studyCreate/register_wr";

	}

}
