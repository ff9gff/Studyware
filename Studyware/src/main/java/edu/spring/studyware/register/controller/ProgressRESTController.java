package edu.spring.studyware.register.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import edu.spring.studyware.domain.ApplyVO;
import edu.spring.studyware.domain.RecruitDTO;
import edu.spring.studyware.register.service.ProgressService;

@RestController
@RequestMapping(value = "/mypage/progress")
public class ProgressRESTController {

	@Autowired
	private ProgressService prgressService;
	
	// 해당 진행상황 리스트 읽기 - 모집글
	@RequestMapping(value="/all/recruitment/{no}", method = RequestMethod.GET)
	public ResponseEntity<List<RecruitDTO>> readRecruitList(@PathVariable("no") Integer member_no){
		System.out.println("progress: "+member_no);
		
		List<RecruitDTO> list = prgressService.readRecruitList(member_no);
		ResponseEntity<List<RecruitDTO>> entity = null;
		if (list != null) { // select 성공
			entity = new ResponseEntity<List<RecruitDTO>>(list, HttpStatus.OK);
		} else { // select 실패
			entity = new ResponseEntity<List<RecruitDTO>>(list, HttpStatus.BAD_REQUEST);
		} // end if

		return entity;
	}
	
	// 해당 진행상황 리스트 읽기 - 신청글
	@RequestMapping(value="/all/application/{no}", method = RequestMethod.GET)
	public ResponseEntity<List<ApplyVO>> readApplyList(@PathVariable("no") Integer member_no){
		List<ApplyVO> list = prgressService.readApplyList(member_no);
		ResponseEntity<List<ApplyVO>> entity = null;
		if (list != null) { // select 성공
			entity = new ResponseEntity<List<ApplyVO>>(list, HttpStatus.OK);
		} else { // select 실패
			entity = new ResponseEntity<List<ApplyVO>>(list, HttpStatus.BAD_REQUEST);
		} // end if

		return entity;
	}
}// end class
