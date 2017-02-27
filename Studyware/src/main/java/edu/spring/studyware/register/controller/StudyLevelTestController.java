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

	// 2. 공부 내용 & 레벨 받아서 DB Insert & select 연습
	@RequestMapping(value = "/studyCreate/study_level", method = RequestMethod.POST)
	public void region2(Model model, @RequestParam("level1_name") String level_name,
			@RequestParam("level1_value") String level_value, HttpServletResponse response) throws IOException {
		logger.info("studyLevel 호출");
		logger.info("공부내용: " + level_name);
		logger.info("공부레벨: " + level_value);

		// 1. 공부 내용과 수준을 먼저 Insert해보자
		LevelNameVO levelNameVO = new LevelNameVO(level_name, null, null, null, null);
		LevelValueVO levelValueVO = new LevelValueVO(level_value, null, null, null, null);

		int nameInsertResult = testLevelService.insertLevelName(levelNameVO);
		int valueInsertResult = testLevelService.insertLevelValue(levelValueVO);

		// 2. Insert가 성공했을 경우 name_no, value_no를 select 해온다
		if (valueInsertResult == 1 && nameInsertResult == 1) {

			logger.info("이름번호: " + levelNameVO.getLevel_name_no());
			logger.info("벨류번호: " + levelValueVO.getLevel_value_no());

			logger.info("공부수준 Insert 성공");

			// name_no, value_no는 각 VO 객체 안에 저장되어 있다.
			int name_no = levelNameVO.getLevel_name_no();
			int value_no = levelValueVO.getLevel_value_no();

			if (name_no == value_no) {

				LevelVO levelVO = new LevelVO(name_no, value_no);

				int nameValueNoInsertResult = testLevelService.insertNameValueNO(levelVO);

				logger.info("level_no: " + nameValueNoInsertResult);

			}

		}

	}

	// 3. 공부 내용 & 레벨  여러개 받기 연습
	@RequestMapping(value = "/studyCreate/study_level2", method = RequestMethod.POST)
	public void region3(Model model, LevelNameVO levelNameVO, LevelValueVO levelValueVO) {
		logger.info("studyLevel 호출");
		
		int nameInsertResult = testLevelService.insertLevelName(levelNameVO);
		int valueInsertResult = testLevelService.insertLevelValue(levelValueVO);

		// 2. Insert가 성공했을 경우 name_no, value_no를 select 해온다
		if (valueInsertResult == 1 && nameInsertResult == 1) {

			logger.info("이름번호: " + levelNameVO.getLevel_name_no());
			logger.info("벨류번호: " + levelValueVO.getLevel_value_no());

			logger.info("공부수준 Insert 성공");

			// name_no, value_no는 각 VO 객체 안에 저장되어 있다.
			int name_no = levelNameVO.getLevel_name_no();
			int value_no = levelValueVO.getLevel_value_no();

			if (name_no == value_no) {

				LevelVO levelVO = new LevelVO(name_no, value_no);

				int nameValueNoInsertResult = testLevelService.insertNameValueNO(levelVO);

				logger.info("level_no: " + nameValueNoInsertResult);

			}

		}
		

	}
}
