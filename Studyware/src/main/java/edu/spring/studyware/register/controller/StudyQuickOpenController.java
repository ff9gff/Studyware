package edu.spring.studyware.register.controller;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.spring.studyware.domain.RecruitCateVO;
import edu.spring.studyware.domain.RecruitTypeVO;
import edu.spring.studyware.domain.RecruitVO;
import edu.spring.studyware.domain.Region1VO;
import edu.spring.studyware.domain.LevelListVO;
import edu.spring.studyware.member.service.MemberService;
import edu.spring.studyware.register.service.StudyCreateService;
import edu.spring.studyware.register.service.StudyInfoService;
import edu.spring.studyware.register.service.TestLevelService;

@Controller
public class StudyQuickOpenController {

	private static final Logger logger = LoggerFactory.getLogger(StudyQuickOpenController.class);

	@Autowired
	private StudyCreateService studyCreateService;

	@Autowired
	private StudyInfoService studyInfoService;

	@Autowired
	private MemberService memberService;

	@Autowired
	private TestLevelService testLevelService;

	///////////////////////////////////////////////////////////////////////////////////

	// 1. 스터디 바로시작 페이지로 이동
	@RequestMapping(value = "/studyCreate/quickOpen", method = RequestMethod.GET)
	public String quickOpen(Locale locale, Model model) {
		
		return "studyCreate/direct_open";
	}
}
