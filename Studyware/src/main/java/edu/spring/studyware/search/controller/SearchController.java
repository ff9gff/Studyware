package edu.spring.studyware.search.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.spring.studyware.study.domain.RecruitVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class SearchController {

	private static final Logger logger = LoggerFactory.getLogger(SearchController.class);

	// 1. 검색 페이지로 이동
	@RequestMapping(value = "search", method = RequestMethod.GET)
	public String searchPage() {
		return "search";
	}

	// 2. 검색어를 받아오자
	@RequestMapping(value = "search_study", method = RequestMethod.POST)
	public String searchResult(@RequestBody String title) {
		logger.info("제목: " + title);
		
		return "redirect:../studyware";
	}

}
