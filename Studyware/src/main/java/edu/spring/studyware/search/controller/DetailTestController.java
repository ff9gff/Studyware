package edu.spring.studyware.search.controller;

import java.util.List;
import java.util.Locale;

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
import edu.spring.studyware.domain.RecruitVO;
import edu.spring.studyware.register.service.StudyCreateService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class DetailTestController {

	private static final Logger logger = LoggerFactory.getLogger(DetailTestController.class);
	
	@Autowired
	private StudyCreateService studyCreateService;

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

}
