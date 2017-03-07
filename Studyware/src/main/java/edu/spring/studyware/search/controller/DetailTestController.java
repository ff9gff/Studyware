package edu.spring.studyware.search.controller;

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
	
	/*@RequestMapping(value = "/review_detail", method = RequestMethod.GET)
	public String reviewDetail(int review_no, Model model, HttpSession session) {
		// review_detail.jsp 페이지 이동
		// DAO 통해서 view 테이블 불러오게..
		logger.info("reviewDetail() 호출...");
		logger.info("review_no : " + review_no);

		// 클릭할 때마다 조회수 + 1
		int currentHit = tourReviewService.read_current_review_hits(review_no);
		logger.info("조회수  : " + currentHit);

		// 업데이트 할 조회수 = 현재 조회수 + 1
		currentHit = currentHit + 1;
		logger.info("업데이트 조회수  : " + currentHit);

		// 조회수 업데이트!
		ReviewVO updatehitvo = new ReviewVO(review_no, null, null, 0, 0, currentHit, null);

		int updatehitResult = tourReviewService.update_review_hits(updatehitvo);

		if (updatehitResult == 1) {
			logger.info("업데이트 조회수  : " + currentHit);
		} else {
			logger.info("조회수 업데이트 실패");
		}

		ReviewVO reviewvo = tourReviewService.read_review_by_no(review_no);

		if (reviewvo != null) {
			logger.info("reviewvo.getMno: " + reviewvo.getMno());

			ImgVO img = tourReviewService.read_review_profile(reviewvo.getMno());
			logger.info("img: " + img);

			PersonalVO personalvo = tourReviewService.read_review_personal(reviewvo.getMno());
			String region = tourReviewService.read_review_region_name(reviewvo.getReview_no());

			model.addAttribute("reviewVO", reviewvo);

			if (personalvo != null) {
				model.addAttribute("inserterNickname", personalvo.getNickname());
				model.addAttribute("inserterIntro", personalvo.getIntroduce());
			}

			if (img != null) {
				model.addAttribute("inserterImg", img.getImg_url());
			}

			if (region != null) {
				model.addAttribute("inserterRegion", region);
			}
		} // end if

		// 내가 이 게시물에 따봉을 눌렀는가? state를 조회해보면 알 수 있다
		int selectLike = 0;

		String mnoString = (String) (session.getAttribute("mno"));

		if (mnoString == null) {
			logger.info("로그인된 아이디가 없음");
		} else {

			// 문제가 있음
			int mno = Integer.valueOf(mnoString);

			try {
				// 먼저 사용자가 게시글에 따봉을 눌렀는지 확인!
				selectLike = tourReviewService.readReviewLike(review_no, mno);
				logger.info("selectLike=? : " + selectLike);

			} catch (Exception e) {
				// TODO: handle exception
				logger.info("따봉을 누른 흔적이 없습니다.");

				BestVO vo = new BestVO(mno, review_no, 0);
				model.addAttribute("likecheck", vo);
			}

			if (selectLike == 1) {
				// 따봉을 누른 흔적이 없으니 새 따봉을 입력합니다.
				logger.info("따봉 누른 흔적이 있습니다.");
				BestVO vo = new BestVO(mno, review_no, selectLike);
				model.addAttribute("likecheck", vo);
			}
		}

		return "review/review_detail";
	} // end reviewDetail()*/

}
