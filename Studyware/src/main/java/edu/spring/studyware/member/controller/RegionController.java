package edu.spring.studyware.member.controller;

import java.io.IOException;

import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.spring.studyware.domain.MemberVO;
import edu.spring.studyware.domain.Region2VO;
import edu.spring.studyware.domain.Region1VO;
import edu.spring.studyware.member.service.MemberService;
//import project.spring.groupware.member.domain.LoginVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class RegionController {

	private static int member_no = 0;

	private static final Logger logger = LoggerFactory.getLogger(RegionController.class);

	@Autowired
	private MemberService memberService;

	// 2. 회원 가입 - 지역1 선택 후 지역2 리스트 보내주기
	@RequestMapping(value = "/member/region2", method = RequestMethod.POST)
	public ResponseEntity<List<Region2VO>> ajaxRegion2Test(@RequestBody String region1) {

		ResponseEntity<List<Region2VO>> entity = null;
		// logger.info("지역1 에이작스놈아 : " + region1);

		// 지역1 데이터를 받아 지역2 리스트를 준빟
		List<Region2VO> list = memberService.memberRegionDepth2(region1);

		if (list != null) {
			// select 성공 한것이다.
			entity = new ResponseEntity<List<Region2VO>>(list, HttpStatus.OK);
			// logger.info("지역2 검색 성공 ");
		} else {
			// select 실패이다.
			entity = new ResponseEntity<List<Region2VO>>(list, HttpStatus.BAD_REQUEST);
			logger.info("지역2 검색 실패 ");
		}

		logger.info("entity " + entity.getBody().toString());

		return entity;
	}

	// 2. 회원 가입 - 지역1&지역2 데이터를 이용해서 지역번호 받기
	@RequestMapping(value = "/member/region_no_select", method = RequestMethod.GET)
	public void region2(Model model, @RequestParam(value = "city1") String region1,
			@RequestParam(value = "city2") String region2, HttpServletResponse response) throws IOException {
		logger.info("region_no_select 호출");
		logger.info("지역1 : " + region1);
		logger.info("지역2 : " + region2);

		// 지역1, 지역2 데이터 받아서 DB에 있는 region_no를 먼저 select한다
		// select된 region_no를 member 테이블에 집어 넣는다

		Region1VO vo = new Region1VO(region1, region2);

		int region_no = memberService.memberRegionNo(vo);

		PrintWriter out = response.getWriter();

		if (region_no > 0) {
			out.print(region_no);
		}

		logger.info("지역 번호: " + region_no);

	}
}
