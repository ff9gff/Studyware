package edu.spring.studyware.member.persistance;

import java.util.List;

import edu.spring.studyware.member.domain.RegionVO;

public interface MemberDAO {

	// 1. 회원가입 양식에 들어갈 지역 DropDown 리스트
	public abstract List<RegionVO> memberRegion();
	
	
}
