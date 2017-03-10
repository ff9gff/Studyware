package edu.spring.studyware.register.persistance;

import java.util.List;

import edu.spring.studyware.domain.ApplyVO;
import edu.spring.studyware.domain.MemberVO;
import edu.spring.studyware.domain.RecruitCateVO;
import edu.spring.studyware.domain.RecruitDTO;
import edu.spring.studyware.domain.RecruitTypeVO;
import edu.spring.studyware.domain.RecruitVO;

public interface DirectOpenDAO {

	// 1. 추가할 회원 검색
	public abstract MemberVO memberSearch(String id);

}
