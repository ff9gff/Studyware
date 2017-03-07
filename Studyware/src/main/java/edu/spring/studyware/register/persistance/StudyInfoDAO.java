package edu.spring.studyware.register.persistance;

import java.util.List;

import edu.spring.studyware.domain.RecruitCateVO;
import edu.spring.studyware.domain.RecruitTypeVO;
import edu.spring.studyware.domain.RecruitVO;

public interface StudyInfoDAO {

	// 1. recruit_no를 이용해서 recruit 정보를 가져오자
	public abstract RecruitVO recruitInfo(int recruit_no);

}
