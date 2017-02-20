package edu.spring.studyware.member.persistance;

import java.util.List;

import edu.spring.studyware.domain.RegionVO;

public interface MemberDAO {

	// 1. 회원가입 양식에 들어갈 지역 DropDown 리스트
	public abstract List<RegionVO> memberRegionDepth1();

	// 2. depth1을 가지고 depth2를 찾는다.
	public abstract List<RegionVO> memberRegionDepth2(String region1);

	// 3. depth2를 가지고 최종 지역 번호를 찾는다.
	public abstract int memberRegionNo(String region2);
}
