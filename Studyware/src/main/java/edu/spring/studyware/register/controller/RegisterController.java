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
import edu.spring.studyware.domain.Region1VO;
import edu.spring.studyware.member.service.MemberService;
import edu.spring.studyware.register.service.StudyCreateService;

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
	
	// 1. 스터디 등록 페이지로 이동
	@RequestMapping(value = "studyCreate/register", method = RequestMethod.GET)
	public String studyRegister(Locale locale, Model model) {
		
		List<RecruitCateVO> recruitCateList = studyCreateService.recruitCateName();
		List<Region1VO> depth1List = memberService.memberRegionDepth1();
		
		for (int i = 0; i < recruitCateList.size(); i++) {
			System.out.println(recruitCateList.get(i).getName_recruit_cate());
		}
		
		logger.info("스터디등록");
		
		model.addAttribute("recruitCateList", recruitCateList);
		model.addAttribute("depth1List", depth1List);

		return "studyCreate/register_wr";

	}

}
