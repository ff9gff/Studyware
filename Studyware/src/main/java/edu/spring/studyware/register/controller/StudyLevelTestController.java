package edu.spring.studyware.register.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import edu.spring.studyware.domain.LevelNameVO;
import edu.spring.studyware.domain.LevelVO;
import edu.spring.studyware.domain.LevelValueVO;
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
public class StudyLevelTestController {

	private static final Logger logger = LoggerFactory.getLogger(StudyLevelTestController.class);

	@Autowired
	private StudyCreateService studyCreateService;

	@Autowired
	private MemberService memberService;

	@Autowired
	private TestLevelService testLevelService;

	// 1. 스터디 등록 페이지로 이동
	@RequestMapping(value = "studyCreate/studyLevelTest", method = RequestMethod.GET)
	public String studyRegister(Locale locale, Model model) {

		List<RecruitTypeVO> recruitTypeList = studyCreateService.recruitTypeName();
		List<RecruitCateVO> recruitCateList = studyCreateService.recruitCateName();
		List<Region1VO> depth1List = memberService.memberRegionDepth1();
		List<LevelListVO> levelList = testLevelService.levelList();

		logger.info("스터디등록");

		model.addAttribute("recruitTypeList", recruitTypeList);
		model.addAttribute("recruitCateList", recruitCateList);
		model.addAttribute("depth1List", depth1List);
		model.addAttribute("levelList", levelList);

		return "studyCreate/level_test";

	}

	///////////////////////////////////////////////////////////////////////////////////
}
