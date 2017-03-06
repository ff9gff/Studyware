package edu.spring.studyware.register.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.spring.studyware.domain.RecruitCateVO;
import edu.spring.studyware.domain.RecruitTypeVO;
import edu.spring.studyware.domain.RecruitVO;
import edu.spring.studyware.register.persistance.StudyCreateDAO;

@Service
public class StudyCreateServiceImpl implements StudyCreateService {
	
	@Autowired
	private StudyCreateDAO studyCreateDAO;

	@Override
	public List<RecruitCateVO> recruitCateName() {
		return studyCreateDAO.recruitCateName();
	}

	@Override
	public List<RecruitTypeVO> recruitTypeName() {
		return studyCreateDAO.recruitTypeName();
	}

	@Override
	public int recruitTypeNo(String recruitType) {
		return studyCreateDAO.recruitTypeNo(recruitType);

	}

	@Override
	public int recruitCateNo(String studyCate) {
		return studyCreateDAO.recruitCateNo(studyCate);
	}

	@Override
	public int insertRecruit(RecruitVO recruitVO) {
		return studyCreateDAO.insertRecruit(recruitVO);
	}

	@Override
	public List<RecruitVO> recruitDetail() {
		return studyCreateDAO.recruitDetail();
	}
	
	
	

}
