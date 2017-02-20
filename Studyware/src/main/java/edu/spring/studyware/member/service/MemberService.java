package edu.spring.studyware.member.service;

import java.util.List;

import edu.spring.studyware.domain.MemberVO;
import edu.spring.studyware.domain.RegionVO;

public interface MemberService {

	// 1. 회원가입 양식에 들어갈 지역 DropDown 리스트 불러오기
	public abstract List<RegionVO> memberRegionDepth1();

	// 2. depth1을 가지고 depth2를 찾는다.
	public abstract List<RegionVO> memberRegionDepth2(String region1);
	
	// 3. depth2를 가지고 최종 지역 번호를 찾는다.
	public abstract int memberRegionNo(String region2);
	
	// 4. 모든 데이터를 가지고 회원 가입을 진행한다. DB Insert
	public abstract int memberSignUp(MemberVO memberVO);
}
