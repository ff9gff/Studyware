package edu.spring.studyware.register.controller;


import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.spring.studyware.domain.RecruitCateVO;
import edu.spring.studyware.domain.RecruitTypeVO;
import edu.spring.studyware.domain.Region1VO;
import edu.spring.studyware.domain.LevelListVO;
import edu.spring.studyware.member.service.MemberService;
import edu.spring.studyware.register.service.StudyCreateService;
import edu.spring.studyware.register.service.TestLevelService;

//공부수준 테스트용 컨트롤러입니다.
//테스트 후 삭제할 예정입니다.

@Controller
public class StudyDetailController {

	private static final Logger logger = LoggerFactory.getLogger(StudyDetailController.class);

	@Autowired
	private StudyCreateService studyCreateService;

	@Autowired
	private MemberService memberService;

	@Autowired
	private TestLevelService testLevelService;

	// 1. 스터디 디테일 페이지로 이동
	@RequestMapping(value = "studyCreate/register_re", method = RequestMethod.GET)
	public String studyRegister(Locale locale, Model model) {

		return "studyCreate/register_re";

	}

	///////////////////////////////////////////////////////////////////////////////////
}
