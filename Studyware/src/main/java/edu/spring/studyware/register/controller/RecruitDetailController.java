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

//공부수준 테스트용 컨트롤러입니다.
//테스트 후 삭제할 예정입니다.

@Controller
public class RecruitDetailController {

	private static final Logger logger = LoggerFactory.getLogger(RecruitDetailController.class);

	@Autowired
	private StudyCreateService studyCreateService;
	
	@Autowired
	private StudyInfoService studyInfoService;

	@Autowired
	private MemberService memberService;

	@Autowired
	private TestLevelService testLevelService;
	
	@RequestMapping(value = "/index/defaultRecruit", method = RequestMethod.GET)
	public ResponseEntity<List<RecruitVO>> ajaxDetailStudyTest() {
		
		logger.info("디폴트 리쿠르트 호출");

		ResponseEntity<List<RecruitVO>> entity = null;

		List<RecruitVO> list = studyCreateService.recruitDetail();

		if (list != null) {
			// select 성공 한것이다.
			entity = new ResponseEntity<List<RecruitVO>>(list, HttpStatus.OK);
		} else {
			// select 실패이다.
			entity = new ResponseEntity<List<RecruitVO>>(list, HttpStatus.BAD_REQUEST);
		}

		logger.info("entity " + entity.getBody());

		return entity;
	}

	// 1. 스터디 디테일 페이지로 이동
	@RequestMapping(value = "studyCreate/register_re", method = RequestMethod.GET)
	public String studyRegister(int recruit_no, Model model, HttpSession session) {

		logger.info("recruit_no: " + recruit_no);
		
		RecruitVO recruitVO = studyInfoService.recruitInfo(recruit_no);
		
		logger.info("리쿠르트 제목: " + recruitVO.getRecruit_title());
		
		model.addAttribute("recruitVO", recruitVO);
		
		return "studyCreate/register_re";

	}

	///////////////////////////////////////////////////////////////////////////////////
}
