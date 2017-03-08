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
import edu.spring.studyware.register.service.StudyInfoService;
import edu.spring.studyware.register.service.TestLevelService;

// 모집글 보기 컨트롤러
// select, update, delete 기능 수행

@Controller
public class RecruitDetailController {

	private static final Logger logger = LoggerFactory.getLogger(RecruitDetailController.class);

	@Autowired
	private StudyCreateService studyCreateService;

	@Autowired
	private StudyInfoService studyInfoService;

	@Autowired
	private MemberService memberService;

	// 테스트 종료 후 삭제!
	@Autowired
	private TestLevelService testLevelService;

	// 1. 현재 등록된 모집글들 보여주기(select)
	@RequestMapping(value = "/index/defaultRecruit", method = RequestMethod.GET)
	public ResponseEntity<List<RecruitVO>> ajaxDetailStudyTest() {

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

	///////////////////////////////////////////////////////////////////////////////////

	// 2. 스터디 클릭 --> 디테일 페이지로 이동(select)
	@RequestMapping(value = "studyCreate/register_detail", method = RequestMethod.GET)
	public String studyRegister(int recruit_no, Model model, HttpSession session) {

		logger.info("recruit_no: " + recruit_no);

		RecruitVO recruitVO = studyInfoService.recruitInfo(recruit_no);

		logger.info("리쿠르트 제목: " + recruitVO.getRecruit_title());

		model.addAttribute("recruitVO", recruitVO);

		return "studyCreate/register_detail";

	}

	///////////////////////////////////////////////////////////////////////////////////

	// 2. 모집글 내용 수정페이지 이동
	@RequestMapping(value = "studyCreate/updateRecruit", method = RequestMethod.POST)
	public String goUpdateRecruit(int recruit_no, Model model, HttpSession session) {

		logger.info("모집글 번호: " + recruit_no);

		RecruitVO recruitVO = studyInfoService.recruitInfo(recruit_no);
		List<RecruitTypeVO> recruitTypeList = studyCreateService.recruitTypeName();
		List<RecruitCateVO> recruitCateList = studyCreateService.recruitCateName();
		List<Region1VO> depth1List = memberService.memberRegionDepth1();
		List<LevelListVO> levelList = testLevelService.levelList();

		model.addAttribute("recruitTypeList", recruitTypeList);
		model.addAttribute("recruitCateList", recruitCateList);
		model.addAttribute("depth1List", depth1List);
		model.addAttribute("levelList", levelList);
		model.addAttribute("recruitVO", recruitVO);
		model.addAttribute("recruit_no", recruit_no);

		return "studyCreate/recruit_update";

	}

	///////////////////////////////////////////////////////////////////////////////////

	// 3. 모집글 수정
	@RequestMapping(value = "studyCreate/recruit_update", method = RequestMethod.POST)
	public void region3(Model model, RecruitVO recruitVO, LevelNameVO levelNameVO, LevelValueVO levelValueVO) {
		logger.info("수정작업 호출: " + recruitVO.getLevel_no());

		int level_name_no = studyInfoService.selectLevelNameNO(recruitVO.getLevel_no());
		int level_value_no = studyInfoService.selectLevelValueNO(recruitVO.getLevel_no());

		levelNameVO = new LevelNameVO(level_name_no, levelNameVO.getLevel1_name(), levelNameVO.getLevel2_name(),
				levelNameVO.getLevel3_name(), levelNameVO.getLevel4_name(), levelNameVO.getLevel5_name());
		levelValueVO = new LevelValueVO(level_value_no, levelValueVO.getLevel1_value(), levelValueVO.getLevel2_value(),
				levelValueVO.getLevel3_value(), levelValueVO.getLevel4_value(), levelValueVO.getLevel5_value());

		int levelNameUpdateResult = studyInfoService.updateLevelName(levelNameVO);
		int levelValueUpdateResult = studyInfoService.updateLevelValue(levelValueVO);
		
		logger.info("업데이트1?: " + levelNameUpdateResult);
		logger.info("업데이트2?: " + levelValueUpdateResult);

		recruitVO = new RecruitVO(recruitVO.getBoard_name_no(), recruitVO.getRecruit_no(), recruitVO.getRecruit_cate_no(), recruitVO.getRecruit_type_no(), recruitVO.getMember_no(), recruitVO.getNum_now(), recruitVO.getNum_max(), recruitVO.getRegion_no(), recruitVO.getLevel_no(), recruitVO.getRecruit_title(), recruitVO.getRecruit_date(), recruitVO.getRecruit_content());
		
		int updateRecruitResult = studyInfoService.updateRecruit(recruitVO);
		
		logger.info("리쿠르트 업데이트?: " + updateRecruitResult);
		
	}

	// 4. 모집글 삭제
	@RequestMapping(value = "studyCreate/deleteRecruit", method = RequestMethod.POST)
	public String deleteRecruit(int recruit_no, Model model, HttpSession session) {
		
		logger.info("삭제작업 호출: " + recruit_no);
		RecruitVO recruitVO = studyInfoService.recruitInfo(recruit_no);
		
		// 1. 공부수준/레벨도 삭제해야 한다. level_no와 level_name_no, level_value_no를 찾아서 삭제한다.
		int level_no = recruitVO.getLevel_no();
		int level_name_no = studyInfoService.selectLevelNameNO(level_no);
		int level_value_no = studyInfoService.selectLevelValueNO(level_no);
		
		int deleteLevelNameResult = studyInfoService.deleteLevelName(level_name_no);
		int deleteLevelValueResult = studyInfoService.deleteLevelValue(level_value_no); 
		int deleteLevelResult = studyInfoService.deleteLevel(level_no);
		
		
		int deleteRecruitResult = studyInfoService.deleteRecruit(recruit_no);
		
		logger.info("삭제1: " + deleteLevelNameResult);
		logger.info("삭제2: " + deleteLevelValueResult);
		logger.info("삭제3: " + deleteLevelResult);
		logger.info("삭제4: " + deleteRecruitResult);

		return "redirect:/";
	}
}
