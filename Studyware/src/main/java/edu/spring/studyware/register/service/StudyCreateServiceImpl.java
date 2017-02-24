package edu.spring.studyware.register.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.spring.studyware.domain.RecruitCateVO;
import edu.spring.studyware.register.persistance.StudyCreateDAO;

@Service
public class StudyCreateServiceImpl implements StudyCreateService {
	
	@Autowired
	private StudyCreateDAO studyCreateDAO;

	@Override
	public List<RecruitCateVO> recruitCateName() {
		return studyCreateDAO.recruitCateName();
	}
	

}
