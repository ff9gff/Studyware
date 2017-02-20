package edu.spring.studyware.member.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.spring.studyware.domain.MemberVO;
import edu.spring.studyware.domain.RegionVO;
import edu.spring.studyware.member.persistance.MemberDAO;


/**
 * Handles requests for the application home page.
 */
@Service
public class MemberServiceImpl implements MemberService {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberServiceImpl.class);
	
	@Autowired
	private MemberDAO memberDAO;

	@Override
	public List<RegionVO> memberRegionDepth1() {
		return memberDAO.memberRegionDepth1();
	}
	
	@Override
	public List<RegionVO> memberRegionDepth2(String region1) {
		return memberDAO.memberRegionDepth2(region1);
	}

	@Override
	public int memberRegionNo(String region2) {
		return memberDAO.memberRegionNo(region2);
	}

	@Override
	public int memberSignUp(MemberVO memberVO) {
		return memberDAO.memberSignUp(memberVO);
	}
	
	
}
