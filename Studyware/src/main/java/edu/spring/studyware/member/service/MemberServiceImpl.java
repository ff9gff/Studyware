package edu.spring.studyware.member.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.spring.studyware.member.domain.RegionVO;
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
	public List<RegionVO> memberRegion() {
		return memberDAO.memberRegion();
	}
	
	
}
