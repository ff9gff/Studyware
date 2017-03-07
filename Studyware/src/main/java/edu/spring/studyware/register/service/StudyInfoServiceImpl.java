package edu.spring.studyware.register.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.spring.studyware.domain.RecruitVO;
import edu.spring.studyware.register.persistance.StudyInfoDAO;

@Service
public class StudyInfoServiceImpl implements StudyInfoService {
	
	@Autowired
	private StudyInfoDAO studyInfoDAO;

	@Override
	public RecruitVO recruitInfo(int recruit_no) {
		return studyInfoDAO.recruitInfo(recruit_no);
	}

}
