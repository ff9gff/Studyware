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

import edu.spring.studyware.domain.RecruitCateVO;
import edu.spring.studyware.domain.RecruitTypeVO;
import edu.spring.studyware.domain.Region1VO;
import edu.spring.studyware.domain.TestLevelVO;
import edu.spring.studyware.member.service.MemberService;
import edu.spring.studyware.register.service.StudyCreateService;
import edu.spring.studyware.register.service.TestLevelService;

// 공부수준 로직 연습용 컨트롤러
// 테스트 종료 후 삭제 예정!

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
	@RequestMapping(value = "/studyCreate/study_level", method = RequestMethod.GET)
	public void region2(Model model, String level_name, String level_value, HttpServletResponse response) throws IOException {
		logger.info("studyLevel 호출");
		logger.info("공부내용: " + level_name);
		logger.info("공부레벨: " + level_value);

		// 지역1, 지역2 데이터 받아서 DB에 있는 region_no를 먼저 select한다
		// select된 region_no를 member 테이블에 집어 넣는다

		/*Region1VO vo = new Region1VO(region1, region2);

		int region_no = memberService.memberRegionNo(vo);

		PrintWriter out = response.getWriter();

		if (region_no > 0) {
			out.print(region_no);
		}

		logger.info("지역 번호: " + region_no);*/

	}
}