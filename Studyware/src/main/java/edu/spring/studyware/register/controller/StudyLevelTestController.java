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
import edu.spring.studyware.domain.LevelValueVO;
import edu.spring.studyware.domain.RecruitCateVO;
import edu.spring.studyware.domain.RecruitTypeVO;
import edu.spring.studyware.domain.Region1VO;
import edu.spring.studyware.domain.TestLevelVO;
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
		List<TestLevelVO> levelList = testLevelService.levelList();

		for (int i = 0; i < recruitCateList.size(); i++) {
			System.out.println(recruitCateList.get(i).getName_recruit_cate());
		}

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
	public void region2(Model model, @RequestParam("level1_name") String level_name, @RequestParam("level1_value") String level_value, HttpServletResponse response) throws IOException {
		logger.info("studyLevel 호출");
		logger.info("공부내용: " + level_name);
		logger.info("공부레벨: " + level_value);

		// 1. 공부 내용과 수준을 먼저 Insert 해보자
		LevelNameVO levelNameVO = new LevelNameVO(level_name, null, null, null, null);
		LevelValueVO levelValueVO = new LevelValueVO(level_value, null, null, null, null);

		int nameInsertResult = testLevelService.insertLevelName(levelNameVO);		
		int valueInsertResult = testLevelService.insertLevelValue(levelValueVO);
		
		if (valueInsertResult == 1 && nameInsertResult == 1) {
			logger.info("공부수준 Insert 성공");
			
			// 2. 이제 두 개의 테이블의 name_no, value_no를 select 해온다.
			int name_no = 0;
			int value_no = 0;
			
			if (name_no == value_no) {
				// 3. select 해온 name_no, value_no를 SW_LEVEL 테이블에 Insert한다!
				// ggggg
				int nameValueNoInsertResult;
			}
			
		}

	}
}
