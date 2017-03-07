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

import edu.spring.studyware.domain.RecruitCateVO;
import edu.spring.studyware.domain.RecruitTypeVO;
import edu.spring.studyware.domain.RecruitVO;
import edu.spring.studyware.domain.Region1VO;
import edu.spring.studyware.domain.LevelListVO;
import edu.spring.studyware.domain.LevelNameVO;
import edu.spring.studyware.domain.LevelVO;
import edu.spring.studyware.domain.LevelValueVO;
import edu.spring.studyware.member.service.MemberService;
import edu.spring.studyware.register.service.StudyCreateService;
import edu.spring.studyware.register.service.TestLevelService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class RegisterController {

	private static final Logger logger = LoggerFactory.getLogger(RegisterController.class);

	@Autowired
	private StudyCreateService studyCreateService;

	@Autowired
	private MemberService memberService;

	// 테스트 종료 후 삭제!
	@Autowired
	private TestLevelService testLevelService;

	// 1. 스터디 등록 페이지로 이동
	@RequestMapping(value = "/studyCreate/register", method = RequestMethod.GET)
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

		return "studyCreate/register_wr";

	}

	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	// 2. 스터디종류 내용을 이용해서 스터디종류 번호를 찾는다
	@RequestMapping(value = "/studyCreate/studyCate", method = RequestMethod.POST)
	public void studyCate(Model model, @RequestBody String recruit_cate_name, HttpServletResponse response)
			throws IOException {
		logger.info("스터디종류 메소드 호출");
		logger.info("스터디종류 : " + recruit_cate_name);

		int recruit_cate_no = studyCreateService.recruitCateNo(recruit_cate_name);

		PrintWriter out = response.getWriter();

		if (recruit_cate_no > 0) {
			out.print(recruit_cate_no);
		}

		logger.info("스터디종류 번호: " + recruit_cate_no);

	}

	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	// 3. 모집구분 내용을 이용해서 모집구분 번호를 찾는다
	@RequestMapping(value = "/studyCreate/studyType", method = RequestMethod.POST)
	public void studyType(Model model, @RequestBody String recruit_type_name, HttpServletResponse response)
			throws IOException {
		logger.info("모집 구분 메소드 호출");
		logger.info("모집구분 : " + recruit_type_name);

		int recruit_type_no = studyCreateService.recruitTypeNo(recruit_type_name);

		PrintWriter out = response.getWriter();

		if (recruit_type_no > 0) {
			out.print(recruit_type_no);
		}

		logger.info("모집 구분번호: " + recruit_type_no);

	}

	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	// 2. 공부 내용 & 레벨 여러개 받기 연습
	@RequestMapping(value = "/studyCreate/study_create", method = RequestMethod.POST)
	public String region3(Model model, RecruitVO recruitVO, LevelNameVO levelNameVO, LevelValueVO levelValueVO) {
		logger.info("studyLevel 호출");

		logger.info("스터디제목: " + recruitVO.getRecruit_title());
		logger.info("스터디지역: " + recruitVO.getRecruit_no());
		logger.info("스터디내용: " + recruitVO.getRecruit_content());
		logger.info("스터디마감: " + recruitVO.getRecruit_date());

		int recruit_no = 0;
		
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

				// name_no, value_no를 담아 level_no를 가져올 준비를 한다.
				LevelVO levelVO = new LevelVO(name_no, value_no);

				// levelVO를 이용해서 level_no를 가져온다.
				int insertLevelResult = testLevelService.insertNameValueNO(levelVO);
				
				int level_no = levelVO.getLevel_no();
				
				logger.info("level_no: " + level_no);

				if (insertLevelResult > 0) {

					recruitVO = new RecruitVO(recruitVO.getBoard_name_no(), recruitVO.getRecruit_cate_no(),
							recruitVO.getRecruit_type_no(), recruitVO.getMember_no(), recruitVO.getNum_now(),
							recruitVO.getNum_max(), recruitVO.getRegion_no(), level_no, recruitVO.getRecruit_title(),
							recruitVO.getRecruit_date(), recruitVO.getRecruit_content(), null, 0, 0);
					
					int insertRecruitResult = studyCreateService.insertRecruit(recruitVO);

					if (insertRecruitResult > 0) {
						logger.info("스터디 등록 성공!");
						recruit_no = recruitVO.getRecruit_no();
						
						logger.info("recruit_no: " + recruit_no);
						
						recruitVO = new RecruitVO(recruitVO.getBoard_name_no(), recruit_no, recruitVO.getRecruit_cate_no(),
								recruitVO.getRecruit_type_no(), recruitVO.getMember_no(), recruitVO.getNum_now(),
								recruitVO.getNum_max(), recruitVO.getRegion_no(), level_no, recruitVO.getRecruit_title(),
								recruitVO.getRecruit_date(), recruitVO.getRecruit_content(), null, 0, 0);
						
						
					}
				}

			}

		}
		
		model.addAttribute("recruitVO", recruitVO);

		return "redirect:/studyCreate/register_re?recruit_no=" + recruit_no;
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	

}
