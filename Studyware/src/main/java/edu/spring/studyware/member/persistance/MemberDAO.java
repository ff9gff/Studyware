package edu.spring.studyware.member.persistance;

import java.util.List;

import edu.spring.studyware.domain.MemberDTO;
import edu.spring.studyware.domain.MemberVO;
import edu.spring.studyware.domain.RegionVO;

public interface MemberDAO {

	// 1. 회원가입 양식에 들어갈 지역 DropDown 리스트
	public abstract List<RegionVO> memberRegionDepth1();

	// 2. depth1을 가지고 depth2를 찾는다.
	public abstract List<RegionVO> memberRegionDepth2(String region1);

	// 3. depth2를 가지고 최종 지역 번호를 찾는다.
	public abstract int memberRegionNo(String region2);

	// 4. 모든 데이터를 가지고 회원 가입을 진행한다. DB Insert
	public abstract int memberSignUp(MemberVO memberVO);
	
	// 5. 모든 멤버 리스트를 조회한다
	public abstract List<MemberDTO> selectList();
}
