package edu.spring.studyware.member.service;

import java.util.List;

import edu.spring.studyware.domain.MemberVO;
import edu.spring.studyware.domain.Region2VO;
import edu.spring.studyware.domain.Region1VO;

public interface MemberService {

	// 1. 회원가입 양식에 들어갈 지역 DropDown 리스트 불러오기
	public abstract List<Region1VO> memberRegionDepth1();

	// 2. depth1을 가지고 depth2를 찾는다.
	public abstract List<Region2VO> memberRegionDepth2(String region1);
	
	// 3. depth2를 가지고 최종 지역 번호를 찾는다.
	public abstract int memberRegionNo(Region1VO region1vo);
	
	// 4. 모든 데이터를 가지고 회원 가입을 진행한다. DB Insert
	public abstract int memberSignUp(MemberVO memberVO);
	
	// 5. 세션id로 memberVO selectOne
	public abstract MemberVO memberSelectOne(String id);
	
	// 6. 로그인 
	public abstract MemberVO login(MemberVO memberVO);
	
}
